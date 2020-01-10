//
//  MovieViewModel.swift
//  RxFlowTest
//
//  Created by 박기석 on 2020/01/10.
//  Copyright © 2020 Peter. All rights reserved.
//

class MovieViewModel {
    
    let image = BehaviorRelay<URL?>(value: nil)
    let title = BehaviorRelay<String>(value: "")
    
    init(item: MovieItem) {
        image.accept(URL(string: item.image))
        title.accept(item.title)
    }
}
