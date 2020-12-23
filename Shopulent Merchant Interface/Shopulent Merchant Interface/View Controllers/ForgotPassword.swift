//
//  ForgotPassword.swift
//  Shopulent Merchant Interface
//
//  Created by Stefan Rheeders on 12/23/20.
//

import Cocoa

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
            
        }
    }
    
}
