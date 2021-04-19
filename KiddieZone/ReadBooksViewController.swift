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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
