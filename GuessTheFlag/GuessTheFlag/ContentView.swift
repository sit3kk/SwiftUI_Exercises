//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Student1 on 05/12/2023.
//



import SwiftUI

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)

    @State private var userScore = 0
    @State private var questionCount = 0
    @State private var correctCount = 0

    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var alertMessage = ""
    @State private var finalMessage = ""

    var body: some View {
        ZStack {
            // Background and other UI elements

            VStack(spacing: 30) {
                VStack {
                    Text("Select the flag of")
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.black)
                }

                ForEach(0..<3, id: \.self) { number in
                    Button(action: {
                        self.flagTapped(number)
                    }) {
                        Image(self.countries[number])
                            .renderingMode(.original)
                            .resizable()
                            .scaledToFit()
                            .clipShape(Capsule())
                            .shadow(radius: 5)
                    }
                }

                Text("Score: \(userScore)")
                    .font(.title)

                Spacer()
            }
        }
        .alert(isPresented: $showingScore) {
            if questionCount < 8 {
                return Alert(title: Text(scoreTitle), message: Text(alertMessage), dismissButton: .default(Text("Continue")) {
                    self.askQuestion()
                })
            } else {
                return Alert(title: Text("Game Over"), message: Text(finalMessage), dismissButton: .default(Text("Restart Game")) {
                    self.restartGame()
                })
            }
        }
    }

    func flagTapped(_ number: Int) {
        questionCount += 1
        if number == correctAnswer {
            userScore += 1
            correctCount += 1
            scoreTitle = "Correct"
            alertMessage = "Your score is \(userScore)"
        } else {
            scoreTitle = "Wrong"
            alertMessage = "Wrong! That’s the flag of \(countries[number]). Your score is \(userScore)"
        }

        if questionCount == 8 {
            finalMessage = "You got \(correctCount) out of 8 correct. Your final score is \(userScore)."
        }

        showingScore = true
    }

    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }

    func restartGame() {
        userScore = 0
        questionCount = 0
        correctCount = 0
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
