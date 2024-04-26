import SwiftUI

struct ContentView: View {
    @State private var countries = ["Albania","Antarctica","Argentina","Belgium","Brazil","Canada","China","Cuba","Denmark","Egypt","England","Estonia","France","Germany","Ghana","Great Britain","Greece","Hong Kong","India","Ireland","Italy","Jamaica"]
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State var score: Int = 0
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        VStack(spacing: 30) {
            VStack {
                Text("Tap the flag of")
                    .font(.subheadline.weight(.heavy))
                    .foregroundColor(.white)
                Text(countries[correctAnswer])
                    .font(.largeTitle.weight(.semibold))
                    .foregroundColor(.white)
            }
            
            ForEach(0..<3) { number in
            Button {
                flagTapped(number)
            } label: {
                Image(countries[number])
                    .resizable()
                    .clipShape(.capsule)
                    .frame(width:300,height:150)
                    .shadow(radius: 5)
            }   
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        }
    }
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            score += 1
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}
