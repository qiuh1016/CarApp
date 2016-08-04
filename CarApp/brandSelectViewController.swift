//
//  CarSelectViewController.swift
//  CarApp
//
//  Created by qiuhong on 8/4/16.
//  Copyright © 2016 CETCME. All rights reserved.
//

import UIKit

class brandSelectViewController: UITableViewController {
    
    let A = ["阿斯顿马丁", "奥迪"];
    let B = ["巴博斯", "宝马", "宝沃", "保时捷", "奔驰", "本田", "比亚迪", "标致", "别克", "宾利", "布加迪"]
    let C = ["长安", "长城"]
    let D = ["DS", "大众", "道奇", "东风", "东南"]
    let F = ["法拉利", "菲亚特", "丰田", "福特", "福田", "福特野马"]
    let G = ["GMC", "观致", "广汽传祺"]
    let H = ["哈弗", "海格", "海马", "悍马", "红旗"]
    let J = ["Jeep", "吉利", "江淮", "江铃", "捷豹", "金杯"]
    let K = ["凯迪拉克", "克莱斯勒"]
    let L = ["兰博基尼", "劳斯莱斯", "雷克萨斯", "雷诺", "林肯", "铃木", "陆风", "路虎"]
    let M = ["MG", "MINI", "马自达", "玛莎拉蒂", "迈巴赫", "迈凯轮", "摩根"]
    let N = ["纳智捷"]
    let O = ["讴歌", "欧宝", "欧朗"]
    let P = ["帕加尼"]
    let Q = ["奇瑞", "起亚"]
    let R = ["日产", "荣威", "瑞麒"]
    let S = ["smart", "三菱", "斯巴鲁", "斯柯达"]
    let T = ["特斯拉", "腾势"]
    let W = ["沃尔沃"]
    let X = ["现代", "雪佛兰", "雪铁龙"]
    let Y = ["一汽", "英菲尼迪"]
    let Z = ["中华", "众泰"]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 22
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        switch section {
        case 0:
            return A.count
        case 1:
            return B.count
        case 2:
            return C.count
        case 3:
            return D.count
        case 4:
            return F.count
        case 5:
            return C.count
        case 6:
            return G.count
        case 7:
            return H.count
        case 8:
            return J.count
        case 9:
            return K.count
        case 10:
            return L.count
        case 11:
            return M.count
        case 12:
            return N.count
        case 13:
            return O.count
        case 14:
            return P.count
        case 15:
            return Q.count
        case 16:
            return R.count
        case 17:
            return S.count
        case 18:
            return T.count
        case 19:
            return W.count
        case 20:
            return X.count
        case 21:
            return Y.count
        case 22:
            return Z.count
        default:
            break
        }
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("brandSelectCell", forIndexPath: indexPath)
        
        let textLabel = cell.viewWithTag(1001) as! UILabel
        let imageView = cell.viewWithTag(1000) as! UIImageView
        
        textLabel.text = getCarName(indexPath)
        imageView.image = UIImage(named: getCarName(indexPath))
        

        // Configure the cell...

        return cell
    }
    
    func getCarName(indexPath: NSIndexPath) -> String {
        switch indexPath.section {
        case 0:
            return A[indexPath.row]
        case 1:
            return B[indexPath.row]
        case 2:
            return C[indexPath.row]
        case 3:
            return D[indexPath.row]
        case 4:
            return F[indexPath.row]
        case 5:
            return C[indexPath.row]
        case 6:
            return G[indexPath.row]
        case 7:
            return H[indexPath.row]
        case 8:
            return J[indexPath.row]
        case 9:
            return K[indexPath.row]
        case 10:
            return L[indexPath.row]
        case 11:
            return M[indexPath.row]
        case 12:
            return N[indexPath.row]
        case 13:
            return O[indexPath.row]
        case 14:
            return P[indexPath.row]
        case 15:
            return Q[indexPath.row]
        case 16:
            return R[indexPath.row]
        case 17:
            return S[indexPath.row]
        case 18:
            return T[indexPath.row]
        case 19:
            return W[indexPath.row]
        case 20:
            return X[indexPath.row]
        case 21:
            return Y[indexPath.row]
        case 22:
            return Z[indexPath.row]
        default:
            return ""
        }
        
    }
 
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "A"
        case 1:
            return "B"
        case 2:
            return "C"
        case 3:
            return "D"
        case 4:
            return "F"
        case 5:
            return "C"
        case 6:
            return "G"
        case 7:
            return "H"
        case 8:
            return "J"
        case 9:
            return "K"
        case 10:
            return "L"
        case 11:
            return "M"
        case 12:
            return "N"
        case 13:
            return "O"
        case 14:
            return "P"
        case 15:
            return "Q"
        case 16:
            return "R"
        case 17:
            return "S"
        case 18:
            return "T"
        case 19:
            return "W"
        case 20:
            return "X"
        case 21:
            return "Y"
        case 22:
            return "Z"
        default:
            return ""
        }

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        performSegueWithIdentifier("carSelectSegue", sender: nil)
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return ["A", "B", "C", "D", "F", "G", "H", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "W", "X", "Y", "Z"]
    }
    
//    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headView = UIView(frame: CGRectMake(0, 0, 100, 28))
//        let label = UILabel(frame: CGRectMake(15, 0, 100, 20))
//        label.text = "测试"
//        label.font = UIFont(name: "Helvetica Neue", size: 12)
//        label.textColor = UIColor.grayColor()
//        label.center.y = headView.bounds.size.height / 2
//        headView.addSubview(label)
//        return headView
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
