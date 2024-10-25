//
//  ItemModel.swift
//  MVVMToDoListByBootcamp
//
//  Created by Apinun on 23/10/2567 BE.
//

import Foundation

struct ItemModel: Encodable, Decodable, Identifiable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompleted() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
