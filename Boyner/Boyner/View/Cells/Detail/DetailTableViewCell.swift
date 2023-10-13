//
//  DetailTableViewCell.swift
//  Boyner
//
//  Created by Onur Başdaş on 14.10.2023.
//

import UIKit
import Kingfisher

class DetailTableViewCell: UITableViewCell {
    
    static let identifier = "DetailTableViewCell"
    static func nib() -> UINib {
        return UINib(nibName: "DetailTableViewCell", bundle: nil)
    }
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailReadBtn: UIButton!
    @IBOutlet weak var detailPubDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        detailReadBtn.setTitle("Okuma Listesine Ekle", for: .normal)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bind(data: DetailArticles) {
        let url = URL(string: data.urlToImage ?? "")
        detailImage.kf.setImage(with: url)
        detailTitle.text = data.title
        let dateString = data.publishedAt ?? ""
        if let date = iso8601DateFormatter.date(from: dateString) {
            let timeFormatter = DateFormatter()
            timeFormatter.dateFormat = "HH:mm:ss"
            detailPubDate.text = timeFormatter.string(from: date)
        }
    }
    
    @IBAction func detailReadBtnPressed(_ sender: UIButton) {
        
    }
    
    lazy var iso8601DateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        return formatter
    }()
}
