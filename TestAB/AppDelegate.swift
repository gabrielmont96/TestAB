//
//  AppDelegate.swift
//  TestAB
//
//  Created by Gabriel Monteiro Camargo da Silva - GCM on 13/04/20.
//  Copyright © 2020 Gabriel Monteiro Camargo da Silva - GCM. All rights reserved.
//

import UIKit
import Firebase
import FirebaseRemoteConfig

@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static var remoteConfig = RemoteConfig.remoteConfig()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        
        setupRemoteConfigDefaultValues()
        setupRemoteConfig()
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    func setupRemoteConfig() {
        let settings = RemoteConfigSettings(developerModeEnabled: true)
        settings.minimumFetchInterval = 0
        AppDelegate.remoteConfig.configSettings = settings
        fetchRemoteConfig()
    }
    
    func fetchRemoteConfig(finished: (() -> Void)? = nil) {
        AppDelegate.remoteConfig.fetch(withExpirationDuration: 0, completionHandler: { (status, error) in
            if status == .success {
                AppDelegate.remoteConfig.activate(completionHandler: { error in
                    finished?()
                })
            } else {
                print(error)
                finished?()
            }
        })
    }
    
    func setupRemoteConfigDefaultValues() {
        let defaultValues = [
            "teste_remoteconfig": "didn't download" as NSObject
        ]
        
        AppDelegate.remoteConfig.setDefaults(defaultValues)
    }
}

