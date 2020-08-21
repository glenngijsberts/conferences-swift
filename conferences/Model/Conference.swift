//
//  Conference.swift
//  conferences
//
//  Created by Glenn Gijsberts on 21/08/2020.
//  Copyright © 2020 Glenn Gijsberts. All rights reserved.
//

import SwiftUI

struct ConferenceOrganizer: Identifiable {
    var id: UUID
    var name: String
    var about: String
    var imageUrl: String?
}

struct Conference: Identifiable {
    var id: UUID
    var name: String
    var organizer: ConferenceOrganizer?
}
