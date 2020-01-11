//
//  DetailViewController.swift
//  RxFlowTest
//
//  Created by 박기석 on 2020/01/11.
//  Copyright © 2020 Peter. All rights reserved.
//

import AsyncDisplayKit

class DetailViewController: ASViewController<DetailNode> {
    
    init() {
        super.init(node: DetailNode.init())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
