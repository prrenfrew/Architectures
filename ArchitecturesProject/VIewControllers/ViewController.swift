//
//  ViewController.swift
//  ArchitecturesProject
//
//  Created by MAC on 8/26/20.
//  Copyright © 2020 PaulRenfrew. All rights reserved.
//
/*
 MVC:
 
 Model - Data
 View - presentation
 Controller - business logic
 
 view and controller have access to the model
 However, the way it is implemented in iOS has issues
 
 View and controller layers are tightly coupled in the ViewController
 
 This makes them hard to test independently
 
 Also makes the VC classes massive.
 
 MVC = Massive View Controller
 
 This approach is good for beginners
 
 Not so much for senior iOS developers
 
 
 MVVM:
 
 Model - Data
 
 View - presentation

 ViewModel - business logic
 
 View has a reference to ViewModel, but not Model
 ViewModel has a reference to the Model, but not the View
 Model is a model
 
 Last difference is that MVVM will have data binding
 
 Data Binding - data(models) when updated, let the view know to update
 
 Decouples the view from the business logic
 We can now test them separately
 
 ViewModel is not married to any particular view
 
 Other architectures to be aware of:
 
 VIPER(aka Clean architecture)
 View - presentation(kind of)/canvas
 Interactor - business logic
 Presentor - Presentation logic
 Entity - Data
 Router - Navigational logic
 
 MVP
 
 Model
 View
 Presenter
 
 Redux/reflux - Architecture created by Facebook
 Concentrate on abstracting the app state
 
 Typical screen has a few states:
 1. empty
 2. error state
 3. data-filled state
 
 MVVM+C
 C - Coordinator(basically a router)
 */

/*
 
 OOP
 
 POP - protocol-oriented programming
 
 What's difference?
 
 They are both ways to solve the same problem. We wnat to reuse something, usually some kind of functionality
 
 OOP Uses inheritance
 POP uses composition(a la protocols)
 
 Example
 
 I have 3 screens, and 3 total kinds of functionality
 
 Screen A Screen B Screen C
 Func A Func B Func C
 
 Screen A - Func A & B
 Screen B - Func B & C
 Screen C - Func A, B, C
 
 With OOP, we would have a superclass with all three functionality, and All three screens would subclass, and then override the appropriate functionality
 
 */

//Object-oriented programming approach
//class Screen {
//  func A() {
//
//  }
//
//  func B() {
//
//  }
//
//  func C() {
//
//  }
//}
//
//class ScreenA: Screen {
//  override func A() {
//
//  }
//
//  override func B() {
//
//  }
//}
//
//class ScreenB: Screen {
//  override func B() {
//
//  }
//
//  override funcC() {
//
//  }
//}
//
//class ScreenC: Screen {
//  override func A() {
//
//  }
//
//  override func B() {
//
//  }
//
//  override func C() {
//
//  }
//}

//protocol FuncA {
//  func A()
//}
//
//protocol FuncB {
//  func B()
//}
//
//protocol FuncC {
//  func C()
//}
//
//protocol FuncD {
//
//}
//
//class ScreenA: FuncA, FuncB {
//
//}
//
//class ScreenD: ScreenA, FuncD {
//
//}
//
//struct ScreenB: FuncB, FuncC {
//
//}
//
//struct ScreenC: FuncA, FuncB, FuncC {
//
//}

protocol Viewable {
  func A()
}

extension Viewable {
  func A() {
    print("doing A things")
  }
}

class Viewer: Viewable {
  func A() {
    print("Doing viewer things")
  }
}

import UIKit

enum ViewState {
  case empty
  case error
  case data
}

class ViewController: UIViewController {
  
  let viewModel = ViewModel()
  var state = ViewState.empty

  override func viewDidLoad() {
    super.viewDidLoad()
    self.viewModel.addTodo(named: "Go to bed")
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.viewModel.numberOfModels()
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }
  
  
}
