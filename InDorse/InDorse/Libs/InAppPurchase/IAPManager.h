//
//  IAPManager.h
//  Ripple Training
//
//  Created by Ashwin Jumani on 25/10/13.
//  Copyright (c) 2012 Brians.com. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "StoreKit/StoreKit.h"


#define kProductsLoadedNotification         @"ProductsLoaded"
#define kProductPurchasedNotification       @"ProductPurchased"
#define kProductRestoredNotification       @"ProductRestored"
#define kProductPurchaseFailedNotification  @"ProductPurchaseFailed"
#define kProductRestoreFailedNotification  @"ProductRestoreFailed"


@interface IAPManager : UIViewController <SKProductsRequestDelegate, SKPaymentTransactionObserver> {

    NSSet * _productIdentifiers;    
    NSArray * _products;
    NSMutableSet * _purchasedProducts;
    SKProductsRequest * _request;
    
    //API
    NSString *currentProductIdentifier;
}

@property (retain) NSSet *productIdentifiers;
@property (retain) NSArray * products;
@property (retain) NSMutableSet *purchasedProducts;
@property (retain) SKProductsRequest *request;



//Method for Request Products from itune
- (void)requestProducts;

//Method for initialize products
- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers;

//Method for buy product with product Identifier
//- (void)buyProductIdentifier:(NSString *)productIdentifier;

//Method for purchase product
- (void)purchaseProduct:(SKProduct *)product;


//Method for Restore all Transactions
-(void) restoreAllTransaction;

//Method for complete transaction
- (void)completeTransaction:(SKPaymentTransaction *)transaction;

//Method for restore transaction
- (void)restoreTransaction:(SKPaymentTransaction *)transaction;

//Method for failed transaction
- (void)failedTransaction:(SKPaymentTransaction *)transaction;

//Method for show alert
-(void)showAlert:(NSString *)theTitle :(NSString *)theMessage;

@end
