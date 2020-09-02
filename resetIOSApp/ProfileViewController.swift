//
//  SettingViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 22/11/2017.
//  Copyright © 2017 Walid Helaoui. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var user: UILabel!
    @IBOutlet weak var email: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("aaa "+ViewController.user.username)
        user.text = "Welcome "+ViewController.user.username
        email.text = ViewController.user.email
        
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

}
