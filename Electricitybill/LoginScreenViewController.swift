//
//  LoginScreenViewController.swift
//  Electricitybill
//
//  Created by yash on 08/08/18.
//  Copyright © 2018 g. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController
{
    
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func btnlogin(_ sender: Any) {
        if txtusername.text == "admin" && password.text == "password" {
            performSegue(withIdentifier: "ElectricityBillViewController", sender: self)

        } else {
            print("error")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
