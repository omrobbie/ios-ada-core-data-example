//
//  LoginViewController.swift
//  LoginRegister
//
//  Created by omrobbie on 15/08/18.
//  Copyright © 2018 omrobbie. All rights reserved.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var context:NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.context = appDelegate.persistentContainer.viewContext
    }

    @IBAction func doSignIn(_ sender: Any) {
        let email = txtEmail.text
        let password = txtPassword.text
        
        let request:NSFetchRequest<User> = User.fetchRequest()
        request.predicate = NSPredicate(format: "email = %@", email!)
        
        do {
            let result = try context?.fetch(request)
            
            for data in result as! [NSManagedObject] {
                let correctPassword = data.value(forKey: "password") as! String
                if password == correctPassword {
                    print("Login success")
                } else {
                    print("Login failed")
                }
            }
        } catch {
            print("Failed to login!")
        }
    }
    
}
