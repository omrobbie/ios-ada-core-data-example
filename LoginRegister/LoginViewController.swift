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
    }
    
}
