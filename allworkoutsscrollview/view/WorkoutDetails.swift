import SwiftUI
import Kingfisher
struct WorkoutDetails: View {
    
    let workoutData: WorkoutData
    let workoutViewModel: WorkoutViewModel
    let backgroundColor: Color
    
    init(workoutData: WorkoutData, workoutViewModel: WorkoutViewModel) {
        
        self.workoutData = workoutData
        self.workoutViewModel = workoutViewModel
        self.backgroundColor = Color(workoutViewModel.detectBackgroundColor(forType: workoutData.type))
    }
    
    var body: some View {
        
        ZStack {
            backgroundColor.edgesIgnoringSafeArea(.all)
            
            VStack {
                
                KFImage(URL(string: workoutData.imageUrl))
                    .resizable()
                    .offset(y: 25)
                    .frame(width: 150, height: 150)
                    .zIndex(1)
                
                VStack(alignment: .leading) {
                    
                    VStack(spacing: 15) {
                        
                        Text("#" + String(workoutData.id))
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color.gray)
                            .padding(.top, 20)
                        
                        Text(workoutData.name.capitalized)
                            .font(.largeTitle)
                        
                        Text(workoutData.type.uppercased())
                            .font(.title2).bold()
                            .frame(width: 150, height: 40)
                            .background(backgroundColor)
                            .cornerRadius(20)
                            .shadow(color: backgroundColor, radius: 5)
                        
                        HStack {
                            
                            VStack {
                                
                                HStack(alignment: .center, spacing: 5) {
                                    
                                    Text(String(workoutData.weight))
                                        .font(.title)
                                    
                                    Text("KG")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                }
                                
                                Text("Weight")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.gray)
                            }
                            
                            VStack {
                                
                                HStack(alignment: .center, spacing: 5) {
                                    
                                    Text(String(workoutData.height))
                                        .font(.title)
                                    
                                    Text("METER")
                                        .font(.subheadline)
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                }
                                
                                Text("Height")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .foregroundColor(Color.gray)
                            }
                        }
                        
                        .padding(.vertical, 15)
                        .frame(maxWidth: .infinity)
                        
                        Text(workoutData.description)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(.gray))
                            .padding(.horizontal, 15)
                        
                        VStack {
                            
                            HStack {
                                
                                Text("STATS")
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                    .padding(.top, 10)
                                    .padding(.horizontal, 20)
                                
                                VStack(spacing: 5){
                                    
                                    ForEach(0..<2) { i in if( i == 0 ) {
                                        
                                        StatList(statusName: "atk", value: workoutData.attack/100, color: backgroundColor) } else {
                                            StatList(statusName: "def", value: workoutData.defense/100, color: backgroundColor)
                                            
                                        }
                                        
                                    }
                                                                
                                                                
                                                                
                                    }
                                    
                                }
                                
                                
                            }
                        }
                    }

                    Spacer()

            }
                
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.white)
                .cornerRadius(50.0)
                .edgesIgnoringSafeArea(.bottom)


            }

        }

    }



struct StatList: View{
    @State var statusName: String
    @State var value: Float
    @State var color: Color
    var body: some View {
        HStack {
            Text(statusName.uppercased())
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(Color.gray)
                .padding(.horizontal)
            Text(String(Int(value*100)))
            Meterbar(value: $value, color: $color).frame(height:10)
                .padding(.horizontal, 10)
            
            
            
            
        }
    }
    
    
}

struct Meterbar: View{
    @Binding var value: Float
    @Binding var color: Color
    var body: some View {
        
        
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Rectangle().frame(width: geometry.size.width, height: geometry.size.height)
                    .opacity(0.3)
                    .foregroundColor(Color(.systemGray))
                Rectangle().frame(width: min(CGFloat(self.value)*geometry.size.width, geometry.size.width),
                                  height: geometry.size.height)
                
                    .foregroundColor(color)
                    .animation(.linear)
                
                
                
                
                
            }
            
            
            
        }
        
        
    }

    
    
    
    
    
}
