import SwiftUI
import PencilKit

struct ResultCanvas: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView

    func makeUIView(context: Context) -> PKCanvasView {
        if #available(iOS 14.0, *) {
            canvasView.drawingPolicy = .anyInput
        } else {
            // Fallback on earlier versions
        }
        canvasView.tool = PKInkingTool(.pen, color: .black, width: 15)
        return canvasView
    }

    func updateUIView(_ canvasView: PKCanvasView, context: Context) { }
}
