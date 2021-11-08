protocol BaseViewProtocol: AnyObject {
    func startActivity()
    func stopActivity()
    func presentError(message: String)
}
