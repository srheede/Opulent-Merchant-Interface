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
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    @IBOutlet weak var collectionView: NSCollectionView!
    
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

extension Main: NSCollectionViewDelegate, NSCollectionViewDataSource {
    func collectionView(_ collectionView: NSCollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: NSCollectionView, itemForRepresentedObjectAt indexPath: IndexPath) -> NSCollectionViewItem {
        if (indexPath.item == 0){
            let collectionItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: ("ShopAdd")), for: indexPath) as! ShopAdd
            collectionItem.view.wantsLayer = true
            collectionItem.view.layer?.backgroundColor = NSColor.gridColor.cgColor
            return collectionItem
        } else {
        let collectionItem = collectionView.makeItem(withIdentifier: NSUserInterfaceItemIdentifier(rawValue: ("ShopList")), for: indexPath) as! ShopList
            collectionItem.view.wantsLayer = true
            collectionItem.view.layer?.backgroundColor = NSColor.gridColor.cgColor
            return collectionItem
        
        }
    }
    
    func collectionView(_ collectionView: NSCollectionView, didSelectItemsAt indexPaths: Set<IndexPath>) {
        collectionView.deselectItems(at: indexPaths)
        let alert = NSAlert()
        alert.messageText = "You selected:"
        alert.informativeText = indexPaths.debugDescription
        alert.addButton(withTitle: "OK")
        alert.alertStyle = NSAlert.Style.critical
        alert.runModal()
    }
    
    
}
