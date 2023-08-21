//
//  QueenJson.swift
//  AfahIyh
//
//  Created by Dimas Aristyo Rahadian on 21/08/23.
//

import Foundation

struct QueenJson: Codable{
    
    let id: Int
    let Opening: String
    let Convo:  [String]
    let Questions: String
    let RAnswers: String
    let Answers: Answers
    let ConvEnd: [String]
    let GameClosing: String
    
    
    // Generate samples
    static let allData: [QueenJson] = Bundle.main.decode(file: "QueenLess.json")
}
//
struct Answers: Codable {
    let Wrong, Hint, End, RiAnswers: String
}
