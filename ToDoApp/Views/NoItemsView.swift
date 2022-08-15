//
//  NoItemsView.swift
//  ToDoApp
//
//  Created by Onur Şimşek on 12.08.2022.
//

import SwiftUI

struct NoItemsView: View {
    var body: some View {
        ScrollView{
            VStack (spacing:10){
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person ? I think you sholdu click the add button and add a bunch of items to your todo list!")
                NavigationLink(destination: AddView(), label: {
                    Text("Add Something")
                        .fontWeight(.medium)
                        .padding()
                        
                })
            }.multilineTextAlignment(.center)
                .padding(40)
        }.frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            NoItemsView()
                .navigationTitle("Title")
        }
        NoItemsView()
    }
}
