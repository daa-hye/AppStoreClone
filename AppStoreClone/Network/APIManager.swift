//
//  APIManager.swift
//  AppStoreClone
//
//  Created by 박다혜 on 11/6/23.
//

import Foundation
import RxSwift

enum APIError: Error {
    case invalidURL
    case unknown
    case statusError
}

final class APIManager {

    static func request(_ query: String) -> Observable<AppModel> {

        return Observable<AppModel>.create { value in
            guard let encodedString = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return Disposables.create() }
            let urlString = "https://itunes.apple.com/search?term=\(encodedString)&country=KR&media=software&lang=ko_KR&limit=10"

            guard let url = URL(string: urlString) else {
                value.onError(APIError.invalidURL)
                return Disposables.create()
            }

            URLSession.shared.dataTask(with: url) { data, response, error in

                if let _ = error {
                    value.onError(APIError.unknown)
                    return
                }

                guard let response = response as? HTTPURLResponse,(200...299).contains(response.statusCode) else {
                    value.onError(APIError.unknown)
                    return
                }

                if let data = data, let appData = try? JSONDecoder().decode(AppModel.self, from: data) {
                    value.onNext(appData)
                }
            }.resume()

            return Disposables.create()
        }

    }

}
