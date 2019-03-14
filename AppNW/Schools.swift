//
//  Schools.swift
//  AppNW
//
//  Created by Nalivela,Saikumar on 3/14/19.
//  Copyright © 2019 Nalivela,Saikumar. All rights reserved.
//

import Foundation
class Schools{
    static var shared = Schools()
    var schools:[school] = [
        school(name: "sai", coach: "sai"),
        school(name: "sam", coach: "nw")
    ]
    
    func numSchools()-> Int{
        return schools.count
    }
    
}
class school{
    var name: String
    var coach:String
    var team:[Team]
    func addTeam(name:String,students:[String]){
        
}
    init(name:String,coach:String){
        self.name = name
        self.coach = coach
        self.team = []
    }
}

class Team{
    var name:String
    var students:[String]
    
    init(name:String,students:[String]){
        self.name = name
        self.students = []
    }
    
}
