//
//  ChartsViewController.swift
//  resetIOSApp
//
//  Created by Walid Helaoui on 30/11/2017.
//  Copyright © 2017 Walid Helaoui. All rights reserved.
//

import UIKit
import SwiftCharts
import Alamofire

class DrinkingChartViewController: UIViewController {
    
    
    
    fileprivate var chart: Chart?
    
    var data : NSArray = []
    
    var nbrObottle : Int = 0
    var tuplesXY = [(0, 0)]
    
    
    
    let sideSelectorHeight: CGFloat = 50
    
    fileprivate func barsChart(horizontal: Bool) -> Chart {
        
        // tuplesXY = [(1, 17), (2, 9), (3, 8), (4, 8), (5, 7), (6, 17), (7, 17)]
        
        func reverseTuples(_ tuples: [(Int, Int)]) -> [(Int, Int)] {
            return tuples.map{($0.1, $0.0)}
        }
        
        let chartPoints = (horizontal ? reverseTuples(tuplesXY) : tuplesXY).map{ChartPoint(x: ChartAxisValueInt($0.0), y: ChartAxisValueInt($0.1))}
        
        let labelSettings = ChartLabelSettings(font: ExamplesDefaults.labelFont)
        
        let generator = ChartAxisGeneratorMultiplier(1)
        let labelsGenerator = ChartAxisLabelsGeneratorFunc {scalar in
            return ChartAxisLabel(text: "\(scalar)", settings: labelSettings)
        }
        let xGenerator = ChartAxisGeneratorMultiplier(1)
        
        print(Double(self.data.count))
        
        let xModel = ChartAxisModel(firstModelValue: 0, lastModelValue: Double(self.data.count)+1, axisTitleLabels: [ChartAxisLabel(text: "Days", settings: labelSettings)], axisValuesGenerator: xGenerator, labelsGenerator: labelsGenerator)
        let yModel = ChartAxisModel(firstModelValue: 0, lastModelValue: Double(self.nbrObottle+1), axisTitleLabels: [ChartAxisLabel(text: "Number Of Bottles", settings: labelSettings.defaultVertical())], axisValuesGenerator: generator, labelsGenerator: labelsGenerator)
        
        let barViewGenerator = {(chartPointModel: ChartPointLayerModel, layer: ChartPointsViewsLayer, chart: Chart) -> UIView? in
            let bottomLeft = layer.modelLocToScreenLoc(x: 0, y: 0)
            
            let barWidth: CGFloat = Env.iPad ? 60 : 30
            
            let settings = ChartBarViewSettings(animDuration: 0.5)
            
            let (p1, p2): (CGPoint, CGPoint) = {
                if horizontal {
                    return (CGPoint(x: bottomLeft.x, y: chartPointModel.screenLoc.y), CGPoint(x: chartPointModel.screenLoc.x, y: chartPointModel.screenLoc.y))
                } else {
                    return (CGPoint(x: chartPointModel.screenLoc.x, y: bottomLeft.y), CGPoint(x: chartPointModel.screenLoc.x, y: chartPointModel.screenLoc.y))
                }
            }()
            return ChartPointViewBar(p1: p1, p2: p2, width: barWidth, bgColor: UIColor.blue.withAlphaComponent(0.6), settings: settings)
        }
        
        let frame = ExamplesDefaults.chartFrame(view.bounds)
        let chartFrame = chart?.frame ?? CGRect(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height - sideSelectorHeight)
        
        let chartSettings = ExamplesDefaults.chartSettingsWithPanZoom
        
        let coordsSpace = ChartCoordsSpaceLeftBottomSingleAxis(chartSettings: chartSettings, chartFrame: chartFrame, xModel: xModel, yModel: yModel)
        let (xAxisLayer, yAxisLayer, innerFrame) = (coordsSpace.xAxisLayer, coordsSpace.yAxisLayer, coordsSpace.chartInnerFrame)
        
        let chartPointsLayer = ChartPointsViewsLayer(xAxis: xAxisLayer.axis, yAxis: yAxisLayer.axis, chartPoints: chartPoints, viewGenerator: barViewGenerator)
        
        let settings = ChartGuideLinesDottedLayerSettings(linesColor: UIColor.black, linesWidth: ExamplesDefaults.guidelinesWidth)
        let guidelinesLayer = ChartGuideLinesDottedLayer(xAxisLayer: xAxisLayer, yAxisLayer: yAxisLayer, settings: settings)
        
        return Chart(
            frame: chartFrame,
            innerFrame: innerFrame,
            settings: chartSettings,
            layers: [
                xAxisLayer,
                yAxisLayer,
                guidelinesLayer,
                chartPointsLayer
            ]
        )
    }
    
