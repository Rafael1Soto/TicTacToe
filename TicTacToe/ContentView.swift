//
//  ContentView.swift
//  TicTacToe
//
//  Created by A.M. Student on 1/26/21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        NavigationView {
            Home()
                .navigationTitle("Tic Tac Toe")
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
        }
    }
}

struct Home: View {
    
    @State var moves : [String] = Array(repeating: "", count: 9)
    @State var isPlaying = true
    
    var body: some View {
        VStack {
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 3), spacing: 15) {
                
                ForEach(0..<9, id: \.self) { index in
                    ZStack {
                        Color.white
                            
                        Text(moves[index])
                            .font(.title.system(size: 55))
                            .fontweight(.heavy)
                            .foregroungColor(.black)
                    }
                    .frame(width: getWidth(), height: getWidth())
                    .cornerRadius(15)
                    .onTapGesture(perform: {
                        withAnimation(Animation.easeIn(duration: 0.5)) {
                            
                            moves(index) = isplaying ? "X" : "O"
                            isPlaying.toggle()
                        }
                    })
                }
            }
            .padding(15)
            
        }
    }
    
}

func getWidth() -> CGFloat {
    let width = UIScreen.main.bounds.width - (30 + 30)
    return width / 3
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
