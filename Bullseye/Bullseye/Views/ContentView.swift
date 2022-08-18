//
//  ContentView.swift
//  Bullseye
//
//  Created by Carl Duncan on 8/11/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue: Double = 50.0
    @State private var game = Game()
    
    
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                InstructionsView(game: $game)
                SliderView(sliderValue: $sliderValue)
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
           
            
        }
        }
    }
}

struct InstructionsView: View {
    @Binding var game: Game
    var body: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\n Put the Bullseye as clos as you can to")
                .padding(.leading)
                .padding(.trailing)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View {
    @Binding var sliderValue: Double
    var body: some View {
        HStack {
            SliderLabelTextView(text: "1")
            Slider(value: $sliderValue, in: 1.0...100.0)
            SliderLabelTextView(text: "100")
        }
        .padding()
    
    }
    
}


struct HitMeButton: View {
    
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            print ("Hello Swift UI!")
            alertIsVisible = true
        }){
            Text("Hit Me".uppercased())
                .bold()
                .font(.title3)
            }
            .padding(20.0)
            .background(
                ZStack {
                    Color("ButtonColor")
                    LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                }
            )
            .foregroundColor(Color.white)
            .cornerRadius(21.0)
            .overlay(
                RoundedRectangle(cornerRadius: 21.0)
                    .strokeBorder(.white, lineWidth: 2.0)
            )
            .alert("Hello there!", isPresented: $alertIsVisible) {
                Button("Awesome!") {}
            } message: {
                let roundedValue = Int(sliderValue.rounded())
                Text("This slider's value is  \(roundedValue). \n" + "You scored \(game.points(sliderValue: roundedValue)) points this round")
            }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        ContentView()
//        ContentView()
//            .previewLayout(.fixed(width: 568, height: 320))
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .previewLayout(.fixed(width: 568, height: 320))
            .preferredColorScheme(.dark)
    }
}
