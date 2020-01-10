//
//  SearchViewController.swift
//  RxFlowTest
//
//  Created by 박기석 on 2019/12/27.
//  Copyright © 2019 Peter. All rights reserved.
//

import AsyncDisplayKit

final class SearchViewController: ASViewController<SearchTableNode> {
    
    let viewModel = SearchViewModel()
    let disposeBag = DisposeBag()
    
    init() {
        super.init(node: SearchTableNode())
        
        node.tableNode.dataSource = self
        
        bindUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func bindUI() {
        node.searchBar?.rx.text.orEmpty
            .bind(to: viewModel.searchText)
            .disposed(by: self.disposeBag)
        
        viewModel.items
            .bind(onNext: { [weak self] _ in
                self?.node.tableNode.reloadData()
            })
            .disposed(by: self.disposeBag)
    }
}

extension SearchViewController: ASTableDataSource {
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return viewModel.items.value.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            let viewModel = self.viewModel.items.value[indexPath.row]
            return MovieCellNode(viewModel: viewModel)
        }
    }
}
