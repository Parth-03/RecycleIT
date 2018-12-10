//
//  SearchViewController.swift
//  RecycleIT
//
//  Created by Samuel Schmitt on 12/9/18.
//  Copyright © 2018 Samuel Schmitt. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let image = UIImage(named: "search")
        let scaledImage = image?.scaleImage(toSize: CGSize(width: 10, height: 10))
        tabBarItem = UITabBarItem(title: "Search", image: scaledImage, tag: 1)
    }

    
}
