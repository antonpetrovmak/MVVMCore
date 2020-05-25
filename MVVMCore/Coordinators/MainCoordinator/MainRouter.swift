//
//  MainRouter.swift
//  MVVMCore
//
//  Created by Serhii Petrishenko on 22.05.2020.
//  Copyright © 2020 APM. All rights reserved.
//

import UIKit

class MainRouter: BaseRouter {
  
  public enum Context {
    case counter
    case simpleMovies
    case fullMovies
  }
  
  weak var coordinator: MainCoordinatorProtocol?
  private let factory: MainFactoryProtocol
  
  init(factory: MainFactoryProtocol) {
    self.factory = factory
  }
  
  override func route(with window: UIWindow) {
    window.rootViewController = factory.makeMainController(with: self)
    window.makeKeyAndVisible()
    super.route(with: window)
  }
  
  override func route(with context: Any?, animated: Bool , completion: ((Bool) -> Void)?) {
    guard let context = context as? Context else { return }

    switch context {
    case .counter:
      coordinator?.showCounter()
    case .simpleMovies:
      coordinator?.showMovies(with: .setupSimple)
    case .fullMovies:
      coordinator?.showMovies(with: .setupFull)
    }
  }
}