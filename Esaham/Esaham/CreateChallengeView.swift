//
//  CreateChallengeView.swift
//  Esaham
//
//  Created by AlAnoud on 01/02/2024.
//

import SwiftUI

struct CreateChallengeView: View {
        @State private var challengeName = ""
        @State private var challengeCode = ""
        @State private var randomNumber = generateRandomNumber()
        @Environment(\.dismiss) private var dismiss

        var body: some View {
            VStack(spacing: 20) {
                Spacer()

                VStack(alignment: .leading, spacing: 20) {
                    Text("Challenge name")
                        .font(.custom("NotoSans-Regular", size: 20))
                        .foregroundColor(Color("TextColor"))
                        .offset(y:-300)

                    TextField("Enter challenge name", text: $challengeName)
                        .frame(width: 320)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .offset(y:-300)

                    Text("Challenge Code")
                        .font(.custom("NotoSans-Regular", size: 20))
                        .foregroundColor(Color("TextColor"))
                        .offset(y:-250)

                    Rectangle()
                        .fill(Color.white)
                        .frame(width: 328, height: 80)
                        .overlay(
                            RandomView(randomNumber: $randomNumber)
                        )
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.2), lineWidth: 1)
                        )
                        .offset(y:-250)
                }

                NavigationLink(destination: ChooseMonthView().background(Color("BackgroundColor"))) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 11)
                            .fill(Color("ButtonColor"))
                            .frame(width: 302, height: 53)
                            .shadow(color: Color("ShadowColor"), radius: 4, x: 0, y: 4)

                        Text("Create")
                            .font(Font.custom("NotoSans", size: 20))
                            .foregroundColor(.white)
                    }
                }
                .offset(y:-150)
            }
            .navigationBarTitle("Create Challenge", displayMode: .inline)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color("BackColor"))
                    }
                }
            }
        }

        // Function to generate a random number in the format 000-000-000
        private static func generateRandomNumber() -> String {
            let random1 = String(format: "%03d", Int.random(in: 0...999))
            let random2 = String(format: "%03d", Int.random(in: 0...999))
            let random3 = String(format: "%03d", Int.random(in: 0...999))
            return "\(random1)-\(random2)-\(random3)"
        }
    }

    struct RandomView: View {
        @Binding var randomNumber: String
        @State private var copied = false

        var body: some View {
            HStack {
                Text(randomNumber)
                    .font(.system(size: 36))
                    .foregroundColor(Color("TextColor"))

                Button(action: {
                    UIPasteboard.general.string = randomNumber
                    copied = true
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        copied = false
                    }
                }) {
                    Image(systemName: "doc.on.doc")
                        .font(.system(size: 24))
                        .foregroundColor(Color("PrimaryColor"))
                }
            }
            .overlay(
                copied ? Text("Copied!")
                    .foregroundColor(Color("PrimaryColor"))
                    //.padding(10)
                    .background(Color.white)
                    .cornerRadius(5)
                    .padding(.leading, 10)
                    : nil,
                alignment: .topTrailing
            )
        }
    }

#Preview {
    CreateChallengeView()
}
