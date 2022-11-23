//
//  HeroStats.swift
//  DOTAApi2
//
//  Created by Default on 11/23/22.
//

import Foundation

public struct HeroStats: Decodable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
}
