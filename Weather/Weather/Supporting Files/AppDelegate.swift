//
//  AppDelegate.swift
//  Weather
//
//  Created by Taina Viriato on 13/04/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    let forecast = ForecastRouter.createModule()
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = forecast
    window?.makeKeyAndVisible()
     
    return true
  }
} 
