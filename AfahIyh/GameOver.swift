//
//  GameOver.swift
//  AfahIyh
//
//  Created by Dimas Aristyo Rahadian on 18/04/23.
//

import SwiftUI

struct GameOver: View {
    
    @Binding var path : [Int]

    var body: some View {
        ZStack{
            Image("Background").resizable()
                .frame(width: 850.0, height: 500)
                .offset(x: 0, y: 60)
                .blur(radius: 10)
                .brightness(-0.4)
                .contrast(0.6)
            ZStack{
                Text("GAME\nOVER")
                    .font(.system(size: 125, weight: .bold))
                    .foregroundColor(Color.white)
                    .shadow(color: Color.green.opacity(0.7), radius: 10, x: 0, y: 0)
            }
        }.onTapGesture {
            path.removeAll()
        }
    }
}

struct GameOver_Previews: PreviewProvider {
    static var previews: some View {
        GameOver(path: .constant([])).previewInterfaceOrientation(.landscapeLeft)
    }
}
