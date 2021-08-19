//
//  SampleViewCell.swift
//  SampleTableViewReload
//
//  Created by 岩本康孝 on 2021/08/19.
//

import UIKit

class SampleViewCell: UITableViewCell {

    @IBOutlet weak var indexLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(index: Int) {
        indexLabel.text = "\(index)"
    }
}
