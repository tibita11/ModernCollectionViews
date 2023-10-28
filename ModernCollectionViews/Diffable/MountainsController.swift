//
//  MountainsController.swift
//  ModernCollectionViews
//
//  Created by 鈴木楓香 on 2023/10/28.
//

import Foundation

class MountainsController {
    struct Mountain: Hashable {
        let name: String
        let height: Int
        let identifire = UUID()
        // 自分のnameに対して該当する文字が含まれているか否か
        func contains(_ filter: String?) -> Bool {
            guard let filter else { return false }
            if filter.isEmpty { return false }
            let lowercasedFilter = filter.lowercased()
            return name.lowercased().contains(lowercasedFilter)
        }
    }
    
    func filterdMountains(with filter: String? = nil, limit: Int? = nil) -> [Mountain] {
        let filtered = mountains.filter { $0.contains(filter) }
        if let limit = limit {
            return Array(filtered.prefix(through: limit))
        } else {
            return filtered
        }
    }
    
    private lazy var mountains: [Mountain] = {
       generateMoutains()
    }()
}

extension MountainsController {
    private func generateMoutains() -> [Mountain] {
        let components = mountainsRawData.components(separatedBy: CharacterSet.newlines)
        var mountains = [Mountain]()
        for line in components {
            let mountainComponents = line.components(separatedBy: ",")
            let name = mountainComponents[0]
            let height = Int(mountainComponents[1])
            mountains.append(Mountain(name: name, height: height!))
        }
        return mountains
    }
}
