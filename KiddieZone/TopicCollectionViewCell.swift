//
//  TopicCollectionViewCell.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/25/21.
//

import UIKit

class TopicCollectionViewCell: UICollectionViewCell {
    
   
    @IBOutlet weak var topicsImageView: UIImageView!
    
   
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(with topics: Topics) {
        topicsImageView.image = topics.image
        titleLabel.text = topics.title
    }
    
}
