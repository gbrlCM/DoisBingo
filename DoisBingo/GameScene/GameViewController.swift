//
//  GameViewController.swift
//  DoisBingo
//
//  Created by Gabriel Ferreira de Carvalho on 25/01/23.
//

import UIKit

class GameViewController: UIViewController, ViewControllerProtocol {
    
    let contentView: GameView = GameView()
    let interactor: GameInteractor
    
    init(interactor: GameInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentView.button.addAction(buttonAction, for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    private var buttonAction: UIAction {
        UIAction {[weak interactor] _ in
            print("pudim")
            interactor?.send(.didSelectWord("fodase"))
        }
    }
    
    func display(_ viewModel: String) {
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
