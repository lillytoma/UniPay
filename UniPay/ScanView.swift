import SwiftUI
import AVFoundation
import Vision

struct ScanView: View {
    @State private var recognizedPrice: String = ""
    @State private var selectedCurrency: String = "USD"
    @State private var convertedAmount: Double = 0.0
    
    // Conversion rates (same as HomeView)
    let conversionRates: [String: Double] = [
        "USD": 1.0,
        "Pounds": 0.75,
        "Lera": 0.85,
        "Yuan": 6.45,
        "Euro": 0.9,
        "Rupees": 83.5,
        "Won": 1330.0,
        "Pesos": 18.5,
        "Yen": 130.0,
        "Franc": 0.92,
        "CAD": 1.25
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Scan a Price Tag!")
                    .font(.headline)
                    .padding()
                
                // Camera preview
                CameraView(recognizedText: $recognizedPrice)
                    .frame(height: 300)
                    .cornerRadius(10)
                    .padding()
                
                if !recognizedPrice.isEmpty {
                    Text("Recognized Price: \(recognizedPrice)")
                        .font(.headline)
                        .padding(.top)
                    
                    Picker("Select Currency", selection: $selectedCurrency) {
                        ForEach(conversionRates.keys.sorted(), id: \.self) { currency in
                            Text(currency).tag(currency)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                    
                    if let price = Double(recognizedPrice.replacingOccurrences(of: "$", with: "").trimmingCharacters(in: .whitespaces)),
                       let rate = conversionRates[selectedCurrency] {
                        Text("Converted Price: \(selectedCurrency) \(price * rate, specifier: "%.2f")")
                            .font(.headline)
                            .padding(.top)
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Scan")
        }
    }
}

// MARK: - CameraView
struct CameraView: UIViewControllerRepresentable {
    @Binding var recognizedText: String
    
    func makeUIViewController(context: Context) -> CameraViewController {
        let cameraVC = CameraViewController()
        cameraVC.delegate = context.coordinator
        return cameraVC
    }
    
    func updateUIViewController(_ uiViewController: CameraViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, CameraViewControllerDelegate {
        var parent: CameraView
        
        init(_ parent: CameraView) {
            self.parent = parent
        }
        
        func didCaptureText(_ text: String) {
            parent.recognizedText = text
        }
    }
}

// MARK: - CameraViewController
protocol CameraViewControllerDelegate: AnyObject {
    func didCaptureText(_ text: String)
}

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    weak var delegate: CameraViewControllerDelegate?
    
    private let captureSession = AVCaptureSession()
    private let textRecognitionRequest = VNRecognizeTextRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCamera()
        setupVision()
    }
    
    private func setupCamera() {
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        guard let input = try? AVCaptureDeviceInput(device: captureDevice) else { return }
        
        captureSession.addInput(input)
        let output = AVCaptureVideoDataOutput()
        output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "cameraQueue"))
        captureSession.addOutput(output)
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.frame = view.layer.bounds
        previewLayer.videoGravity = .resizeAspectFill
        view.layer.addSublayer(previewLayer)
        
        captureSession.startRunning()
    }
    
    private func setupVision() {
        textRecognitionRequest.recognitionLevel = .accurate
        textRecognitionRequest.usesLanguageCorrection = true
    }
    
    func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
        guard let pixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        let requestHandler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:])
        
        do {
            try requestHandler.perform([textRecognitionRequest])
            if let results = textRecognitionRequest.results as? [VNRecognizedTextObservation] {
                for result in results {
                    if let candidate = result.topCandidates(1).first {
                        // Detect price-like patterns (e.g., $99.99)
                        if candidate.string.contains("$") || candidate.string.range(of: "\\d+\\.\\d{2}", options: .regularExpression) != nil {
                            DispatchQueue.main.async { [weak self] in
                                self?.delegate?.didCaptureText(candidate.string)
                            }
                            return
                        }
                    }
                }
            }
        } catch {
            print("Error recognizing text: \(error)")
        }
    }
}
