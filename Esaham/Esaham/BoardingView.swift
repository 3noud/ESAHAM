//
//  Boarding.swift
//  ESAHAM
//
//  Created by manar khaled on 12/07/1445 AH.
//

import SwiftUI

struct BoardingView: View {
    @State private var currentPageIndex = 0
    
    var body: some View {
       
            
            TabView(selection: $currentPageIndex) {
                OnboardingPage(imageName: "volunteer", title: "Protect our planet", description: "Protecting our planet  starts with you, volunteer, plant a tree, recycle.", currentPageIndex: 0)
                    .tag(0)
                
                OnboardingPage(imageName: "environment", title: "volunteer with us", description: "Make your own plant physically, And virtually with your team!", currentPageIndex: 1)
                    .tag(1)
                
                OnboardingPage(imageName: "Share", title: "Share your progress ", description: "Take care of your plant and show the world your progress!", currentPageIndex: 2)
                    .tag(2)
                
                OnboardingPage(imageName: "Compete", title: "Compete with other teams!", description: "Collect points with your team to compete with other teams!", currentPageIndex: 3)
                    .tag(3)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .accentColor(.green) // Set the accent color
            .background(Color("whitee"))
            
        
    }
    
    struct OnboardingPage: View {
        var imageName: String
        var title: String
        var description: String
        var currentPageIndex: Int
        
        
        var isLastPage: Bool {
            let lastPageIndex = 3 // Set the index of the last page here
            return currentPageIndex == lastPageIndex
        }
        
        
        @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
        
        var body: some View {
            
            ZStack{
                Color("whitee")
                    .ignoresSafeArea(.all)
                
                if !isLastPage {
                    HStack {
                        Spacer()
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            NavigationLink(destination: ContentView()) {
                                Text("Skip")
                                    .font(Font.custom("NotoSans", size: 18))
                                    .foregroundColor(Color("TextColor"))
                                    .position(CGPoint(x: 320.0, y: 40.0))
                                
                            }
                            .navigationBarBackButtonHidden(true)
                        }
                    }
                    .alignmentGuide(HorizontalAlignment.trailing) { _ in
                        UIScreen.main.bounds.width - 20
                    }
                }
                
                VStack (spacing: 10) {
                    
                    
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350 )
                    
                    
                    Text(title)
                        .foregroundColor(Color("TextColor"))
                        .font(.title)
                        .bold()
                    
                    Text(description)
                        .foregroundColor(Color("TextColor"))
                        .font(.body)
                        .multilineTextAlignment(.center)
                   //     .padding(.vertical, 10)
                    
                    
                    if isLastPage {
                        
                        Button(action: {
                            // Handle "Start" button action
                            presentationMode.wrappedValue.dismiss()
                            
                        })   {
                            NavigationLink(destination: ContentView()) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 11)
                                        .fill(Color("ButtonColor"))
                                        .frame(width: 302, height: 53)
                                        .shadow(color: Color("ShadowColor"), radius: 4, x: 0, y: 4)
                                    
                                    Text("Start")
                                        .font(Font.custom("NotoSans", size: 20))
                                        .foregroundColor(.white)
                                }
                                
                            }
                            .navigationBarBackButtonHidden(true)
                            .padding(.top, 30)
                        }
                    }
                }
                .padding()
            }
        }
    }
}
  

#Preview {
    BoardingView()
}
