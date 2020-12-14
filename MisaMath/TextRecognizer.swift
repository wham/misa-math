import SwiftUI
import Vision

public struct TextRecognizer {
    private let textRecognitionWorkQueue = DispatchQueue(label: "TextRecognitionQueue",
                                                         qos: .userInitiated, attributes: [], autoreleaseFrequency: .workItem)
 
    func recognizeText(from image: CGImage) -> String {
        var tmp = ""
        let textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
            guard let observations = request.results as? [VNRecognizedTextObservation] else {
                print("The observations are of an unexpected type.")
                return
            }
            // Concatenate the recognised text from all the observations.
            let maximumCandidates = 1
            for observation in observations {
                guard let candidate = observation.topCandidates(maximumCandidates).first else { continue }
                tmp += candidate.string + "\n"
            }
        }
        textRecognitionRequest.recognitionLevel = .accurate
            let requestHandler = VNImageRequestHandler(cgImage: image, options: [:])
 
            do {
                try requestHandler.perform([textRecognitionRequest])
            } catch {
                print(error)
            }
            tmp += "\n\n"
        return tmp
    }
 
}
