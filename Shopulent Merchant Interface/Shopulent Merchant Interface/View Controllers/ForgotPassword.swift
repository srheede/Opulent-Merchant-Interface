//
//  ForgotPassword.swift
//  Shopulent Merchant Interface
//
//  Created by Stefan Rheeders on 12/23/20.
//

import Cocoa
import FirebaseAuth

class ForgotPassword: NSViewController {

    @IBOutlet weak var emailTextField: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(self)
    }
    
    @IBAction func resetPasswordButton(_ sender: Any) {
        let email: String = emailTextField.stringValue
        if (Utilities.isValidEmail(email: email)){
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let error = error {
                    let alert = NSAlert()
                    alert.messageText = "Error Message"
                    alert.informativeText = error.localizedDescription
                    alert.addButton(withTitle: "OK")
                    alert.alertStyle = NSAlert.Style.critical
                    alert.runModal() }
                else {
                    let alert = NSAlert()
                    alert.messageText = "Password Reset Email Sent"
                    alert.informativeText = "Please follow the link sent to your email address to reset your password."
                    alert.addButton(withTitle: "OK")
                    alert.alertStyle = NSAlert.Style.informational
                    alert.runModal() }
                    }
            }
    }
}
