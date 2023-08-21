//
//  Character.swift
//  AfahIyh
//
//  Created by Dimas Aristyo Rahadian on 21/08/23.
//

import Foundation

enum Characters{
    case pakBudi
    case ibuKantin
    case penjualEsKrim
    case ratna
    case rani
    case penjagaToko
    case kakakAndi
    
    var peopleImage: String{
        switch self{
        case .pakBudi:
            return "PakBudiHalf"
        case .ibuKantin:
            return "IbuKantinHalf"
        case .penjualEsKrim:
            return "PenjualEsKrimHalf"
        case .ratna:
            return "RatnaHalf"
        case .rani:
            return "RaniHalf"
        case .penjagaToko:
            return "PenjagaTokoHalf"
        case .kakakAndi:
            return "KakakAndiHalf"
        }
    }
    
    var peopleName: String{
        switch self{
        case .pakBudi:
            return "PAK BUDI"
        case .ibuKantin:
            return "IBU KANTIN"
        case .penjualEsKrim:
            return "PENJUAL ES"
        case .ratna:
            return "RATNA"
        case .rani:
            return "RANI"
        case .penjagaToko:
            return "PENJAGA TOKO"
        case .kakakAndi:
            return "PENJAGA TOKO"
        }
    }
    
}
