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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(character: Character?) {
        self.nameLabel.text = character?.name
        self.speciesLabel.text = character?.species
        self.genderLabel.text = character?.gender
        
        DispatchQueue.global().async {
            guard let imageData = ImageManager.shared.fetchImage(from: character?.image) else { return }
            DispatchQueue.main.async {
                self.characterImageView.image = UIImage(data: imageData)
            }
        }
    }
}
