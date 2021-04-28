

import Foundation
import Swinject
import SwinjectStoryboard
import SwinjectAutoregistration

extension SwinjectStoryboard {
   @objc class func setup() {
     defaultContainer.autoregister(Networking.self, initializer: HTTPNetworking.init)
     defaultContainer.autoregister(PriceFetcher.self, initializer: BitcoinPriceFetcher.init)
     defaultContainer.storyboardInitCompleted(BitcoinViewController.self) { resolver, controller in
      controller.fetcher = resolver ~> PriceFetcher.self
    }
   }
}
