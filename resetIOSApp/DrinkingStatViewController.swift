//
//  DrinkingStatViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 09/01/2018.
//  Copyright © 2018 Walid Helaoui. All rights reserved.
//

import UIKit
import Alamofire

class DrinkingStatViewController: UIViewController ,UITableViewDelegate , UITableViewDataSource {

    var data : NSArray = []

    @IBOutlet var myTab: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        getDrinking()
        // Do any additional setup after loading the view.
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
        
        let num = "\(items["number"] ?? 0 as AnyObject)"
        let priceCig = "\(items["price"] ?? 0 as AnyObject)"
        number.text = "Number: "+num
        price.text = "Price: "+priceCig
        date.text = items["date"] as? String

        return cell!
    }
    
    func getDrinking() {
        
        /*let headers = [
            "Authorization": "Bearer "+ViewController.user.token
        ]*/
        let url = ViewController.ServerURL+"DrinkingDataSource.php?id="+ViewController.user.token
        Alamofire.request(url, method: .get).responseJSON {
            response in
            switch response.result {
            case .success:
                //   print(response.result.value)
                let dict = response.result.value as! NSDictionary
                self.data = dict["drinking_statistics"] as! NSArray
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


}
