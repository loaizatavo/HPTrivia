//
//  PlayButton.swift
//  HPTrivia
//
//  Created by Gustavo Loaiza Robles on 24/3/26.
//

import SwiftUI

struct PlayButton: View {
    @State private var playGame = false
    @State private var scalePlayButton = false
    @Binding var animateViewIn: Bool
    let geo: GeometryProxy
    
    var body: some View {
        VStack {
            if animateViewIn {
                Button {
                    playGame.toggle()
                } label: {
                    Text("Play")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .padding(.vertical, 7)
                        .padding(.horizontal, 50)
                        .background(.brown)
                        .clipShape(.rect(cornerRadius: 7))
                        .shadow(radius: 5)
                        .scaleEffect(scalePlayButton ? 1.2 : 1)
                        .onAppear {
                            withAnimation(.easeInOut(duration: 1.3).repeatForever(autoreverses: true)) {
                                scalePlayButton.toggle()
                            }
                        }
                }
                .transition(.offset(y: geo.size.height/3))
            }
        }
        .animation(.easeOut(duration: 0.7).delay(2), value: animateViewIn)
    }
}

#Preview {
    GeometryReader { geo in
        PlayButton(animateViewIn: .constant(true), geo: geo)
    }
    .preferredColorScheme(.dark)
}
