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
    
    @IBOutlet weak var switchremember: UISwitch!
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var password: UITextField!
    var userDefault: UserDefaults?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDefault = UserDefaults.standard
        if let username = userDefault?.value(forKey: "username")
        {
            if let userpassword1 = userDefault?.value(forKey: "password")
            {
                txtusername.text = username as? String
                password.text = userpassword1 as? String
                switchremember.setOn(true, animated: true)
            }
        }
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnlogin(_ sender: Any)
    {
        if txtusername.text?.elementsEqual("admin") == true  && password.text?.elementsEqual("password") == true
        {
            if switchremember.isOn
            {
                userDefault?.setValue(txtusername.text, forKey: "username")
                userDefault?.setValue(password.text, forKey: "password")
            }else
            {
                userDefault?.removeObject(forKey: "username")
                userDefault?.removeObject(forKey: "password")
            }
            
            performSegue(withIdentifier: "ElectricityBillViewController", sender: self)

        } else {
            print("error")
        }
    }
    
    
    
    
}
