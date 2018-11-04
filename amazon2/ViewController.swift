//
//  ViewController.swift
//  amazon2
//
//  Created by Sergiy Fugol on 10/28/18.
//  Copyright © 2017-2018 Sergiy Fugol. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        func ClosestXdestinations(numDestinations: Int, allLocations:[[Int]],
                                  numDeliveries: Int) -> [[Int]] {

            //Write code here
            var deliveryDestinations = [[Int]]()
            var possibleDeliveryWays = [Double]()
            if numDeliveries > numDestinations { return deliveryDestinations }

            for index in 0..<allLocations.count {
                // берем каждый елемент счиам квадратный корень и сохраняем в масив, потом его сортируем
                let (x, y) = (allLocations[index][0], allLocations[index][1])
                let squareRoot = sqrt(Double(x * x + y * y))
                possibleDeliveryWays.append(squareRoot)
                print("x \(x), y \(y) squareRoot \(squareRoot)")
            }
            let sortedDeliveryWay = possibleDeliveryWays.enumerated().sorted(by: {$0.element < $1.element})
            let indexSorted = sortedDeliveryWay.map{$0.offset}

            print("\n")
            print(sortedDeliveryWay)
            print(indexSorted)

            for way in 0..<numDeliveries {
                deliveryDestinations.append(allLocations[indexSorted[way]])
            }
            return deliveryDestinations
        }// end func ClosestXdestinations



        // INPUT parameters

        //let numDestinations = 3 // var 1
        //let allLocations = [[1,2],[3,4],[1,-1]] // var 1
        //let numDeliveries = 2  // var 1

        //let numDestinations = 3 // var 2
        //let allLocations = [[1,-3],[1,2],[3,4]] // var 2
        //let numDeliveries = 1  // var 2

        let numDestinations = 6     // var 3
        let allLocations = [[3,6],[2,4],[5,3],[2,7],[1,8],[7,9]] // var 3
        let numDeliveries = 3   // var 3

        let results = ClosestXdestinations(numDestinations: numDestinations, allLocations: allLocations, numDeliveries: numDeliveries)
        print ("results \(results)")
    }
}
