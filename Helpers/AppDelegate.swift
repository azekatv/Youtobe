//
//  AppDelegate.swift
//  youtobe
//
//  Created by Azamat on 08.11.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let layout = UICollectionViewFlowLayout()
        window?.rootViewController = UINavigationController(rootViewController: HomeController())
        
// get rid of black bar underneath navbar
//        UINavigationBar.appearance().barTintColor = UIColor.rgb(red: 230, green: 32, blue: 31)
//        UINavigationBar.appearance().shadowImage = UIImage()
//        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .bottom, barMetrics: .default)
        
//        application.statusBarStyle = .lightContent
//
//        let statusBarBackgroundView = UIStat
//        statusBarBackgroundView.backgroundColor = UIColor.rgb(red: 194, green: 31, blue: 31)
//
//        window?.addSubview(statusBarBackgroundView)
//        window?.addConstraintsWidthFormat(format: "H:|[v0]|", views: statusBarBackgroundView)
//        window?.addConstraintsWidthFormat(format: "V:|[v0(20)]|", views: statusBarBackgroundView)
        
        return true
    }

}


