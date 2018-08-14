//
//  BillDetailViewController.swift
//  Electricitybill
//
//  Created by yash on 08/08/18.
//  Copyright © 2018 g. All rights reserved.
//

import UIKit
protocol Passdataprotocol {
    func settotal(totalbill : Double)
}

class BillDetailViewController: UIViewController {
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var txtcustomername: UILabel!
    @IBOutlet weak var txttotalbill: UILabel!
    @IBOutlet weak var txtgender: UILabel!
    
    var electricitybill : ElectricityBill?
    var delegate : Passdataprotocol?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let bill = electricitybill
        {
            print(bill.customername!)
            calculateTotalBillAmount()
            
            self.txtcustomername.text = electricitybill?.customername
           // self.txtgender.text = electricitybill?.gender
            self.txttotalbill.text = String(format: "Total: %.2f",  (electricitybill?.totalbillamount!)!)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func calculateTotalBillAmount()
    {
        
        var totalBill = 0.0
        if(electricitybill?.unitconsumed)! <= 100
        {
            totalBill = Double((electricitybill?.unitconsumed)!) * 0.75
        }else if (electricitybill?.unitconsumed)! <= 250
        {
            totalBill = 75 + (Double((electricitybill?.unitconsumed)!) - 100) * 1.25
        }else if (electricitybill?.unitconsumed)! <= 450
        {
            totalBill = 262.2 + (Double((electricitybill?.unitconsumed)!) - 250) * 1.75
        }else
        {
            totalBill = 612.5 + (Double((electricitybill?.unitconsumed)!) - 450) * 2.25
        }
        delegate?.settotal(totalbill : totalBill)
        electricitybill?.totalbillamount = totalBill
        print(totalBill)
    }
}
