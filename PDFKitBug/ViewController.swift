//
//  ViewController.swift
//  PDFKitBug
//
//  Created by Luca Marconato on 05/11/2016.
//  Copyright © 2016 LucaMarconato. All rights reserved.
//

import Cocoa
import Quartz

class ViewController: NSViewController {
    @IBOutlet weak var pdfView: PDFView!
    @IBOutlet weak var button: NSButton!
    var pdf: PDFDocument?
    var pdfPage: PDFPage?

    override func viewDidLoad() {
        super.viewDidLoad()
        let pdfPath = "file:///PDFKitBug/temp.pdf"
        let url = URL(string: pdfPath)!
        pdf = PDFDocument(url: url)
        pdfView.document = pdf!
    }

    
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func addAnnotation(_ sender: AnyObject) {
        var rect = NSRect()
        rect.origin.x = CGFloat(arc4random_uniform(UInt32(self.view.frame.width)))
        rect.origin.y = CGFloat(arc4random_uniform(UInt32(self.view.frame.height)))
        rect.size.width = 10
        rect.size.height = 10
        
        pdfPage = pdf!.page(at: 0)
        
        let annotation = PDFAnnotationSquare(bounds: rect)
        annotation.setInteriorColor(NSColor.blue)
        annotation.color = NSColor.blue
        pdfPage?.displaysAnnotations = true
        pdfPage?.addAnnotation(annotation)
        pdfView.layoutDocumentView()
        pdfView.setNeedsDisplay((pdfView.documentView?.visibleRect)!)
        pdfView.go(to: pdfPage!)
    }


}

