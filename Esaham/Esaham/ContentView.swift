import SwiftUI
import Combine


import SwiftUI

struct ContentView: View {
    @State private var WaterScore: Float = 0.0
    @State private var RecycleScore: Float = 0.0
    @State private var CleanScore: Float = 0.0
    
    
    @State private var WaterButtonCount: Int = 0
    @State private var RecycleButtonCount: Int = 0
    @State private var CleanButtonCount: Int = 0
    
    @State private var selectedTab: Tab = .community
    
    
    enum Tab {
        case community, plant, tasks
    }


    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                TabView(selection: $selectedTab) {
                    NavigationView {
                        CommunityView()
                            .navigationBarTitle("Community", displayMode: .inline)
                    }
                    .tabItem {
                        Image(systemName: "person.3")
                        Text("Community")
                    }
                    .tag(Tab.community)

                    NavigationView {
                        MyPlantView(WaterScore: $WaterScore, RecycleScore: $RecycleScore, CleanScore: $CleanScore, WaterButtonCount: $WaterButtonCount, RecycleButtonCount: $RecycleButtonCount, CleanButtonCount: $CleanButtonCount)
                            .navigationBarTitle("Plant", displayMode: .inline)
                    }
                    .tabItem {
                        Image(systemName: "tree")
                        Text("Plant")
                    }
                    .tag(Tab.plant)

                    NavigationView {
                        TasksView(WaterScore: $WaterScore, RecycleScore: $RecycleScore, CleanScore: $CleanScore, WaterButtonCount: $WaterButtonCount, RecycleButtonCount: $RecycleButtonCount, CleanButtonCount: $CleanButtonCount)
                            .navigationBarTitle("Tasks", displayMode: .inline)
                    }
                    .tabItem {
                        Image(systemName: "flag")
                        Text("Tasks")
                    }
                    .tag(Tab.tasks)
                }
                .edgesIgnoringSafeArea(.top)
                .frame(maxHeight: .infinity)
                .accentColor(Color("PrimaryColor"))

                Divider()
                    .padding(.top, 650.0)
            }
        }
    }
}


#Preview {
        ContentView()
    }

