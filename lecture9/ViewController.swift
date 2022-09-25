import UIKit
import SnapKit

class ViewController: UIViewController {
    
    override func viewDidLayoutSubviews() {
        initListener(view: self.view)
    }
    
    private func createSquare(startX: Int, endX: Int, startY: Int, endY: Int){
        let square = UIView()
        square.backgroundColor = .randomColor
        
        self.view.addSubview(square)
        
        let randomSize = Int.getRandomSize(maxValue: endX - startX)
        let randomCoordinates = Int.getRandomCoordinates(
            startX: startX,
            endX: endX - randomSize,
            startY: startY,
            endY: endY - randomSize
        )
        
        square.snp.makeConstraints { (make) in
            make.size
                .equalTo(CGSize(width: randomSize, height: randomSize))
            make.top
                .equalTo(randomCoordinates.0)
            make.leading
                .equalTo(randomCoordinates.1)
        }
        
        initListener(view: square)
    }
    
    private func initListener(view: UIView){
        let gesture = UITapGestureRecognizer(
            target: self,
            action: #selector(onViewClickListener(_:))
        )
        view.addGestureRecognizer(gesture)
    }
    
    @objc private func onViewClickListener(_ sender: UITapGestureRecognizer){
        for _ in 0..<3 {
            createSquare(
                startX: Int(sender.view!.frame.minX),
                endX: Int(sender.view!.frame.maxX),
                startY: Int(sender.view!.frame.minY),
                endY: Int(sender.view!.frame.maxY)
            )
        }
    }
}

