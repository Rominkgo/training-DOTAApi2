//
//  HeroViewController.swift
//  DOTAApi2
//
//  Created by Default on 11/23/22.
//

import UIKit

class HeroViewController: UIViewController {
    
    var hero: HeroStats?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = hero?.localized_name
        attributeLabel.text = hero?.primary_attr
        attacktypeLabel.text = hero?.attack_type
        legsLabel.text = "\((hero?.legs)!)"
        
        let imgUrl = "https://api.opendota.com" + (hero?.img)!
        
        heroImg.downloaded(from: imgUrl)
        
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var heroImg: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attributeLabel: UILabel!
    @IBOutlet weak var attacktypeLabel: UILabel!
    @IBOutlet weak var legsLabel: UILabel!
}

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

