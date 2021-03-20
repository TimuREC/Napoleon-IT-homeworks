//
//  ViewController.swift
//  Lesson 5
//
//  Created by mono on 28.11.2020.
//
//Создать экран с таблицей, в которой будут кастомные ячейки и header, в котором содержится label. Каждая ячейка должна содержать разный текст и кнопку. По нажатию на ячейку label в хедере таблицы должен меняться на текст ячейки, а по нажатию на кнопку должен открываться новый экран (добавляться в навигационный стэк). В новом экране должна быть вертикальная коллекция, содержащая два столбца и несколько строк. Элементы должны быть на расстоянии 10 друг от друга и иметь разный текст внутри себя (можно добавлять и другие элементы). По нажатию на ячейку должен в консоль должен выводиться ее номер.

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(MyCustomHeader.self,
               forHeaderFooterViewReuseIdentifier: "sectionHeader")
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "templateCell", for: indexPath) as! TableViewCell
        
        cell.setup(index: indexPath.row)
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TableViewCell
        let header = tableView.headerView(forSection: indexPath.section) as! MyCustomHeader
        
        header.title.text = cell.cellLabel.text
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier:
                    "sectionHeader") as! MyCustomHeader
        view.title.text = "Здесь будет отображен текст ячейки"

        return view
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
}

class MyCustomHeader: UITableViewHeaderFooterView {
    let title = UILabel()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        title.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(title)

        NSLayoutConstraint.activate([
            title.heightAnchor.constraint(equalToConstant: 40),
            title.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            title.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}

