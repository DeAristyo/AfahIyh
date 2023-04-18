//
//  GameDialoque.swift
//  AfahIyh
//
//  Created by Dimas Aristyo Rahadian on 18/04/23.
//

import SwiftUI

struct GameDialoque: View {
    
    @State private var navigateToIntro : Bool = false
    @State private var navigateToQuestion : Bool = false
    @Binding var indeks: Int
    @Binding var path : [Int]
    
    let AllData: [QueenJson] = QueenJson.allData
    var getNumber: Int{
        self.AllData[indeks].id
    }
    
    var secondChar: String{
        switch getNumber{
        case 1:
            return "PakBudiHalf"
        case 2:
            return "PenjagaTokoHalf"
        case 3:
            return "PenjualEsKrimHalf"
        case 4:
            return "PenjualEsKrimHalf"
        case 5:
            return "RaniHalf"
        case 6:
            return "PenjualEsKrimHalf"
        case 7:
            return "PenjualEsKrimHalf"
        case 8:
            return "PenjualEsKrimHalf"
        default:
            return "PakBudiHalf"
        }
    }
    

    
    @State private var nama = true
    @State private var words : Int = 0
    @State private var scene : Int = 0
    
    var body: some View {
        let charName = nama ? "ANDI" : "PAK BUDI"
        let BG = scene == 1 || scene == 5 || scene == 6 || scene == 7 ? "KoperasiBG" : "Background"
        
        let convo = AllData[indeks].Convo
        let questions = AllData[indeks].Questions
        
            ZStack {
                Image(BG)
                    .resizable()
                    .frame(width: 850.0, height: 500)
                    .offset(x: 0, y: 60)
                
                HStack{
                    if nama {
                        Image("AndiHalf")
                            .scaleEffect(0.3)
                            .offset(x:25, y: -25)
                        Image(secondChar)
                            .scaleEffect(0.2)
                            .scaleEffect(x: -1)
                            .brightness(-0.3)
                    }else{
                        Image("AndiHalf")
                            .scaleEffect(0.2)
                            .brightness(-0.3)
                            .offset(x:25, y: -25)
                        Image(secondChar)
                            .scaleEffect(0.3)
                            .scaleEffect(x: -1)
                            .offset(x:0, y:-25)
                        
                    }
                    
                }
                HStack{
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(Color.white, lineWidth: 15)
                        .frame(width: 500,height: 130)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                            .fill(Color.yellow)
                            .overlay(
                                Text(convo[words])
                                    .font(.system(size: 26 )).multilineTextAlignment(.center).padding(15)
                            )
                        )
                }.offset(x:0,y:101)
                
                HStack{
                    if nama{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .frame(width: 120,height: 40)
                            .shadow(radius:5, x: 0, y:2)
                            .overlay(
                                Text(charName)
                                    .font(.system(size:18))
                                    .fontWeight(.bold))
                            .offset(x:-185,y:35)
                    }else{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .frame(width: 120,height: 40)
                            .shadow(radius:3)
                            .overlay(
                                Text(charName)
                                    .font(.system(size:18))
                                    .fontWeight(.bold))
                            .offset(x:185,y:35)
                    }
                }
            }
            .onTapGesture {
                if words < convo.count-1{
                    kalimat()
                    print("Masih di kalimat ya bro")
                }else if questions == ""{
                    print("Go To Intro")
                    words = 0
                    indeks += 1
                    print("indeks \(indeks)")
                    path.removeAll()
                }else{
                    print("Go To Question")
                    self.navigateToQuestion.toggle()
                    words = 0
                }
            }
            .navigationDestination(isPresented: $navigateToQuestion) {
                QuestionView().navigationBarBackButtonHidden()
            }
    }
    
    func kalimat(){
        self.nama.toggle()
        self.words += 1
    }
}

struct GameDialoque_Previews: PreviewProvider {
    static var previews: some View {
        GameDialoque(indeks: .constant(0), path: .constant([])).previewInterfaceOrientation(.landscapeRight)
    }
}
