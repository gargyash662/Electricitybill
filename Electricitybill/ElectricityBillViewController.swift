//
//  ElectricityBillViewController.swift
//  Electricitybill
//
//  Created by yash on 08/08/18.
//  Copyright © 2018 g. All rights reserved.
//

import UIKit

class ElectricityBillViewController: UIViewController , UITextFieldDelegate ,  Passdataprotocol {
    
    @IBOutlet weak var txtcustomerid: UITextField!
    @IBOutlet weak var txtcustomername: UITextField!
    @IBOutlet weak var opgender: UISegmentedControl!
    @IBOutlet weak var lbldate: UITextField!
    @IBOutlet weak var txtunit: UITextField!
    @IBOutlet weak var txtbillamount: UILabel!
    @IBOutlet weak var emailid: UITextField!
    
    @IBAction func genderSegment(_ sender: UISegmentedControl)
    {
       switch (opgender.selectedSegmentIndex) {
        case 0:
            electricitybill.gender = Gender(rawValue: "Male")
            
        case 1:
            electricitybill.gender = Gender(rawValue: "Female")
        default:
            break
        }
        //return electricitybill.gender!.rawValue
    }
    var electricitybill : ElectricityBill!
    var datePicker : UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbldate.delegate = self
        
    self.navigationItem.title = "Bill data entry"
           }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //electricityBill.gender = Gender.getgender(value: segGender.selectedsegmentIndex
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickUpDate(self.lbldate)
    }
    
    func pickUpDate(_ textField : UITextField){
        
        // DatePicker
        self.datePicker = UIDatePicker(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
        self.datePicker.backgroundColor = UIColor.white
        self.datePicker.datePickerMode = UIDatePickerMode.date
        textField.inputView = self.datePicker
        
        // ToolBar
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
        toolBar.sizeToFit()
        
        // Adding Button ToolBar
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ElectricityBillViewController.doneClick))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(ElectricityBillViewController.cancelClick))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolBar
        
    }

    @objc func doneClick() {
        let dateFormatter1 = DateFormatter()
        dateFormatter1.dateStyle = .medium
        dateFormatter1.timeStyle = .none
        lbldate.text = dateFormatter1.string(from: datePicker.date)
        lbldate.resignFirstResponder()
    }
    
    @objc func cancelClick() {
        lbldate.resignFirstResponder()
    }
    
    
    @IBAction func btncalculatebill(_ sender: Any) {
//        electricitybill = ElectricityBill(customerID: Int(txtcustomerid.text!), customername: txtcustomername.text!, gender: electricitybill.gender, billdate: Date(), unitconsumed: Int(txtunit.text!), totalbillamount: 0 , email : emailid)
        
        electricitybill.customerID = Int(txtcustomerid.text!)
        electricitybill.customername = txtcustomername.text!
        electricitybill.gender = Gender(rawValue: electricitybill.gender!.rawValue)
//        electricitybill.gender = Gender.getgender(value:opgender.selectedsegmentIndex)
        electricitybill.billdate = Date()
        electricitybill.unitconsumed = Int(txtunit.text!)
        electricitybill.totalbillamount = 0
        electricitybill.email = String(emailid.text!)
        
       // electricityBill.gender = Gender.getgender(value: segGender.selectedsegmentIndex
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
