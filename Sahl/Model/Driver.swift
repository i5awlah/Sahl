//
//  Driver.swift
//  Sahl
//
//  Created by Khawlah on 05/11/2022.
//

import SwiftUI

struct Driver: Hashable {
    var description: String?
    var name: String
    var image: String
    var phoneNumber: String
    var carName: String
    var carModel: String
    var carPlate: String
    var rate: Int
    var numberOfRate: Int
}

extension Driver {
    static let all : [Driver] = [
        Driver(name: "Saeed", image: "Saeed", phoneNumber: "555444555", carName: "Hyundai H1", carModel: "2019", carPlate: "1145 WQA", rate: 3, numberOfRate: 25),
        Driver(name: "Abdullah Saeed", image: "AbdullahSaeed", phoneNumber: "555000000", carName: "Hyundai Sonata", carModel: "2022", carPlate: "9845 DWS", rate: 4, numberOfRate: 33)
    ]
}
