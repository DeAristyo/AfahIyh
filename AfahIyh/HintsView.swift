//
//  HintsView.swift
//  AfahIyh
//
//  Created by Dimas Aristyo Rahadian on 19/04/23.
//

import SwiftUI

struct HintsView: View {
    
    @Binding var indeks: Int
    @Binding var path : [Int]
    
    @State var navigateToConvEnd : Bool = false
    @State var navigateToGameOver : Bool = false
    
    let AllData: [QueenJson] = QueenJson.allData
    var getNumber: Int{
        self.AllData[indeks].id
    }
    
    var hints : String {
        self.AllData[indeks].Answers.Hint
    }
    
    var answers : String {
        self.AllData[indeks].Answers.RiAnswers
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
        ZStack{
            Image("Background").resizable()
                .frame(width: 850.0, height: 500)
                .offset(x: 0, y: 60)
                .blur(radius: 10)
                .brightness(-0.4)
                .contrast(0.6)
            
            HStack{
                VStack(spacing: 0){
                    Image(secondChar)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 240)
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .frame(width: 160,height: 50)
                            .shadow(color:.black, radius: 4, x:0, y:2)
                            .offset(x:0,y:0)
                            .overlay(
                                Text(charName)
                                    .bold()
                                    .font(.custom("SFProRound-Regular", size:20))
                                    .fontWeight(.bold)
                                    .multilineTextAlignment(.center)
                            )
                        
                    }
                }.offset(y:40)
                
                VStack(spacing: 30){
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 0.935, green: 0.856, blue: 0.819))
                        .frame(width: 550, height: 170)
                        .overlay(
                            Text(hints)
                                .font(.custom("SFProRound-Regular", size: 23))
                                .fontWeight(.bold)
                                .frame(width: 500)
                                .multilineTextAlignment(.center))
                        .offset(x:-30)
                    
                    
                    HStack(spacing: 20){
                        Spacer()
                        Button(action: benarSkali) {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth:2)
                                .frame(maxWidth: 150, maxHeight: 50)
                                .shadow(color: .black, radius: 4, x:0, y:2)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(red: 0.245, green: 0.536, blue: 0.839))
                                        .frame(maxWidth: 150, maxHeight: 50))
                                .overlay(
                                    Text("Benar")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: 150, maxHeight: 50)
                                        .font(.system(size: 23))
                                        .cornerRadius(10))
                                .offset(x:-30)
                        }
                        .navigationDestination(isPresented: $navigateToConvEnd) {
                            EndConvo(indeks: $indeks, path: $path).navigationBarBackButtonHidden()
                        }
                        
                        Spacer()
                        
                        Button(action: salahSkali) {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, lineWidth:2)
                                .frame(maxWidth: 150, maxHeight: 50)
                                .shadow(color: .black, radius: 4, x:0, y:2)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(red: 0.245, green: 0.536, blue: 0.839))
                                        .frame(maxWidth: 150, maxHeight: 50))
                                .overlay(
                                    Text("Salah")
                                        .foregroundColor(.white)
                                        .frame(maxWidth: 150, maxHeight: 50)
                                        .font(.system(size: 23))
                                        .cornerRadius(10))
                                .offset(x:-30)
                        }
                        .navigationDestination(isPresented: $navigateToGameOver) {
                            EndWrongView(indeks: $indeks,path: $path).navigationBarBackButtonHidden()
                        }
                        Spacer()
                    }
                    
                }.padding(30)
            }
        }
        
    }
    func benarSkali(){
        if answers == "Benar"{
            self.navigateToConvEnd.toggle()
        }else{
            self.navigateToGameOver.toggle()
        }
    }
    
    func salahSkali(){
        if answers == "Salah"{
            self.navigateToConvEnd.toggle()
        }else{
            self.navigateToGameOver.toggle()
        }
    }
}
    
    struct HintsView_Previews: PreviewProvider {
        static var previews: some View {
            HintsView(indeks: .constant(0), path: .constant([])).previewInterfaceOrientation(.landscapeLeft)
        }
    }
