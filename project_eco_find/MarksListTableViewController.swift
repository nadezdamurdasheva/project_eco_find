//
//  MarksListTableViewController.swift
//  project_eco_find
//
//  Created by Надя Мурдашева on 18.08.2020.
//  Copyright © 2020 Надя Мурдашева. All rights reserved.
//

import UIKit
struct Marks {
    let name: String?
    let category: String?
    let desc: String?
    let pict: UIImage?
    init(name: String? = nil,
         category: String? = nil,
         desc: String? = nil,
         pict: UIImage? = nil) {
        
        self.name = name
        self.category = category
        self.desc = desc
        self.pict = pict
    }
}


class MarksListTableViewController: UITableViewController,UISearchBarDelegate {
    @IBOutlet weak var searchBarMarks: UISearchBar!
    var searchData = [Marks()]
     var searching = false
    let allMarks = [
        Marks(name: "01 PET", category: "Plastic", desc: "", pict: UIImage(named: "sign1")!),
        Marks(name: "02 PE-HD PEHD PE HDPE", category: "Plastic", desc: "", pict: UIImage(named: "sign2")!),
        Marks(name: "03 PVC", category: "Plastic", desc: "", pict: UIImage(named: "sign3")!),
        Marks(name: "04 PE-LD PELD LDPE", category: "Plastic", desc: "", pict: UIImage(named: "sign4")!),
        Marks(name: "05 PP", category: "Plastic" , desc: "", pict: UIImage(named: "sign5")!),
        Marks(name: "06 PS", category: "Plastic" , desc: "", pict: UIImage(named: "sign6")!),
        Marks(name: "07 O OTHER", category: "Plastic" , desc: "", pict: UIImage(named: "sign7")!),
        Marks(name: "09 ABS", category: "Plastic" , desc: "", pict: UIImage(named: "sign9")!),
        Marks(name: "20 PAP PCB", category: "Paper" , desc: "", pict: UIImage(named: "sign20")!),
        Marks(name: "21 PAP", category: "Paper" , desc: "", pict: UIImage(named: "sign21")!),
        Marks(name: "22 PAP", category: "Paper" , desc: "", pict: UIImage(named: "sign22")!),
        Marks(name: "23 PAP PPB", category: "Paper" , desc: "", pict: UIImage(named: "sign23")!),
        Marks(name: "40 FE", category: "Metal" , desc: "", pict: UIImage(named: "sign40")!),
        Marks(name: "41 ALU", category: "Metal" , desc: "", pict: UIImage(named: "sign41")!),
        Marks(name: "50 FOR", category: "Organic" , desc: "", pict: UIImage(named: "sign50")!),
        Marks(name: "51 FOR", category: "Organic" , desc: "", pict: UIImage(named: "sign51")!),
        Marks(name: "60 TEX COT", category: "Organic" , desc: "", pict: UIImage(named: "sign60")!),
        Marks(name: "61 TEX", category: "Organic" , desc: "", pict: UIImage(named: "sign61")!),
        Marks(name: "70 GLS GL", category: "Glass" , desc: "", pict: UIImage(named: "sign70")!),
        Marks(name: "71 GLS GL", category: "Glass" , desc: "", pict: UIImage(named: "sign71")!),
        Marks(name: "72 GLS GL", category: "Glass" , desc: "", pict: UIImage(named: "sign72")!),
        Marks(name: "73 GLS GL", category: "Glass" , desc: "", pict: UIImage(named: "sign73")!),
        Marks(name: "74 GLS GL", category: "Glass" , desc: "", pict: UIImage(named: "sign74")!),
        Marks(name: "75 GLS GL", category: "Glass" , desc: "", pict: UIImage(named: "sign75")!),
        Marks(name: "76 GLS GL", category: "Glass" , desc: "", pict: UIImage(named: "sign76")!),
        Marks(name: "77 GLS GL", category: "Glass" , desc: "", pict: UIImage(named: "sign77")!),
        Marks(name: "78 GLS GL", category: "Glass" , desc: "", pict: UIImage(named: "sign78")!),
        Marks(name: "79 GLS GL", category: "Glass" , desc: "", pict: UIImage(named: "sign79")!),
        Marks(name: "80", category: "Other" , desc: "", pict: UIImage(named: "sign80")!),
        Marks(name: "81 PapPet", category: "Other" , desc: "", pict: UIImage(named: "sign81")!),
        Marks(name: "82", category: "Other" , desc: "", pict: UIImage(named: "sign82")!),
        Marks(name: "83", category: "Other" , desc: "", pict: UIImage(named: "sign83")!),
        Marks(name: "84 C/PAP", category: "Other" , desc: "", pict: UIImage(named: "sign84")!),
        Marks(name: "85", category: "Other" , desc: "", pict: UIImage(named: "sign85")!),
        Marks(name: "87", category: "Other" , desc: "", pict: UIImage(named: "sign87")!),
        Marks(name: "90", category: "Other" , desc: "", pict: UIImage(named: "sign90")!),
        Marks(name: "91", category: "Other" , desc: "", pict: UIImage(named: "sign91")!),
        Marks(name: "92", category: "Other" , desc: "", pict: UIImage(named: "sign92")!),
        Marks(name: "95", category: "Other" , desc: "", pict: UIImage(named: "sign95")!),
        Marks(name: "96", category: "Other" , desc: "", pict: UIImage(named: "sign96")!),
        Marks(name: "97", category: "Other" , desc: "", pict: UIImage(named: "sign97")!),
        Marks(name: "98", category: "Other" , desc: "", pict: UIImage(named: "sign98")!),
      ]
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarMarks.delegate = self
        searchData = allMarks
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchData.count
        }
            return allMarks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MarksTableViewCell
        
        let marksCell = allMarks[indexPath.row]
        let marksCellSearch = searchData[indexPath.row]
        
        if searching {
            cell.labelCell?.text = marksCellSearch.name
            cell.imageCell?.image = marksCellSearch.pict
        } else{
        cell.labelCell?.text = marksCell.name
        cell.imageCell?.image = marksCell.pict
        }
        return cell
         
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        /*searchData = allMarks.filter({($0.name!.lowercased().prefix(searchText.count) == searchText.lowercased()) || ($0.name!.lowercased().suffix(searchText.count) == searchText.lowercased())})*/
        searchData = allMarks.filter({$0.name!.lowercased().contains(searchText.lowercased())})
           searching = true
           tableView.reloadData()
       }
       
       func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
           searching = false
           searchBarMarks.text = ""
           tableView.reloadData()
       }
    /*func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            searchData = allMarks.filter({ mark -> Bool in
                searchBarMarks.selectedScopeButtonIndex {
                if searchText.isEmpty { return true }
                else{
                    return mark.name.lowercased().contains(searchText.lowercased())
                    }
                }
            })
            tableView.reloadData()
        }
        
        func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
            switch selectedScope {
            case 0:
                searchData = allMarks
            case 1:
                searchData = allMarks.filter({ animal -> Bool in
                    animal.category == AnimalType.dog
                })
            case 2:
                searchData = allMarks.filter({ animal -> Bool in
                    animal.category == AnimalType.cat
                })
            default:
                break
            }
            tableView.reloadData()
        }
    }*/
    
    
    /*func searchBarCancelButtonClicked(_ searchBar: UISearchBar){
        searchBar.text = ""
        searchData = allMarks
        searchBar.endEditing(true)
        tableView.reloadData()
       }

       

       func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        
        searchData = searchText.isEmpty ? allMarks : allMarks.filter {
            (item: String) -> Bool in

                        // If dataItem matches the searchText, return true to include it
            return item.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil

        }
        tableView.reloadData()
       }*/
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
