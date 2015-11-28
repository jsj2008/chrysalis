#import "CSAdvancedListController.h"
#import "../CSAppSwitcherViewController.h"
#include <dlfcn.h>
#import "CSAdvancedBackgroundGradientView.h"
#import <UIKit/UIImage+Private.h>
#import <UIKit/UINavigationBar+Private.h>

@implementation CSAdvancedListController {
	CSAdvancedBackgroundGradientView *_backgroundGradientView;
	CSAppSwitcherViewController *_liveAppSwitcherView;
}

#pragma mark Cephei - HBListController

+ (NSString *)hb_specifierPlist {
	return @"Advanced";
}

#pragma mark CSAdvancedListController

- (instancetype)init {
	if (self = [super init]) {
		dlopen("/Library/MobileSubstrate/DynamicLibraries/Chrysalis.dylib", RTLD_NOW);
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	UIView *viewToAddGradientTo = [[UIView alloc] initWithFrame:CGRectMake(0, 34, [[UIScreen mainScreen] bounds].size.width, 95)];

	_liveAppSwitcherView = [[%c(CSAppSwitcherViewController) alloc] init];
	_liveAppSwitcherView.view.userInteractionEnabled = NO;
	_liveAppSwitcherView.view.frame = viewToAddGradientTo.bounds;

	_backgroundGradientView = [[CSAdvancedBackgroundGradientView alloc] init];
	_backgroundGradientView.frame = CGRectMake(0, 0, self.view.frame.size.width, 183);

	[_backgroundGradientView addSubview:viewToAddGradientTo];

	[viewToAddGradientTo addSubview:_liveAppSwitcherView.view];
	[self addChildViewController:_liveAppSwitcherView];
	[_liveAppSwitcherView didMoveToParentViewController:self];

	self.table.tableHeaderView = _backgroundGradientView;
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	[self.realNavigationController.navigationBar _setHidesShadow:YES];
}

- (void)viewDidLayoutSubviews {
	[super viewDidLayoutSubviews];
	[self.realNavigationController.navigationBar _setHidesShadow:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[self.realNavigationController.navigationBar _setHidesShadow:NO];
}

@end
