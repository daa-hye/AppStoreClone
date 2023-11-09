//
//  BaseViewModel.swift
//  AppStoreClone
//
//  Created by 박다혜 on 11/9/23.
//

import Foundation

protocol BaseViewModel {

    associatedtype Input
    associatedtype Output

    func transform(_ input: Input) -> Output

}
