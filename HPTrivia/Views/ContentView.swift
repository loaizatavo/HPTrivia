//
//  ContentView.swift
//  HPTrivia
//
//  Created by Gustavo Loaiza Robles on 10/3/26.
//

import SwiftUI
import AVKit

struct ContentView: View {
    @State private var audioPlayer: AVAudioPlayer!
    @State private var animateViewIn = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                AnimatedBackground(geo: geo)
                
                VStack{
                    GameTitle(animateViewIn: $animateViewIn)
                    
                    Spacer()
                    
                    RecentScores(animateViewIn: $animateViewIn)
                    
                    Spacer()
                    
                    ButtonBar(animateViewIn: $animateViewIn, geo: geo)
                    
                    Spacer()
                    
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .ignoresSafeArea()
        .onAppear {
            //withAnimation {
            animateViewIn = true
            //}
            //playAudio()
        }
    
    }
    
    private func playAudio() {
        let sound = Bundle.main.path(forResource: "magic-in-the-air", ofType: "mp3")
        audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
        
        audioPlayer.numberOfLoops = -1
        audioPlayer.play()
        
        var isPLaying = audioPlayer.isPlaying
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
