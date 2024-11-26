//
//  HessahView.swift
//  Esaham
//
//  Created by AlAnoud on 01/02/2024.
//

import SwiftUI

struct TasksView: View {
    @Binding var WaterScore: Float
    @Binding var RecycleScore: Float
    @Binding var CleanScore: Float
        
        
    @Binding var WaterButtonCount: Int
    @Binding var RecycleButtonCount: Int
    @Binding var CleanButtonCount: Int
        
    
    
        @State public var circleColor: Color = Color("PrimaryColor")
        @State public var completedCircleColor: Color = Color("HighlightColor")
    @State public var animateCircle = false
        
    
    var body: some View {
        VStack {
            Text("Tasks")
                .foregroundColor(Color("TextColor"))
                .fontWeight(.semibold)
                .font(.custom("NotoSans", size: 18))
                .offset(y:-180)
            
            HStack {
                Text("[Challenge Name]")
                    .font(.custom("NotoSans", size: 22))
                    .fontWeight(.bold)
                    .foregroundColor(Color("TextColor"))
                    .offset(x:-70,y:-160)
            }
            HStack{
                Text("Joined April 2024")
                    .fontWeight(.light)
                    .font(.custom("NotoSans", size: 15))
                    .foregroundColor(Color.gray)
                    .offset(x:-100,y:-150)
            }

        }
        
        
        HStack(spacing: 37) {
                
            VStack{
                ZStack {
                    Circle()
                        .frame(width: 66, height: 66)
                        .foregroundColor(Color("PrimaryColor"))
                    
                    Image("TopWater")
                       
                }
                ForEach(0..<1, id: \.self) { _ in
                    Text("\(self.WaterButtonCount)/8") // Display buttonPressedCount
                        .font(.title)
                        .padding()
            }
            
            VStack{
                ZStack {
                    Circle()
                        .frame(width: 66, height: 66)
                        .foregroundColor(Color("PrimaryColor"))

                    Image("TopRecycle")
                        
                }
                ForEach(0..<1, id: \.self) { _ in
                    Text("\(self.RecycleButtonCount)/8") // Display buttonPressedCount
                        .font(.title)
                        .padding()
            }
            
            VStack{
                ZStack {
                    Circle()
                        .frame(width: 66, height: 66)
                        .foregroundColor(Color("PrimaryColor"))

                    Image("TopClean")

                        .foregroundColor(Color.white)
            
                }
                ForEach(0..<1, id: \.self) { _ in
                    Text("\(self.CleanButtonCount)/8") // Display buttonPressedCount
                        .font(.title)
                        .padding()
            }
                
                
        }
        .offset(y:-110)
        
        
//---------------------- The progress Circle --------------------------
        
            SwiftUI.ZStack{
                
                HStack {
                    Text("2")
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                        .offset(x: 22)
                    Text("30")
                        .fontWeight(.bold)
                        .foregroundColor(Color("TextColor"))
                        .offset(x: 50)
                    
                    Image("2030")
                        .resizable()
                        .offset(x: -22)
                        .frame(width: 48, height: 48)
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                WaterBar(progress: $WaterScore)
                    .frame(width: 160.0, height: 160.0)
                    .padding(20.0)
                    }
                
                RecycleBar(progress: $RecycleScore)
                    .frame(width: 160.0, height: 160.0)
                    .padding(20.0)
                            
                    
                    }
                
                CleanBar(progress: $CleanScore)
                    .frame(width: 160.0, height: 160.0)
                    .padding(20.0)
                    
                    }
                
                
                    ZStack{
                        //Water
                        Circle()
                            .frame(width: 43, height: 43)
                            .foregroundColor(circleColor)
                            .offset(x:115,y:-50)
                        
                        Image("WaterImage")
                            .offset(x:115,y:-50)
                        
                        //Recycle
                        Circle()
                            .frame(width: 43, height: 43)
                            .foregroundColor(circleColor)
                            .offset(y:120)
                        
                        Image("RecycleImage")
                            .offset(y:120)
                            
                        
                        //Clean
                        Circle()
                            .frame(width: 43, height: 43)
                            .foregroundColor(circleColor)
                            .offset(x:-115,y:-50)
                        
                        Image("CleanImage")
                            .offset(x:-115,y:-50)
                            
                        
                    }
                
                    
                }
            .offset(y:-60)
            }
        }

    struct WaterBar: View {
        @Binding var progress: Float

        var body: some View {
            ZStack {
                Circle()
                    .trim(from: 0.0, to: 1 / 3.1)
                    .stroke(Color.gray, lineWidth: 15)
                    .opacity(0.20)
                    .rotationEffect(Angle(degrees: 150))

                Circle()
                    .trim(from: 0.0, to: CGFloat(min(progress / 10.0, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.blue)
                    .animation(.easeInOut(duration: 1.0))
                    .rotationEffect(Angle(degrees: 150))
            }
        }
    }



struct RecycleBar: View {
    @Binding var progress: Float

    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: 1 / 3.1)
                .stroke(Color.gray, lineWidth: 15)
                .opacity(0.20)
                .rotationEffect(Angle(degrees: 150))

            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress / 10.0, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.blue)
                .animation(.easeInOut(duration: 1.0))
                .rotationEffect(Angle(degrees: 150))
        }
    }
}


struct CleanBar: View {
    @Binding var progress: Float

    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0.0, to: 1 / 3.1)
                .stroke(Color.gray, lineWidth: 15)
                .opacity(0.20)
                .rotationEffect(Angle(degrees: 150))

            Circle()
                .trim(from: 0.0, to: CGFloat(min(progress / 10.0, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 12.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(Color.blue)
                .animation(.easeInOut(duration: 1.0))
                .rotationEffect(Angle(degrees: 150))
        }
    }
}





#Preview {
    TasksView(WaterScore: .constant(0), RecycleScore: .constant(0), CleanScore: .constant(0), WaterButtonCount: .constant(0), RecycleButtonCount: .constant(0), CleanButtonCount: .constant(0))
}
