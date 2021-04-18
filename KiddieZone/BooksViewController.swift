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



class BooksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
   
    
    var booksArr: [Books] = [Books]()
    var webView: WKWebView!
    
   
    
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblView.delegate = self
        self.tblView.dataSource = self
       /* let myURL = URL(string:"https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)*/

    }
    
  /*  override func loadView() {
       let webConfiguration = WKWebViewConfiguration()
       webView = WKWebView(frame: .zero, configuration: webConfiguration)
       webView.uiDelegate = self
       view = webView
    }
    */
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
       
        // print(booksArr[indexPath.row].id)
        cell.lblTitle.text = "\(booksArr[indexPath.row].title) "
        cell.lblAuthor.text = "\(booksArr[indexPath.row].authors) "
       // cell.booksImage.image =  UIImage(
        // cell.booksImage.image = UIImage(named :maxIcon)
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

                              // self.booksArr = [Books]()

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
    
   /* struct WebView : UIViewRepresentable {
        
        var url : String
        
        func makeUIView(context: UIViewRepresentableContext<WebView>) -> WKWebView {
            
            let view = WKWebView()
            view.load(URLRequest(url: URL(string: url)!))
            return view
        }
        
        func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
            
            
        }*/
    
                    /*getBooksData(url: url)
                          .done { (books) in
                              self.booksArr = [Books]()
                              for book in books {
                                  self.booksArr.append(book)
                              }
                             
                              self.tblBooks.reloadData()
                          }
                          .catch { (error) in
                              print("Error in getting all the values \(error)")
                          }
                          
          }
          
          func getBooksData(url : String) -> Promise<Books>{
                      
                      return Promise<Books> { seal -> Void in
                          
                        
                          AF.request(url).responseJSON { response in
                          
                              if response.error == nil {
                      
                               var arr: Books = Books(id, title, authors, imurl, url, desc)
                                  
                                  guard let data = response.data else {return seal.fulfill( arr ) }
                                  
                                  guard let details = JSON(data).array else { return  seal.fulfill( arr ) }
                                  
                                  for eachOne in details {
                                      
                                      let id = eachOne["id"].stringValue
                                      let title = eachOne["volumeInfo"]["title"].stringValue
                                      let author = eachOne["volumeInfo"]["authors"].stringValue
                                     /* let authors = eachOne["volumeInfo"]["authors"].array!
                                      var author = ""
                                      for j in authors{
                                          
                                          author += "\(j.stringValue)"
                                      }*/
                                      
                                      let imurl = eachOne["volumeInfo"]["imageLinks"]["thumbnail"].stringValue
                                      let url = eachOne["volumeInfo"]["previewLink"].stringValue
                                      let description = eachOne["volumeInfo"]["description"].stringValue
                                      
                                      let bookDetails = Books(id: id, title:  title,authors: author, imurl: imurl, url: url, desc: description )
                                      bookDetails.id = id
                                      bookDetails.title = title
                                      bookDetails.authors = author
                                      bookDetails.imurl = imurl
                                      bookDetails.url = url
                                      bookDetails.desc = description
                                      
                                      arr.append(bookDetails)
                                      
                                    
                                      
                                  }
                                  
                                  seal.fulfill(arr)
                              }
                              else {
                                  seal.reject(response.error!)
                              }
                          }// end of AF request
                      }//End of Promise return
                  }// End of function
          
          */
         


    

}
