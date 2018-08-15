//
//  WelcomeViewController.swift
//  LoginRegister
//
//  Created by omrobbie on 15/08/18.
//  Copyright © 2018 omrobbie. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var txtWelcome: UILabel!
    
    var fullname = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtWelcome.text = "Welcome aboard, \(fullname)"
    }

}
