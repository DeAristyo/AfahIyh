//
//  HintsDialoque.swift
//  AfahIyh
//
//  Created by Dimas Aristyo Rahadian on 19/04/23.
//

import SwiftUI

struct WrongDialoque: View {
    
    @State private var navigateToIntro : Bool = false
    @State private var navigateToHints : Bool = false
    @State private var nama = true
    @State private var words : Int = 0
    @State private var scene : Int = 0
    
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
        let BG = indeks <= 4 ? "Background" : "KoperasiBG"
        
        let wrong = AllData[indeks].Answers.Wrong
        
        ZStack {
            Image(BG)
                .resizable()
                .frame(width: 850.0, height: 500)
                .offset(x: 0, y: 60)
            
            HStack{
                    Image("AndiHalf")
                        .scaleEffect(0.3)
                        .offset(x:25, y: -25)
                    Image(secondChar)
                        .scaleEffect(0.2)
                        .scaleEffect(x: -1)
                        .brightness(-0.3)
            }
            HStack{
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.white, lineWidth: 15)
                    .frame(width: 500,height: 130)
                    .overlay(RoundedRectangle(cornerRadius: 20)
                        .fill(Color.yellow)
                        .overlay(
                            Text(wrong)
                                .font(.system(size: 26 )).multilineTextAlignment(.center).padding(15)
                        )
                    )
            }.offset(x:0,y:101)
            
            HStack{
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: 120,height: 40)
                        .shadow(radius:5, x: 0, y:2)
                        .overlay(
                            Text("ANDI")
                                .font(.system(size:18))
                                .fontWeight(.bold))
                        .offset(x:-185,y:35)
            }
        }
        .onTapGesture {
            self.navigateToHints.toggle()
        }
        .navigationDestination(isPresented: $navigateToHints) {
            HintsView(indeks: $indeks, path: $path).navigationBarBackButtonHidden()
        }
    }
}

struct WrongDialoque_Previews: PreviewProvider {
    static var previews: some View {
        WrongDialoque(indeks: .constant(0), path: .constant([])).previewInterfaceOrientation(.landscapeLeft)
    }
}
