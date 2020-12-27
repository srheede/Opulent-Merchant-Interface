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
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func forgotPasswordButton(_ sender: Any) {
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
            } else {
                 
                self?.performSegue(withIdentifier: "loginSegue", sender: self)
                
                
       

            }
        }
    }
}

