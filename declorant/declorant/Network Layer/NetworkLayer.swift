//
//  NetworkLayer.swift
//  declorant
//
//  Created by Дмитрий Яровой on 05/02/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//
import Alamofire.Swift
import Alamofire

typealias JSON = [String : Any]

class NetworkLayer {
    
    static let apiString = "https://public-api.nazk.gov.ua/v1/declaration/"
    static let reportString = "https://public.nazk.gov.ua"
    
    static func searcDeclarations(name: String, page: Int = 1, completion: @escaping([AccountModel]?, PageModel?) -> Void) {
        
        let parameters: [String : Any] = [
            "page" : page,
            "q" : name
        ]
        
        AF.request(NetworkLayer.apiString, method: .get, parameters: parameters).responseJSON { (jsonResponse) in
            
            guard let jsonValue = jsonResponse.result.value as? JSON else {
                return
            }
            guard let jsonItems = jsonValue["items"] else {
                return
            }
            guard let jsonPage = jsonValue["page"] else {
                return
            }
            
            let decoder = JSONDecoder()
            
            guard let itemsData =  try? JSONSerialization.data(withJSONObject: jsonItems, options: []) else {
                return completion(nil, nil)
            }
            guard let pageData = try? JSONSerialization.data(withJSONObject: jsonPage, options: []) else {
                return completion(nil, nil)
            }
            
            let itemsArray = try? decoder.decode([AccountModel].self, from: itemsData)
            let page = try? decoder.decode(PageModel.self, from: pageData)
            
            completion(itemsArray, page)
        }
            
        
    }
    
}
