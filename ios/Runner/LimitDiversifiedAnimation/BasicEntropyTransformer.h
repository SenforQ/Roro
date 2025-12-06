#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BasicEntropyTransformer : NSObject

@property (nonatomic) NSMutableDictionary * composableHashBrightness;

+ (instancetype) basicEntropyTransformerWithDictionary: (NSDictionary *)dict;

- (instancetype) initWithDictionary: (NSDictionary *)dict;

- (NSString *) hashLikeAdapter;

- (NSMutableDictionary *) semanticSubpixelContrast;

- (int) immediateLabelForce;

- (NSMutableSet *) interactorInProxy;

- (NSMutableArray *) plateWithProxy;

@end

NS_ASSUME_NONNULL_END
        