//
//  PomodoroAppApp.swift
//  PomodoroApp
//
//  Created by Onur Şimşek on 10.08.2022.
//

import SwiftUI

@main
struct ToDoApp: App {
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
