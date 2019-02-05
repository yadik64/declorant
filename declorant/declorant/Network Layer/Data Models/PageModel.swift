//
//  PageModel.swift
//  declorant
//
//  Created by Дмитрий Яровой on 05/02/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import Foundation

struct PageModel: Codable { // page
    
    let currentPage: Int
    let batchSize: Int
    let totalItems: String
}
