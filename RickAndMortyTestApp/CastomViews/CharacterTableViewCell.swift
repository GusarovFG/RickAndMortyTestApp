//
//  CharacterTableViewCell.swift
//  RickAndMortyTestApp
//
//  Created by Фаддей Гусаров on 24.04.2022.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {

    @IBOutlet weak var characterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var speciesLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!

    func setupCell(character: Character?) {
        self.characterImageView.layer.cornerRadius = self.characterImageView.frame.width / 2
        self.nameLabel.text = "Name : \(character?.name ?? "")"
        self.speciesLabel.text = "specie: \(character?.species ?? "")"
        self.genderLabel.text = "gender: \(character?.gender ?? "")"
        
        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: character?.image) else { return }
            DispatchQueue.main.async {
                self.characterImageView.image = UIImage(data: imageData)
            }
        }
    }
}
