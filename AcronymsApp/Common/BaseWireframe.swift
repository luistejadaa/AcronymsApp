import UIKit

protocol WireframeInterface: AnyObject {
}

class BaseWireframe<BaseViewController> where BaseViewController: UIViewController {

    private unowned var _viewController: BaseViewController
    
    // to retain view controller reference upon first access
    private var temporaryStoredViewController: BaseViewController?

    init(viewController: BaseViewController) {
        temporaryStoredViewController = viewController
        _viewController = viewController
    }

}

extension BaseWireframe: WireframeInterface {

}

extension BaseWireframe {
    
    var viewController: BaseViewController {
        defer { temporaryStoredViewController = nil }
        return _viewController
    }

    var navigationController: UINavigationController? {
        return viewController.navigationController
    }

}

extension UIViewController {
    
    func presentWireframe<ViewController>(_ wireframe: BaseWireframe<ViewController>, animated: Bool = true, completion: (() -> Void)? = nil) {
        present(wireframe.viewController, animated: animated, completion: completion)
    }

}

extension UINavigationController {
    
    func pushWireframe<ViewController>(_ wireframe: BaseWireframe<ViewController>, animated: Bool = true) {
        pushViewController(wireframe.viewController, animated: animated)
    }
    
    func setRootWireframe<ViewController>(_ wireframe: BaseWireframe<ViewController>, animated: Bool = true) {
        setViewControllers([wireframe.viewController], animated: animated)
    }

}
