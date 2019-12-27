//
//  AppManager.swift
//  RxFlowTest
//
//  Created by 박기석 on 2019/12/27.
//  Copyright © 2019 Peter. All rights reserved.
//

final class AppManager {
    
    // MARK: Singleton
    private init() {}
    
    static let shared = AppManager()
    
    // MARK: Constants
    let naverId: String = "TUL3AgA_aGq0aeyPtjTV"
    let naverSecret: String = "xfmbZJVczf"
}
