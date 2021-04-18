//
//  videoTableDataClass.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/14/21.
//

import UIKit
import youtube_ios_player_helper

class videoTableDataClass: UITableViewCell {

    @IBOutlet weak var webView: WKWebView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
