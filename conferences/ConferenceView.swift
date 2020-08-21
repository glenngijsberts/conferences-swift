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

struct ConferenceView: View {
    @ObservedObject private var conferencesData: ConferencesData = ConferencesData()
    
    init() {
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }
        
        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List(conferencesData.conferences) { conference in
                NavigationLink(destination: ConferenceDetail(conference: conference)) {
                    ConferenceRow(conference: conference)
                }
                
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
                    let name = resultMap["name"] as! String
                    let slogan = resultMap["slogan"] as! String
                    
                    let organizer = resultMap["organizer"] as! Dictionary<String, Optional<Any>>
                    let organizerName = organizer["name"] as! String
                    let organizerAbout = organizer["about"] as! String
                    
                    let organizerImage = organizer["image"] as! Dictionary<String, Optional<Any>>
                    let organizerImageUrl = organizerImage["url"] as! String
                    
                    let conferenceOrganizer: ConferenceOrganizer = ConferenceOrganizer(id: UUID(), name: organizerName, about: organizerAbout, imageUrl: organizerImageUrl)
                    
                    
                    self.conferences.append(.init(id: UUID(), name: name, slogan: slogan, organizer: conferenceOrganizer))
                }
                
            case .failure(let error):
                print("Error: \(error)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ConferenceView()
    }
}
