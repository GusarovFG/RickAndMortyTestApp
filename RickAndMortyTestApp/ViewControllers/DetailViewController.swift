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
    
    var characterImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    var characterDescription = UILabel(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchImage()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        self.view.addSubview(characterImageView)
        self.characterImageView.snp.makeConstraints { make in
            make.width.height.equalTo(self.view.frame.width - 40)
            make.top.left.right.equalToSuperview().inset(20)
        }
        self.characterImageView.layer.cornerRadius = self.characterImageView.frame.width / 2
        
        self.view.addSubview(characterImageView)
        self.characterDescription.snp.makeConstraints { make in
            make.top.equalTo(self.characterImageView).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }
    }
    
    private func setupUI() {
        
        self.characterDescription.text = """
        Name: \(self.character?.name ?? "")
        Species: \(self.character?.species ?? "")
        Gender: \(self.character?.gender ?? "")
        Status: \(self.character?.status ?? "")
        Location: \(self.character?.location.name ?? "")
        """
    }
    
    private func fetchImage() {
        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: self.character?.image) else { return }
            DispatchQueue.main.async {
                self.characterImageView.image = UIImage(data: imageData)
            }
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
