//
//  CustomCell.swift
//  ToDoList_withoutStory
//
//  Created by Nikolay T on 01.08.2021.
//

import Foundation
import UIKit

protocol CustomCellDelegate {
    func changeCellMark(cell: CustomCell)
    func deleteCell(cell: CustomCell)
}

class CustomCell: UITableViewCell {

    @IBOutlet weak var labelTask: UILabel!
    @IBOutlet weak var removeBtn: UIButton!
    @IBOutlet weak var completeBtn: UIButton!
    
    var delegate: CustomCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func removeTaskBtnPressed(_ sender: Any) {
        self.delegate?.deleteCell(cell: self)
    }
    
    @IBAction func completeTaskBtnPressed(_ sender: Any) {
        self.delegate?.changeCellMark(cell: self)
        
        if self.backgroundColor != .green {
            self.backgroundColor = .green
        } else {
            self.backgroundColor = .none
        }
    }
    
}
