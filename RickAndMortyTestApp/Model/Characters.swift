//
//  Characters.swift
//  RickAndMortyTestApp
//
//  Created by Фаддей Гусаров on 24.04.2022.
//

import Foundation

struct RickAndMorty: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let pages: Int
    let next: String?
    let prev: String?
}

struct Character: Codable {
    let id: Int
    let name: String
    let status: String
    let species:  String
    let gender: String
    let episode: [String]
    let url: String
    let image: String
    let location: Location
}

struct Location: Codable {
    let name: String
}
