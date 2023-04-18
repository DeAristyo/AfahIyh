//
//  QuestionView.swift
//  AfahIyh
//
//  Created by Dimas Aristyo Rahadian on 18/04/23.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        ZStack{
            Image("Background").resizable()
                .frame(width: 850.0, height: 500)
                .offset(x: 0, y: 60)
                .blur(radius: 10)
                .brightness(-0.4)
                .contrast(0.6)
            
            HStack{
                VStack(spacing: 0){
                    Image("AndiHalf")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 240)
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .frame(width: 140,height: 50)
                            .shadow(color:.black, radius: 10, x:0, y:10)
                            .offset(x:0,y:0)
                            .overlay(
                                Text("Andi")
                                    .font(.custom("SFProRound-Regular", size: 30))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                            )
                        
                    }
                }
    
                VStack(spacing: 50){
                    Text("Harga 1 es loli = 1000 rupiah Harga 1 Es mangkuk = 3000 rupiah andi ingin membeli 3 es loli dan 2 es mangkuk. berapa harga yang harus andi bayar?")
                        .font(.custom("SFProRound-Regular", size: 26))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        
                    
                    VStack(spacing: 20){
                        
                        Button(action: print) {
                            Text("Benar")
                                .foregroundColor(.white)
                                .frame(maxWidth: 100, maxHeight: 50)
                                .background(Color.green)
                                .cornerRadius(10)
                            .opacity(0.8)                        }
                        Button(action: print) {
                            Text("Salah")
                                .foregroundColor(.white)
                                .frame(maxWidth: 100, maxHeight: 50)
                                .background(Color.green)
                                .cornerRadius(10)
                        }
                    }
                    
                }.padding(50)
            }
        }
        
    }
}
func print(){
    print("Hello")
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView().previewInterfaceOrientation(.landscapeLeft)
    }
}
