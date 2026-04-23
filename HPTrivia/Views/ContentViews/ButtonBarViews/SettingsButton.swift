//
//  SettingsButton.swift
//  HPTrivia
//
//  Created by Gustavo Loaiza Robles on 24/3/26.
//

import SwiftUI

struct SettingsButton: View {
    @State private var showSettings = false
    @Binding var animateViewIn: Bool
    let geo: GeometryProxy
    
    var body: some View {
        VStack {
            if animateViewIn {
                Button {
                    showSettings.toggle()
                } label: {
                    Image(systemName: "gearshape.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .shadow(radius: 5)
                }
                .transition(.offset(x: geo.size.height/4.7))
            }
        }
        .animation(.easeOut(duration: 0.7).delay(2.7), value: animateViewIn)
        .sheet(isPresented: $showSettings) {
            SelectBooks()
        }
    }
}

#Preview {
    GeometryReader { geo in
        SettingsButton(animateViewIn: .constant(true), geo: geo)
            .environment(Game())
    }
    .preferredColorScheme(.dark)
    
}
