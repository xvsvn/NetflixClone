//
//  Extensions.swift
//  NetflixClone
//
//  Created by Xasan Xasanov on 06/05/22.
//

import Foundation

extension String {
    func capitalizrFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
