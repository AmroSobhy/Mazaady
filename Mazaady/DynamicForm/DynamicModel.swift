//
//  DynamicModel.swift
//  Mazaady
//
//  Created by mio on 25/03/2025.
//

import Foundation

// 1. Define structs to match the JSON structure.  Use nested structs for nested JSON objects.
struct CategoryImage: Decodable {
    let medium: String?
    let thumbnail: String?
    let id: Int?
    let custom_properties: String?
    let place_holder: Placeholder?
}

struct Placeholder: Decodable {
    let small_no_bg: String?
    let medium_bg: String?
    let small_bg: String?
}

struct Category: Decodable {
    let id: Int
    let name: String
    let slug: String
    let parent_id: Int?
    let properties_count: Int
    let image: CategoryImage?
    let seo_tags: [String]? // Assuming seo_tags is an array of strings, or change to match the actual type
    let is_other: Bool
}

struct DataResponse: Decodable {
    let categories: [Category]
}

struct MessageResponse: Decodable {
    let txt: [String?] // message.txt can contain null
}

struct ResponseData: Decodable {
    let message: MessageResponse
    let data: DataResponse
}

struct Option: Decodable {
    let id: Int
    let name: String
    let has_child: Bool
}

struct Property: Decodable {
    let id: Int
    let name: String
    let type: String
    let parent_id: Int?
    let options: [Option]
}


struct ResponseDataProperty: Decodable {
    let message: MessageResponse
    let data: [Property]
}
