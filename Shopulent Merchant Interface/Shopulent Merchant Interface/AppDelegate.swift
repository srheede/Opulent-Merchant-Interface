//
//  AppDelegate.swift
//  Shopulent Merchant Interface
//
//  Created by Stefan Rheeders on 12/22/20.
//

import Cocoa
import FirebaseCore
import FirebaseDatabase

@main
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    override init() {

    FirebaseApp.configure()

    Database.database().isPersistenceEnabled = true

    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
    Database.database().reference()
        
    }

}

