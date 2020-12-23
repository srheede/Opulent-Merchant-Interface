//
//  ViewController.swift
//  Shopulent Merchant Interface
//
//  Created by Stefan Rheeders on 12/22/20.
//

import Cocoa

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
    }
}

