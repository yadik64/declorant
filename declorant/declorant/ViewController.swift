//
//  ViewController.swift
//  declorant
//
//  Created by Дмитрий Яровой on 05/02/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkLayer.searcDeclarations(name: "Мальований") { (resultsArray, page) in
            
            print(page!)
            
        }
    }


}

