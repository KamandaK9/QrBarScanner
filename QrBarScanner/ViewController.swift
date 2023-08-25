//
//  ViewController.swift
//  QrBarScanner
//
//  Created by Daniel Senga on 2023/03/06.
//

import UIKit

class ViewController: UIViewController, ScannerViewDelegate {
	@IBOutlet weak var scanTxtfield: UITextField!
	@IBOutlet weak var btnScan: UIButton!
	let scannerViewController = ScannerViewController()
	var textFound = ""
	var scannedItems = [String]()
	var completeItems = ["6001008763762", "6009611481394", "6002305012416"]
	
	@IBOutlet weak var loadingCompleteLbl: UILabel!
	@IBOutlet weak var itemsList: UITextView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		scannerViewController.delegate = self
		setupUI()
		
		
		
	}
	
	private func checkComplete() {
		let set1 = Set(scannedItems)
		let set2 = Set(completeItems)
		
		if set1 == set2 {
			loadingCompleteLbl.text = "Loading Completed ✅ "
			loadingCompleteLbl.isHidden = false
		} else {
			loadingCompleteLbl.text = "Loading \(scannedItems.count) / 3"
		}
	}
	
	func didFindScannedText(text: String) {
		scanTxtfield.text = text
		textFound = text
		if !scannedItems.contains(text) {
			scannedItems.append(text)
		}
		
		let allitems = scannedItems.joined(separator: "\n")
		itemsList.text = allitems
		
		
	}
	
	@IBAction func onBtnScan(_ sender: Any) {
		
		self.navigationController?.pushViewController(scannerViewController, animated: true)
	}
	
	private func setupUI() {
	
			scanTxtfield.text = "Waiting for scan."
			scanTxtfield.textColor = .white
			btnScan.backgroundColor = .systemBlue
			btnScan.setTitle("Scan Code", for: .normal)
			btnScan.setTitleColor(.white, for: .normal)
		

		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		checkComplete()
	}
	

}

