public class LKCentralNotificationController : UIViewController, UIGestureRecognizerDelegate {
    
    var alertView : LKCentralNotification!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.1)
        
        // Create the new alert view
        self.alertView = LKCentralNotification(frame: CGRect(x: 24, y: 24, width: 200, height: 200))
        self.alertView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.alertView)
        
        // Add a recognizer to close the controller when it is tapped
        let closer = UITapGestureRecognizer(target: self, action: "close")
        closer.delegate = self
        view.addGestureRecognizer(closer)
        
        // It can be opened above everything else
        self.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
        self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
    }
    
    //
    // Initializer for creating a new view with the given text
    //
    public convenience init(text:String, image:String) {
        self.init()
        self.alertView.setText(text)
        self.alertView.setImageWithName(image)
    }
    
    func close() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //
    // Required initializer
    //
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //
    // Add constraints to add the box into the middle of the page
    //
    public override func viewWillAppear(animated: Bool) {
        self.view.addConstraint(NSLayoutConstraint(item: self.alertView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0))
        self.view.addConstraint(NSLayoutConstraint(item: self.alertView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0))
        self.alertView.addConstraint(NSLayoutConstraint(item: self.alertView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 200))
        self.alertView.addConstraint(NSLayoutConstraint(item: self.alertView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: 200))
    }
    
    public override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
}