//
//  MovieCellNode.swift
//  RxFlowTest
//
//  Created by 박기석 on 2020/01/03.
//  Copyright © 2020 Peter. All rights reserved.
//

import AsyncDisplayKit

class MovieCellNode: ASCellNode {
    
    // MARK: UI Properties
    
    let imageNode: ASNetworkImageNode = {
        let node = ASNetworkImageNode()
        node.style.preferredSize = CGSize(width: 100.0, height: 100.0)
        node.defaultImage = UIImage(named: "Image")
        node.borderColor = UIColor.gray.cgColor
        node.borderWidth = 1
        node.cornerRadius = 15
//        node.contentMode = .scaleAspectFill
        node.clipsToBounds = true
        return node
    }()
    
    let titleNode: ASTextNode = {
        let node = ASTextNode()
        node.maximumNumberOfLines = 0
        return node
    }()
    
    let subtitleNode: ASTextNode = {
        let node = ASTextNode()
        node.maximumNumberOfLines = 0
        return node
    }()
    
    let userRatingNode: ASTextNode = {
        let node = ASTextNode()
        node.maximumNumberOfLines = 0
        return node
    }()
    
    let directorNode: ASTextNode = {
        let node = ASTextNode()
        node.maximumNumberOfLines = 0
        return node
    }()
    
    let actorNode: ASTextNode = {
        let node = ASTextNode()
        node.maximumNumberOfLines = 0
        return node
    }()
}

extension MovieCellNode {
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let imageLayout = ASRatioLayoutSpec(ratio: 1.0, child: imageNode)
        let contentLayout = contentLayoutSpec()
        
        contentLayout.style.flexShrink = 1.0
        contentLayout.style.flexGrow = 1.0
        
        imageLayout.style.flexShrink = 1.0
        imageLayout.style.flexGrow = 0.0
//        imageLayout.style.flexBasis = ASDimension(unit: .fraction, value: 0.3)
//        cotentsLayout.style.flexBasis = ASDimension(unit: .fraction, value: 0.7)
        
        let containerLayout = ASStackLayoutSpec(direction: .horizontal,
                                                spacing: 10.0,
                                                justifyContent: .start,
                                                alignItems: .stretch,
                                                children: [imageLayout, contentLayout])
        
        var containerInsets: UIEdgeInsets = .zero
        containerInsets.left = 15.0
        containerInsets.right = 15.0
        containerInsets.top = 15.0
        containerInsets.bottom = 15.0
        
        return ASInsetLayoutSpec(insets: containerInsets, child: containerLayout)
    }
    
    private func contentLayoutSpec() -> ASLayoutSpec {
        let elements = [titleNode, subtitleNode, userRatingNode, directorNode, actorNode]
        
        return ASStackLayoutSpec(direction: .vertical,
                                 spacing: 5.0,
                                 justifyContent: .start,
                                 alignItems: .stretch,
                                 children: elements)
    }
}
