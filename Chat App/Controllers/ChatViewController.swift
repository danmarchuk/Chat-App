//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "Hkmlkmdflzkmv s;lkdrfmvskltrjdmflksmdtfl;kgmstdl;f slkedfnbldnf bkl;nsd ;lknbd;lknb lkbgn lknd ;lkbnglbkn rgfl;ey"),
        Message(sender: "a@b.com", body: "Hello"),
        Message(sender: "1@2.com", body: "What's up"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        navigationItem.hidesBackButton = true
        
        // register the xib file with the nib (xib) name MessageCell, and with an identifier that we put in the atributes of the cell
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
        
        
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    // this method is going to get called the same amount of times as the messages.count
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a cell object for the specified reuse identifier and adds it to the table.
        // indexPath is the current cell that the tableView is requesting data for
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        as! MessageCell
        
        // set the text of the cell to the String from object "Message[index of the ]"
        // the textLabel property corresponds to the main label in the cell
        cell.messageCellLabel.text = messages[indexPath.row].body
        return cell
    }
    
    
}
