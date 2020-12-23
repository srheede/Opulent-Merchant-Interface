//
//  Utilities.swift
//  Shopulent Merchant Interface
//
//  Created by Stefan Rheeders on 12/23/20.
//

import Cocoa

class Utilities: NSObject {

    static func isValidPassword( password:String) -> Bool{
        let passwordPattern = NSPredicate(format: "SELF MATCHES %@ ", "^(?=.*[a-zA-Z])(?=.*[$&+,:;=?@#|'<>.^*()%!-])(?=.*[0-9]).{8,}$")
        let alert = NSAlert()
        alert.messageText = "Invalid Password"
        alert.informativeText = "Your password must contain 8 characters or more with a combination of letters, numbers and symbols."
        alert.addButton(withTitle: "OK")
        alert.alertStyle = NSAlert.Style.critical
        
        if (!passwordPattern.evaluate(with: password)){
            alert.runModal()
            return false
        }
        return true
    }
    
    static func isPasswordsMatch( password:String, confirmPassword:String) -> Bool{
        let alert = NSAlert()
        alert.messageText = "Passwords don't match"
        alert.informativeText = "Please ensure that the passwords you enter are the same."
        alert.addButton(withTitle: "OK")
        alert.alertStyle = NSAlert.Style.critical
        
        if (!password.elementsEqual(confirmPassword)){
            alert.runModal()
            return false
        }
        return true
    }
    
    static func isValidEmail( email:String) -> Bool{
        let emailPattern = NSPredicate(format: "SELF MATCHES %@ ", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        let alert = NSAlert()
        alert.messageText = "Invalid Email Address"
        alert.informativeText = "Please enter a valid email address."
        alert.addButton(withTitle: "OK")
        alert.alertStyle = NSAlert.Style.critical
        
        if (!emailPattern.evaluate(with: email)){
            alert.runModal()
            return false
        }
        return true
        
    }
    
}
