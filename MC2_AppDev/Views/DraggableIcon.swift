//
//  DraggableIcon.swift
//  MC2_AppDev
//
//  Created by Michael Wijaya Sutrisna on 22/06/23.
//

import SwiftUI

struct DraggableIcon: View {
    @State private var position = CGPoint(x: 100, y: 100)
    @GestureState private var dragState = CGSize.zero

    var body: some View {
        Image(systemName: "circle.fill")
            .font(.largeTitle)
            .foregroundColor(.blue)
            .offset(
                x: position.x + dragState.width,
                y: position.y + dragState.height
            )
            .gesture(
                DragGesture()
                    .updating($dragState) { value, state, _ in
                        state = value.translation
                    }
                    .onEnded { value in
                        position.x += value.translation.width
                        position.y += value.translation.height
                    }
                
            )
            
            
    }
}

struct DraggableIcon_Previews: PreviewProvider {
    static var previews: some View {
        DraggableIcon()
    }
}
