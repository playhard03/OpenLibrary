import Foundation

struct BooksModels: Codable{
    var results: [Results]?
}
struct Results: Codable{
    var title: String?
    var subjects: [String]?
    var download_count: Int?
    var authors: [Authors]?
    var formats: Formats?
}
struct Authors: Codable{
    var death_year: Int?
}
struct Formats: Codable{
    var image: String?
    
    enum CodingKeys: String, CodingKey{
        case image = "image/jpeg"
    }
}
