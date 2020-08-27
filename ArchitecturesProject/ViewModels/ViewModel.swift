//
//  ViewModel.swift
//  ArchitecturesProject
//
//  Created by MAC on 8/26/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//

class ViewModel {
  
  typealias UpdateClosure = () -> Void
  
  private var models = [Model]() {
    didSet {
      self.update?()
    }
  }
  
  private var update: UpdateClosure?
  
  func registerUpdate(closure: @escaping UpdateClosure) {
    self.update = closure
  }
  
  
  func numberOfModels() -> Int {
    return self.models.count
  }
  
  func addTodo(named: String) {
    //do network call
    self.models = [Model(modelThings: [])]
    self.models.append(Model(modelThings: [named]))
  }
}
