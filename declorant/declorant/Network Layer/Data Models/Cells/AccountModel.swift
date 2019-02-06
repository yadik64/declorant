//
//  AccountModel.swift
//  declorant
//
//  Created by Дмитрий Яровой on 05/02/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import Foundation

struct AccountModel : Codable { // items
    
    let id: String
    let firstname: String
    let lastname: String
    let placeOfWork: String?
    let position: String?
    let linkPDF: String?
    
}
