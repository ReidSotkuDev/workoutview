//
//  WorkoutData.swift
//  allworkoutsscrollview
//
//  Created by PMStudent on 10/20/21.
//

import Foundation
struct WorkoutData: Decodable, Identifiable {
    
    let id: Int
    let name: String
    let imageUrl: String
    let type: String
    let weight: Float
    let height: Float
    let description: String
    let attack: Float
    let defense: Float

    
}

//let MockData: [WorkoutData] = [
//    .init(id: 0, name: "Dumbell Curl", imageUrl: "1", type: "arms", difficulty: 15, rating: 8, description: "This is a great arm workout", attack: 2, defense: -3),
//    .init(id: 0, name: "Bicep Curl", imageUrl: "2", type: "arms", difficulty: 15, rating: 8, description: "This is a great arm workout", attack: 2, defense: -3),
//    .init(id: 0, name: "Dumbell press", imageURL: "3", type: "legs", difficulty: 15, rating: 8, description: "This is a great arm workout", attack: 2, defense: -3),
//
//]
