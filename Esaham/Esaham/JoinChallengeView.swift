//
//  JoinChallangeView.swift
//  Esaham
//
//  Created by AlAnoud on 01/02/2024.
//

import SwiftUI

struct JoinChallengeView: View {
    @State public var challengeName = ""
    @State public var challengeCode = ""
    @Environment(\.dismiss) private var dismiss

    
    var body: some View {
        VStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 5) {
                Text("Challenge name")
                    .font(.custom("NotoSans-Regular", size: 20))
                    .foregroundColor(Color("TextColor"))
                    .offset(y:-50)
                
                TextField("Enter challenge name", text: $challengeName)
                    .frame(width: 320)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .offset(y:-40)
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text("Challenge code")
                    .font(.custom("NotoSans-Regular", size: 20))
                    .foregroundColor(Color("TextColor"))
                    .offset(y:-10)
        
                TextField("Enter challenge Code", text: $challengeCode)
                    .offset(y:0)
                    .frame(width: 320)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad)
                    .onChange(of: challengeCode) { newValue in
                        let filtered = newValue.filter { "0123456789-".contains($0) }
                        if filtered != newValue {
                            self.challengeCode = filtered
                        }
                        if self.challengeCode.count == 4 || self.challengeCode.count == 8 {
                            if !self.challengeCode.hasSuffix("-") {
                                self.challengeCode.insert("-", at: self.challengeCode.index(self.challengeCode.endIndex, offsetBy: -1))
                            }
                        }
                        if self.challengeCode.count > 11 {
                            self.challengeCode = String(self.challengeCode.prefix(11))
                        }
                    }
            }
        
            
            NavigationLink(destination: WaitForChallengeView().background(Color("ButtonColor"))) {
                ZStack {
                    RoundedRectangle(cornerRadius: 11)
                        .fill(Color("ButtonColor"))
                        .frame(width: 302, height: 53)
                        .shadow(color: Color("ShadowColor").opacity(0.25), radius: 4, x: 0, y: 4)
                    
                    Text("Create")
                        .font(Font.custom("NotoSans", size: 20))
                        .foregroundColor(.white)
                }
                .padding(.top, 60)
            }
        }
        .navigationBarTitle("Join Challange", displayMode: .inline)
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

    }
}

#Preview {
    JoinChallengeView()
}
