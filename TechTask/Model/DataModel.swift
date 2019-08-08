//
//  Model.swift
//  TechTask
//
//  Created by Arsenkin Bogdan on 8/8/19.
//  Copyright © 2019 Arsenkin Bogdan. All rights reserved.
//

import UIKit

fileprivate let hardcodeNames = ["Dangdhfjrueywtqywueoiweuroiweuroiweuroiuewoiru", "Ban", "Dan", "Ban", "Dan", "Ban", "Dan", "Ban", "Dan", "Ban", "Dan", "Ban", "Dan", "Ban", "Dan", "Ban", "Dan", "Ban", "Dan", "Ban", "Dan", "Ban", "Dan", "Ban", "Dan", "Ban", "Dan", "Ban", "Dan", "Ban",]
fileprivate let hardcodeLinks = ["https://github.com/zigmuntb/", "https://github.com/soberman", "https://github.com/zigmuntb/", "https://github.com/soberman", "https://github.com/zigmuntb/", "https://github.com/soberman", "https://github.com/zigmuntb/", "https://github.com/soberman", "https://github.com/zigmuntb/", "https://github.com/soberman", "https://github.com/zigmuntb/", "https://github.com/soberman", "https://github.com/zigmuntb/", "https://github.com/soberman", "https://github.com/zigmuntb/", "https://github.com/soberman", "https://github.com/zigmuntb/", "https://github.com/soberman", "https://github.com/zigmuntb/", "https://github.com/soberman", "https://github.com/zigmuntb/", "https://github.com/soberman", "https://github.com/zigmuntb/", "https://github.com/soberman", "https://github.com/zigmuntb/", "https://github.com/soberman", "https://github.com/zigmuntb/", "https://github.com/soberman", "https://github.com/zigmuntb/", "https://github.com/soberman"]
fileprivate let hardcodeRatings = [1, 5, 1, 5, 1, 5, 1, 5, 1, 5, 1, 5, 1, 5, 1, 5, 1, 5, 1, 5, 1, 5, 1, 5, 1, 5, 1, 5, 1, 5,]

class DataModel {
	var models = [Model]()
	
	func createStubModel() {
		for (index, hardcodeName) in hardcodeNames.enumerated() {
			let model = Model()
			model.name = hardcodeName
			model.link = hardcodeLinks[index]
			model.rating = hardcodeRatings[index]
			models.append(model)
		}
	}
}

class Model {
	var name = String()
	var link = String()
	var profilePicture = String()
	var rating = Int()
}
