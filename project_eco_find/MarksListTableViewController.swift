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
        Marks(name: "01 PET полиэтилентерефталат (лавсан)", category: "Пластмассы", desc: "", pict: UIImage(named: "sign1")!),
        Marks(name: "02 PE PE-HD PEHD HDPE полиэтилен высокой плотности (низкого давления)", category: "Пластмассы", desc: "", pict: UIImage(named: "sign2")!),
        Marks(name: "03 PVC поливинилхлорид", category: "Пластмассы", desc: "", pict: UIImage(named: "sign3")!),
        Marks(name: "04 PE-LD PELD LDPE полиэтилен низкой плотности (высокого давления)", category: "Пластмассы", desc: "", pict: UIImage(named: "sign4")!),
        Marks(name: "05 PP полипропилен", category: "Пластмассы" , desc: "", pict: UIImage(named: "sign5")!),
        Marks(name: "06 PS полистирол", category: "Пластмассы" , desc: "", pict: UIImage(named: "sign6")!),
        Marks(name: "07 O OTHER остальные виды пластика", category: "Пластмассы" , desc: "", pict: UIImage(named: "sign7")!),
        Marks(name: "09 ABS АБС-пластик", category: "Пластмассы" , desc: "", pict: UIImage(named: "sign9")!),
        Marks(name: "20 PAP PCB гофрированный картон", category: "Бумага" , desc: "", pict: UIImage(named: "sign20")!),
        Marks(name: "21 PAP прочий картон", category: "Бумага" , desc: "", pict: UIImage(named: "sign21")!),
        Marks(name: "22 PAP бумага", category: "Бумага" , desc: "", pict: UIImage(named: "sign22")!),
        Marks(name: "23 PAP PPB вощёная бумага", category: "Бумага" , desc: "", pict: UIImage(named: "sign23")!),
        Marks(name: "40 FE сталь", category: "Металлы" , desc: "", pict: UIImage(named: "sign40")!),
        Marks(name: "41 ALU алюминий", category: "Металлы" , desc: "", pict: UIImage(named: "sign41")!),
        Marks(name: "50 FOR древесина", category: "Органические материалы природного происхождения" , desc: "", pict: UIImage(named: "sign50")!),
        Marks(name: "51 FOR пробка", category: "Органические материалы природного происхождения" , desc: "", pict: UIImage(named: "sign51")!),
        Marks(name: "60 TEX COT хлопок", category: "Органические материалы природного происхождения" , desc: "", pict: UIImage(named: "sign60")!),
        Marks(name: "61 TEX джутовое волокно", category: "Органические материалы природного происхождения" , desc: "", pict: UIImage(named: "sign61")!),
        Marks(name: "70 GLS GL бесцветное стекло", category: "Стекло" , desc: "", pict: UIImage(named: "sign70")!),
        Marks(name: "71 GLS GL зелёное стекло", category: "Стекло" , desc: "", pict: UIImage(named: "sign71")!),
        Marks(name: "72 GLS GL коричневое стекло", category: "Стекло" , desc: "", pict: UIImage(named: "sign72")!),
        Marks(name: "73 GLS GL бутылочное стекло тёмно-коричневое", category: "Стекло" , desc: "", pict: UIImage(named: "sign73")!),
        Marks(name: "74 GLS GL бутылочное стекло светло-коричневое", category: "Стекло" , desc: "", pict: UIImage(named: "sign74")!),
        Marks(name: "75 GLS GL стекло с малым содержанием свинца", category: "Стекло" , desc: "", pict: UIImage(named: "sign75")!),
        Marks(name: "76 GLS GL хрусталь", category: "Стекло" , desc: "", pict: UIImage(named: "sign76")!),
        Marks(name: "77 GLS GL стекло, покрытое медью", category: "Стекло" , desc: "", pict: UIImage(named: "sign77")!),
        Marks(name: "78 GLS GL стекло, покрытое серебром", category: "Стекло" , desc: "", pict: UIImage(named: "sign78")!),
        Marks(name: "79 GLS GL позолоченное стекло", category: "Стекло" , desc: "", pict: UIImage(named: "sign79")!),
        Marks(name: "80 бумага (картон), различные материалы", category: "Композиционные материалы" , desc: "", pict: UIImage(named: "sign80")!),
        Marks(name: "81 PapPet бумага (картон), пластик", category: "Композиционные материалы" , desc: "", pict: UIImage(named: "sign81")!),
        Marks(name: "82 бумага (картон), алюминий", category: "Композиционные материалы" , desc: "", pict: UIImage(named: "sign82")!),
        Marks(name: "83 бумага (картон), белая жесть", category: "Композиционные материалы" , desc: "", pict: UIImage(named: "sign83")!),
        Marks(name: "84 C/PAP бумага (картон), пластик, алюминий", category: "Композиционные материалы" , desc: "", pict: UIImage(named: "sign84")!),
        Marks(name: "85 бумага (картон), пластик, алюминий, жесть", category: "Композиционные материалы" , desc: "", pict: UIImage(named: "sign85")!),
        Marks(name: "87 биоразлагаемый пластик", category: "Композиционные материалы" , desc: "", pict: UIImage(named: "sign87")!),
        Marks(name: "90 пластик, алюминий", category: "Композиционные материалы" , desc: "", pict: UIImage(named: "sign90")!),
        Marks(name: "91 пластик, белая жесть", category: "Композиционные материалы" , desc: "", pict: UIImage(named: "sign91")!),
        Marks(name: "92 пластик, различные металлы", category: "Композиционные материалы" , desc: "", pict: UIImage(named: "sign92")!),
        Marks(name: "95 стекло, пластик", category: "Композиционные материалы" , desc: "", pict: UIImage(named: "sign95")!),
        Marks(name: "96 стекло, алюминий", category: "Композиционные материалы" , desc: "", pict: UIImage(named: "sign96")!),
        Marks(name: "97 стекло, белая жесть", category: "Композиционные материалы" , desc: "", pict: UIImage(named: "sign97")!),
        Marks(name: "98 стекло различные металлы", category: "Композиционные материалы" , desc: "", pict: UIImage(named: "sign98")!),
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
        return 6
    }
    /*override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        if searching {
            return searchData[section].category
        }else {
            return allMarks[section].category
        }
    }*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            if section == 0 {
                return searchData.filter({$0.category == "Пластмассы"}).count
            }
            if section == 1 {
                return searchData.filter({$0.category == "Бумага"}).count
            }
            if section == 2 {
                return searchData.filter({$0.category == "Металлы"}).count
            }
            if section == 3 {
                return searchData.filter({$0.category == "Органические материалы природного происхождения"}).count
            }
            if section == 4 {
                return searchData.filter({$0.category == "Стекло"}).count
            }
            return searchData.filter({$0.category == "Композиционные материалы"}).count
            }
            //return searchData[section].name!.count//
            //return searchData.count
        else {
            if section == 0 {
                return allMarks.filter({$0.category == "Пластмассы"}).count
            }
            if section == 1 {
                return allMarks.filter({$0.category == "Бумага"}).count
            }
            if section == 2 {
                return allMarks.filter({$0.category == "Металлы"}).count
            }
            if section == 3 {
                return allMarks.filter({$0.category == "Органические материалы природного происхождения"}).count
            }
            if section == 4 {
                return allMarks.filter({$0.category == "Стекло"}).count
            }
            return allMarks.filter({$0.category == "Композиционные материалы"}).count
        }
        //return allMarks[section].name!.count//
        //return allMarks.count
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if searching {
            if (searchData.filter({$0.category! == "Пластмассы"}).isEmpty) && (section == 0) {
            return 0
            }
            if (searchData.filter({$0.category! == "Бумага"}).isEmpty) && (section == 1) {
            return 0
            }
            if (searchData.filter({$0.category! == "Металлы"}).isEmpty) && (section == 2) {
            return 0
            }
            if (searchData.filter({$0.category! == "Органические материалы природного происхождения"}).isEmpty) && (section == 3) {
            return 0
            }
            if (searchData.filter({$0.category! == "Стекло"}).isEmpty) && (section == 4) {
            return 0
            }
            if (searchData.filter({$0.category! == "Композиционные материалы"}).isEmpty) && (section == 5) {
            return 0
            }
        }
        return tableView.sectionHeaderHeight
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        if section == 0 {
            label.text = "Пластмассы"
        }
        if section == 1 {
            label.text = "Бумага"
        }
        if section == 2{
            label.text = "Металлы"
        }
        if section == 3{
            label.text = "Органические материалы \n природного происхождения"
        }
        if section == 4{
            label.text = "Стекло"
        }
        if section == 5{
            label.text = "Композиционные материалы"
        }
        label.backgroundColor = .systemGray6
        return label
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MarksTableViewCell
        
        if indexPath.section == 0 {
            let marksCell = allMarks.filter({$0.category! == "Пластмассы"})[indexPath.row]
            let marksCellSearch = searchData.filter({$0.category! == "Пластмассы"})[indexPath.row]
            
            if searching {
                cell.labelCell?.text = marksCellSearch.name
                cell.imageCell?.image = marksCellSearch.pict
            } else{
            cell.labelCell?.text = marksCell.name
            cell.imageCell?.image = marksCell.pict
            }
        }
        if indexPath.section == 1 {
            let marksCell = allMarks.filter({$0.category! == "Бумага"})[indexPath.row]
            let marksCellSearch = searchData.filter({$0.category! == "Бумага"})[indexPath.row]
            
            if searching {
                cell.labelCell?.text = marksCellSearch.name
                cell.imageCell?.image = marksCellSearch.pict
            } else{
            cell.labelCell?.text = marksCell.name
            cell.imageCell?.image = marksCell.pict
            }
        }
        if indexPath.section == 2 {
            let marksCell = allMarks.filter({$0.category! == "Металлы"})[indexPath.row]
            let marksCellSearch = searchData.filter({$0.category! == "Металлы"})[indexPath.row]
            
            if searching {
                cell.labelCell?.text = marksCellSearch.name
                cell.imageCell?.image = marksCellSearch.pict
            } else{
            cell.labelCell?.text = marksCell.name
            cell.imageCell?.image = marksCell.pict
            }
        }
        if indexPath.section == 3 {
           let marksCell = allMarks.filter({$0.category! == "Органические материалы природного происхождения"})[indexPath.row]
           let marksCellSearch = searchData.filter({$0.category! == "Органические материалы природного происхождения"})[indexPath.row]
            
            if searching {
                cell.labelCell?.text = marksCellSearch.name
                cell.imageCell?.image = marksCellSearch.pict
            } else{
            cell.labelCell?.text = marksCell.name
            cell.imageCell?.image = marksCell.pict
            }
        }
        if indexPath.section == 4 {
          let marksCell = allMarks.filter({$0.category! == "Стекло"})[indexPath.row]
          let marksCellSearch = searchData.filter({$0.category! == "Стекло"})[indexPath.row]
            
            if searching {
                cell.labelCell?.text = marksCellSearch.name
                cell.imageCell?.image = marksCellSearch.pict
            } else{
            cell.labelCell?.text = marksCell.name
            cell.imageCell?.image = marksCell.pict
            }
        }
        if indexPath.section == 5 {
          let marksCell = allMarks.filter({$0.category! == "Композиционные материалы"})[indexPath.row]
          let marksCellSearch = searchData.filter({$0.category! == "Композиционные материалы"})[indexPath.row]
            
            if searching {
                cell.labelCell?.text = marksCellSearch.name
                cell.imageCell?.image = marksCellSearch.pict
            } else{
            cell.labelCell?.text = marksCell.name
            cell.imageCell?.image = marksCell.pict
            }
        }
        /*let marksCell = allMarks[indexPath.row]
        let marksCellSearch = searchData[indexPath.row]*/
        
        /*if searching {
            cell.labelCell?.text = marksCellSearch.name
            cell.imageCell?.image = marksCellSearch.pict
        } else{
        cell.labelCell?.text = marksCell.name
        cell.imageCell?.image = marksCell.pict
        }*/
        return cell
         
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchData = allMarks.filter({($0.name!.lowercased().prefix(searchText.count) == searchText.lowercased()) || ($0.name!.lowercased().suffix(searchText.count) == searchText.lowercased()) || ($0.name!.lowercased().contains(searchText.lowercased()))})
        /*searchData = allMarks.filter({$0.name!.lowercased().contains(searchText.lowercased())})*/
        
        searching = true
        tableView.reloadData()}
       }
       
       /*func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
           searching = false
           searchBarMarks.text = ""
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


