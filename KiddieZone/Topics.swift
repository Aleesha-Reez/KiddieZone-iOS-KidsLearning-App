//
//  Topics.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/24/21.
//

import Foundation
import UIKit

struct Topics {
    let title: String
    let image: UIImage
}

let topics: [Topics] = [
    
    Topics(title: "Letters", image: #imageLiteral(resourceName: "ABCimgjpeg.jpeg") ),
    Topics(title: "Books", image:  #imageLiteral(resourceName: "booksImg.png")),
    Topics(title: "Numbers", image: #imageLiteral(resourceName: "123img.jpeg") ),
    Topics(title: "Videos", image: #imageLiteral(resourceName: "playbutton.jpeg") ),
   
]
