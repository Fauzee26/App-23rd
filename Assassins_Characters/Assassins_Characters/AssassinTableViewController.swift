//
//  AssassinTableViewController.swift
//  Assassins_Characters
//
//  Created by Muhammad Hilmy Fauzi on 28/11/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class AssassinTableViewController: UITableViewController {
    
    var namaSelected:String?
    var tahunSelected:String?
    var infoSelected:String?
    var jenisSelected:String?

    var nampungId : String? = nil
    var arrayAsasin = [[String:String]]()


    override func viewDidLoad() {
        super.viewDidLoad()

        let params = ["id_asasin" : nampungId]
        let url = "http://localhost/Data/index.php/api/getAsasin"
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON(completionHandler:
            { (response) in
                
                if response.result.isSuccess {
                    //kalau response suces kita ambil json
                    let json = JSON(response.result.value as Any)
                    print(json)
                    //get jsonaray dari json arrayq
                    self.arrayAsasin = json["List Assasin"].arrayObject as! [[String : String]]
                    //check d log
                    //check jumlah array
                    if (self.arrayAsasin.count > 0){
                        
                        //refresh tableview
                        self.tableView.reloadData()
                    }
                }else{
                    print("Error Server")
                }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayAsasin.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPondok", for: indexPath) as! AssassinTableViewCell

        var serverid = arrayAsasin[indexPath.row]
        
        var nama = serverid["nama"]
        cell.lblNama.text = nama

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("Row \(indexPath.row)selected")
        
        let task = arrayAsasin[indexPath.row]
        namaSelected = task["nama"] as! String
        tahunSelected = task["tahun_hidup"] as! String
        infoSelected = task["info"] as! String
        jenisSelected = task["jenis_asasin"] as! String

        performSegue(withIdentifier: "passData", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "passData" {
            
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let controller = segue.destination as! ViewController
                let value = arrayAsasin[indexPath.row]
                
                controller.passNama = value["nama"] as! String
                controller.passTahun = value["tahun_hidup"] as! String
                controller.passInfo = value["info"] as! String
                controller.passJenis = value["jenis_asasin"] as! String
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
