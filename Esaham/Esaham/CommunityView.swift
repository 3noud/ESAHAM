//
//  CoummunityView.swift
//  ESAHAM
//
//  Created by razan on 31/01/2024.
//

import SwiftUI

struct CommunityView: View {
    var body: some View {
        
            VStack(spacing: 55) {
                RectangleView()
            }
           
        }
    }


struct RectangleView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 345, height: 119)
                .background(Color("BackgroundColor"))
                .cornerRadius(11)
                .shadow(color: Color(red: 0.9, green: 0.9, blue: 0.9), radius: 2, x: 0, y: 4)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .inset(by: 0.5)
                        .stroke(.white, lineWidth: 1)
                )
            
            VStack {
                HStack {
                    Text("Class 10/A")
                        .font(
                            .custom("NotoSans-Regular", size: 19)
                            
                        )
                        .fontWeight(.bold)
                        .foregroundColor(Color(red: 0.18, green: 0.28, blue: 0.03))
                        .offset(x: -22, y: 0)
                    
                    Text("9 hours")
                        .font(.custom("NotoSans-Regular", size: 9))
                        .foregroundColor(Color(red: 0.647, green: 0.65, blue: 0.65))
                        .offset(x: -19, y: 2)
                }
                
                HStack {
                    Image("Imag1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .cornerRadius(11)
                        .frame(width: 62, height: 66)
                    
                        .offset(x: 35, y: -19)
                    
                    
                    
                    Image("imag")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 22.0, height: 25.0)
                        .offset(x: 47, y: -15)
                    
                    Image("imag2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 22.0, height: 25.0)
                        .offset(x: 63, y: -15)
                    
                    Image("imag3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 22.0, height: 25.0)
                        .offset(x: 75, y: -15)
                    
                    Image("Imag4")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 175, height: 9)
                        .offset(x: -45, y: 14)
                    
                    
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 49, height: 23)
                            .cornerRadius(6)
                            .overlay(
                                RoundedRectangle(cornerRadius: 6)
                                    .inset(by: 0.5)
                                    .stroke(Color(red: 0.61, green: 0.55, blue: 0.82), lineWidth: 1)
                                    .offset(x: -36, y: 13)
                            )
                        
                        Image(systemName: "heart.fill")
                            .foregroundColor(Color(red: 0.61, green: 0.55, blue: 0.82))
                            .font(.system(size: 12))
                            .offset(x: -48, y: 13)
                        
                        Text("23")
                            .font(.custom("NotoSans-Regular", size: 15))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        
                            .foregroundColor(Color(red: 0.61, green: 0.55, blue: 0.82))
                            .offset(x: -26, y: 12)
                    }
                }
                
            }
            
        }
    }
}

#Preview {
    CommunityView()
}

