//
//  TableViewCell.swift
//  OpenLibrary
//
//  Created by Андрей Сергеевич on 16.04.2023.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previewImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }


}
