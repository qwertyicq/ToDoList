//
//  Model.swift
//  ToDoList
//
//  Created by Nikolay T on 01.08.2021.
//

import Foundation

struct Tasks {
    var taskName: String
    var isCompleted: Bool
    
    init(_ taskName: String, _ isCompleted: Bool = false) {
        self.taskName = taskName
        self.isCompleted = isCompleted
    }
}

class Model {
    public var arrayTasks: [Tasks] = [Tasks]()
    
    // MARK
    // Функция добавления задачи
    public func addTask(_ task: String) {
        self.arrayTasks.append(Tasks(task))
    }
    
    // Функция отметки состояния задачи
    public func markTask(_ index: Int) {
        self.arrayTasks[index].isCompleted = !self.arrayTasks[index].isCompleted
    }
    
    // Функция удалния задачи
    public func removeTask(_ index: Int) {
        self.arrayTasks.remove(at: index)
    }
}
