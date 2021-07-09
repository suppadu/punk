//
//  Beer.swift
//  Punk
//
//  Created by Дмитрий Константинов on 07.07.2021.
//

import Foundation
import UIKit

struct Beer: Codable {
    let name: String
    let description: String
    let image_url: String?
}

struct BeerWithImage {
    let name: String
    let description: String
    let img: UIImage?
}
