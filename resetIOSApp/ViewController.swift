//
//  ViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 15/11/2017.
//  Copyright © 2017 Walid Helaoui. All rights reserved.
//

import UIKit
import Alamofire
import UserNotifications
import SVProgressHUD

class ViewController: UIViewController {

    @IBOutlet weak var Username: UITextField!
    @IBOutlet weak var Password: UITextField!
    var token:String!
    static var user : User!
    static var ServerURL: String = "http://41.226.11.243:10080/reset/webservices/"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound] , completionHandler: {(granted,error) in
            
            if granted {
                print("Notification access granted")
            }else {
                print("")
            }
        })
        scheduleNotification(time: 5, completion: {
            success in
            if success {
                print("Successfully scheduled notification")
            }
        })
    }
    
    func scheduleNotification(time: TimeInterval,completion: @escaping (_ Success: Bool)->()){
        let notif = UNMutableNotificationContent()
        
        notif.title = "Quiz Alert"
        notif.subtitle = "You have a New Quiz"
        notif.body = "You still have a quiz waiting for response"
        
        let notifTrigger = UNTimeIntervalNotificationTrigger(timeInterval: time, repeats: false)
        
        let request = UNNotificationRequest(identifier: "myNotification", content: notif, trigger: notifTrigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
            if error != nil {
                print(error ??  "")
                completion(false)
            }else {
                completion(true)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginAction(_ sender: Any) {
        SVProgressHUD.show()
        logIn()
    }
    
    func logIn() {
        
        /*let parameters = [
            "username": Username.text!,
            "password": Password.text!
        ] as [String : Any]*/
        //let url = ViewController.ServerURL+"login.php?username=\(String(describing: Username.text))&password=\(String(describing: Password.text))"
        let url = ViewController.ServerURL+"login.php?username="+Username.text!+"&password="+Password.text!
        Alamofire.request(url, method:.get).responseJSON { response in
            switch response.result {
            case .success:
                print(response)
                var dict = response.result.value as! Dictionary<String,AnyObject>
                //let data:Dictionary=dict["data"] as! Dictionary<String,AnyObject>
                //self.token=data["token"] as! String
                print(self.token)
                //self.getCurrentUser()
                //switching the screen
                //let settingViewController = self.storyboard?.instantiateViewController(withIdentifier: "Setting") as! SettingViewController
                //self.navigationController?.pushViewController(settingViewController, animated: true)
                
                //self.dismiss(animated: false, completion: nil)
                SVProgressHUD.dismiss()
                ViewController.user = User()
                ViewController.user.email = dict["email"] as! String
                ViewController.user.username = dict["username"] as! String
                
                if dict["drinker"]==1 as AnyObject as! _OptionalNilComparisonType{
                    ViewController.user.drinker = true
                    }else{
                    ViewController.user.drinker = false
                }
                
                if dict["smoker"]==1 as AnyObject as! _OptionalNilComparisonType{
                    ViewController.user.drinker = true
                }else{
                    ViewController.user.drinker = false
                }
                
                //ViewController.user.smoker = dict["smoker"] as! Int
                //ViewController.user.drinker = dict["drinker"] as! Bool
                //ViewController.user.smoke_score = dict["smoke_score"] as! Int
                ViewController.user.smoke_score = (dict["smoke_score"] as! NSString).integerValue
                //ViewController.user.drink_score = dict["drink_score"] as! Int
                ViewController.user.drink_score = (dict["drink_score"] as! NSString).integerValue
                ViewController.user.token = dict["id"] as! String
                print(ViewController.user.email)
                print(ViewController.user.username)
                self.performSegue(withIdentifier: "test", sender: self)
                
                
            case .failure(let error):
                print(error)
                print("try again")
                
                self.showToast(message: "Error in login")
                
                SVProgressHUD.dismiss()
            }
        }
    
    }
    
    func showToast(message : String) {
        
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 75, y: self.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
    
    
    func getCurrentUser() {
        
        let headers = [
            "Authorization": "Bearer "+token!
        ]
        let url = ViewController.ServerURL+"user"
        Alamofire.request(url, method: .post, parameters: nil, encoding: URLEncoding.httpBody,headers: headers).responseJSON {
            response in
        switch response.result {
        case .success:

            let dict = response.result.value as! Dictionary<String,AnyObject>

            ViewController.user = User()
            ViewController.user.email = dict["email"] as! String
            ViewController.user.username = dict["username"] as! String
            ViewController.user.smoker = dict["smoker"] as! Bool
            ViewController.user.drinker = dict["drinker"] as! Bool
            ViewController.user.smoke_score = dict["smoke_score"] as! Int
            ViewController.user.drink_score = dict["drink_score"] as! Int
            print(ViewController.user.email)
            print(ViewController.user.username)
            self.performSegue(withIdentifier: "test", sender: self)
        case .failure(let error):
            print(error)
            print("try again")
        }

        
    }

}
    
    

}
