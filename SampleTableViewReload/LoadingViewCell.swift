//
//  LoadingViewCell.swift
//  SampleTableViewReload
//
//  Created by 岩本康孝 on 2021/08/19.
//

import UIKit

class LoadingViewCell: UITableViewCell {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure() {
        indicator.startAnimating()
    }
}
