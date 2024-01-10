//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Konrad Sitek on 10/01/2024.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
