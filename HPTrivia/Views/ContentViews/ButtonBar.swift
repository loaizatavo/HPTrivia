//
//  ButtonBar.swift
//  HPTrivia
//
//  Created by Gustavo Loaiza Robles on 24/3/26.
//

import SwiftUI

struct ButtonBar: View {
    @Binding var animateViewIn: Bool
    let geo: GeometryProxy
    
    var body: some View {
        HStack {
            Spacer()
            
            InstructionButton(animateViewIn: $animateViewIn,geo: geo)
            
            Spacer()
            
            PlayButton(animateViewIn: $animateViewIn, geo: geo)
            
            Spacer()
            
            SettingsButton(animateViewIn: $animateViewIn, geo: geo)
            
            Spacer()
        }
        .frame(width: geo.size.width)
    }
}

#Preview {
    GeometryReader { geo in
        ButtonBar(animateViewIn: .constant(true), geo: geo)
    }
    .preferredColorScheme(.dark)
}
