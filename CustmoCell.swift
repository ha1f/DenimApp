//
//  CustmoCell.swift
//  denimApp
//
//  Created by kota on 2017/02/05.
//  Copyright © 2017年 kota. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    @IBOutlet var imgSample:UIImageView!
    @IBOutlet var lblSample:UILabel!
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    required init(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)!
    }
    
}

