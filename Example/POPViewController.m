#import "POPViewController.h"
#import <WebKit/WebKit.h>
#import <PopupBridge/POPPopupBridge.h>

@interface POPViewController () <POPPopupBridgeDelegate>
@property (nonatomic, strong) WKWebView *webView;
@property (nonatomic, strong) POPPopupBridge *popupBridge;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndicatorView;
@end

@implementation POPViewController

- (NSURL *)url {
    if (!_url) {
        _url = [NSURL URLWithString:@"https://js-sdk-integration.herokuapp.com/v3/paypal-checkout?v3Version=latest&js=prod&merchant=sandbox"];
    }
    return _url;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];

    // 2. Create Popup Bridge.
    self.popupBridge = [[POPPopupBridge alloc] initWithWebView:self.webView delegate:self];

    [self.view addSubview:self.webView];
    [self.webView loadRequest:[NSURLRequest requestWithURL:self.url]];
}

- (void)popupBridge:(POPPopupBridge *)bridge requestsPresentationOfViewController:(UIViewController *)viewController {
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)popupBridge:(POPPopupBridge *)bridge requestsDismissalOfViewController:(UIViewController *)viewController {
    [viewController dismissViewControllerAnimated:YES completion:nil];
}

@end
