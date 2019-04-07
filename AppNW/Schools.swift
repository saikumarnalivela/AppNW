//
//  Schools.swift
//  AppNW
//
//  Created by Nalivela,Saikumar on 3/14/19.
//  Copyright © 2019 Nalivela,Saikumar. All rights reserved.
//

import Foundation

class Schools{
    
    let backendless = Backendless.sharedInstance()!
    var schoolDataStore:IDataStore!
    var teamSitesDataStore:IDataStore!
    //static var shared:TouristBureau = TouristBureau() // our singleton
    static var shared = Schools()
    var schools:[school]
    //static var School = school()
    var teams: [Team]
    var objectId:String?
    var created:NSDate?
    var updated:NSDate?
    var selectedSchool:school?                              // the city that we selected in CitiesTableViewController and will display tourist sites for
    var teamsForSelectedSchool:[Team] = []
    
    convenience init(){
        self.init(schools: [], teams: [])
    }
    
    init(schools: [school], teams: [Team]){
        self.schools = schools
        self.teams = teams
        schoolDataStore = backendless.data.of(school.self)
        teamSitesDataStore = backendless.data.of(Team.self)
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
    
    func deleteSchool(school: school){
        schoolDataStore.remove(school)
        delete(school: school)
    }
    
    func retrieveAllSchhols() {
        let queryBuilder = DataQueryBuilder()
        queryBuilder!.setRelated(["teams"])      // TouristSites referenced in City's touristSites property will be retrieved for each City
        queryBuilder!.setPageSize(100)                  // up to 100 TouristSites can be retrieved for each City)
        
        Types.tryblock({() -> Void in
            self.schools = self.schoolDataStore.find(queryBuilder) as! [school]
            
        },
                       catchblock: {(fault) -> Void in print(fault ?? "Something has gone wrong  reloadingAllCities()")}
        )
        
    }
    
    // fetches all tourist sites storing results in touristsites
   
    // fetches TouristSites for selected city and reloads touristSitesForSelectedCity

    func retrieveTeamsForSelectedSchool() {
        let startDate = Date()
        
        Types.tryblock( {
            let queryBuilder:DataQueryBuilder = DataQueryBuilder()
            queryBuilder.setWhereClause("name = '\(self.selectedSchool?.name)' ")
            queryBuilder.setPageSize(100)
            queryBuilder.setRelated( ["team"] )
            let result = self.schoolDataStore.find(queryBuilder) as! [school] // query returns an array, but we will only have 1 element
            self.teamsForSelectedSchool = result[0].team     // now we have all its touristSites
            //NotificationCenter.default.post(name: .TouristSitesForSelectedCityRetrieved, object: nil) // broadcast a Notification that tourist sites have been retrieved
        },
                        catchblock: {(exception) -> Void in
                            print("Oopsie retrieving tourist sites for selected city -- \(exception.debugDescription)")
        })
        //print("Done in \(Date().timeIntervalSince(startDate)) seconds ")
    }
    
    // creates a City, saves it both locally and in the data store
    func saveSchool(name:String, coach:String) {
        
        //
        var schoolToSave = school(name: name, coach: coach, teams : [])
        schoolToSave = schoolDataStore.save(schoolToSave) as! school // so our local version, in cities, has the objectId filled in
        schools.append(schoolToSave)
        
        //
    }
    
    // saves a (new) tourist site for the selected city
    func saveTeamForSelectedSchool(school: school, team:Team) {
        print("Saving the team for the selected school...")
        //let startingDate = Date()
        Types.tryblock({
            let savedTeamSite = self.teamSitesDataStore.save(team) as! Team // save one of its TouristSites
            self.schoolDataStore.addRelation("team:Teaam:n",  parentObjectId: school.objectId, childObjects: [savedTeamSite.objectId!])
            
        }, catchblock:{ (exception) -> Void in
            print(exception.debugDescription)
        })
        school.addTeam(name: team.name, students: team.students)
       // print("Done!! in \(Date().timeIntervalSince(startingDate)) seconds")
    }
    
}
@objcMembers
class school:NSObject{
    
    var name: String
    var coach:String
    var team:[Team]
    var objectId:String?
    //var objectId:String?
    var created:NSDate?
    var updated:NSDate?
    override init(){
        self.name = ""
        self.coach = ""
        self.team = []
    }

    
    init(name:String,coach:String, teams: [Team]){
        self.name = name
        self.coach = coach
        self.team = teams
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
@objcMembers
class Team:NSObject{
    var name:String
    var students:[String]
    var objectId:String?
    //var objectId:String?
    var created:NSDate?
    var updated:NSDate?
    
    init(name:String,students:[String]){
        self.name = name
        self.students = students
    }
    
    convenience override init(){
        self.init(name: "", students: [])
    }
}
