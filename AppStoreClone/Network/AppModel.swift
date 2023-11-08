//
//  AppModel.swift
//  AppStoreClone
//
//  Created by 박다혜 on 11/6/23.
//

import Foundation

struct AppModel: Codable {
    let resultCount: Int
    let results: [AppInfo]
}

//struct AppInfo: Codable {
//    let screenshotUrls: [String]
//    let trackName: String // 이름
//    let primaryGenreName: String
//    let genres: [String] // 장르
//    let trackContentRating: String // 연령제한
//    let description: String // 설명
//    let price: Double // 가격
//    let sellerName: String // 개발자 이름
//    let formattedPrice: String // 가격(무료/유료)
//    let userRatingCount: Int // 평가자 수
//    let averageUserRating: Double // 평균 평점
//    let artworkUrl512: String // 아이콘 이미지
//    let languageCodesISO2A: [String] // 언어 지원
//    let trackId: Int
//    let version: String
//    let releaseNotes: String
//
//    let currency: String
//    let kind: String
//
//}

//struct AppModel: Codable {
//    let resultCount: Int
//    let results: [AppInfo]
//}
//
struct AppInfo: Codable {
    let screenshotUrls: [String]
    let trackName: String // 이름
    let genres: [String] // 장르
    let trackContentRating: String // 연령제한
    let description: String // 설명
    let price: Double // 가격
    let sellerName: String // 개발자 이름
    let formattedPrice: String // 가격(무료/유료)
    let userRatingCount: Int // 평가자 수
    let averageUserRating: Double // 평균 평점
    let artworkUrl512: String // 아이콘 이미지
    let languageCodesISO2A: [String] // 언어 지원
//    let supportedDevices: [String]
//        let features: [String?]
//        let advisories: [String?]
//        let artistViewURL: String?
//        let kind: String?
//        let minimumOSVersion: String
//        let currentVersionReleaseDate: String?
//        let artistName: String?
//        let releaseDate: String?
//        let trackID: Int
//        let releaseNotes : String?
        let primaryGenreName: String
//        let primaryGenreID: Int
//        let currency: String?
//        let trackCensoredName: String?
//        let fileSizeBytes: String?
//        let sellerURL: String?
//        let contentAdvisoryRating: String?
//        let averageUserRatingForCurrentVersion: Double
//        let userRatingCountForCurrentVersion: Int
//        let trackViewURL: String?
//        let isVppDeviceBasedLicensingEnabled: Bool
//        let version: String?
        let wrapperType: String?
}
