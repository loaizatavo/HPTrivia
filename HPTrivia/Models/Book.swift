//
//  Book.swift
//  HPTrivia
//
//  Created by Gustavo Loaiza Robles on 22/4/26.
//
struct Book: Identifiable {
    let id: Int
    let image: String
    let questions: [Question]
    var status: BookStatus
    
    enum BookStatus {
        case active, inactive, locked
    }
}
