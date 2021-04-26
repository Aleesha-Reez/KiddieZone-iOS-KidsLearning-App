//
//  ReadBooksViewController.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/18/21.
//

import UIKit
import WebKit

class ReadBooksViewController: UIViewController {

    var links: String = ""
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL (string: links)
        let request = URLRequest(url: url!)
        webView.load(request)
        
    }
    
}
