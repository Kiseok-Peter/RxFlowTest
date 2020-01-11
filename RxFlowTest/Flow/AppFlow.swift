//
//  AppFlow.swift
//  RxFlowTest
//
//  Created by 박기석 on 2020/01/11.
//  Copyright © 2020 Peter. All rights reserved.
//

import RxFlow

class AppFlow: Flow {
    
    var root: Presentable {
        return self.rootViewController
    }
    
    private var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        
        switch step {
        case .search:
            return self.navigationToSearch()
        }
    }
    
    private func navigationToSearch() -> FlowContributors {
        //        let flow = SearchFlow()
        //        return .one(flowContributor: .contribute(withNextPresentable: <#T##Presentable#>, withNextStepper: <#T##Stepper#>))
        return .none
    }
}

class AppStepper: Stepper {
    
    let steps = PublishRelay<Step>()
    
    var initialStep: Step {
        return AppStep.search
    }
}
