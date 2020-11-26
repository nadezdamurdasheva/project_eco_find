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
            }
            
            DispatchQueue.main.async {
                self.textView.text = detectedText
                self.textView.flashScrollIndicators()
                switch self.textView.text {
                case "PET","pet":
                    self.textView.text = "PET. Полиэтилентерефталат (лавсан), пластмасса."
                    self.searchMapViaScan.isHidden = false
                case "PE","PE-HD","PEHD","HDPE","pe","pe-hd","pehd","hdpe":
                    self.textView.text = "PE PE-HD PEHD HDPE. Полиэтилен высокой плотности (низкого давления), пластмасса."
                    self.searchMapViaScan.isHidden = false
                case  "PVC","pvc":
                    self.textView.text = "PVC. Поливинилхлорид, пластмасса."
                    self.searchMapViaScan.isHidden = false
                case "PE-LD","PELD","LDPE","pe-ld","peld","ldpe":
                    self.textView.text = "PE-LD PELD LDPE. Полиэтилен низкой плотности (высокого давления), пластмасса."
                    self.searchMapViaScan.isHidden = false
                case "PP","pp":
                    self.textView.text = "PP. Полистирол, пластмасса."
                    self.searchMapViaScan.isHidden = false
                case "PS","ps":
                    self.textView.text = "PS. Полистирол, пластмасса."
                    self.searchMapViaScan.isHidden = false
                case "O","OTHER","o","other":
                    self.textView.text = "O OTHER. Остальные виды пластика, пластмасса."
                    self.searchMapViaScan.isHidden = false
                case "ABS","abs":
                    self.textView.text = "ABS. АБС-пластик, пластмасса."
                    self.searchMapViaScan.isHidden = false
                case "PCB","pcb":
                    self.textView.text = "PAP PCB. Гофрированный картон, бумага."
                    self.searchMapViaScan.isHidden = false
                case "PAP","pap":
                    self.textView.text = "PAP. Бумага."
                    self.searchMapViaScan.isHidden = false
                case "PPB","ppb":
                    self.textView.text = "PAP PPB. Вощённая бумага."
                    self.searchMapViaScan.isHidden = false
                case "FE","fe":
                    self.textView.text = "FE. Сталь, металл."
                    self.searchMapViaScan.isHidden = false
                case "ALU","alu":
                    self.textView.text = "ALU. Алюминий, металл."
                    self.searchMapViaScan.isHidden = false
                case "FOR","for":
                    self.textView.text = "FOR. Древесина, органический материал."
                    self.searchMapViaScan.isHidden = false
                case "TEX","tex":
                    self.textView.text = "TEX. Хлопок или джутовое волокно, органический материал."
                    self.searchMapViaScan.isHidden = false
                case "COT","cot":
                    self.textView.text = "TEX COT. Джутовое волокно, органический материал."
                    self.searchMapViaScan.isHidden = false
                case "GLS","GL","gls","gl":
                    self.textView.text = "GL GLS. Стекло"
                    self.searchMapViaScan.isHidden = false
                case "PapPet","Pap Pet","PAPPET","PAP PET","C/PAP","c/pap","Tetra Pak","TETRA PAK","tetra pak","TETRAPAK","tetrapak","TetraPak","C/PP","c/pp":
                    self.textView.text = "PapPet C/PAP C/PP TetraPak. Комопзиционный материал"
                    self.searchMapViaScan.isHidden = false
                default:
                    self.searchMapViaScan.isHidden = true
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
        case "PET. Полиэтилентерефталат (лавсан), пластмасса.", "PE PE-HD PEHD HDPE. Полиэтилен высокой плотности (низкого давления), пластмасса.","PVC. Поливинилхлорид, пластмасса.","PE-LD PELD LDPE. Полиэтилен низкой плотности (высокого давления), пластмасса.","PP. Полистирол, пластмасса.","PS. Полистирол, пластмасса.","O OTHER. Остальные виды пластика, пластмасса.","ABS. АБС-пластик, пластмасса.":
            secondViewController.index = 1
        case "PAP PCB. Гофрированный картон, бумага.","PAP. Бумага.","PAP PPB. Вощённая бумага.":
            secondViewController.index = 2
        case "FE. Сталь, металл.","ALU. Алюминий, металл.":
            secondViewController.index = 3
        case "FOR. Древесина, органический материал.","TEX. Хлопок или джутовое волокно, органический материал.","TEX COT. Джутовое волокно, органический материал.":
            secondViewController.index = 4
        case "GL GLS. Стекло":
            secondViewController.index = 5
        case "PapPet C/PAP C/PP TetraPak. Комопзиционный материал":
            secondViewController.index = 6
        default:
            secondViewController.index = 0
        }
        secondViewController.rightBarItem.isEnabled = false
        show(secondViewController, sender: nil)
    }
}
