//
//  DenimDetail.swift
//  denimApp
//
//  Created by kota on 2017/02/05.
//  Copyright © 2017年 kota. All rights reserved.
//

import Foundation
import RealmSwift

//realmを使用するためのクラスを作る

class Denim: Object {
    
    dynamic var id = UUID().uuidString
    dynamic var name:String = ""
    dynamic var maker:String = ""
    dynamic var itemNumber:String = ""
    dynamic var price:Int = 0
    dynamic var color:String = ""
    dynamic var shape:String = ""
    dynamic var rawMaterials:String = ""
    dynamic var size:Int = 0
    dynamic var rise:Int = 0
//    dynamic var review:String = ""
//    dynamic var like = true
    dynamic var thumbnailImage:NSData?
//    dynamic var wearingImage:String? = nil

    override static func primaryKey() -> String? {
        return "id"
    }
    
    class func seed() {
        
        
//            let realm = try! Realm()
//            try! realm.write() {
//                realm.deleteAll()
//            }
        
        let denim = Denim()
        denim.name = "3301"
        denim.maker = "G-STAR"
        denim.itemNumber = "0000aa"
        denim.price = 12000
        denim.color = "BLUE"
        denim.shape = "slim"
        denim.rawMaterials = "rawdenim"
        denim.size = 32
        denim.rise = 78
        
        _ = PDRealmService.service().save(data: denim)
        for realmDenim in PDRealmService.service().getAllData(Denim.self)!.allObjects {
            print("商品名:\((realmDenim as Denim).name)")
            print("メーカー:\((realmDenim as Denim).maker)")
            print("商品番号:\((realmDenim as Denim).itemNumber)")
            print("値段:\((realmDenim as Denim).price)")
            print("カラー:\((realmDenim as Denim).color)")
            print("形状:\((realmDenim as Denim).shape)")
            print("素材:\((realmDenim as Denim).size)")
            print("股下:\((realmDenim as Denim).rise)")
            
            
        }
        
//        let denim2 = Denim()
//        denim2.maker = "bbbbbb"
//        denim2.name = "LEVI'S"
//        denim2.price = 1000
//        
//        _ = PDRealmService.service().save(data: denim2)
//        for realmDenim in PDRealmService.service().getAllData(Denim.self)!.allObjects {
//            print("denim name:\((realmDenim as Denim).name)")
//        }
    }
}
