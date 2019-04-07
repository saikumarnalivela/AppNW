//
//  addteamViewController.swift
//  AppNW
//
//  Created by Nalivela,Saikumar on 3/14/19.
//  Copyright © 2019 Nalivela,Saikumar. All rights reserved.
//

import UIKit

class addteamViewController: UIViewController {
    
    
    @IBOutlet weak internal var teamname: UITextField!
    
    @IBOutlet weak internal var student1TF: UITextField!
    
    @IBOutlet weak internal var student2TF: UITextField!
    
    @IBOutlet weak internal var student3TF: UITextField!
    var schooltest:school!
    
    @IBAction internal func doneBTN(_ sender: Any){
        let t1 = teamname.text!
        let l2 = student1TF.text!
        let l3 = student2TF.text!
        let l4 = student3TF.text!
//        schooltest.addTeam(name: t1, students: [l2,l3,l4])
        Schools.shared.saveTeamForSelectedSchool(school: schooltest, team: Team(name: t1, students: [l2,l3,l4]))
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction internal func closeBTN(_ sender: Any){
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
