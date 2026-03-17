//
//  Question.swift
//  HPTrivia
//
//  Created by Gustavo Loaiza Robles on 17/3/26.
//

struct Question: Decodable {
    let id: Int
    let question: String
    let answer: String
    let wrong: [String]
    let book: Int
    let hint: String
}
