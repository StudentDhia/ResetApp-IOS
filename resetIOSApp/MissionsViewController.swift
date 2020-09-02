//
//  MissionsViewController.swift
//  ProjectRESET
//
//  Created by Xeon on 11/29/17.
//  Copyright © 2017 Xeon. All rights reserved.
//

import UIKit

class MissionsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var infoText: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    
    var details: DetailsViewController?
    
    var indexCell : Int = 0
    
    let pics : [UIImage] = [UIImage(named: "badge1")!,UIImage(named: "badge2")!]
    let noms : [String] = ["Take slow, deep breaths. Breathe through your craving. Inhale through your nose and exhale through your mouth. Repeat this 10 times or until you're feeling more relaxed."
        ,"Keep your mouth busy. Chew a stick of gum instead of picking up a cigarette. Keep hard candy with you. Drink more water."
        ,"Do something else. When a craving hits, stop what you're doing immediately and switch to doing something different. Simply changing your routine might help you shake off a craving."
        ,"Go for a walk or jog. Or go up and down the stairs a few times. Physical activity, even in short bursts, can help boost your energy and beat a craving."]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.tableView.reloadData()
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.noms.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "mycell2")!
        
        
        //let lbl = cell.contentView.viewWithTag(111) as! UIImageView
        //lbl.image = pics[indexPath.row]
        
        let lb2 = cell.contentView.viewWithTag(112) as! UILabel
        lb2.text = "Mission \(indexPath.row + 1)"
        
        let lb3 = cell.contentView.viewWithTag(113) as! UILabel
        lb3.text = "In progress"
        
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "detailsShow" {
            let index : Int = (tableView.indexPathForSelectedRow?.row)!
            self.details = segue.destination as? DetailsViewController
            self.details?.cellContent = noms[index]
            
        }
    }
    
    
    
}
