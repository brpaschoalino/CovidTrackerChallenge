//
//  StatesTableViewCell.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 09/12/21.
//

import Foundation
import UIKit

class StatesTableViewCell: UITableViewCell {

    static let identifier = "StatesTableViewCell"

    static func nib() -> UINib {
        return UINib(nibName: "StatesTableViewCell", bundle: nil)
    }

    public func configure (with uf: String, state: String, cases: Int, suspects: Int, deaths: Int){
        print("success getting inside the configure cell")
        stateUf?.text = uf
        stateState?.text = state
        stateCases?.text = String(cases)
        stateSuspects?.text = String(suspects)
        stateDeaths?.text = String(deaths)

    }

    @IBOutlet var stateUf: UILabel?
    @IBOutlet var stateState: UILabel?
    @IBOutlet var stateCases: UILabel?
    @IBOutlet var stateSuspects: UILabel?
    @IBOutlet var stateDeaths: UILabel?

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
