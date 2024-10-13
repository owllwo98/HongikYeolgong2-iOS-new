//
//  DependencyInjector.swift
//  HongikYeolgong2
//
//  Created by 권석기 on 10/11/24.
//

import SwiftUI
import Combine

/// DIContainer로 appState, Interactor를 주입
struct DIContainer: EnvironmentKey {
    let appState: Store<AppState>
    let interactors: Interactors
    
    init(appState: Store<AppState>, interactors: Interactors) {
        self.appState = appState
        self.interactors = interactors
    }
    
    static var defaultValue: Self { Self.default }
    
    private static let `default` = Self(appState: .init(AppState()), 
                                        interactors: .init(userDataInteractor: UserDataInteractorImpl(appState: .init(AppState()))))
}

extension EnvironmentValues {
    var injected: DIContainer {
        get { self[DIContainer.self] }
        set { self[DIContainer.self] = newValue }
    }
}

extension View {
//    func inject(_ appState: AppState) -> some View {
//        let container = DIContainer(appState: .init(appState), 
//                                    interactors: .init(userDataInteractor: UserDataInteractorImpl(appState: .init(AppState()))))
//        return inject(container)
//    }
    
    func inject(_ container: DIContainer) -> some View {
        return self
            .environment(\.injected, container)
    }
}
