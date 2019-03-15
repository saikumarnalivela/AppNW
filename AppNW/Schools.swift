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
    private var schools:[school]
    
    init(){
        self.schools = []
    }
    
    func numSchools()-> Int{
        return schools.count
    }
    
    subscript(index:Int) -> school {
        return schools[index]
    }
    
    func add(school:school){
        schools.append(school)
    }
    
    
    func delete(school:school){
        for i in 0 ..< schools.count {
            if schools[i].name == school.name {
                schools.remove(at:i)
                break
            }
        }
        
    }
}

class school{
    var name: String
    var coach:String
    var team:[Team]
    
    init(name:String,coach:String){
        self.name = name
        self.coach = coach
        self.team = []
    }
    
    func addTeam(name:String,students:[String]){
        team.append(Team(name: name, students: students))
        
    }
    
    func numteams() -> Int{
        return team.count
    }

    subscript(index:Int) -> Team {
        return team[index]
    }
}

class Team{
    var name:String
    var students:[String]
    
    init(name:String,students:[String]){
        self.name = name
        self.students = students
    }    
}
