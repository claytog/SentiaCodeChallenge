//
//  ViewController.swift
//  SentiaCodeChallenge
//
//  Created by Clayton on 5/5/21.
//

import UIKit

class PropertiesViewController: UIViewController{

    @IBOutlet var propertiesTableView: UITableView!
    
    private var properties: Properties?
    private var httpClient = HTTPClient()
    private var activityView = UIActivityIndicatorView(style: .large)
    
    private let propertyCell = "PropertyCell"
    private let propertySegue = "propertySegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        propertiesTableView.delegate = self
        propertiesTableView.dataSource = self
        
        propertiesTableView.register(UINib(nibName: propertyCell, bundle: nil), forCellReuseIdentifier: propertyCell)
        propertiesTableView.tableFooterView = UIView()
        
        getProperties()
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? PropertyViewController {
            let senderProperty = sender as? Property
            destination.propertyId = senderProperty?.id
        }
    }
    
    
    func getProperties(){
        
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
        
        httpClient.getProperties( completion:  { result in
            switch result {
            case .success(let details):
                DispatchQueue.main.async {
                    self.properties = details
                    self.propertiesTableView.reloadData()
                    self.activityView.stopAnimating()
                }
            case .failure(let error):
                print(error.localizedDescription)
                DispatchQueue.main.async {
                    self.activityView.stopAnimating()
                }
            }
        })
    }
    
}

extension PropertiesViewController : UITableViewDelegate,  UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return properties?.data?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let property = properties?.data?[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: propertyCell, for: indexPath) as! PropertyCell
        cell.setupView(cell, property)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let property = properties?.data?[indexPath.row]
        
        performSegue(withIdentifier: propertySegue, sender: property)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 330
    }
    
}

