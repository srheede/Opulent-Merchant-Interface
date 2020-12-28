//
//  ViewController.swift
//  Shopulent Merchant Interface
//
//  Created by Stefan Rheeders on 12/22/20.
//

import Cocoa
import FirebaseAuth

class Login: NSViewController {

    @IBOutlet weak var emailTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSSecureTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Auth.auth().addStateDidChangeListener { auth, user in
            if let firebaseUser = user {
                // User is signed in. Show home screen
                if (firebaseUser.isEmailVerified){
                    self.view.window!.close()
                    self.performSegue(withIdentifier: "loginSegue", sender: self)
                } else {
                    let alert = NSAlert()
                    alert.messageText = "Activate Your Account"
                    alert.informativeText = "Your email address first needs to be verified. Please go to your email to activate your account"
                    alert.addButton(withTitle: "OK")
                    alert.alertStyle = NSAlert.Style.informational
                    alert.runModal()
                    Auth.auth().currentUser?.sendEmailVerification(completion: { (error) in
                        if let error = error {
                            let alert = NSAlert()
                            alert.messageText = "Error Sending Email Verification"
                            alert.informativeText = error.localizedDescription
                            alert.addButton(withTitle: "OK")
                            alert.alertStyle = NSAlert.Style.informational
                            alert.runModal()
                        }
                    })
                    do {
                        try Auth.auth().signOut()
                    } catch let error as NSError {
                        let alert = NSAlert()
                        alert.messageText = "Error Message"
                        alert.informativeText = error.localizedDescription
                        alert.addButton(withTitle: "OK")
                        alert.alertStyle = NSAlert.Style.critical
                        alert.runModal()
                    }
                }
                }
              }
            
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func loginButton(_ sender: Any) {
        let email = emailTextField.stringValue
        let password = passwordTextField.stringValue
    
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                let alert = NSAlert()
                alert.messageText = "Authentication Error"
                alert.informativeText = error.localizedDescription
                alert.addButton(withTitle: "OK")
                alert.alertStyle = NSAlert.Style.critical
                alert.runModal()
            }
        }
        
    }
}

