//
//  DetailViewController.swift
//  Boyner
//
//  Created by Onur Başdaş on 13.10.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailTableView: UITableView!
    
    let detailViewModel = DetailViewModel()
    var sourceID: String?
    var sourceName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getData()
    }
    
    func setupUI() {
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.register(DetailTableViewCell.nib(), forCellReuseIdentifier: DetailTableViewCell.identifier)
        navigationItem.title = sourceName ?? ""
    }
    
    func getData() {
        detailViewModel.getHeadlineData(sourceHeadlineId: sourceID ?? "") {
            DispatchQueue.main.async { [self] in
                detailTableView.reloadData()
            }
        }
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailViewModel.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = detailTableView.dequeueReusableCell(withIdentifier: DetailTableViewCell.identifier, for: indexPath) as! DetailTableViewCell
        cell.bind(data: detailViewModel.articles[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
}
