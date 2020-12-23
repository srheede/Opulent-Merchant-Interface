//
//  Register.swift
//  Shopulent Merchant Interface
//
//  Created by Stefan Rheeders on 12/22/20.
//

import Cocoa

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
    }
    
}