    fileprivate func showChart(horizontal: Bool) {
        self.chart?.clearView()
        
        let chart = barsChart(horizontal: horizontal)
        view.addSubview(chart.view)
        self.chart = chart
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        showChart(horizontal: false)
        if let chart = chart {
            let sideSelector = DirSelector(frame: CGRect(x: 0, y: chart.frame.origin.y + chart.frame.size.height, width: view.frame.size.width, height: sideSelectorHeight), controller: self)
            view.addSubview(sideSelector)
        }
        
        
        
    }
    
    override func viewDidLoad() {
        
        
        getDrinking()
        
    }
    
    
    
    class DirSelector: UIView {
        
        let horizontal: UIButton
        let vertical: UIButton
        
        weak var controller: DrinkingChartViewController?
        
        fileprivate let buttonDirs: [UIButton : Bool]
        
        init(frame: CGRect, controller: DrinkingChartViewController) {
            
            self.controller = controller
            
            horizontal = UIButton()
            horizontal.setTitle("Horizontal", for: UIControlState())
            vertical = UIButton()
            vertical.setTitle("Vertical", for: UIControlState())
            
            buttonDirs = [horizontal : true, vertical : false]
            
            super.init(frame: frame)
            
            addSubview(horizontal)
            addSubview(vertical)
            
            for button in [horizontal, vertical] {
                button.titleLabel?.font = ExamplesDefaults.fontWithSize(14)
                button.setTitleColor(UIColor.blue, for: UIControlState())
                button.addTarget(self, action: #selector(DirSelector.buttonTapped(_:)), for: .touchUpInside)
            }
        }
        
        @objc func buttonTapped(_ sender: UIButton) {
            let horizontal = sender == self.horizontal ? true : false
            controller?.showChart(horizontal: horizontal)
        }
        
        override func didMoveToSuperview() {
            let views = [horizontal, vertical]
            for v in views {
                v.translatesAutoresizingMaskIntoConstraints = false
            }
            
            let namedViews = views.enumerated().map{index, view in
                ("v\(index)", view)
            }
            
            var viewsDict = Dictionary<String, UIView>()
            for namedView in namedViews {
                viewsDict[namedView.0] = namedView.1
            }
            
            let buttonsSpace: CGFloat = Env.iPad ? 20 : 10
            
            let hConstraintStr = namedViews.reduce("H:|") {str, tuple in
                "\(str)-(\(buttonsSpace))-[\(tuple.0)]"
            }
            
            let vConstraits = namedViews.flatMap {NSLayoutConstraint.constraints(withVisualFormat: "V:|[\($0.0)]", options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict)}
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: hConstraintStr, options: NSLayoutFormatOptions(), metrics: nil, views: viewsDict)
                + vConstraits)
        }
        
        required init(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    func getDrinking() {
        
        /*let headers = [
            "Authorization": "Bearer "+ViewController.user.token
        ]*/
        let url = ViewController.ServerURL+"DrinkingDataSource.php?id="+ViewController.user.token
        Alamofire.request(url, method: .get).responseJSON {
            response in
            switch response.result {
            case .success:
                //   print(response.result.value)
                let dict = response.result.value as! NSDictionary
                self.data = dict["drinking_statistics"] as! NSArray
                //self.data = response.result.value as! NSArray
                
                for  i in  0..<self.data.count  {
                    //let p = NewsDoctor()
                    // bech yrajilna ken el contenu elli fil key main
                    let main:Dictionary=self.data[i] as! Dictionary<String,AnyObject>
                    print(main)
                    
                    
                    // p.idNews = main["idNews"] as! Int
                    // print( p.idNews )
                    let donnee = main["number"] as! String
                    print( donnee )
                    
                    self.tuplesXY.append((i, Int(donnee)!))
                    if (self.nbrObottle<Int(donnee)!){
                        self.nbrObottle = Int(donnee)!
                    }
                    // self.Newslist.append(p)
                    
                }
                
                
                print(self.data.count)
                self.barsChart(horizontal: false).update()
                
                self.chart?.update()
                self.showChart(horizontal: false)
                
                
            case .failure(let error):
                print(error)
                print("try again")
                
            }
            
            
        }
        
        
    }
}

