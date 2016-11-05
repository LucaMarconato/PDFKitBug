# PDFKitBug
Minimal working example for describing a problem that I have encountered with PDFKit Annotations.

I am using macOS Sierra and Xcode 8.0
If you clone the project in the root the path of test.pdf will be correctly handled, otherwise remember to modify the variable "pdfPath" in order to load a .pdf file.

If you press the button a random annotation will be added to the document, but you will not be able to see it unless **zoom in and out** the page.
I would like to able to see the annotations as soon as I press the button.
