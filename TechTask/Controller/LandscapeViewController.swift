//
//  LandscapeViewController.swift
//  TechTask
//
//  Created by Arsenkin Bogdan on 8/8/19.
//  Copyright © 2019 Arsenkin Bogdan. All rights reserved.
//

import UIKit

class LandscapeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	private var dataModel = DataModel()
	private var sortedByName = DataModel()
	private var sortedByRating = DataModel()
	private let cellIdentifier = String(describing: CustomTableViewCell.self)
	
	@IBOutlet weak var alphabetTableView: UITableView!
	@IBOutlet weak var ratingTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		dataModel.createStubModel()
		
		ratingTableView.dataSource = self
		ratingTableView.delegate = self
		alphabetTableView.dataSource = self
		alphabetTableView.delegate = self
		
		sortedByName.models = dataModel.models.sorted { $0.name < $1.name }
		sortedByRating.models = dataModel.models.sorted { $0.rating > $1.rating }
		
		alphabetTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
		ratingTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
	}
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)
		if UIDevice.current.orientation.isPortrait {
			let storyboard = UIStoryboard(name: "Main", bundle: nil)
			let controller = storyboard.instantiateViewController(withIdentifier: "ViewController")
			self.present(controller, animated: false, completion: nil)
		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataModel.models.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
		
		if tableView === ratingTableView {
			
			if sortedByRating.models[indexPath.row].name.count > 15 {
				let shortName = sortedByRating.models[indexPath.row].name.prefix(15)
				cell.nameLabel.text = shortName + "..."
			} else {
				cell.nameLabel.text = sortedByRating.models[indexPath.row].name
			}
			
			cell.linkLabel.text = sortedByRating.models[indexPath.row].link
		}
		
		if tableView === alphabetTableView {
			
			if sortedByName.models[indexPath.row].name.count > 15 {
				let shortName = sortedByName.models[indexPath.row].name.prefix(15)
				cell.nameLabel.text = shortName + "..."
			} else {
				cell.nameLabel.text = sortedByName.models[indexPath.row].name
			}
			
			cell.linkLabel.text = sortedByName.models[indexPath.row].link
		}
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		let urlString = dataModel.models[indexPath.row].link
		if let url = URL(string: urlString)
		{
			UIApplication.shared.open(url, options: [UIApplication.OpenExternalURLOptionsKey : Any](), completionHandler: nil)
		}
		
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
}
