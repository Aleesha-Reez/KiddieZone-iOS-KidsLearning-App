//
//  VideosViewController.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/13/21.
//

import UIKit
import youtube_ios_player_helper

/*class VideosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    
    

    @IBOutlet weak var videosTblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.videosTblView.delegate = self
        self.videosTblView.dataSource = self
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0;
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! videoTableDataClass
        let videourl = NSURL(string: "https://www.youtube.com/embed/Kmq6JU-1N9M")
        let requestObj = URLRequest(url: videourl! as URL)
        cell.webView.load(requestObj)
        return cell
        
    }
}*/
class VideosViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let videoId = [ "PKgvOcjJJjA", "glkQwKA5_PU", "IEF8_q5yDYc", "1VBW6rdvRks"]
    var index :Int = 0
 
    @IBOutlet weak var videosTblView: UITableView!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let videoId = [ "PKgvOcjJJjA", "glkQwKA5_PU", "IEF8_q5yDYc", "1VBW6rdvRks"]
     
        self.videosTblView.delegate = self
        self.videosTblView.dataSource = self
        
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoId.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
     //   cell.playerView.load(withVideoId: "PKgvOcjJJjA")
        
        let cell = Bundle.main.loadNibNamed("VideosTableViewCell", owner: self, options: nil)?.first as! VideosTableViewCell
        /*let row = indexPath.row
        print(videoId[indexPath.row])*/
        
        let urll = "https://www.youtube.com/embed/\(videoId[indexPath.row])"
        let videourl = NSURL(string: urll)
        let requestObj = URLRequest(url: videourl! as URL)
        cell.webView.load(requestObj)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0;
    }
    
  

}
