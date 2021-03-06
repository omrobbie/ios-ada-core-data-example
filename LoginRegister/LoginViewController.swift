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
    var fullname = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.context = appDelegate.persistentContainer.viewContext
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? WelcomeViewController {
            destination.fullname = fullname
        }
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
                    
                    fullname = data.value(forKey: "fullname") as! String
                    performSegue(withIdentifier: "SegueToWelcomePage", sender: nil)
                } else {
                    print("Login failed")
                    
                    // tampilkan alert saat password gagal
                    let alert = UIAlertController(title: "Failed!", message: "Login failed!", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alert, animated: true)
                }
            }
        } catch {
            print("Failed to login!")
        }
    }
    
}
