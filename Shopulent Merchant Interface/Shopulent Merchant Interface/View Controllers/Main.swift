//
//  Main.swift
//  Shopulent Merchant Interface
//
//  Created by Stefan Rheeders on 12/26/20.
//

import Cocoa
import FirebaseAuth

class Main: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Auth.auth().addStateDidChangeListener { auth, user in
          if let firebaseUser = user {
            // User is signed in. Show home screen
          } else {
            self.view.window!.close()
            self.performSegue(withIdentifier: "logoutSegue", sender: self)
          }
        }
    }
    
    @IBAction func logoutButton(_ sender: Any) {
        let firebaseAuth = Auth.auth()
    do {
      try firebaseAuth.signOut()
    } catch let error as NSError {
        let alert = NSAlert()
        alert.messageText = "Error While Logging out"
        alert.informativeText = error.localizedDescription
        alert.addButton(withTitle: "OK")
        alert.alertStyle = NSAlert.Style.critical
        alert.runModal()
    }
    }
}
