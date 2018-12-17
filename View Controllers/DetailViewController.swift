//
//  DetailViewController.swift
//  RecycleIT
//
//  Created by Samuel Schmitt on 12/5/18.
//  Copyright © 2018 Samuel Schmitt. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var examplesLabel: UILabel!
	@IBOutlet weak var outcomesLabel: UILabel!
	@IBOutlet weak var plasticNumberLabel: UILabel!
	
	var item = RecycleItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		imageView.image = UIImage(named: item.material)
		nameLabel.text = item.name
		examplesLabel.text = item.examples
		outcomesLabel.text = item.outcome
		guard let plasticNumber = item.plasticNumber else{
			plasticNumberLabel.text = ""
			return
		}
		plasticNumberLabel.text = String(plasticNumber)
		
    }

	
    
    
    
    
    

}
