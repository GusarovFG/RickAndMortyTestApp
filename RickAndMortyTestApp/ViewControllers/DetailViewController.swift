//
//  DetailViewController.swift
//  RickAndMortyTestApp
//
//  Created by Фаддей Гусаров on 24.04.2022.
//
import SnapKit
import UIKit

class DetailViewController: UIViewController {
    
    var character: Character?
    
    private var characterImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private var nameLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private var speciesLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private var statusLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private var locationLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    private var episodesCountLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        fetchImage()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.current.orientation.isLandscape {
            self.characterImageView.snp.remakeConstraints { make in
                make.width.height.equalTo(150)
                make.leading.trailing.equalToSuperview().inset(200)
                make.top.equalToSuperview().inset((self.navigationController?.navigationBar.frame.height ?? 0) + 10)
            }
        } else {
            self.characterImageView.snp.remakeConstraints { make in
                make.width.height.equalTo(300)
                make.leading.trailing.equalToSuperview().inset(50)
                make.top.equalToSuperview().inset((self.navigationController?.navigationBar.frame.height ?? 0) + 10)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.addSubview(self.characterImageView)
        self.characterImageView.snp.makeConstraints { make in
            make.width.height.equalTo(300)
            make.leading.trailing.equalToSuperview().inset(50)
            make.top.equalToSuperview().inset((self.navigationController?.navigationBar.frame.height ?? 0) + 10)
        }
        
        self.view.addSubview(self.nameLabel)
        self.nameLabel.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(self.characterImageView.snp.bottom).offset(5)
        }
        
        self.view.addSubview(self.speciesLabel)
        self.speciesLabel.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(self.nameLabel.snp.bottom).offset(5)
        }
        
        self.view.addSubview(self.statusLabel)
        self.statusLabel.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(self.speciesLabel.snp.bottom).offset(5)
        }
        
        self.view.addSubview(self.locationLabel)
        self.locationLabel.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(self.statusLabel.snp.bottom).offset(5)
        }
        
        self.view.addSubview(self.episodesCountLabel)
        self.episodesCountLabel.snp.makeConstraints { make in
            make.width.equalTo(300)
            make.height.equalTo(20)
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(self.locationLabel.snp.bottom).offset(5)
        }
        
        
    }
    
    private func setupUI() {
        
        self.view.backgroundColor = .white
        
        self.nameLabel.text = "Name: \(self.character?.name ?? "")"
        self.speciesLabel.text = "Species: \(self.character?.species ?? "")"
        self.statusLabel.text = "Status: \(self.character?.status ?? "")"
        self.locationLabel.text = "Location: \(self.character?.location.name ?? "")"
        self.episodesCountLabel.text = "Count of episodes: \(self.character?.episode.count ?? 0)"
    }
    
    private func fetchImage() {
        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: self.character?.image) else { return }
            DispatchQueue.main.async {
                self.characterImageView.image = UIImage(data: imageData)
            }
        }
    }
}
