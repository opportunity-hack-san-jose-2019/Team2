//
//  CurrentUser.swift
//  OppHack19T2
//
//  Created by Pierce Tu on 11/2/19.
//  Copyright © 2019 Pierce Tu. All rights reserved.
//

import Foundation
import FirebaseAuth

class CurrentUser: Codable {
    let email: String
    var firstName: String
    var lastName: String
    var gender: Gender
    var dob: DateOfBirth?
    var state: State
    
    var id: String {
        return Auth.auth().currentUser?.uid ?? ""
    }
    
    init(email: String, firstName: String, lastName: String, gender: Gender, dob: DateOfBirth?, state: State) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.dob = dob
        self.state = state
    }
}

extension CurrentUser {
    enum Gender: String, Codable {
        case male
        case female
        case other
        case unknown
    }
    
    struct DateOfBirth: Codable {
        let day: String
        let month: String
        let year: String
    }
    
    enum State: String, Codable {
        case mentor
        case mentee
    }
}
