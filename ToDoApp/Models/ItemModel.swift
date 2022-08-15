//
//  ItemModel.swift
//  ToDoApp
//
//  Created by Onur Şimşek on 11.08.2022.
//

import Foundation

struct ItemModel:Identifiable,Codable {
    let id : String
    let title: String
    let isCompleted : Bool
    
    init(id:String = UUID().uuidString ,title:String , isCompleted : Bool){
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletiton() -> ItemModel{
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}


