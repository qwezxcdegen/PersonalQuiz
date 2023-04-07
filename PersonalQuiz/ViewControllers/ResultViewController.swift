//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.04.2023.
//

import UIKit

final class ResultViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var animalDescriptionLabel: UILabel!
    
    // MARK: - Properties
    var answersChosen: [Answer]!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        let animal = findTheAnimal()
        animalLabel.text = "Вы - \(animal.rawValue)"
        animalDescriptionLabel.text = animal.definition
        
        navigationItem.hidesBackButton = true
    }
    
    // MARK: - IBActions
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    // MARK: - Private Methods
    private func findTheAnimal() -> Animal {
        var currentCount = 0
        var favAnimal = (animal: Animal.dog, count: 0)
        let animalsChosen = answersChosen.compactMap { $0.animal }
        for animal in Animal.allCases {
            for chosen in animalsChosen {
                if animal == chosen {
                    currentCount += 1
                }
            }
            if currentCount > favAnimal.count {
                favAnimal = (animal, currentCount)
            }
            currentCount = 0
        }
        return favAnimal.animal
    }
    
    // MARK: - Deinit
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
