//
//  WorkoutList.swift
//  allworkoutsscrollview
//
//  Created by PMStudent on 10/19/21.
//

import SwiftUI

struct WorkoutList: View {
    
    private let gridItems = [GridItem(.flexible()),
                             GridItem(.flexible())]
    @ObservedObject var viewModel = WorkoutViewModel()
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems, spacing: 20) {
                    ForEach(viewModel.workout) { workout in
                        NavigationLink(destination: WorkoutDetails(workoutData: workout, workoutViewModel: viewModel) ) {
                        WorkoutCard(workoutData: workout, workoutViewModel: viewModel)
                    }
                    
                }
                }
            }
            .navigationTitle("Workouts")
        }
    }
}

