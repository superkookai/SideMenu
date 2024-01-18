//
//  ContentView.swift
//  SideMenu
//
//  Created by Weerawut Chaiyasomboon on 18/1/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var selectedTab: SideMenuOptionModel = .dashboard
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedTab){
                    Text("Dashboard")
                        .tag(SideMenuOptionModel.dashboard)
                    
                    Text("Performance")
                        .tag(SideMenuOptionModel.performance)
                    
                    Text("Profile")
                        .tag(SideMenuOptionModel.profile)
                    
                    Text("Search")
                        .tag(SideMenuOptionModel.search)
                    
                    Text("Notifications")
                        .tag(SideMenuOptionModel.notifications)
                }
                
                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
            }
            .navigationTitle(selectedTab.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        showMenu.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                    })
                }
            }
            .toolbar(showMenu ? .hidden : .visible, for: .navigationBar)
        }
    }
}

#Preview {
    ContentView()
}
