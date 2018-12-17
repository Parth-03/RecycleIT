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
    @IBOutlet weak var recycleInfoLabel: UILabel!
    
	var item = RecycleItem()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		
        nameLabel.text = "Name: " + item.name
        examplesLabel.text = "Examples: " + item.examples
		outcomesLabel.text = "This item is " + item.outcome.lowercased()
        recycleInfoLabel.text = item.recyclingInformation
        let plasticNumber = item.plasticNumber
    
        if let plasticNumber = plasticNumber {
            let labelText: String
            switch plasticNumber {
            case 1:
                labelText = "PETE – Polyethylene Terephthalate"
                imageView.image = UIImage(named: "plastic1")
            case 2:
                labelText = "HDPE – High density Polyethylene"
                imageView.image = UIImage(named: "plastic2")
            case 3:
                labelText = "PVC – Polyvinyl Chloride"
                imageView.image = UIImage(named: "plastic3")
            case 4:
                labelText = "LDPE Low-density Polyethylene"
                imageView.image = UIImage(named: "plastic4")
            case 5:
                labelText = "PP – Polypropylene"
                imageView.image = UIImage(named: "plastic5")
            case 6:
                labelText = "PS – Polystyrene"
                imageView.image = UIImage(named: "plastic6")
            case 7:
                labelText = "Other Plastic"
                imageView.image = UIImage(named: "plastic7")
            default:
                labelText = ""
                imageView.image = UIImage(named: "Metal")
            }
            plasticNumberLabel.text = "Plastic Symbol Number: " + String(plasticNumber) + "\n" + labelText
        }else {
            imageView.image = UIImage(named: item.material)
            plasticNumberLabel.text = ""
        }
        
    }

	
    
    
    
    
    

}
