//
//  AccountTableViewCell.swift
//  declorant
//
//  Created by Дмитрий Яровой on 06/02/2019.
//  Copyright © 2019 Дмитрий Яровой. All rights reserved.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var placeOfWorkLabel: UILabel!
    @IBOutlet private var pdfIcon: UIImageView!
    
    func setup(with account: AccountModel) {
        
        nameLabel.text = account.firstname + " " + account.lastname
        placeOfWorkLabel.text = account.placeOfWork ?? "Неизвестно"
        pdfIcon.isHidden = account.linkPDF == nil
        
    }
}
