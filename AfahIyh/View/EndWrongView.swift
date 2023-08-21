//
//  RightDialoque.swift
//  AfahIyh
//
//  Created by Dimas Aristyo Rahadian on 19/04/23.
//

import SwiftUI

struct EndWrongView: View {
    
    @State private var navigateToIntro : Bool = false
    @State private var navigateToQuestion : Bool = false
    @State private var nama = true
    @State private var words : Int = 0
    @State private var scene : Int = 0
    
    @Binding var indeks: Int
    @Binding var path: [Int]
    
    let AllData: [QueenJson] = QueenJson.allData
    var getNumber: Int{
        self.AllData[indeks].id
    }
    
    var secondChar: String{
        switch getNumber{
        case 1:
            return "PakBudiHalf"
        case 2:
            return "IbuKantinHalf"
        case 3:
            return "PenjualEsKrimHalf"
        case 4:
            return "RatnaHalf"
        case 5:
            return "RaniHalf"
        case 6:
            return "PenjagaTokoHalf"
        case 7:
            return "PenjagaTokoHalf"
        case 8:
            return "PenjagaTokoHalf"
        default:
            return "KakakAndiHalf"
        }
    }
    
    
    var charName: String{
        switch getNumber{
        case 1:
            return "PAK BUDI"
        case 2:
            return "IBU KANTIN"
        case 3:
            return "PENJUAL ES"
        case 4:
            return "RATNA"
        case 5:
            return "RANI"
        case 6:
            return "PENJAGA TOKO"
        case 7:
            return "PENJAGA TOKO"
        case 8:
            return "PENJAGA TOKO"
        default:
            return "KAKAK ANDI"
        }
    }
    
    
    var body: some View {
        let BG = scene == 1 || scene == 5 || scene == 6 || scene == 7 ? "KoperasiBG" : "Background"
        
        let endWrong = AllData[indeks].Answers.End
        
        ZStack {
            Image(BG)
                .resizable()
                .frame(width: 850.0, height: 500)
                .offset(x: 0, y: 60)
            
            HStack{
                Image("AndiHalf")
                    .scaleEffect(0.2)
                    .brightness(-0.3)
                    .offset(x:25, y: -25)
                Image(secondChar)
                    .scaleEffect(0.3)
                    .scaleEffect(x: -1)
                    .offset(x:0, y:-25)
                
            }
            HStack{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 15)
                    .frame(width: 500,height: 130)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .fill(Color.yellow)
                        .overlay(
                            Text(endWrong)
                                .font(.system(size: 26 )).multilineTextAlignment(.center).padding(15)
                        )
                    )
            }.offset(x:0,y:101)
            
            HStack{
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 160,height: 40)
                    .shadow(radius:3)
                    .overlay(
                        Text(charName)
                            .font(.system(size:18))
                            .fontWeight(.bold))
                    .offset(x:185,y:35)
            }
        }
        .onTapGesture {
            self.navigateToQuestion.toggle()
        }
        .navigationDestination(isPresented: $navigateToQuestion) {
            GameOver(path: $path).navigationBarBackButtonHidden()
        }
    }
    
    func kalimat(){
        self.nama.toggle()
        self.words += 1
    }
}

struct EndWrongView_Previews: PreviewProvider {
    static var previews: some View {
        EndWrongView(indeks: .constant(0), path: .constant([])).previewInterfaceOrientation(.landscapeLeft)
    }
}
