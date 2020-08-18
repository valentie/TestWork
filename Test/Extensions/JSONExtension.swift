//
//  JSONExtension.swift
//  Test
//
//  Created by Tana Chaijamorn on 18/8/2563 BE.
//  Copyright © 2563 BE Tana Chaijamorn. All rights reserved.
//

import Foundation

struct JSONExtension {
   
  static let shared = JSONExtension()
  
  func loadJson<T: Decodable>(_ type: T.Type, filename fileName: String) -> T? {
      
      if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
          do {
              let data = try Data(contentsOf: url)
              let decoder = JSONDecoder()
              let jsonData = try decoder.decode(type.self, from: data)
              return jsonData
          } catch {
              print("error:\(error)")
          }
      }
      return nil
  }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
