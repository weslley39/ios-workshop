//
//  TaskCell.swift
//  gestta
//
//  Created by Marcus Costa on 26/06/17.
//  Copyright © 2017 redspark. All rights reserved.
//

import UIKit

protocol TaskCellDelegate {
    
    func taskCell(cell: TaskCell, didSelectIconForItem item: String)
    
}

class TaskCell: UITableViewCell {
    
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelSubtitle: UILabel!
    
    var delegate: TaskCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
    
        setupGestures()
        applyStyle()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    fileprivate func applyStyle () {
        // Apply color scheme and visual effects
    }
    
    fileprivate func setupGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(iconTapped))
        imageIcon.addGestureRecognizer(tap)
        imageIcon.isUserInteractionEnabled = true
    }
    
    @objc fileprivate func iconTapped() {
        delegate?.taskCell(cell: self, didSelectIconForItem: labelTitle.text!)
    }
    
    func setupTask(taskName: String) {
        labelTitle.text = taskName
    }
    
}
