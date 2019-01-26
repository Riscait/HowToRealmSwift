//
//  RealmPrimaryKeyIncrementerProtocol.swift
//  RealmSwiftSample
//
//  Created by 村松龍之介 on 2019/01/26.
//  Copyright © 2019 nerco studio. All rights reserved.
//

import RealmSwift

protocol RealmPrimaryKeyIncrementerProtocol {
    func newId<T: Object>(model: T) -> Int
}

extension RealmPrimaryKeyIncrementerProtocol {
    
    func newId<T: Object>(model: T) -> Int {
        guard let key = T.primaryKey() else { fatalError("このオブジェクトにはプライマリキーがありません") }
        
        // Realmのインスタンスを取得
        let realm = try! Realm()
        // 最後のプライマリーキーを取得
        if let last = realm.objects(T.self).sorted(byKeyPath: "id", ascending: true).last,
            let lastId = last[key] as? Int {
            return lastId + 1 // 最後のプライマリキーに+1した数値を返す
        } else {
            return 0  // 初めて使う際は0を返す
        }
    }
}
