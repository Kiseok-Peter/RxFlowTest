//
//  SearchViewModel.swift
//  RxFlowTest
//
//  Created by 박기석 on 2020/01/10.
//  Copyright © 2020 Peter. All rights reserved.
//

class SearchViewModel {
    
    let searchText = PublishRelay<String>()
    
    let items: BehaviorRelay<[MovieViewModel]> = BehaviorRelay(value: [])
    
    let disposeBag = DisposeBag()
    
    init() {
        searchText.distinctUntilChanged()
            .flatMap { AppService.shared.request(AppAPI.search($0)) }
            .map { MovieModel(JSONString: $0) }
            .filterNil()
            .map { $0.items.map { MovieViewModel(item: $0) }}
            .subscribe(onNext: { [weak self] in
                self?.items.accept($0)
            })
            .disposed(by: self.disposeBag)
    }
}
