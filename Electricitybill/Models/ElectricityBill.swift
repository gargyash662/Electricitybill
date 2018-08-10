//
//  ElectricityBill.swift
//  Electricitybill
//
//  Created by yash on 08/08/18.
//  Copyright © 2018 g. All rights reserved.
//

import Foundation
enum Gender: String{
    case MALE = "Male"
    case FEMALE = "Female"
    case OTHER = "Other"
}
struct ElectricityBill
{
    var customerID: Int?
    var customername: String?
    var gender: Gender?
    var billdate : Date?
    var unitconsumed : Int?
    var totalbillamount: Double?
}
