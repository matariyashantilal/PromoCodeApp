//
//  IAPManager.m
//  Ripple Training
//
//  Created by Ashwin Jumani on 25/10/13.
//  Copyright (c) 2012 Brians.com. All rights reserved.
//

#import "IAPManager.h"
#import "Constants.h"


@implementation IAPManager
@synthesize productIdentifiers = _productIdentifiers;
@synthesize products = _products;
@synthesize purchasedProducts = _purchasedProducts;
@synthesize request = _request;


- (id)initWithProductIdentifiers:(NSSet *)productIdentifiers
{
    if ((self = [super init]))
    {
        
        // Store product identifiers
        _productIdentifiers = [productIdentifiers retain];
        
        // Check for previously purchased products
        NSMutableSet * purchasedProducts = [NSMutableSet set];
        for (NSString * productIdentifier in _productIdentifiers)
        {
            BOOL productPurchased = [[NSUserDefaults standardUserDefaults] boolForKey:productIdentifier];
            if (productPurchased)
            {
                [purchasedProducts addObject:productIdentifier];
           
                DLog(@"Previously purchased: %@", productIdentifier);
                
            }
            else{
                DLog(@"Not purchased: %@", productIdentifier);
            }
        }
        self.purchasedProducts = purchasedProducts;
        
    }
    return self;
}


#pragma mark - Product Request

- (BOOL)canMakePurchases
{
    return [SKPaymentQueue canMakePayments];
}

- (void)loadStore
{
    // restarts any purchases if they were interrupted last time the app was open
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
}

- (void)requestProducts
{
    
    [self loadStore];
    if ( [self canMakePurchases] )
    {
        self.request = [[[SKProductsRequest alloc] initWithProductIdentifiers:_productIdentifiers] autorelease];
        _request.delegate = self;
        [_request start];
    }
    else{
        DLog(@"Unable to make payment....");
    }
    
}


-(void) restoreAllTransaction
{
    [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
}

#pragma mark - Purchase Product

-(void)purchaseProduct:(SKProduct *)product
{
    DLog(@"Buying %@...", product.productIdentifier);
    SKPayment *payment = [SKPayment paymentWithProduct:product];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

//Old method for buy product - store kit
//- (void)buyProductIdentifier:(NSString *)productIdentifier
//{
//    
//    
//    DebugLog(@"Buying %@...", productIdentifier);
//    SKPayment *payment = [SKPayment paymentWithProductIdentifier:productIdentifier];
//    [[SKPaymentQueue defaultQueue] addPayment:payment];
//    
//}


//Method for Record transaction
- (void)recordTransaction:(SKPaymentTransaction *)transaction 
{    
    // TODO: Record the transaction on the server side...
    currentProductIdentifier = transaction.payment.productIdentifier;
    [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:currentProductIdentifier];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [_purchasedProducts addObject:currentProductIdentifier];
    
        
}

//Method for provide content
- (void)provideContent:(NSString *)productIdentifier
{
    [[NSUserDefaults standardUserDefaults] setBool:TRUE forKey:productIdentifier];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [_purchasedProducts addObject:productIdentifier];
}

#pragma mark - Show Alert
//Helper method to show alert
-(void)showAlert:(NSString *)theTitle :(NSString *)theMessage
{
	
    
	UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:theTitle message:theMessage delegate:self
                                              cancelButtonTitle:NSLocalizedString(@"ok", "OK") otherButtonTitles:nil];
	[alertView show];
	[alertView release];
    
}


#pragma mark - Store Kit Delegate Methods
- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response
{
   
    self.products = response.products;
    
    DLog(@"Received products results. %@",[self.products description]);
    self.request = nil;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kProductsLoadedNotification object:_products];
}
- (void)completeTransaction:(SKPaymentTransaction *)transaction
{
    currentProductIdentifier = transaction.payment.productIdentifier;
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kProductPurchasedNotification object:currentProductIdentifier];
    
    [self recordTransaction: transaction];
    [self provideContent:transaction.payment.productIdentifier];
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
}

//Method for restore transaction
- (void)restoreTransaction:(SKPaymentTransaction *)transaction
{
    DLog(@"Restore Transaction for %@", transaction.payment.productIdentifier);
    currentProductIdentifier = transaction.payment.productIdentifier;
    [[NSNotificationCenter defaultCenter] postNotificationName:kProductRestoredNotification object:currentProductIdentifier];
    [self recordTransaction:transaction];
    [self provideContent:transaction.payment.productIdentifier];
    [[SKPaymentQueue defaultQueue] finishTransaction: transaction];
}

//Method for failed transaction
- (void)failedTransaction:(SKPaymentTransaction *)transaction
{
    if (transaction.error.code != SKErrorPaymentCancelled)
    {
        DebugLog(@"Transaction error: %@", transaction.error.localizedDescription);
    }
    else
    {
        DLog(@"Transaction Cancelled");
    }
    
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
    [[NSNotificationCenter defaultCenter] postNotificationName:kProductPurchaseFailedNotification object:transaction];
    
}

//Method for payment queue restore transaction
- (void)paymentQueue:(SKPaymentQueue *)queue restoreCompletedTransactionsFailedWithError:(NSError *)error 
{
    
    DLog(@"Error in restore transaction : %@",error.description);
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kProductRestoreFailedNotification object:error];
}

//Method for payment queue update transaction
- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions
{
    for (SKPaymentTransaction *transaction in transactions)
    {
        switch (transaction.transactionState)
        {
            case SKPaymentTransactionStatePurchased:
                [self completeTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                [self failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                [self restoreTransaction:transaction];
            default:
                break;
        }
    }
}

//Method for restore ques completed transaction
- (void)paymentQueueRestoreCompletedTransactionsFinished:(SKPaymentQueue *)queue
{
    DLog(@"paymentQueueRestoreCompletedTransactionsFinished");
}

- (void)dealloc
{
    [_productIdentifiers release];
    _productIdentifiers = nil;
    [_products release];
    _products = nil;
    [_purchasedProducts release];
    _purchasedProducts = nil;
    [_request release];
    _request = nil;
    [super dealloc];
}
@end