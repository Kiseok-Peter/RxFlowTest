//
//  AppServiceType.swift
//  RxFlowTest
//
//  Created by 박기석 on 2019/12/27.
//  Copyright © 2019 Peter. All rights reserved.
//

import Moya

protocol AppServieType: class {
    func request(_ api: AppAPI) -> Observable<String>
}
