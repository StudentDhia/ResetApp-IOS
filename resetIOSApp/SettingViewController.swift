//
//  SettingViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 07/12/2017.
//  Copyright © 2017 Walid Helaoui. All rights reserved.
//

import UIKit
import Alamofire

class SettingViewController: UIViewController {

    @IBOutlet weak var drinkingPrice: UITextField!
    @IBOutlet weak var smokingPrice: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveAction(_ sender: Any) {
        let setting = [
            "smokingPrice": smokingPrice.text!,
            "drinkingPrice": drinkingPrice.text!
            ] as [String : Any]
       
        let headers = [
            "Authorization": "Bearer "+ViewController.user.token
        ]
        
        print(setting)
        let url = ViewController.ServerURL+"setting"
        Alamofire.request(url, method:.post, parameters:setting,encoding: JSONEncoding.default,headers: headers).responseJSON { response in
            switch response.result {
            case .success:
                print("done")
            case .failure(let error):
                print(error)
                print("try again")
            }
        }
    }
}
