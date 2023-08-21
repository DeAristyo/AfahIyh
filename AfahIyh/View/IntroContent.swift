//
//  IntroContent.swift
//  AfahIyh
//
//  Created by Dimas Aristyo Rahadian on 18/04/23.
//

import SwiftUI

struct IntroContent: View {
    
    @State var indexData : Int = 0
    @State var changeScreen : Bool =  false
    @State var path : [Int] = []
    
    let AllData: [QueenJson] = QueenJson.allData
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack{
                    Image("Background").resizable()
                        .frame(width: 850.0, height: 500)
                        .offset(x: 0, y: 60)
                        .blur(radius: 10)
                        .brightness(-0.4)
                        .contrast(0.6)
                        .overlay(
                            Text(AllData[indexData].Opening)
                                .padding(100)
                                .font(.custom("SFProRound-Regular", size: 30))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                        ).onTapGesture {
                            path.append(1)
                            self.changeScreen.toggle()
                        }
                        .navigationDestination(for: Int.self) { int in
                            GameDialoque(indeks: $indexData, path: $path).navigationBarBackButtonHidden()
                        }
//                }
            }
        }
    }
}

struct IntroContent_Previews: PreviewProvider {
    static var previews: some View {
        IntroContent().previewInterfaceOrientation(.landscapeLeft)
    }
}
