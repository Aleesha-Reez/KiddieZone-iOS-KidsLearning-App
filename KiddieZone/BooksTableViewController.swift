//
//  BooksTableViewController.swift
//  KiddieZone
//
//  Created by ASHITHA REEZ on 4/18/21.
//

import UIKit
import Alamofire
import SwiftyJSON
import PromiseKit
import WebKit

class BooksTableViewController: UITableViewController {

    var booksArr: [Books] = [Books]()
    
    var links = ["http://www.facebook.com","http://www.twitter.com","http://www.instagram.com","http://www.linkedin.com"]

    
    
    @IBOutlet var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    // MARK: - Table view data source

   override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func viewWillAppear(_ animated: Bool) {
          getData();
      }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0;
    }
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  booksArr.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("BooksTableViewCell", owner: self, options: nil)?.first as! BooksTableViewCell
          cell.lblTitle?.text = "\(booksArr[indexPath.row].title) "
          cell.lblAuthor.text = "\(booksArr[indexPath.row].authors) "
          return cell
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

                               for eachOne in items! {

                                   
                                   let id = eachOne["id"].stringValue
                                  
                                   let title = eachOne["volumeInfo"]["title"].stringValue
                                  // let author = eachOne["volumeInfo"]["authors"].stringValue
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
                                  // print(self.booksArr)
                                  // self.booksArr.append(Books(id: id, title:  title,authors: author, imurl: imurl, url: url, desc: description))
                               }

                               self.tblView.reloadData()
                           }
                              
                       }
                   }
    

   
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        if segue.identifier == "showLinks" {
                    if let indexPath = tblView.indexPathForSelectedRow {
                        let destination = segue.destination as? ReadBooksViewController
                        destination?.links = links[indexPath.row]
                    }
                }
            }
            
    
    
    

}
