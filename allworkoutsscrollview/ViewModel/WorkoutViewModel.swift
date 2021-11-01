//
//  WorkoutViewModel.swift
//  allworkoutsscrollview
//
//  Created by PMStudent on 10/20/21.
//

import Foundation
import UIKit
class WorkoutViewModel: ObservableObject {
    
    @Published var workout = [WorkoutData]()
    
    let apiURL = "https://firebasestorage.googleapis.com/v0/b/pokedexam-68b7d.appspot.com/o/PokemonforTemporaryStudentUsage%20-%20Transformed%20by%20Data.Page.json?alt=media&token=f35bf605-5cec-47eb-a35b-5d97ed4fa4e0"

    init() {
        fetchWorkoutdata()
        
    }
func fetchWorkoutdata() {
    
    guard let url = URL(string: apiURL) else { return }
    let session = URLSession.shared
    let task = session.dataTask(with: url) { (data, response, error) in
        guard let cleanData = data?.parseData(removeString: "null,") else { return }

        DispatchQueue.main.async {
            do {
               let workout = try
                        JSONDecoder().decode([WorkoutData].self, from:
                                                cleanData)
                    self.workout = workout
            } catch {
                print ("error msg", error)
            }
    
}
    }
    task.resume()
}
    
    func detectBackgroundColor(forType type: String) -> UIColor{
        switch type {
        case "arms": return .systemRed
        case "legs": return .systemBlue
        case "chest": return .systemOrange
        case "triceps": return .systemYellow
        case "biceps": return .systemPurple
        case "delts": return .systemBrown
        case "lats": return .systemTeal
        case "traps": return .systemGray
        case "hamstrings": return .systemIndigo
        case "glutes": return .systemPurple

        case "abs": return .systemPurple
        case "back": return .systemPurple

        case "shoulders": return .systemPurple
     default: return .systemIndigo

            
        }
        
        
    }
    
}

extension Data {
    
    func parseData(removeString string: String) -> Data? {
        let dataAsString = String(data: self, encoding: .utf8)
            let parsedDataString = dataAsString?
            .replacingOccurrences(of: string, with: "")
        guard let data = parsedDataString?.data(using: .utf8) else {
            return nil
        }
            return data
            
        
        
    }
    
    
}
