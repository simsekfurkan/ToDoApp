//
//  ListViewModel.swift
//  ToDoApp
//
//  Created by Onur Şimşek on 11.08.2022.
//


import Foundation

class ListViewModel : ObservableObject {
    @Published var items:[ItemModel] = []{
        didSet{
            saveItems()
        }
    }
    let itemskey :String = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems()  {
        guard
            let data = UserDefaults.standard.data(forKey: itemskey),
                let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else{return}
        self.items = savedItems
    }
    
    func deleteitem(IndexSet: IndexSet) {
        items.remove(atOffsets: IndexSet)
        
    }
    
    func moveItem(from:IndexSet, to:Int){
        items.move(fromOffsets: from, toOffset: to)
        
    }

    
    func addItem(title:String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
        
    }
    
    func updateItem(item:ItemModel){if let index = items.firstIndex(where: {$0.id == item.id}){
            items[index] = item.updateCompletiton()
        
        }
    }

    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemskey)
        }
    }
}
