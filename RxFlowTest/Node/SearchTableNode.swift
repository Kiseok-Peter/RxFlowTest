//
//  SearchTableNode.swift
//  RxFlowTest
//
//  Created by 박기석 on 2020/01/03.
//  Copyright © 2020 Peter. All rights reserved.
//

import AsyncDisplayKit

class SearchTableNode: ASDisplayNode {
        
    // MARK: UI Properties
    
    let searchNode: SearchNode
    let tableNode: ASTableNode = {
        let node = ASTableNode(style: .plain)
        return node
    }()
    
    var searchBar: UISearchBar? {
        return self.searchNode.view as? UISearchBar
    }
    
    // MARK: Node Life Cycle
    
    override init() {
        searchNode = SearchNode()
        
        super.init()
        
        self.automaticallyManagesSubnodes = true
        self.automaticallyRelayoutOnSafeAreaChanges = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        searchNode.style.height = ASDimension(unit: .points, value: 44)
        
        tableNode.style.flexGrow = 1.0
        
        let containerLayout = ASStackLayoutSpec(direction: .vertical,
                                                spacing: 0,
                                                justifyContent: .start,
                                                alignItems: .stretch,
                                                children: [searchNode, tableNode])
        
        var containerInsets: UIEdgeInsets = self.safeAreaInsets
        containerInsets.left += 15
        containerInsets.right += 15
        containerInsets.top = containerInsets.bottom
        
        return ASInsetLayoutSpec(insets: containerInsets, child: containerLayout)
    }}
