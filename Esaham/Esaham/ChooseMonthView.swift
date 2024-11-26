//
//  ChooseMonthView.swift
//  Esaham
//
//  Created by AlAnoud on 01/02/2024.
//

import SwiftUI

struct ChooseMonthView: View {
    let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
        
        @State public var selectedMonth: String?
        @Environment(\.dismiss) private var dismiss

        
        var body: some View {
            Text("Choose the month that track your progress in challenges")
                .font(.custom("NotoSans-Regular", size: 12))
                .foregroundColor(Color("ShadowColor"))
                .offset(y:-30)
            
        
            VStack(spacing: 30) {
                ForEach(0..<4) { row in
                    HStack(spacing: 25) {
                        ForEach(0..<3) { column in
                            let index = row * 3 + column
                            let month = months[index]
                            CircleView(month: month, isSelected: selectedMonth == month)
                                .onTapGesture {
                                    selectedMonth = month
                                }
                        }
                    }
                }
            }
            .offset(y:5)
            .navigationBarTitle("Choose The Month", displayMode: .inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {

                                Button {
                                    dismiss()

                                } label: {
                                    HStack {

                                        Image(systemName: "chevron.backward")
                                            .foregroundColor(Color("BackColor"))
                                     
                                    }
                                }
                            }
                        }

         
            NavigationLink(destination: StartChallengeView().background(Color("ButtonColor"))) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 11)
                                    .fill(Color("ButtonColor"))
                                    .frame(width: 302, height: 53)
                                    .shadow(color: Color("ShadowColor"), radius: 4, x: 0, y: 4)
                                
                                Text("Next")
                                    .font(Font.custom("NotoSans", size: 20))
                                    .foregroundColor(.white)
                            }

                        }
                        .padding(.top, 60)
        }
    }

    struct CircleView: View {
        let month: String
        let isSelected: Bool
        
        var body: some View {
            ZStack {
                Circle()
                    .fill(isSelected ? Color("PrimaryColor") : Color.clear)
                    .overlay(
                        Circle()
                            .stroke(Color("PrimaryColor"), lineWidth: 2)
                            .shadow(color: Color("ShadowColor"), radius: 4, x: 0, y: 2)
                    )
                    .frame(width: 87, height: 87)
                
                Text(month)
                    .font(.custom("NotoSans", size: 14))
                    .foregroundColor(isSelected ? Color(.white) : Color("PrimaryColor"))
                
            }
            
        }
        
    }

#Preview {
    ChooseMonthView()
}
