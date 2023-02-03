//
//  ContentView.swift
//  URLSessionGetTutorial
//
//  Created by apple on 2023/02/03.
//

import SwiftUI
import Combine

struct Anime: Codable {
    var anime: String
    var character: String
    var quote: String
}

struct ContentView: View {
    @State var result: Anime
    var body: some View {
        VStack {
            Text(result.anime)
            Text(result.character)
            Text(result.quote)
        }
        .task {
            await loadData()
        }
        .padding()
    }
    
    func loadData () async {
        guard let url = URL(string: "https://animechan.vercel.app/api/random?anime&character") else {
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decoded = try?JSONDecoder().decode(Anime.self, from: data) {
                result = decoded
            }
        } catch {
            print("error")
        }
                
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(result: Anime(anime: "one piece ", character: "zorro", quote: "hey"))
    }
}
