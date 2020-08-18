//
//  DetailPresenter.swift
//  Test
//
//  Created by Tana Chaijamorn on 17/8/2563 BE.
//  Copyright (c) 2563 BE Tana Chaijamorn. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol DetailPresentationLogic {
  func presentSetMap(response: Detail.SetMap.Response)
}

class DetailPresenter: DetailPresentationLogic {
  weak var viewController: DetailDisplayLogic?
  
  // MARK: Do SetMap
  
  func presentSetMap(response: Detail.SetMap.Response) {
    viewController?.displaySetMap(viewModel: Detail.SetMap.ViewModel(name: response.object.name, lat: response.object.coord.lat, lon: response.object.coord.lon))
  }
}
