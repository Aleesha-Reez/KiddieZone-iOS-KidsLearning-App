//
//  BooksViewController.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/12/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import PromiseKit
import WebKit
import SDWebImage



class BooksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    var booksArr: [Books] = [Books]()
  
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.delegate = self
        self.tblView.dataSource = self

    }
    
  
    override func viewWillAppear(_ animated: Bool) {
          getData();
      }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        booksArr.count

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

     
      let cell = Bundle.main.loadNibNamed("BooksTableViewCell", owner: self, options: nil)?.first as! BooksTableViewCell
       
      
        cell.lblTitle.text = "\(booksArr[indexPath.row].title) "
        cell.lblAuthor.text = "\(booksArr[indexPath.row].authors) "
        
        print(booksArr[indexPath.row].imurl)
        cell.booksImage.sd_setImage(with: URL(string: booksArr[indexPath.row].imurl), placeholderImage:UIImage(named:"Login"))
       
        return cell
    }
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
        {
        
        let link = booksArr[indexPath.row].url
        if let url = URL(string: link){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }  //else you entered an incorrect link
        }
    

    func getUrl() -> String
       {
                  let url = apiURL
                  return url
       }
          
       func getData()
       {
                    let url = getUrl()
          
                    AF.request(url).responseJSON { response in
                              
                           if response.error == nil {
                                   
                               guard let data = response.data else { return }
                              
                               guard let res = JSON(data).dictionary else { return }
                              
                               let items = res["items"]?.array;

                               if items!.count == 0 { return }

                              // self.booksArr = [Books]()

                               for eachOne in items! {

                                   
                                   let id = eachOne["id"].stringValue
                                  
                                   let title = eachOne["volumeInfo"]["title"].stringValue

                                   let authors = eachOne["volumeInfo"]["authors"].array!
                                   
                                   var author = ""
                                   
                                   for j in authors{
                                       
                                       author += "\(j.stringValue)"
                                   }
                                   
                                   let imurl = eachOne["volumeInfo"]["imageLinks"]["thumbnail"].stringValue
                                   let url = eachOne["volumeInfo"]["previewLink"].stringValue
                                   let description = eachOne["volumeInfo"]["description"].stringValue

                                  // DispatchQueue.main.async {
                                       
                                       self.booksArr.append(Books(id: id, title:  title,authors: author, imurl: imurl, url: url, desc: description))
                                 //  }
                                  
                                  // self.booksArr.append(Books(id: id, title:  title,authors: author, imurl: imurl, url: url, desc: description))
                               }

                               self.tblView.reloadData()
                           }
                              
                       }
                   }

}
