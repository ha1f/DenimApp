//
//  ProductPageViewController.swift
//  denimApp
//
//  Created by kota on 2017/02/07.
//  Copyright © 2017年 kota. All rights reserved.
//

import UIKit
import RealmSwift

class ProductPageViewController: UIViewController {
    
    var denim:Denim?
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    @IBOutlet weak var makerName: UILabel!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var shape: UILabel!
    @IBOutlet weak var color: UILabel!
    @IBOutlet weak var rawMaterials: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRect(x: 50, y: view.frame.height - 100, width: 80, height: 80))
        button.layer.cornerRadius = button.frame.width / 2
        button.backgroundColor = UIColor.blue
        button.setTitle("Back", for: UIControlState.normal)
        self.view.addSubview(button)
        button.addTarget(self, action: #selector(back), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back() {
        self.dismiss(animated: true, completion: nil)
    }

   
}
