//
//  ApiManager.swift
//  OpenLibrary
//
//  Created by Андрей Сергеевич on 16.04.2023.
//

import Foundation

class ApiManager {
    
    static let shared = ApiManager(); private init(){}
    
    func getRequest(ids: String, complection: @escaping (BooksModels?) -> Void){
        let urlString = "https://gutendex.com/books/?ids=\(ids)"
        guard  let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {return}
            do {
                let task = try JSONDecoder().decode(BooksModels.self, from: data)
                complection(task)
            }catch{
                print(error)
            }
            
        }.resume()
    }
}
