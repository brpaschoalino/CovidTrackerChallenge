//
//  ContryTableViewCell.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 29/12/21.
//

import Foundation
import UIKit

class CountryTableViewCell: UITableViewCell {
    static let identifier = "StatesTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "StatesTableViewCell", bundle: nil)
    }

    public func configure (with name: String, code: String){
        print("success getting inside the configure cell")
        countryName?.text = name
        countryCode?.text = code

    }

    @IBOutlet var countryName: UILabel?
    @IBOutlet var countryCode: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
