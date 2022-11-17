//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Andrey Talanchuk on 26.10.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private lazy var collectionView = CollectionViewFactory().createProfileViewControllerCollectionView()
    
    private lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.text = "Photos"
        return label
    }()
    
    private lazy var cellAccessoryView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "arrow.right")
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.layer.borderWidth = 0.3
        self.layer.borderColor = UIColor.gray.cgColor
        self.contentView.addSubview(photosLabel)
        self.contentView.addSubview(cellAccessoryView)
        self.contentView.addSubview(collectionView)
        
        photosLabel.snp.makeConstraints { make in
            make.leading.equalTo(self.contentView.snp.leading).inset(12)
            make.top.equalTo(self.contentView.snp.top).inset(12)
        }
        
        cellAccessoryView.snp.makeConstraints { make in
            make.centerY.equalTo(photosLabel.snp.centerY)
            make.trailing.equalTo(self.contentView.snp.trailing).inset(12)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(photosLabel.snp.bottom)
            make.leading.equalTo(self.contentView.snp.leading)
            make.trailing.equalTo(self.contentView.snp.trailing)
            make.bottom.equalTo(self.contentView.snp.bottom)
            make.height.equalTo(collectionView.itemHeight ?? 0)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
    }
}

