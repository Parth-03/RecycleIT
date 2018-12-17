//
//  ViewController.swift
//  RecycleIT
//
//  Created by Samuel Schmitt on 11/25/18.
//  Copyright © 2018 Samuel Schmitt. All rights reserved.
//

import UIKit
import CSV

class CollectionViewController: UICollectionViewController, UINavigationControllerDelegate {
    
    var materials = [String]()
    var recycleItems = [RecycleItem]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        dataSetup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(presentCameraView))
    }
    
    func dataSetup(){
        let csvPath = Bundle.main.path(forResource: "data", ofType: "csv")
        let csvURL = URL(fileURLWithPath: csvPath!)
        let stream = InputStream(url: csvURL)!
        

        do {
            let csv = try CSVReader(stream: stream, hasHeaderRow: true)
            let decoder = CSVRowDecoder()
            while csv.next() !=  nil {
                let row = try decoder.decode(RecycleItem.self, from: csv)
                recycleItems.append(row)
            }
            
            
        } catch {
            print(error)
        }
        for item in recycleItems {
            let material = item.material
            if !materials.contains(material){
                materials.append(material)
            }
        }
    }
    
    //Collection View Methods
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var matieralsNumber = 0
        var materials = [String]()
        for item in recycleItems {
            let material = item.material
            if !materials.contains(material){
                matieralsNumber += 1
                materials.append(material)
            }
        }
        return matieralsNumber
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MaterialsViewCell", for: indexPath) as! MaterialsViewCell
        cell.materialLabel.text = materials[indexPath.row]
        cell.imageView.image = UIImage(named: materials[indexPath.row])
        cell.materialLabel.textColor = UIColor.black
        cell.materialLabel.backgroundColor = UIColor.white
        cell.materialLabel.layer.cornerRadius = 3.0
        cell.materialLabel.clipsToBounds = true
        cell.layer.cornerRadius = 6.0
        return cell
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let image = UIImage(named: "menu")
        let newImage = image?.scaleImage(toSize: CGSize(width: 10, height: 10))
        tabBarItem = UITabBarItem(title: "Materials", image: newImage, tag: 0)
    }
    
    @objc func presentCameraView() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.allowsEditing = false
        vc.delegate = self
        present(vc, animated: true)
    
    }
    
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowTableView" {
			if let destinationVC = segue.destination as? TableViewController {
				let cell = sender as! MaterialsViewCell
				var tableViewItems = [RecycleItem]()
				let indexPath = collectionView.indexPath(for: cell)!
				let material = materials[indexPath.row]
				let backButton = UIBarButtonItem()
				backButton.title = material
				navigationItem.backBarButtonItem = backButton
				
				for item in recycleItems {
					if item.material == material {
						tableViewItems.append(item)
					}
					destinationVC.items = tableViewItems
				}
			}
        } else if segue.identifier == "ShowDetailFromCamera" {
            if let destinationVC = segue.destination as? DetailViewController {
                let item = sender as! RecycleItem
                destinationVC.item = item
            }
        }
        
	}

}

extension CollectionViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true){
            let randomNum = Int.random(in: 0..<self.recycleItems.count)
            let item = self.recycleItems[randomNum]
            self.performSegue(withIdentifier: "ShowDetailFromCamera", sender: item)
        }
    }
}

