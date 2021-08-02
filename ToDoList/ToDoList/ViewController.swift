//
//  ViewController.swift
//  ToDoList
//
//  Created by Nikolay T on 26.07.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLable: UILabel!
    
    var model = Model()
    
    var alert = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        titleLable.layer.borderWidth = 3
        titleLable.layer.borderColor = CGColor.init(red: 1.0, green: 0.5, blue: 0.5, alpha: 1.0)
        titleLable.layer.cornerRadius = titleLable.frame.width / 40
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    //MARK
    // Функция возвращает количство ячеек в таблице
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.arrayTasks.count
    }
    
    // Функция возвращает ячейку
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        
        cell.delegate = self
        cell.labelTask.text = model.arrayTasks[indexPath.row].taskName
        
        return cell
    }
    
    // Функция устанавливает высоту ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    
    // Обработка события "Нажата кнопка добавить задачу"
    @IBAction func addBtnPressed(_ sender: Any) {
        self.alert = UIAlertController(title: "Введите новую задачу", message: nil, preferredStyle: .alert)
        self.alert.addTextField { (textField: UITextField) in
            textField.placeholder = "Название задачи..."
        }
        
        let createTaskAction = UIAlertAction(title: "Cоздать", style: .default) { _ in
            guard let taskText = self.alert.textFields?[0].text else { return }
            
            self.model.addTask(taskText)
            self.tableView.reloadData()
        }
        
        let cancelTaskAction = UIAlertAction(title: "Отменить", style: .cancel, handler: nil)
        
        self.alert.addAction(createTaskAction)
        self.alert.addAction(cancelTaskAction)
        
        
        self.present(self.alert, animated: true, completion: nil)
    }
}

// Реализация делегата ячейки
extension ViewController: CustomCellDelegate {
    
    // Обработка события "Нажата кнопка задача выполнена"
    func changeCellMark(cell: CustomCell) {
        guard let index = tableView.indexPath(for: cell) else { return }
        
        model.markTask(index.row)
        
        tableView.reloadData()
    }
    
    // Обработка события "Нажата кнопка удалить задачу"
    func deleteCell(cell: CustomCell) {
        guard let index = tableView.indexPath(for: cell) else { return }
        
        model.removeTask(index.row)
        tableView.reloadData()
    }
}

