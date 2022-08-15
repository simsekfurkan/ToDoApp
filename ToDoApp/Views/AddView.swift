//
//  AddView.swift
//  ToDoApp
//
//  Created by Onur Şimşek on 11.08.2022.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel : ListViewModel
    @State var textFieldText: String = ""
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type item", text: $textFieldText)
                    .multilineTextAlignment(.center)
                    .navigationTitle("Add an Item")
                    .frame(height:50)
                    .background(Color(hue: 1.0, saturation: 0.03, brightness: 0.929))
                    .cornerRadius(10)
                    .padding()
                
                Button(action: saveButtonPressed , label: {
                    Text("Save".uppercased())
                        .frame(height:55)
                        .frame(maxWidth:.infinity)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .font(.headline)
                })
            }
            .padding(14)
        }
        
    }
    
    func saveButtonPressed()  {
        listViewModel.addItem(title: textFieldText)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}
