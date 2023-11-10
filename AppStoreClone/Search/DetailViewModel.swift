//
//  DetailViewModel.swift
//  AppStoreClone
//
//  Created by 박다혜 on 11/10/23.
//

import Foundation
import RxSwift

class DetailViewModel {

    let data: BehaviorSubject<AppInfo>

    init(data: AppInfo) {
        self.data = .init(value: data)
    }

}
