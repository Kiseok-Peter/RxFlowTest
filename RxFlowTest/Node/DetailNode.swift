//
//  DetailNode.swift
//  RxFlowTest
//
//  Created by 박기석 on 2020/01/11.
//  Copyright © 2020 Peter. All rights reserved.
//

import AsyncDisplayKit

class DetailNode: ASDisplayNode {
    
    // MARK: UI Properties
    let imageNode: ASNetworkImageNode = {
        let node = ASNetworkImageNode()
        node.defaultImage = UIImage(named: "Image")
        node.borderColor = UIColor.gray.cgColor
        node.borderWidth = 1
        node.cornerRadius = 15
        node.clipsToBounds = true
        return node
    }()
    
    let titleNode: ASTextNode = {
        let node = ASTextNode()
        return node
    }()
    
    let subtitleNode: ASTextNode = {
        let node = ASTextNode()
        return node
    }()
    
    let userRatingNode: ASTextNode = {
        let node = ASTextNode()
        return node
    }()
    
    let directorNode: ASTextNode = {
        let node = ASTextNode()
        return node
    }()
    
    let actorNode: ASTextNode = {
        let node = ASTextNode()
        return node
    }()
    
    let centerParagraphStyle: NSMutableParagraphStyle = {
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        return style
    }()
    
    // MARK: Node Life Cycle
    
    override init() {
        super.init()
        
        self.automaticallyManagesSubnodes = true
        self.automaticallyRelayoutOnSafeAreaChanges = true
        
        self.titleNode.attributedText = NSAttributedString(string: "제목",
                                                           attributes: [.font: UIFont.boldSystemFont(ofSize: 20),
                                                                        .paragraphStyle: centerParagraphStyle])
        self.subtitleNode.attributedText = NSAttributedString(string: "부제목",
                                                              attributes: [.font: UIFont.systemFont(ofSize: 16),
                                                                           .foregroundColor: UIColor.gray,
                                                                           .paragraphStyle: centerParagraphStyle])
        self.userRatingNode.attributedText = NSAttributedString(string: "0.0",
                                                                attributes: [.font: UIFont.boldSystemFont(ofSize: 14),
                                                                             .foregroundColor: UIColor.gray,
                                                                             .paragraphStyle: centerParagraphStyle])
        self.directorNode.attributedText = NSAttributedString(string: "감독",
                                                              attributes: [.font: UIFont.systemFont(ofSize: 14),
                                                                           .foregroundColor: UIColor.gray])
        self.actorNode.attributedText = NSAttributedString(string: "배우",
                                                           attributes: [.font: UIFont.systemFont(ofSize: 14),
                                                                        .foregroundColor: UIColor.gray])
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let elements: [ASLayoutElement] = [imageNode, titleNode, subtitleNode, userRatingNode, contentsLayoutSpec()]
        
        let containerLayout = ASStackLayoutSpec(direction: .vertical,
                                                spacing: 4.0,
                                                justifyContent: .center,
                                                alignItems: .stretch,
                                                children: elements)
        
        var containerInsets: UIEdgeInsets = self.safeAreaInsets
        containerInsets.right = 16.0
        containerInsets.left = 16.0
        containerInsets.top = containerInsets.bottom
        
        return ASInsetLayoutSpec(insets: containerInsets, child: containerLayout)
    }
    
    private func contentsLayoutSpec() -> ASLayoutSpec {
        let elements = [directorNode, actorNode]
        
        let containerLayout = ASStackLayoutSpec(direction: .vertical,
                                                spacing: 2.0,
                                                justifyContent: .start,
                                                alignItems: .stretch,
                                                children: elements)
        
        var containerInsets: UIEdgeInsets = .zero
        containerInsets.right = 20.0
        containerInsets.left = 20.0
        
        return ASInsetLayoutSpec(insets: containerInsets, child: containerLayout)
    }
}
