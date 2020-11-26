//
//  ScannerViewController.swift
//  project_eco_find
//
//  Created by Надя Мурдашева on 25.11.2020.
//  Copyright © 2020 Надя Мурдашева. All rights reserved.
//

import UIKit
import VisionKit
import Vision

class ScannerViewController: UIViewController, VNDocumentCameraViewControllerDelegate {

   /* override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }*/
    
    @IBOutlet weak var searchMapViaScan: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    
    var textRecognitionRequest = VNRecognizeTextRequest(completionHandler: nil)
    private let textRecognitionWorkQueue = DispatchQueue(label: "MyVisionScannerQueue", qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.isEditable = false
        setupVision()
    }

    @IBAction func btnTakePicture(_ sender: Any) {
        
        let scannerViewController = VNDocumentCameraViewController()
        scannerViewController.delegate = self
        present(scannerViewController, animated: true)
    }
    
    private func setupVision() {
        textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else { return }
            
            var detectedText = ""
            for observation in observations {
                guard let topCandidate = observation.topCandidates(1).first else { return }
                print("text \(topCandidate.string) has confidence \(topCandidate.confidence)")
    
                detectedText += topCandidate.string
                //detectedText += "\n"
                
            
            }
            
            DispatchQueue.main.async {
                self.textView.text = detectedText
                self.textView.flashScrollIndicators()
                switch self.textView.text {
                case "PET","PE","PE-HD","PEHD","HDPE","PVC","PE-LD","PELD","LDPE","PP","PS","O","OTHER","ABS","pet","pe","pe-hd","pehd","hdpe","pvc","pe-ld","peld","ldpe","pp","ps","o","other","abs","PAP","PCB","PPB","pap","pcb","ppb","FE","ALU","fe","alu","FOR","TEX","COT","for","tex","cot","GLS","GL","gls","gl","PapPet","Pap Pet","PAPPET","PAP PET","C/PAP","c/pap","Tetra Pak","TETRA PAK","tetra pak","TETRAPAK","tetrapak","TetraPak":
                    self.searchMapViaScan.isHidden = false
                default:
                    self.searchMapViaScan.isHidden = false
                    self.textView.text = "Не удалось отсканировать маркировку. Сфотографируйте и отсканируйте маркировку повторно."
                }
                

            }
        }

        textRecognitionRequest.recognitionLevel = .accurate
    }
    
    private func processImage(_ image: UIImage) {
        imageView.image = image
        recognizeTextInImage(image)
    }
    
    private func recognizeTextInImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        
        textView.text = ""
        textRecognitionWorkQueue.async {
            let requestHandler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            do {
                try requestHandler.perform([self.textRecognitionRequest])
            } catch {
                print(error)
            }
        }
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
        guard scan.pageCount >= 1 else {
            controller.dismiss(animated: true)
            return
        }
        
        let originalImage = scan.imageOfPage(at: 0)
        let newImage = compressedImage(originalImage)
        controller.dismiss(animated: true)
        
        processImage(newImage)
    }
    
    func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
        print(error)
        controller.dismiss(animated: true)
    }
    
    func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
        controller.dismiss(animated: true)
    }

    func compressedImage(_ originalImage: UIImage) -> UIImage {
        guard let imageData = originalImage.jpegData(compressionQuality: 1),
            let reloadedImage = UIImage(data: imageData) else {
                return originalImage
        }
        return reloadedImage
    }
    
    
    @IBAction func searchMapFromScan(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let secondViewController = storyboard.instantiateViewController(identifier: "MapViewController") as? MapViewController else { return }
        switch textView.text {
        case "PET","PE","PE-HD","PEHD","HDPE","PVC","PE-LD","PELD","LDPE","PP","PS","O","OTHER","ABS","pet","pe","pe-hd","pehd","hdpe","pvc","pe-ld","peld","ldpe","pp","ps","o","other","abs":
            secondViewController.index = 1
        case "PAP","PCB","PPB","PBD","pap","pcb","ppb","pbd":
            secondViewController.index = 2
        case "FE","ALU","fe","alu":
            secondViewController.index = 3
        case "FOR","TEX","COT","for","tex","cot":
            secondViewController.index = 4
        case "GLS","GL","gls","gl":
            secondViewController.index = 5
        case "PapPet","Pap Pet","PAPPET","PAP PET","C/PAP","c/pap","Tetra Pak","TETRA PAK","tetra pak","TETRAPAK","tetrapak","TetraPak":
            secondViewController.index = 6
        default:
            secondViewController.index = 0
            /*textView.text = "Не удалось отсканировать маркировку. Сфотографируйте и отсканируйте маркировку повторно"
            searchMapViaScan.isHidden = true*/
        }
        /*rightBarItem.isEnabled = false
        rightBarItem.tintColor = UIColor.clear*/
        /*rightBarItem.isEnabled = true
        rightBarItem.tintColor = UIColor.blue*/
        secondViewController.index = nil
        show(secondViewController, sender: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
