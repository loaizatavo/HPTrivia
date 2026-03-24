//
//  InstructionButton.swift
//  HPTrivia
//
//  Created by Gustavo Loaiza Robles on 24/3/26.
//

import SwiftUI

struct InstructionButton: View {
    @State private var showInstructions = false
    @Binding var animateViewIn: Bool
    let geo: GeometryProxy
    
    var body: some View {
        VStack {
            if animateViewIn {
                Button {
                    showInstructions.toggle()
                } label: {
                    Image(systemName: "info.circle.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .shadow(radius: 5)
                }
                .transition(.offset(x: -geo.size.height/4))
            }
        }
        .animation(.easeOut(duration: 0.7).delay(2.7), value: animateViewIn)
        .sheet(isPresented: $showInstructions) {
            Instructions()
        }
    }
}

#Preview {
    GeometryReader { geo in
        InstructionButton(animateViewIn: .constant(true),geo: geo)
        .preferredColorScheme(ColorScheme.dark)
    }

}
