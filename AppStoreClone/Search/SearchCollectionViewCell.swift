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
        button.layer.cornerRadius = 16
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
        return label
    }()

    let sellerLavel = {
        let label = UILabel()
        return label
    }()

    let genreLabel = {
        let label = UILabel()
        return label
    }()

    let screenshotStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        return view
    }()

    let screenshotImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        return view
    }()

    lazy var screenshots = [screenshotImageView, screenshotImageView, screenshotImageView]

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
        subStackView.addArrangedSubview(sellerLavel)
        subStackView.addArrangedSubview(genreLabel)

        for screenshot in screenshots {
            screenshotStackView.addArrangedSubview(screenshot)
        }

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
            $0.size.equalTo(60)
        }

        downloadButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
        }

        titleStackView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(iconImageView).offset(20)
            $0.trailing.equalTo(downloadButton).offset(20)
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
