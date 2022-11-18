//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Андрей Таланчук on 25.10.2022.
//

import UIKit
import iOSIntPackage

class PhotosViewController: UIViewController {
    
    private lazy var imagePublisherFacade = ImagePublisherFacade()
    private lazy var collectionView = PhotoCollectionView(viewControllerName: .photosVC)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        setupNavigationBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        imagePublisherFacade.subscribe(self)
        imagePublisherFacade.addImagesWithTimer(time: 0.5, repeat: 20)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        imagePublisherFacade.removeSubscription(for: self)
        imagePublisherFacade.rechargeImageLibrary()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationItem.title = "Photo Gallery"
    }
    
    private func setupView() {
        view.backgroundColor = .systemGray6
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.leading.equalTo(view.snp.leading)
            make.trailing.equalTo(view.snp.trailing)
            make.bottom.equalTo(view.snp.bottom)
        }
    }
}

extension PhotosViewController: ImageLibrarySubscriber {
    func receive(images: [UIImage]) {
        collectionView.photos = images
        collectionView.reloadData()
        let item = IndexPath(item: images.count - 1, section: 0)
        collectionView.scrollToItem(at: item, at: .bottom, animated: true)
    }
}
