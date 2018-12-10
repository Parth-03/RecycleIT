//
//  ViewController.swift
//  RecycleIT
//
//  Created by Samuel Schmitt on 11/25/18.
//  Copyright © 2018 Samuel Schmitt. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let materials = ["Plastics", "Metals", "Food Waste", "Hazardous Waste", "Glass", "Liquids", "Electronics", "Other"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(presentCameraView))
    }
    
    func dataSetup(){
        
    }
    
    //Collection View Methods
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return materials.count
        
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
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let detailVC = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
//        print(detailVC)
//        //detailVC.imageView.image = UIImage(named: materials[indexPath.row])
//        //self.navigationController?.pushViewController(detailVC, animated: true)
//    }
    
    
    
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
        if segue.identifier == "ShowDetail" {
            if let destinationVC = segue.destination as? DetailViewController {
                //destinationVC.imageView.image = UIImage(named: materials[collectionView?.indexPathsForSelectedItems[0]!.row])
                //destinationVC.materialLabel.text = materials[collectionView?.indexPathsForSelectedItems[0]!.row]
            }
        }

    }

    
    
}



