//
//  ShopAdd.swift
//  Shopulent Merchant Interface
//
//  Created by Stefan Rheeders on 1/25/21.
//

import Cocoa
import FirebaseAuth
import FirebaseDatabase

class ShopAdd: NSCollectionViewItem {


    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func createNewShop(_ sender: Any) {
        let firebaseUser = Auth.auth().currentUser?.uid
        let database = Database.database().reference().child("Merchants").child(firebaseUser!)
        database.child("shopCount").observeSingleEvent(of: .value) { (snapshot) in
            var shopCount = snapshot.value as! Int
            shopCount += 1
            let shop = Shop(shopID: firebaseUser! + String(shopCount))
            database.child("shopCount").setValue(shopCount)
            database.child("shops").child(shop.shopID).setValue(shop.nsDictionary)
        }
    }
}
