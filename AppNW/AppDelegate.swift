//
//  AppDelegate.swift
//  AppNW
//
//  Created by Nalivela,Saikumar on 3/14/19.
//  Copyright © 2019 Nalivela,Saikumar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    let APP_ID = "3CB43389-F7F5-0728-FF7E-CA43213FA100"
    let API_KEY = "E27762D2-B1F5-C63B-FFFF-B7FA3DD96200"
    
    var backendless = Backendless.sharedInstance()
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        backendless!.initApp(APP_ID, apiKey:API_KEY)
        return true
    }
    
    
}
