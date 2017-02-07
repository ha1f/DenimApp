//
//  InputForm.swift
//  
//
//  Created by kota on 2017/02/06.
//
//
import UIKit
import Foundation
import ImageRow
import Eureka
import RealmSwift

class InputFormViewController: FormViewController {
    
    let realm = try! Realm()
    let denim = Denim()
    
    
    var rowKeyboardSpacing = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let button = UIButton(frame: CGRect(x: 50, y: view.frame.height - 100, width: 80, height: 80))
        button.layer.cornerRadius = button.frame.width / 2
        button.backgroundColor = UIColor.blue
        button.setTitle("Back", for: UIControlState.normal)
        self.view.addSubview(button)
        
        button.addTarget(self, action: #selector(backbutton), for: .touchUpInside)
        
        form +++ Section("INPUT DATA")
            <<< TextRow("makerName"){
                $0.title = "メーカー"
                $0.placeholder = "ここに書いてね"
                }.onChange{row in
                    
                    let userDefault = UserDefaults.standard
                    userDefault.setValue(row.value, forKey: "maker")
                    
                    self.denim.maker = row.value!
                    
            }
            <<< TextRow("name"){
                $0.title = "商品名"
                $0.placeholder = "ここに書いてね"
                }.onChange{row in
                    
                    let userDefault = UserDefaults.standard
                    userDefault.setValue(row.value, forKey: "name")
                    
                    self.denim.name = row.value!
            }

            <<< TextRow("price"){
                $0.title = "価格"
                $0.placeholder = "数字を入力してください"
                }.onChange{row in
                let userDefault = UserDefaults.standard
                userDefault.setValue(row.value, forKey: "price")
                    
                    self.denim.price = Int(row.value!)!
                    
                }
            <<< ImageRow() { row in
                row.title = "サムネイル画像"
                row.sourceTypes = [.PhotoLibrary, .SavedPhotosAlbum]
                row.clearAction = .yes(style: UIAlertActionStyle.destructive)
                
                self.denim.thumbnailImage = NSData(contentsOf: row.imageURL!)
                
            }
        
            +++ Section("デニムの詳細")
            <<< PushRow<String>("color") {
                $0.title = "色"
                $0.options = ["赤","青","黄", "緑", "灰色", "紫", "迷彩", "白", "黒"]
                $0.value = "赤"
                }.onChange{row in
                    let userDefault = UserDefaults.standard
                    userDefault.setValue(row.value, forKey: "color")
                    
                    self.denim.color = row.value!
                    
            }
            <<< SegmentedRow<String>("shape"){
                $0.options = ["regular", "Tapered", "slim", "wide"]
                $0.title = "形状"
                $0.value = "regular"
                }.onChange{ row in
                    let userDefault = UserDefaults.standard
                    userDefault.setValue(row.value, forKey: "shape")
                    
                    self.denim.shape = row.value!
            }
            <<< PushRow<String>("rawMaterials") {
                $0.title = "素材"
                $0.options = ["コットン","デニム","ワンウォッシュ"]
                $0.value = "コットン"
                }.onChange{row in
                    let userDefault = UserDefaults.standard
                    userDefault.setValue(row.value, forKey: "rawMaterials")
                    
                    self.denim.rawMaterials = row.value!
        }
        
            +++ Section()
            <<< ButtonRow() {
                $0.title = "保存する"
                try! realm.write() {
                    realm.add(denim)
                }
                
        }
        
    }
    func backbutton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addData(){
        
    }
    
}
