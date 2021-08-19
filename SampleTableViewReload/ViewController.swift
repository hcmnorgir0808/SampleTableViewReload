//
//  ViewController.swift
//  SampleTableViewReload
//
//  Created by 岩本康孝 on 2021/08/19.
//

import UIKit

class ViewController: UIViewController {

    private var cellCount = 20
    
    private var isReloading = false
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(UINib(nibName: "SampleViewCell", bundle: nil), forCellReuseIdentifier: "SampleViewCell")
            tableView.register(UINib(nibName: "LoadingViewCell", bundle: nil), forCellReuseIdentifier: "LoadingViewCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellCount + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row < cellCount {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SampleViewCell") as! SampleViewCell
            cell.configure(index: indexPath.row + 1)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoadingViewCell") as! LoadingViewCell
            cell.configure()
            return cell
        }
    }
}

extension ViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if tableView.contentOffset.y + tableView.frame.size.height > tableView.contentSize.height,
           tableView.isDragging, !isReloading {
            
            cellCount += 20
            isReloading = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.tableView.reloadData()
                self.isReloading = false
            }
            
        }
    }
}
