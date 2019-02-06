//
//  SearchResultViewController.swift
//  declorant
//
//  Created by Дмитрий Яровой on 06/02/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class SearchResultViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    var nameForSearch: String = ""
    
    var currentPage: PageModel?
    var isLoadingNow = false
    
    var foundAccount: [AccountModel] = [] {
        
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "AccountTableViewCell", bundle: nil), forCellReuseIdentifier: "AccountTableViewCell")
        
        makeNetworkRequest(errorHandler: nil)
    }
    
    func makeNetworkRequest(errorHandler: (() -> Void)?) {
        guard !isLoadingNow  else {
            return
        }
        
        isLoadingNow = true
        NetworkLayer.searcDeclarations(name: nameForSearch) { (accounts, page) in
            
            self.isLoadingNow = false
            
            guard let accounts = accounts, let page = page else {
                return
            }
            
            self.currentPage = page
            self.foundAccount += accounts
            
        }
    }

}

extension SearchResultViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foundAccount.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AccountTableViewCell") as? AccountTableViewCell
        cell?.setup(with: foundAccount[indexPath.row])
        return cell!
    }
    
    
    
}
