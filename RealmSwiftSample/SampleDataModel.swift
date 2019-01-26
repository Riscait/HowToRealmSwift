//
//  SampleDataModel.swift
//  RealmSwiftSample
//
//  Created by 村松龍之介 on 2019/01/26.
//  Copyright © 2019 nerco studio. All rights reserved.
//

import RealmSwift

class SampleDataModel: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var memo: String?
    @objc dynamic var category = 0

    override static func primaryKey() -> String? {
        return "id"
    }
}

enum SampleDataCategory: Int {
    case life
    case work
}
