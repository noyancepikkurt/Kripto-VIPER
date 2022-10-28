//
//  Presenter.swift
//  Kripto VIPER
//
//  Created by Noyan Çepikkurt on 28.10.2022.
//

import Foundation

enum NetworkError : Error {
    case NetworkFailed
    case ParsingFaied
}


protocol AnyPresenter {
    var router : AnyRouter? {get set}
    var interactor : AnyInteractor? {get set}
    var view : AnyView? {get set}
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>)
}

class CryptoPresenter : AnyPresenter {
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.downloadCryptos()
        }
    }
    
    var view: AnyView?
    
    func interactorDidDownloadCrypto(result: Result<[Crypto], Error>) {
        switch result {
        case.success(let cryptos) :
            view?.update(with: cryptos)
        
        case.failure(_) :
            view?.update(with: "Try again later...")
        }
    }
    
    
}
