//
//  ElectricityBillViewController.swift
//  Electricitybill
//
//  Created by yash on 08/08/18.
//  Copyright © 2018 g. All rights reserved.
//

import UIKit

class ElectricityBillViewController: UIViewController , Passdataprotocol {
    
    @IBOutlet weak var txtcustomerid: UITextField!
    @IBOutlet weak var txtcustomername: UITextField!
    @IBOutlet weak var opgender: UISegmentedControl!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var txtunit: UITextField!
    
    @IBOutlet weak var txtbillamount: UILabel!
    
    var electricitybill : ElectricityBill!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.navigationItem.title = "Bill data entry"
           }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btncalculatebill(_ sender: Any) {
        electricitybill = ElectricityBill(customerID: Int(txtcustomerid.text!), customername: txtcustomername.text!, gender: Gender.MALE, billdate: Date(), unitconsumed: Int(txtunit.text!), totalbillamount: 0)
        
        performSegue(withIdentifier: "seguebilldetails", sender: self)
        }
    
  override  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destVC = segue.destination as? BillDetailViewController {
        print("#####  \(electricitybill)")
         destVC.electricitybill = electricitybill
        destVC.delegate = self
        }
    }
    
    
    func settotal(totalbill: Double) {
        print("a =  class \(totalbill)")
        txtbillamount.text = "Total Bill: $\(totalbill)"
        
    }
    
    
    
    
}
