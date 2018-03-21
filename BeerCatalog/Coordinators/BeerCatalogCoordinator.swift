//
//  BeerCatalogCoordinator.swift
//  BeersApp
//
//  Created by Thiago Lioy on 18/03/18.
//  Copyright © 2018 Thiago Lioy. All rights reserved.
//

import UIKit
import UIFramework
import ModelsFramework

public final class BeerCatalogCoordinator: Coordinator {
    
    private let presenter: UINavigationController
    private var catalogController: BeerCatalogController?
    
    
    public init(presenter: UINavigationController) {
        self.presenter = presenter
    }
    
    public func start() {
        let builder = BeerCatalogPresenterBuilder(delegate: self)
        let controller = BeerCatalogController(builder: builder)
        presenter.pushViewController(controller, animated: true)
        catalogController = controller
    }
}

extension BeerCatalogCoordinator: BeerCatalogPresenterDelegate {
    func didClickMe() {
        print("didClickMe from the coordinator")
    }

    func didSelect(beer: Beer) {
        print("didSelect beer \(beer.name) from the coordinator")
    }
}