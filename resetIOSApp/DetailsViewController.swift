//
//  DetailsViewController.swift
//  ProjectRESET
//
//  Created by Xeon on 11/29/17.
//  Copyright © 2017 Xeon. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var cellContent: String!
    
    
    @IBOutlet weak var textMotiv: UILabel!
    @IBOutlet weak var confirmer: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textMotiv.text = cellContent
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        
        
    }
    
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
     if segue.identifier == "ConfirmShow" {
     self.details = segue.destination as? MissionsViewController
     self.details?.cellContent = noms[index]
     
     }
     }*/
    
}
