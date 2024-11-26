//
//  TasksView.swift
//  Esaham
//
//  Created by AlAnoud on 01/02/2024.
//

import SwiftUI

struct ChallengeView: View {
        var body: some View {
            NavigationView {
                
                VStack(spacing: 20) {
                    NavigationLink(destination: CreateChallengeView().background(Color("BackgroundColor")))
                    {
                        ZStack {
                            RoundedRectangle(cornerRadius: 11)
                                .fill(Color("ButtonColor"))
                                .frame(width: 328, height: 105)
                                .shadow(color:  Color("ShadowColor"), radius: 4, x: 0, y: 4)
                            
                            Text("Create Challenge")
                                .font(Font.custom("NotoSans", size: 20))
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.bottom, 40)
                    
                    NavigationLink(destination: JoinChallengeView().background(Color("BackgroundColor"))) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 11)
                                .fill(Color("ButtonColor"))
                                .frame(width: 328, height: 105)
                                .shadow(color: Color("ShadowColor"), radius: 4, x: 0, y: 4)
                            
                            Text("Join Challenge")
                                .font(Font.custom("NotoSans", size: 20))
                                .foregroundColor(.white)
                        }
                    }
                }
                
                .padding(.top, -20)
                .background(Color.white)
                
            }
        }
    }

#Preview {
    ChallengeView()
}
