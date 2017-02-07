//
//  ViewController.swift
//  denimApp
//
//  Created by kota on 2017/02/05.
//  Copyright © 2017年 kota. All rights reserved.
//

import UIKit
@IBDesignable
class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    let denims = PDRealmService.service().getAllData(Denim.self)!.allObjects
    let thumbnailImage = UIImage(data: Denim)
    
    @IBInspectable
    var bordercolor:UIColor = .black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CustomCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! CustomCell
        cell.lblSample.text = "ラベル\(indexPath.row)"
        cell.imgSample.image = UIImage(named: "g-star.jpeg")
        cell.imgSample.layer.borderColor = UIColor.black.cgColor
        cell.imgSample.layer.borderWidth = 2.0
        cell.imgSample.layer.cornerRadius = cellSize.width / 2
        cell.imgSample.clipsToBounds = true
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
    // セクションの数（今回は1つだけです）
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    // 表示するセルの数
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return denims.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let denim = denims[indexPath.row]
        if denim != nil {
            performSegue(withIdentifier: "toProductPageViewController",sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "toProductPageViewController") {
            let subVC = (segue.destination as? ProductPageViewController)!
            subVC.thumbnailImage = UIImage(data: denims)
            
        }
    }
    
    var  cellSize :CGSize {
        let width: CGFloat = view.frame.width / 3 - 5
        let height: CGFloat = width
        return CGSize(width: width, height: height)
    }
    


}

