// ButtonView.swift
import SwiftUI

struct MyPlantView: View {
    @Binding var WaterScore: Float
    @Binding var RecycleScore: Float
    @Binding var CleanScore: Float
    
    
    @Binding var WaterButtonCount: Int
    @Binding var RecycleButtonCount: Int
    @Binding var CleanButtonCount: Int
    
    
    
    var body: some View {
//Water Button
        VStack {
            Button(action: {
                // Increment buttonPressedCount by 1 each time the button is pressed
                WaterButtonCount += 1
                
                // Update cleanScore by 0.375 until it reaches 3.0
                let increment: Float = 0.375
                if WaterScore + increment <= 3.0 {
                    WaterScore += increment
                } else {
                    WaterScore = 3.0
                }
            }) {
                Text("Clean Button")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(WaterButtonCount >= 8) // Disable the button after 8 presses
        }
        
//Recycle Button
        VStack {
            Button(action: {
                // Increment buttonPressedCount by 1 each time the button is pressed
                RecycleButtonCount += 1
                
                // Update cleanScore by 0.375 until it reaches 3.0
                let increment: Float = 0.375
                if RecycleScore + increment <= 3.0 {
                    RecycleScore += increment
                } else {
                    RecycleScore = 3.0
                }
            }) {
                Text("Clean Button")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(RecycleButtonCount >= 8) // Disable the button after 8 presses
        }
        
        
//Clean Button
        VStack {
            Button(action: {
                // Increment buttonPressedCount by 1 each time the button is pressed
                CleanButtonCount += 1
                
                // Update cleanScore by 0.375 until it reaches 3.0
                let increment: Float = 0.375
                if CleanScore + increment <= 3.0 {
                    CleanScore += increment
                } else {
                    CleanScore = 3.0
                }
            }) {
                Text("Clean Button")
                    .font(.title)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .disabled(CleanButtonCount >= 8) // Disable the button after 8 presses
        }
    }
}

struct MyPlantView_previews: PreviewProvider {
    static var previews: some View {
        MyPlantView(WaterScore: .constant(0), RecycleScore: .constant(0), CleanScore: .constant(0), WaterButtonCount: .constant(0), RecycleButtonCount: .constant(0), CleanButtonCount: .constant(0))
    }
}

