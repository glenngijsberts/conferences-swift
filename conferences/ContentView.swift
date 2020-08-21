//
//  ContentView.swift
//  conferences
//
//  Created by Glenn Gijsberts on 21/08/2020.
//  Copyright © 2020 Glenn Gijsberts. All rights reserved.
//

import SwiftUI

extension String: Identifiable {
    public var id: String { self }
}

struct ContentView: View {
    @ObservedObject private var conferencesData: ConferencesData = ConferencesData()
    
    var body: some View {
        NavigationView {
            List(conferencesData.conferences) { conference in
                Text(conference.name)
            }.navigationBarTitle(Text("Conferences"))
        }
    }
}

class ConferencesData: ObservableObject {
    @Published var conferences: [Conference]
    
    init() {
        print("loading data..")
        self.conferences = [Conference]()
        loadConferencesData()
    }
    
    func loadConferencesData() {
        Network.shared.apollo.fetch(query: ConferencesQuery()) { result in
            switch result {
            case .success(let graphQLResult):
                                     
                for conference in graphQLResult.data!.conferences {
                    let resultMap = conference.resultMap
                    let name: String = resultMap["name"] as! String
                    
self.conferences.append(.init(id: UUID(), name: name))
                }
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
