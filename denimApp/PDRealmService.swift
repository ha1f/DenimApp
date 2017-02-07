//
//  PDRealmService.swift
//
//  Copyright © 2016年 Krimpedance. All rights reserved.
//

import Foundation
import RealmSwift

extension Results {
    var allObjects: [Element] {
        return self.flatMap { $0 }
    }
}

class PDRealmService {
    private static let instance = PDRealmService()
    class func service() -> PDRealmService { return instance }
    private init() {
        do {
            realm = try Realm()
        } catch let error {
            print("PDRealmService error: ", error)
        }
    }

    var realm: Realm?

    func getRealm() -> Realm? {
        if let realm = self.realm { return realm }
        do {
            let realm = try Realm()
            self.realm = realm
            return realm
        } catch { return nil }
    }
}


/**
 Set up ---------------------------
 */
extension PDRealmService {
//    class func configuration(version version: UInt64 = 0, migrationBlock: MigrationBlock? = nil) {
//        let config = Realm.Configuration( schemaVersion: version, migrationBlock: migrationBlock)
//        Realm.Configuration.defaultConfiguration = config
//    }
}


/**
 Save data ----------------------------------
*/
extension PDRealmService {
    func save<T: Object>(data: T) -> Bool {
        do {
            let realm: Realm
            if Thread.current.isMainThread {
                guard let constRealm = getRealm() else { return false }
                realm = constRealm
            } else {
                realm = try Realm()
            }

            try realm.write {
                realm.add(data, update: true)
            }
            return true
        } catch { return false }
    }

    func save<T: Object>(datas: [T]) -> Bool {
        do {
            let realm: Realm
            if Thread.current.isMainThread {
                guard let constRealm = getRealm() else { return false }
                realm = constRealm
            } else {
                realm = try Realm()
            }

            try realm.write {
                realm.add(datas, update: true)
            }
            return true
        } catch {
            return false
        }
    }
}


/**
 Get data ------------------------------------------
*/
extension PDRealmService {
    func getAllData<T: Object>(_: T.Type) -> Results<T>? {
        do {
            let realm: Realm
            if Thread.current.isMainThread {
                guard let constRealm = getRealm() else { return nil }
                realm = constRealm
            } else {
                realm = try Realm()
            }

            return realm.objects(T.self)
        } catch {
            return nil
        }
    }
}


/**
データの削除 ----------------------------------
*/
extension PDRealmService {
    // all data
    func deleteAll() -> Bool {
        do {
            let realm: Realm
            if Thread.current.isMainThread {
                guard let constRealm = getRealm() else { return false }
                realm = constRealm
            } else {
                realm = try Realm()
            }

            try realm.write {
                realm.deleteAll()
            }
            return true
        } catch { return false }
    }

    // all table data
    func deleteAllRecord<T: Object>(results: Results<T>) -> Bool {
        do {
            let realm: Realm
            if Thread.current.isMainThread {
                guard let constRealm = getRealm() else { return false }
                realm = constRealm
            } else {
                realm = try Realm()
            }

            try realm.write {
                realm.delete(results)
            }

            return true
        } catch {
            return false
        }
    }

    // record
    func delete<T: Object>(object: T) -> Bool {
        do {
            let realm: Realm
            if Thread.current.isMainThread {
                guard let constRealm = getRealm() else { return false }
                realm = constRealm
            } else {
                realm = try Realm()
            }

            try realm.write {
                realm.delete(object)
            }
            return true
        } catch {
            return false
        }
    }

    func delete<T: Object>(objects: [T]) -> Bool {
        do {
            let realm: Realm
            if Thread.current.isMainThread {
                guard let constRealm = getRealm() else { return false }
                realm = constRealm
            } else {
                realm = try Realm()
            }

            try realm.write {
                realm.delete(objects)
            }
            return true
        } catch {
            return false
        }
    }
}
