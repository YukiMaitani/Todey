//
//  Item.swift
//  Todoey
//
//  Created by 米谷裕輝 on 2022/06/21.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct Item: Codable {
    var title: String
    var done: Bool = false
}
