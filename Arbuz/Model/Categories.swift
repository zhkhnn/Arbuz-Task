//
//  Categories.swift
//  Arbuz
//
//  Created by Aruzhan Zhakhan on 21.05.2023.
//

import Foundation
import SwiftUI
struct Category: Identifiable {
  var id = UUID()
  var name: String
  var products: [Product]
}


