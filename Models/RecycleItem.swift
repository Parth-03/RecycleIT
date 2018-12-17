//
//  RecycleItem.swift
//  RecycleIT
//
//  Created by Samuel Schmitt on 12/5/18.
//  Copyright © 2018 Samuel Schmitt. All rights reserved.
//

import Foundation


struct RecycleItem: Codable {
    let name: String
    let material: String
    let examples: String
    let outcome: String
    let plasticNumber: Int?
	
	
	init(name: String = "",
		material: String = "",
		examples: String = "",
		outcome: String = "",
		plasticNumber: Int? = nil
		){
		self.name = name
		self.material = material
		self.examples = examples
		self.outcome = outcome
		self.plasticNumber = plasticNumber
	}
}


extension RecycleItem: Hashable {
    var hashValue: Int {
		return name.hashValue ^ material.hashValue ^ examples.hashValue ^ outcome.hashValue ^ plasticNumber.hashValue
    }
}

