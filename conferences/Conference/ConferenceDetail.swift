//
//  ConferenceDetail.swift
//  conferences
//
//  Created by Glenn Gijsberts on 21/08/2020.
//  Copyright © 2020 Glenn Gijsberts. All rights reserved.
//

import SwiftUI

struct ConferenceDetail: View {
    var conference: Conference
    
    var body: some View {
        VStack {
            // Hacky SVG's
            SVGKFastImageViewSUI(url: .constant(URL(string: conference.organizer!.imageUrl!)!), size: .constant(CGSize(width: 100, height: 100))).frame(width: 200, height: 50)
            Text(conference.name)
            Text(conference.slogan)
            Text("Organized by \(conference.organizer!.name)")
        }
    }
}
