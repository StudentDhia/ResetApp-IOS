//
//  SignUpViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 22/11/2017.
//  Copyright © 2017 Walid Helaoui. All rights reserved.
//

import UIKit
import Alamofire

class SignUpViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var reenterPassword: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func signUpAction(_ sender: Any) {
        /*let plainPassword = [
            "first": password.text!,
            "second": reenterPassword.text!
            ] as [String : Any]
            let parameters = [
            "username": username.text!,
            "email": email.text!,
            "plainPassword": plainPassword
            ] as [String : Any]*/
        
        let plainPassword = [
            "first": password.text!,
            "second": reenterPassword.text!
            ] as [String : Any]
        let parameterss = [
            "username": username.text!,
            "email": email.text!,
            "plainPassword": plainPassword
            ] as [String : Any]
        
        print(parameterss)
        //let url = "http://41.226.11.243:10080/reset/webservices/Register"
        
        let url = "http://41.226.11.243:10080/reset/webservices/Register.php?username="+username.text!+"&email="+email.text!+"&password="+password.text!
        
        print(url)
        Alamofire.request(url, method:.get).responseJSON { response in
            switch response.result {
            case .success:
                print("done")
                                //switching the screen
                //let settingViewController = self.storyboard?.instantiateViewController(withIdentifier: "Setting") as! SettingViewController
                //self.navigationController?.pushViewController(settingViewController, animated: true)
                
                //self.dismiss(animated: false, completion: nil)
                
                self.showToast(message: "Account created")
                
            case .failure(let error):
                print(error)
               print("try again")
                self.showToast(message: "Failed to create account")
            }
        }

    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
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
}
