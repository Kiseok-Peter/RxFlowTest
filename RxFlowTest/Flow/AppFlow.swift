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
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        return viewController
    }()
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        
        switch step {
        case .search:
            return self.navigationToSearchScreen()
        case .detail(let viewModel):
            return self.navigationToDetailScreen(viewModel: viewModel)
        default:
            return .none
        }
    }
    
//    private func navigationToSearch() -> FlowContributors {
//        let searchFlow = SearchFlow()
//
//        Flows.whenReady(flow1: searchFlow) { [unowned self] root in
//            self.rootViewController.pushViewController(root, animated: false)
//        }
//
//        return .one(flowContributor: .contribute(withNextPresentable: searchFlow,
//                                                 withNextStepper: OneStepper(withSingleStep: AppStep.search)))
//    }
    
    private func navigationToSearchScreen() -> FlowContributors {
        let viewController = SearchViewController.init()
        viewController.title = "Search"
        
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .one(flowContributor: FlowContributor.contribute(withNextPresentable: viewController,
                                                                withNextStepper: viewController.viewModel))
    }
    
    private func navigationToDetailScreen(viewModel: MovieViewModel) -> FlowContributors {
        let viewController = DetailViewController.init(viewModel: viewModel)
        
        self.rootViewController.pushViewController(viewController, animated: true)
        
        return .none
    }
}

class AppStepper: Stepper {
    
    let steps = PublishRelay<Step>()
    
    var initialStep: Step {
        return AppStep.search
    }
}
