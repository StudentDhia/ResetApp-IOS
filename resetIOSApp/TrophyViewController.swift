//
//  TrophyViewController.swift
//  ProjectRESET
//
//  Created by Xeon on 12/12/17.
//  Copyright © 2017 Xeon. All rights reserved.
//

import UIKit
import UserNotifications

class TrophyViewController: UIViewController {
    
    
    @IBOutlet weak var titre: UILabel!
    @IBOutlet weak var trophy1: UIImageView!
    @IBOutlet weak var trophy2: UIImageView!
    @IBOutlet weak var trophy3: UIImageView!
    @IBOutlet weak var trophy4: UIImageView!
    @IBOutlet weak var trophy5: UIImageView!
    @IBOutlet weak var trophy6: UIImageView!
    @IBOutlet weak var trophy7: UIImageView!
    @IBOutlet weak var trophy8: UIImageView!
    @IBOutlet weak var trophy9: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        trophee(number: 5, cond: 1, msg: "Trophy: You didn't smoke for 1 day", img: trophy1)
        trophee(number: 5, cond: 3, msg: "Trophy: You didn't smoke for 3 day", img: trophy2)
        trophee(number: 5, cond: 7, msg: "Trophy: You didn't smoke for 7 day", img: trophy3)
        trophee(number: 2, cond: 1, msg: "Trophy: You didn't drink for 1 day", img: trophy4)
        trophee(number: 2, cond: 3, msg: "Trophy: You didn't drink for 3 day", img: trophy5)
        trophee(number: 2, cond: 7, msg: "Trophy: You didn't drink for 7 day", img: trophy6)
        trophee(number: 21, cond: 25, msg: "Trophy: You saved 25 $ from smoking or drinking", img: trophy7)
        trophee(number: 21, cond: 50, msg: "Trophy: You saved 50 $ from smoking or drinking", img: trophy8)
        trophee(number: 21, cond: 100, msg: "Trophy: You saved 100 $ from smoking or drinking", img: trophy9)
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func titreMsg(message: String){
        titre.text = message
    }
    
    func trophee(number: Int, cond: Int, msg: String, img: UIImageView){
        
        if number >= cond {
            img.image = #imageLiteral(resourceName: "trophy-png-trophy-icon-1600")
        }
        
        //   let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.imageTapped(gesture:)))
        
        // add it to the image view;
        //       img.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        img.isUserInteractionEnabled = true
        
    }
    
    func imageTapped(gesture: UIGestureRecognizer) {
        // if the tapped view is a UIImageView then set it to imageview
        if (gesture.view as? UIImageView) != nil {
            print("Image Tapped")
            //Here you can initiate your new ViewController
            
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound] , completionHandler: {(granted,error) in
            
            if granted {
                print("Notification access granted")
            }else {
                print("")
            }
        })
        scheduleNotification(time: 11, completion: {
            success in
            if success {
                print("Successfully scheduled notification")
            }
        })
    }
    
    func scheduleNotification(time: TimeInterval,completion: @escaping (_ Success: Bool)->()){
        let notif = UNMutableNotificationContent()
        
        notif.title = "Trophy"
        notif.subtitle = "CongratulationsY"
        notif.body = "You unlocked a new trophy"
        
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

}
