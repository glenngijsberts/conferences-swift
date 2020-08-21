//
//  ConferenceRow.swift
//  conferences
//
//  Created by Glenn Gijsberts on 21/08/2020.
//  Copyright © 2020 Glenn Gijsberts. All rights reserved.
//

import SwiftUI

struct ConferenceRow: View {
        var conference: Conference
    
    var body: some View {
        VStack(alignment: .leading) {            
            Text(conference.name)
                .font(.headline)
                .padding(.bottom, 4)
            
            Text("Organized by \(conference.organizer!.name)")
                .font(.subheadline)
                .foregroundColor(Color.gray)
        }
        .padding(.top, 8)
        .padding(.bottom, 8)
    }
}
