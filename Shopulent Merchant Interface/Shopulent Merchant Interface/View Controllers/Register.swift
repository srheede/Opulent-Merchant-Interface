//
//  Register.swift
//  Shopulent Merchant Interface
//
//  Created by Stefan Rheeders on 12/22/20.
//

import Cocoa
import FirebaseAuth

class Register: NSViewController {
    
    @IBOutlet weak var emailTextField: NSTextField!
    @IBOutlet weak var passwordTextField: NSSecureTextField!
    @IBOutlet weak var confirmTextField: NSSecureTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
            
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(self)
    }
    
    @IBAction func createAccountButton(_ sender: Any) {
        let password: String = passwordTextField.stringValue
        let email: String = emailTextField.stringValue
        let confirmPassword: String = confirmTextField.stringValue
        if (Utilities.isValidEmail(email: email) && Utilities.isValidPassword(password: password) && Utilities.isPasswordsMatch(password: password, confirmPassword: confirmPassword)){
            
            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                if let error = error {
                    let alert = NSAlert()
                    alert.messageText = "Error While Creating Account"
                    alert.informativeText = error.localizedDescription
                    alert.addButton(withTitle: "OK")
                    alert.alertStyle = NSAlert.Style.critical
                    alert.runModal()
                } else {
                self.dismiss(self)
                }
            }
            
            }
    }
    
}
