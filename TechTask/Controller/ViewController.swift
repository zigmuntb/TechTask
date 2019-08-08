//
//  ViewController.swift
//  TechTask
//
//  Created by Arsenkin Bogdan on 8/8/19.
//  Copyright © 2019 Arsenkin Bogdan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	let dataModel = DataModel()
	private let cellIdentifier = String(describing: CustomTableViewCell.self)
	
	@IBOutlet weak var listTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		dataModel.createStubModel()
		listTableView.delegate = self
		listTableView.dataSource = self
		listTableView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellReuseIdentifier: cellIdentifier)
	}
	
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		super.viewWillTransition(to: size, with: coordinator)
		if UIDevice.current.orientation.isLandscape {
			let storyboard = UIStoryboard(name: "Landscape", bundle: nil)
			let controller = storyboard.instantiateViewController(withIdentifier: "LandscapeViewController")
			self.present(controller, animated: false, completion: nil)
		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataModel.models.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! CustomTableViewCell
		
		cell.linkLabel.text = dataModel.models[indexPath.row].link
		
		if dataModel.models[indexPath.row].name.count > 15 {
			let shortName = dataModel.models[indexPath.row].name.prefix(15)
			cell.nameLabel.text = shortName + "..."
		} else {
			cell.nameLabel.text = dataModel.models[indexPath.row].name
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

