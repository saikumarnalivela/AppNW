//
//  addschoolViewController.swift
//  AppNW
//
//  Created by Nalivela,Saikumar on 3/14/19.
//  Copyright © 2019 Nalivela,Saikumar. All rights reserved.
//

import UIKit

class addschoolViewController: UIViewController {

    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var coachTF: UITextField!
    
    
    @IBAction func CloseBTN(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func DoneBTN(_ sender: Any) {
        let name = nameTF.text!
        let coach = coachTF.text!
        let addschool = school(name: name, coach: coach)
        Schools.shared.add(school: addschool)
        super.viewDidLoad()
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewWillAppear(true)
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
