//
//  UserPreferencesViewController.swift
//  Lofti
//
//  Created by Medi Assumani on 12/27/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit

class UserPreferencesViewController: UICollectionViewController{

    // - MARK: CLASS PROPERTIES
    private let mainStackView = CustomStackView()
    private var saveButton = CustomButton()
    private var preferences = [String]()
    
    // - MARK: VIEW CONTROLLER LIFECYCLE METHODS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        styleSaveButton()
        mainAutoLayout()
        setUpNavigationBarItems()
    }
    
    
    // - MARK: CLASS METHODS
    
    private func configureCollectionView(){
        
        collectionView.backgroundColor = .lightGray
        collectionView.register(UserPreferencesViewCell.self, forCellWithReuseIdentifier: Constant.userPreferencesCellID)
    }
    
    
    /// Sets up home page title and nav bar items
    private func setUpNavigationBarItems(){
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        
        // Styling the home page title
        titleLabel.text = "Select your preferences"
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
        titleLabel.textAlignment = .left
        titleLabel.backgroundColor = .white
        titleLabel.adjustsFontSizeToFitWidth = true
        
        // Styling the home page navigation bar
        navigationItem.titleView = titleLabel
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.alpha = 0.0
    }
    
    
    @objc private func saveButtonIsTapped(_ sender: UIButton){
        
        let destinationVC = HomePageViewController()
        var userPreferences = ""
        sender.pulsate()
        
        preferences.forEach { (preference) in
            userPreferences += "\((preference.lowercased()).replacingOccurrences(of: " ", with: ","))"
        }
        userPreferences.remove(at: userPreferences.lastIndex(of: ",")!)
        UserDefaults.standard.set(userPreferences, forKey: "user_space_preferences")
        UserDefaults.standard.set(true, forKey: "current_user")
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    private func styleSaveButton(){
        
        
        saveButton = CustomButton(title: "Done",
                                  fontSize: 20,
                                  titleColor: .white,
                                  target: self,
                                  action: #selector(saveButtonIsTapped(_:)),
                                  event: .touchUpInside,
                                  titleFontName: "HelveticaNeue-Light")
        
        saveButton.backgroundColor = .black
        saveButton.layer.cornerRadius = 15
        saveButton.clipsToBounds = true
        saveButton.layer.masksToBounds = true
        saveButton.layer.shadowRadius = 1
    }
    
    
    private func mainAutoLayout(){
        
        let bottomControlsStackView = UIStackView(arrangedSubviews: [saveButton])
        bottomControlsStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlsStackView.axis = .horizontal
        bottomControlsStackView.distribution = .fillEqually
        view.addSubview(bottomControlsStackView)
        
        NSLayoutConstraint.activate([
            bottomControlsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomControlsStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            bottomControlsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            bottomControlsStackView.heightAnchor.constraint(equalToConstant: 50)
            ])
    }
    
    // - MARK: UICollectionView DATASOURCE METHODS
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return Constant.PAUSIBLE_PREFERENCES.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.userPreferencesCellID, for: indexPath) as! UserPreferencesViewCell
        
        cell.preferenceNameLabel.text = Constant.PAUSIBLE_PREFERENCES[indexPath.row]
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = collectionView.cellForItem(at: indexPath)
        if selectedCell?.isSelected == true{
            
            let userChoice = Constant.PAUSIBLE_PREFERENCES[indexPath.row]
            selectedCell?.backgroundColor = .gray
            preferences.append("\(userChoice.replacingOccurrences(of: " ", with: "")) ")
    
        }else{
            selectedCell?.backgroundColor = .white
            print("Cell at position \(indexPath.row) is deselected")
        }
    }
    
}