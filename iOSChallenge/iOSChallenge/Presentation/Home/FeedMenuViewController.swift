//
//  FeedMenuViewController.swift
//  XcodeGenSample
//
//  Created by Bruno Rodrigues Paschoalino on 03/12/21.
//

import Foundation
import UIKit
import Combine

class FeedMenuViewController:UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?

    var viewModel = FeedMenuViewModel()
    private var cancellables: Set<AnyCancellable> = []

    @IBOutlet var tableView: UITableView!
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet weak var recoveredLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var caseLabel: UILabel!
    @IBOutlet weak var confirmedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(StatesTableViewCell.nib(), forCellReuseIdentifier: StatesTableViewCell.identifier)
        tableView.dataSource = self
        pickerView.dataSource = self
        pickerView.delegate = self

        registerObservers()

        viewModel.loadData()
    }

    func registerObservers() {
        viewModel.objectWillChange.sink { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
            self.setCountryDataLabel()
            self.pickerView.reloadAllComponents()
        }.store(in: &cancellables)
    }

    func setCountryDataLabel() {
        countryLabel.text = viewModel.getSelectedCountryName()
        recoveredLabel.text = viewModel.getSelectedCountryRecovered()
        deathsLabel.text = viewModel.getSelectedCountryDeaths()
        caseLabel.text = viewModel.getSelectedCountryCases()
        confirmedLabel.text = viewModel.getSelectedCountryConfirmed()
    }
}

extension FeedMenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("inside the cell creation")

        if viewModel.getStatesArraySize() == 0 {
            return UITableViewCell()
        }

        let textCell = tableView.dequeueReusableCell(withIdentifier: StatesTableViewCell.identifier,
                                                         for: indexPath) as! StatesTableViewCell
            textCell.configure(with: viewModel.getStateUF(index: indexPath.row),
                               state: viewModel.getState(index: indexPath.row),
                               cases: viewModel.getStateCases(index: indexPath.row),
                               suspects: viewModel.getStateSuspects(index: indexPath.row),
                               deaths: viewModel.getStateDeats(index: indexPath.row))
            textCell.selectionStyle = UITableViewCell.SelectionStyle.none

            print("success in creating the text cell")
        return textCell

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getStatesArraySize()
    }
}

extension FeedMenuViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return viewModel.getCountryName(index: row)
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.setSelectedCountry(index: row)
    }

}

extension FeedMenuViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return viewModel.getCountryArraySize()
    }
}
