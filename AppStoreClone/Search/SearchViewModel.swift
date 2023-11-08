//
//  SearchViewModel.swift
//  AppStoreClone
//
//  Created by 박다혜 on 11/8/23.
//

import Foundation
import RxSwift

class SearchViewModel {

    let disposeBag = DisposeBag()

    struct Input {
        var searchButtonTapped: Observable<Void>
        var searchQuery: Observable<String>
    }

    struct Output {
        var items: BehaviorSubject<[AppInfo]>
    }

    func transform(_ input: Input) -> Output {

        var data: [AppInfo] = []
        let items = BehaviorSubject(value: data)

        input.searchButtonTapped
            .throttle(.seconds(1), scheduler: MainScheduler.instance)
            .withLatestFrom(input.searchQuery) { _, text in
                return text
            }
            .flatMap {
                APIManager.request($0)
            }
            .bind(with: self) { owner, result in
                print(result)
                data.append(contentsOf: result.results)
                items.onNext(data)
            }
            .disposed(by: disposeBag)

        return Output(items: items)

    }

}
