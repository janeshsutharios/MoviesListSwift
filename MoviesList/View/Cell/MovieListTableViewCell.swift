//
//  MovieListTableViewCell.swift
//  MoviesList
//
//  Created by Janesh Suthar on 27/05/22.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    
    @IBOutlet var movieImgView:UIImageView!
    @IBOutlet var movieTitle:UILabel!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
