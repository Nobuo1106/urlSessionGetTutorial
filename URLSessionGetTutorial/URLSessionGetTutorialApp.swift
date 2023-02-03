//
//  URLSessionGetTutorialApp.swift
//  URLSessionGetTutorial
//
//  Created by apple on 2023/02/03.
//

import SwiftUI

@main
struct URLSessionGetTutorialApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(result: Anime(anime: "one piece", character: "zoro", quote: "pirate king"))
        }
    }
}
