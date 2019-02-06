//
//  SearchViewController.swift
//  declorant
//
//  Created by Дмитрий Яровой on 06/02/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit
import SafariServices

class SearchViewController: UIViewController {

    @IBOutlet var nameFieldOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameFieldOutlet.delegate = self
    }
    
    @IBAction func searchButtonAction() {
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
    @IBAction func reportButtonAction() {
        
        guard let reportURL = URL(string: NetworkLayer.reportString) else {
            return
        }
        
        let safariVC = SFSafariViewController(url: reportURL)
        
        self.present(safariVC, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "showResult" else {
            return
        }
        
        let destination = segue.destination as? SearchResultViewController
        
        destination?.nameForSearch = nameFieldOutlet.text ?? ""
        
        let backButton = UIBarButtonItem()
        backButton.title = ""
        navigationItem.backBarButtonItem = backButton
    }
    
}

extension SearchViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchButtonAction()
        return true
    }
}
