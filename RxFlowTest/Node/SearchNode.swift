//
//  SearchNode.swift
//  RxFlowTest
//
//  Created by 박기석 on 2020/01/03.
//  Copyright © 2020 Peter. All rights reserved.
//

import AsyncDisplayKit

class SearchNode: ASDisplayNode {
    
    // MARK: UI Properties
    
    var searchBar: UISearchBar? {
        return self.view as? UISearchBar
    }
    
    // MARK: Node Life Cycle
    
    override init() {
        super.init()
        setViewBlock {
            let view = UISearchBar()
            return view
        }
    }
}
