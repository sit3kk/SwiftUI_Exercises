//
//  ContentView.swift
//  WordScramble
//
//  Created by Konrad Sitek on 08/01/2024.
//

import SwiftUI

struct ContentView: View {
    // State Variables
        @State private var enteredWords = [String]()
        @State private var currentBaseWord = ""
        @State private var userEnteredWord = ""

        @State private var alertTitle = ""
        @State private var alertMessage = ""
        @State private var isAlertVisible = false

        // Main Body of the View
        var body: some View {
            NavigationView {
                List {
                    Section {
                        TextField("Enter your word", text: $userEnteredWord)
                            .autocapitalization(.none)
                    }

                    Section {
                        ForEach(enteredWords, id: \.self) { word in
                            HStack {
                                Image(systemName: "\(word.count).circle")
                                Text(word)
                            }
                        }
                    }
                }
                .navigationTitle(currentBaseWord)
                .onSubmit(processNewWord)
                .onAppear(perform: initializeGame)
                .alert(alertTitle, isPresented: $isAlertVisible) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text(alertMessage)
                }
            }
        }

        // Processes the new word entered by the user
        func processNewWord() {
            let answer = userEnteredWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
            guard answer.count > 0 else { return }

            guard isUnique(word: answer) else {
                displayError(title: "Word used already", message: "Try something new!")
                return
            }

            guard canBeFormed(word: answer) else {
                displayError(title: "Word not possible", message: "That word can't be formed from '\(currentBaseWord)'!")
                return
            }

            guard isValidWord(word: answer) else {
                displayError(title: "Invalid Word", message: "That's not a recognized word!")
                return
            }

            withAnimation {
                enteredWords.insert(answer, at: 0)
            }

            userEnteredWord = ""
        }

        // Initializes the game with a starting word
        func initializeGame() {
            if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
                if let startWords = try? String(contentsOf: startWordsURL) {
                    let allWords = startWords.components(separatedBy: "\n")
                    currentBaseWord = allWords.randomElement() ?? "silkworm"
                    return
                }
            }

            fatalError("Could not load start.txt from bundle.")
        }

        // Checks if the word has not been used already
        func isUnique(word: String) -> Bool {
            !enteredWords.contains(word)
        }

        // Checks if the word can be formed from the base word
        func canBeFormed(word: String) -> Bool {
            var tempWord = currentBaseWord

            for letter in word {
                if let pos = tempWord.firstIndex(of: letter) {
                    tempWord.remove(at: pos)
                } else {
                    return false
                }
            }

            return true
        }

        // Checks if the word is a valid English word
        func isValidWord(word: String) -> Bool {
            let checker = UITextChecker()
            let range = NSRange(location: 0, length: word.utf16.count)
            let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")

            return misspelledRange.location == NSNotFound
        }

        // Displays an error alert to the user
        func displayError(title: String, message: String) {
            alertTitle = title
            alertMessage = message
            isAlertVisible = true
        }
    }

    // Preview Provider
    struct WordGameView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
