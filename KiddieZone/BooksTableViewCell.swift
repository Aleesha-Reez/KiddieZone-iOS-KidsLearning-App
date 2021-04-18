//
//  BooksTableViewCell.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/12/21.
//

import UIKit

class BooksTableViewCell: UITableViewCell {

    
    @IBOutlet weak var booksImage: UIImageView!
    
    
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblAuthor: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
