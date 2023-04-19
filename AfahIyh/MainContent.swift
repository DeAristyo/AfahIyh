//
//  MainContent.swift
//  AfahIyh
//
//  Created by Dimas Aristyo Rahadian on 18/04/23.
//

import SwiftUI

struct MainContent: View {
    
//    @State var path : [Int] = []
    @State var toNavigate : Bool = false
    
    var body: some View {
//        NavigationStack(path: $path){
            ZStack{
                Image("LandingPagewTitle")
                    .resizable()
                    .frame(width: 850.0, height: 500)
                    .offset(x: 0, y: 30)
                    .ignoresSafeArea()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.white, lineWidth: 15)
                            .frame(width: 150,height: 50)
                            .overlay(RoundedRectangle(cornerRadius: 20)
                                .fill(Color.green)
                                .overlay(
                                    Text("Mulai")
                                        .bold()
                                        .font(.system(size: 34 )).multilineTextAlignment(.center).padding(15)
                                )
                            ).offset(x: 0, y: 120)
                            .onTapGesture {
//                                path.append(1)
                                self.toNavigate.toggle()
                            }
                            .navigationDestination(isPresented: $toNavigate) {
                                IntroContent().navigationBarBackButtonHidden()
                            }
                    )
            }
    }
}

struct MainContent_Previews: PreviewProvider {
    static var previews: some View {
        MainContent().previewInterfaceOrientation(.landscapeLeft)
    }
}
