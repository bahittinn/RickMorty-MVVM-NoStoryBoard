//
//  Character.swift
//  RMorty
//
//  Created by Bahittin on 11.09.2023.
//

import Foundation


struct Character: Codable {
    let info: Info?
    let results: [CharacterResult]?
}

struct Info: Codable {
    let count, pages: Int?
}

struct CharacterResult: Codable {
    let id: Int?
    let name: String?
    let image: String?
    let status: String?
    let species: String?
}
