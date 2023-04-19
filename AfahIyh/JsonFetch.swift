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


extension Bundle {
    func decode<T: Decodable>(file: String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in bundle.")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not load \(file) from bundle.")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) from bundle.")
        }
        
        return loadedData
    }
}
