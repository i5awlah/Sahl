//
//  Driver.swift
//  Sahl
//
//  Created by Khawlah on 05/11/2022.
//

import Foundation

struct Driver: Hashable {
    let name: String
    let image: String
    let carName: String
    let carPlate: String
    let rate: Int
    let numberOfRate: Int
}

extension Driver {
    static let all : [Driver] = [
        Driver(name: "Saeed", image: "Saeed", carName: "Hyundai H1", carPlate: "1145 WQA", rate: 3, numberOfRate: 25),
        Driver(name: "Abdullah Saeed", image: "AbdullahSaeed", carName: "Hyundai Sonata", carPlate: "9845 DWS", rate: 4, numberOfRate: 33)
    ]
}
