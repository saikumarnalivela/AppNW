//
//  studentViewController.swift
//  AppNW
//
//  Created by Nalivela,Saikumar on 3/14/19.
//  Copyright © 2019 Nalivela,Saikumar. All rights reserved.
//

import UIKit

class studentViewController: UIViewController {
    var teamdetails:Team!
    @IBOutlet weak var navigation: UINavigationItem!
    @IBOutlet weak var student1: UILabel!
    @IBOutlet weak var student3: UILabel!
    @IBOutlet weak var student2: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        navigation.title = teamdetails.name
        student1.text = teamdetails.students[0]
        student2.text = teamdetails.students[1]
        student3.text = teamdetails.students[2]
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
    }
    

}
