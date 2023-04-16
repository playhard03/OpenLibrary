//
//  ViewController +extension.swift
//  OpenLibrary
//
//  Created by Андрей Сергеевич on 16.04.2023.
//

import Foundation
import UIKit
    

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell else {return UITableViewCell() }
        ApiManager.shared.getRequest(ids: array[indexPath.row]) { [weak self] books in
            DispatchQueue.main.async {
                cell.titleLabel.text = books?.results?[0].title
                cell.dateLabel.text = "\(books?.results?[0].authors?[0].death_year ?? 1912)"
                cell.previewImage.sd_setImage(with: URL(string: (books?.results?[0].formats?.image ?? "")), completed: nil)
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard  let vc = storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else {return }
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        ApiManager.shared.getRequest(ids: array[indexPath.row]) { [weak self] books in
            DispatchQueue.main.async {
                vc.dateLabel.text = "Год выпуска: \(books?.results?[0].authors?[0].death_year ?? 1912)"
                vc.descriptionLabel.text = books?.results?[0].subjects?[0]
                vc.titleLabel.text = books?.results?[0].title
                vc.previewImage.sd_setImage(with: URL(string: (books?.results?[0].formats?.image ?? "")), completed: nil)
            }
        }
    }
    
}
