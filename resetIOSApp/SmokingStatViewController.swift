//
//  SmokingStatViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 23/11/2017.
//  Copyright © 2017 Walid Helaoui. All rights reserved.
//

import UIKit
import Alamofire

class SmokingStatViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource{

    var data : NSArray = []
    
    @IBOutlet weak var myTab: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getSmoking()
        // Do any additional setup after loading the view.
    }
    func getSmoking() {
        
        /*let headers = [
            "Authorization": "Bearer "+ViewController.user.token
        ]*/
        let url = ViewController.ServerURL+"SmokingDataSource.php?id="+ViewController.user.token
        Alamofire.request(url, method: .get).responseJSON {
            response in
            switch response.result {
            case .success:
                //   print(response.result.value)
                let dict = response.result.value as! NSDictionary
                self.data = dict["smoking_statistics"] as! NSArray
                print(self.data)
                self.myTab.reloadData()
                //   for i in 0 ... self.data.count {
                //   let dec = self.data[i] as! Dictionary<String,AnyObject>
                
                //     }
            //  self.dict = response.result.value as! NSArray
            case .failure(let error):
                print(error)
                print("try again")
            }
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")

        let number : UILabel = cell?.viewWithTag(100) as! UILabel
        let price : UILabel = cell?.viewWithTag(101) as! UILabel
        let date : UILabel = cell?.viewWithTag(102) as! UILabel
        

        let items = data[indexPath.row] as! Dictionary<String,AnyObject>
        print("hello")

       // let num = String(describing: items["number"])
        
        let num = "\(items["number"] ?? 0 as AnyObject)"
        let priceCig = "\(items["price"] ?? 0 as AnyObject)"
   //     number.text = items["number"] as? String
   //     price.text = items["price"] as? String
    //    date.text = ""
        number.text = "Number: "+num
        price.text = "Price: "+priceCig
        date.text = items["date"] as? String
       // number.text = "123"
       // price.text = "75000"
       // date.text = "21/12/1993"
        //print(price.text)
        return cell!
    }
    

    

}
