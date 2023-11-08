//
//  SearchCollectionViewCell.swift
//  AppStoreClone
//
//  Created by 박다혜 on 11/6/23.
//

import UIKit
import RxSwift

final class SearchCollectionViewCell: UICollectionViewCell {

    var disposeBag = DisposeBag()

    static let identifier = "SearchViewCollectionViewCell"

    let baseStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        return view
    }()

    let titleStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        return view
    }()

    let titleView = {
        let view = UIView()
        return view
    }()

    let iconImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 8
        return view
    }()

    let titleLabel = {
        let label = UILabel()
        return label
    }()

    let subtitleLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
        return label
    }()

    let downloadButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        return button
    }()

    let subStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        return view
    }()

    let ratingLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
        return label
    }()

    let sellerLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
        return label
    }()

    let genreLabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = .darkGray
        return label
    }()

    let screenshotStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 5
        return view
    }()

    let firstScreenshotImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        return view
    }()

    let secondScreenshotImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        return view
    }()

    let thirdScreenshotImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        configureHierarchy()
        setLayout()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        disposeBag = DisposeBag()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureHierarchy() {
        contentView.addSubview(baseStackView)
        baseStackView.addArrangedSubview(titleView)
        baseStackView.addArrangedSubview(subStackView)
        baseStackView.addArrangedSubview(screenshotStackView)
        titleView.addSubview(iconImageView)
        titleView.addSubview(titleStackView)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(subtitleLabel)
        titleView.addSubview(downloadButton)
        subStackView.addArrangedSubview(ratingLabel)
        subStackView.addArrangedSubview(sellerLabel)
        subStackView.addArrangedSubview(genreLabel)
        screenshotStackView.addArrangedSubview(firstScreenshotImageView)
        screenshotStackView.addArrangedSubview(secondScreenshotImageView)
        screenshotStackView.addArrangedSubview(thirdScreenshotImageView)

    }

    private func setLayout() {

        baseStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        titleView.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.2)
        }

        iconImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.top.bottom.equalToSuperview()
            $0.height.equalToSuperview()
            $0.width.equalTo(iconImageView.snp.height)
        }

        downloadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalToSuperview().multipliedBy(0.15)
            $0.height.equalToSuperview().multipliedBy(0.5)
        }

        titleStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(iconImageView.snp.trailing).offset(10)
            $0.trailing.equalTo(downloadButton.snp.leading).offset(10)
        }

        subStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
        }

        screenshotStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.7)
        }
        
    }

}
