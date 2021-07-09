//
//  ServiceLayer.swift
//  Punk
//
//  Created by Дмитрий Константинов on 07.07.2021.
//

import Foundation
import UIKit

protocol NetworkServiceProtocol {
        
    func getBeersPage(_ page: Int, complit: @escaping (_ beers: [BeerWithImage]) -> Void)
}

class NetworkService: NetworkServiceProtocol {
    
    func getBeersPage(_ page: Int, complit: @escaping (_ beers: [BeerWithImage]) -> Void) {
        
        let request = URLRequest(url: punkURL(page: page))
        
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            let httpStatus = response as? HTTPURLResponse
            let code = httpStatus?.statusCode
                guard let data = data else { return }
                do {
                    let beers = try JSONDecoder().decode([Beer].self, from: data)
                    var pivoSKartinkoy: [BeerWithImage] = []
                    for beer in beers {
                        let stringUrl = beer.image_url
                        let url = URL(string: stringUrl ?? "https://images.punkapi.com/v2/keg.png")!
                        if let imageData = try? Data(contentsOf: url){
                            pivoSKartinkoy.append(BeerWithImage(name: beer.name,
                                                                description: beer.description,
                                                                img: UIImage.init(data: imageData)))
                        }
                    }
                    complit(pivoSKartinkoy)
                } catch let error {
                    print(error)
                }
            print("statusCode: \(code ?? 999)")
        }.resume()
    }
    
}

extension NetworkService {
    private func punkURL(page: Int) -> URL{
        print("Page: \(page)")
        return URL(string: "https://api.punkapi.com/v2/beers?page=\(page)&per_page=5")!
    }
}
