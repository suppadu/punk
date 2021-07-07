//
//  ServiceLayer.swift
//  Punk
//
//  Created by Дмитрий Константинов on 07.07.2021.
//

import Foundation

protocol NetworkServiceProtocol {
        
    func getBeer()
//    complit: @escaping (_ beer: Beer) -> Void
}

class NetworkService: NetworkServiceProtocol {
    
    func punkURL(page: Int) -> URL{
        return URL(string: "https://api.punkapi.com/v2/beers?page=\(page)&per_page=5")!
    }
    
    func getBeer() {
        
        let request = URLRequest(url: punkURL(page: 3))
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            let httpStatus = response as? HTTPURLResponse
            let code = httpStatus?.statusCode
                guard let data = data else { return }
                do {
                    let beers = try JSONDecoder().decode([Beer].self, from: data)
                    for beer in beers {
                        print(beer)
                    }
                } catch let error {
                    print(error)
                }
            print("statusCode: \(code ?? 999)")
        }.resume()
    }
}
