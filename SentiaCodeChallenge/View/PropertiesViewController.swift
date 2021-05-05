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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        propertiesTableView.delegate = self
        propertiesTableView.dataSource = self
        
        propertiesTableView.register(UINib(nibName: "PropertyCell", bundle: nil), forCellReuseIdentifier: "PropertyCell")
        
        propertiesTableView.tableFooterView = UIView()
        
        getProperties()
        
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PropertyCell", for: indexPath) as! PropertyCell
 
        
        // get thumbnail image from web service
        if let imageURL = property?.propertyImages?[0].attachment?.url {
            cell.propertyImage.setImageFromUrl(imageURL: imageURL, completion: { completed in
            })
        }
        cell.addressLabel.text = property?.location?.address
        if let bed = property?.bedrooms {
            cell.bedLabel.text = String(bed)
        }
        if let bath = property?.bathrooms {
            cell.bathLabel.text = String(bath)
        }
        if let car = property?.carspaces {
            cell.carLabel.text = String(car)
        }
        if let firstName = property?.agent?.firstName, let lastName = property?.agent?.lastName {
            cell.agentLabel.text = firstName + " " + lastName
        }
        // get thumbnail image from web service
        if let imageURL = property?.agent?.avatar?.small?.url {
            cell.avatarImage.setImageFromUrl(imageURL: imageURL, completion: { completed in
            })
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
          return 330
    }
    
}

