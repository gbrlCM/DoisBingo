//
//  GameInteractor.swift
//  DoisBingo
//
//  Created by Gabriel Ferreira de Carvalho on 25/01/23.
//

import Foundation
import UIKit

protocol InteractorProtocol: AnyObject where Presenter.State == State {
    associatedtype Action
    associatedtype State
    associatedtype Presenter: PresenterProtocol
    
    var presenter: Presenter { get }
    var currentState: State { get set }
    
    func send(_ action: Action)
    func reduce(_ action: Action, previousState: State) async -> State
}

extension InteractorProtocol {
    func send(_ action: Action) {
        Task {
            let newState = await reduce(action, previousState: currentState)
            currentState = newState
            await MainActor.run {
                presenter.present(newState)
            }
        }
    }
}

protocol PresenterProtocol: AnyObject {
    associatedtype State
    associatedtype ViewController: ViewControllerProtocol
    
    var viewController: ViewController? { get set }
    
    func present(_ state: State)
}

protocol ViewControllerProtocol: UIViewController {
    associatedtype ViewModel
    associatedtype Interactor: InteractorProtocol
    
    var interactor: Interactor { get }
    
    func display(_ viewModel: ViewModel)
    
}

final class GameInteractor: InteractorProtocol {
    
    enum Action {
        case didSelectWord(String)
    }
    
    struct State {
        
    }
    
    init(presenter: GamePresenter) {
        self.presenter = presenter
    }
    
    let presenter: GamePresenter
    var currentState: State = State()
    
    func reduce(_ action: Action, previousState: State) async -> State {
        switch action {
        case .didSelectWord(let string):
            return previousState
        }
    }
}

final class GamePresenter: PresenterProtocol {
    typealias State = GameInteractor.State
    
    weak var viewController: GameViewController?
    
    func present(_ state: State) {
        viewController?.view.backgroundColor = [UIColor.red, UIColor.blue, UIColor.brown].randomElement()!
    }
}


