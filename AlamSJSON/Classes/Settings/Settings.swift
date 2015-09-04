//
//  Settings.swift
//  ASR
//
//  Created by Ara Hakobyan on 5/20/15.
//  Copyright (c) 2015 Arohak LLC. All rights reserved.
//

//MARK: - Device and System Version

struct ScreenSize
{
    static let SCREEN_WIDTH         = UIScreen.mainScreen().bounds.size.width
    static let SCREEN_HEIGHT        = UIScreen.mainScreen().bounds.size.height
    static let SCREEN_MAX_LENGTH    = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH    = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS  = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6          = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P         = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPAD              = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
}

struct Version
{
    static let SYS_VERSION_FLOAT = (UIDevice.currentDevice().systemVersion as NSString).floatValue
    static let iOS7 = (Version.SYS_VERSION_FLOAT < 8.0 && Version.SYS_VERSION_FLOAT >= 7.0)
    static let iOS8 = (Version.SYS_VERSION_FLOAT >= 8.0 && Version.SYS_VERSION_FLOAT < 9.0)
    static let iOS9 = (Version.SYS_VERSION_FLOAT >= 9.0 && Version.SYS_VERSION_FLOAT < 10.0)
}

struct API
{
    static let SERVER_URL = "http://localhost:3000/"
    static let GET_CATALOGS = "products.json"
    static let GET_DEAL_STRUCTURAL_FEATURES = "fetchDealStructuralFeaturesByLegalName/"
    static let GET_DEAL_REPORT = "fetchDealReportByLegalName/"
}

//MARK: - Multiplier

let IPHONE_5_4_SCALE : CGFloat          =  568  / 736
let IPHONE_6_SCALE : CGFloat            =  667  / 736
let IPAD_SCALE : CGFloat                =  1024 / 736

//MARK: - Navigation Bar Constants

let NV_MENU_INSETS : CGFloat            = DeviceType.IS_IPAD ? 4  : 10
let NV_SEARCH_INSETS : CGFloat          = DeviceType.IS_IPAD ? 9  : 12
let NV_LOGO_SIZE : CGFloat              = DeviceType.IS_IPAD ? 28 : 22


//MARK: - LeftMenu Constants

let LM_WIDTH : CGFloat                  = DeviceType.IS_IPAD ? 300    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 300    : DeviceType.IS_IPHONE_6 ? 300  * IPHONE_6_SCALE : 300  * IPHONE_5_4_SCALE
let LM_INSET : CGFloat                  = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
let LM_BG_HEIGHT : CGFloat              = DeviceType.IS_IPAD ? 75     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 75     : DeviceType.IS_IPHONE_6 ? 75   * IPHONE_6_SCALE : 75   * IPHONE_5_4_SCALE
let LM_USERIMAGE_SIZE : CGFloat         = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_4_SCALE
let LM_LOGOUT_SIZE : CGFloat            = DeviceType.IS_IPAD ? 50     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 50     : DeviceType.IS_IPHONE_6 ? 50   * IPHONE_6_SCALE : 50   * IPHONE_5_4_SCALE
let LM_USERNAME_LBL_FONTSIZE : CGFloat  = DeviceType.IS_IPAD ? 18     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 18     : DeviceType.IS_IPHONE_6 ? 18   * IPHONE_6_SCALE : 18   * IPHONE_5_4_SCALE
let LM_USERNAME_LBL_FONT                = UIFont.systemFontOfSize(LM_USERNAME_LBL_FONTSIZE)


//MARK: - LeftMenu Cell Constants

let LMC_INSET : CGFloat                 = DeviceType.IS_IPAD ? 30     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 30     : DeviceType.IS_IPHONE_6 ? 30   * IPHONE_6_SCALE : 30   * IPHONE_5_4_SCALE
let LMC_HEIGHT : CGFloat                = DeviceType.IS_IPAD ? 50     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 50     : DeviceType.IS_IPHONE_6 ? 50   * IPHONE_6_SCALE : 50   * IPHONE_5_4_SCALE
let LMC_LOGO_SIZE : CGFloat             = DeviceType.IS_IPAD ? 30     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 30     : DeviceType.IS_IPHONE_6 ? 30   * IPHONE_6_SCALE : 30   * IPHONE_5_4_SCALE
let LMC_NAME_LBL_FONTSIZE : CGFloat     = DeviceType.IS_IPAD ? 14     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 14     : DeviceType.IS_IPHONE_6 ? 14   * IPHONE_6_SCALE : 14   * IPHONE_5_4_SCALE
let LMC_NAME_LBL_FONT                   = UIFont.boldSystemFontOfSize(LMC_NAME_LBL_FONTSIZE)


//MARK: - SignIn Constants

let SI_INSET : CGFloat                  = DeviceType.IS_IPAD ? 30     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 30     : DeviceType.IS_IPHONE_6 ? 30   * IPHONE_6_SCALE : 30   * IPHONE_5_4_SCALE
let SI_LOGO_SIZE : CGFloat              = DeviceType.IS_IPAD ? 130    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 130    : DeviceType.IS_IPHONE_6 ? 130  * IPHONE_6_SCALE : 130  * IPHONE_5_4_SCALE
let SI_CONTAINER_WIDTH : CGFloat        = DeviceType.IS_IPAD ? 345    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 345    : DeviceType.IS_IPHONE_6 ? 345  * IPHONE_6_SCALE : 345  * IPHONE_5_4_SCALE
let SI_CONTAINER_HEIGHT : CGFloat       = DeviceType.IS_IPAD ? 180    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 160    : DeviceType.IS_IPHONE_6 ? 160  * IPHONE_6_SCALE : 160  * IPHONE_5_4_SCALE
let SI_FIELD_HEIGHT : CGFloat           = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_4_SCALE
let SI_FIELD_FONTSIZE : CGFloat         = DeviceType.IS_IPAD ? 14     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 14     : DeviceType.IS_IPHONE_6 ? 14   * IPHONE_6_SCALE : 14   * IPHONE_5_4_SCALE
let SI_FIELD_FONT                       = UIFont.systemFontOfSize(SI_FIELD_FONTSIZE)
let SI_BUTTON_FONTSIZE : CGFloat        = DeviceType.IS_IPAD ? 18     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 18     : DeviceType.IS_IPHONE_6 ? 18   * IPHONE_6_SCALE : 18   * IPHONE_5_4_SCALE
let SI_BUTTON_FONT                      = UIFont.systemFontOfSize(SI_BUTTON_FONTSIZE)


//MARK: - Popover Constants

let PO_BTN_WIDTH : CGFloat              = DeviceType.IS_IPAD ? 122    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 170    : DeviceType.IS_IPHONE_6 ? 170  * IPHONE_6_SCALE : 170  * IPHONE_5_4_SCALE
let PO_ORIGIN_X : CGFloat               = DeviceType.IS_IPAD ? 60     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 60     : DeviceType.IS_IPHONE_6 ? 60   * IPHONE_6_SCALE : 60   * IPHONE_5_4_SCALE
let PO_ORIGIN_Y : CGFloat               = DeviceType.IS_IPAD ? 28     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 28     : DeviceType.IS_IPHONE_6 ? 28   * IPHONE_6_SCALE : 28   * IPHONE_5_4_SCALE


//MARK: - Search Constants

let SE_INSET : CGFloat                  = DeviceType.IS_IPAD ? 80     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 80     : DeviceType.IS_IPHONE_6 ? 80   * IPHONE_6_SCALE : 80   * IPHONE_5_4_SCALE
let SE_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 30     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 30     : DeviceType.IS_IPHONE_6 ? 30   * IPHONE_6_SCALE : 30   * IPHONE_5_4_SCALE
let SE_SEARCHBAR_HEIGHT : CGFloat       = DeviceType.IS_IPAD ? 35     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 35     : DeviceType.IS_IPHONE_6 ? 35   * IPHONE_6_SCALE : 35   * IPHONE_5_4_SCALE
let SE_SEARCHBAR_FONTSIZE : CGFloat     = DeviceType.IS_IPAD ? 14     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 14     : DeviceType.IS_IPHONE_6 ? 14   * IPHONE_6_SCALE : 14   * IPHONE_5_4_SCALE
let SE_SEARCHBAR_FONT                   = UIFont.systemFontOfSize(SE_SEARCHBAR_FONTSIZE)


//MARK: - Search Cell Constants

let SEC_HEIGHT : CGFloat                 = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_4_SCALE
let SEC_LBL_FONTSIZE : CGFloat           = DeviceType.IS_IPAD ? 14     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 14     : DeviceType.IS_IPHONE_6 ? 14   * IPHONE_6_SCALE : 14   * IPHONE_5_4_SCALE
let SEC_LBL_FONT                            = UIFont.boldSystemFontOfSize(SEC_LBL_FONTSIZE)


//MARK: - Deal Info Constants

let DI_INSET : CGFloat                  = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_4_SCALE
let DI_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
let DI_DATE_BTN_WIDTH : CGFloat         = DeviceType.IS_IPAD ? 122    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 122    : DeviceType.IS_IPHONE_6 ? 122  * IPHONE_6_SCALE : 122  * IPHONE_5_4_SCALE
let DI_DATE_BTN_HEIGHT : CGFloat        = DeviceType.IS_IPAD ? 25     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 25     : DeviceType.IS_IPHONE_6 ? 25   * IPHONE_6_SCALE : 25   * IPHONE_5_4_SCALE
let DI_TITLE_LBL_FONTSIZE : CGFloat     = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
let DI_TITLE_LBL_FONT                   = UIFont.boldSystemFontOfSize(DI_TITLE_LBL_FONTSIZE)
let DI_DATE_LBL_FONTSIZE : CGFloat      = DeviceType.IS_IPAD ? 14     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 14     : DeviceType.IS_IPHONE_6 ? 14   * IPHONE_6_SCALE : 14   * IPHONE_5_4_SCALE
let DI_DATE_LBL_FONT                    = UIFont.systemFontOfSize(DI_DATE_LBL_FONTSIZE)


//MARK: - Overview Cell Constants

let OV_HEIGHT : CGFloat                 = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_4_SCALE
let OV_LBL_FONTSIZE : CGFloat           = DeviceType.IS_IPAD ? 14     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 14     : DeviceType.IS_IPHONE_6 ? 14   * IPHONE_6_SCALE : 14   * IPHONE_5_4_SCALE
let OV_LBL_FONT                         = UIFont.boldSystemFontOfSize(OV_LBL_FONTSIZE)


//MARK: - Grafics Constants

let GR_INSET : CGFloat                  = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_4_SCALE
let GR_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
let GR_BTN_WIDTH : CGFloat              = DeviceType.IS_IPAD ? 122    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 122    : DeviceType.IS_IPHONE_6 ? 122  * IPHONE_6_SCALE : 122  * IPHONE_5_4_SCALE
let GR_BTN_HEIGHT : CGFloat             = DeviceType.IS_IPAD ? 25     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 25     : DeviceType.IS_IPHONE_6 ? 25   * IPHONE_6_SCALE : 25   * IPHONE_5_4_SCALE
let GR_LBL_FONTSIZE : CGFloat           = DeviceType.IS_IPAD ? 12     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 12     : DeviceType.IS_IPHONE_6 ? 12   * IPHONE_6_SCALE : 12   * IPHONE_5_4_SCALE
let GR_LBL_FONT                         = UIFont.systemFontOfSize(GR_LBL_FONTSIZE)
let GR_LBL_FONTSIZE_1 : CGFloat         = DeviceType.IS_IPAD ? 14     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 14     : DeviceType.IS_IPHONE_6 ? 14   * IPHONE_6_SCALE : 14   * IPHONE_5_4_SCALE

let GR_PCVIEW_SIZE : CGFloat            = DeviceType.IS_IPAD ? 130    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 145    : DeviceType.IS_IPHONE_6 ? 145  * IPHONE_6_SCALE : 145  * IPHONE_5_4_SCALE
let GR_LBL_HEIGHT : CGFloat             = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE


//Mark: - ChartView Constants

let PC_GRAF_INSSET : CGFloat            = DeviceType.IS_IPAD ? 35     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 35     : DeviceType.IS_IPHONE_6 ? 35   * IPHONE_6_SCALE : 35   * IPHONE_5_4_SCALE
let PC_HEIGHT : CGFloat                 = DeviceType.IS_IPAD ? 300    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 300    : DeviceType.IS_IPHONE_6 ? 220  * IPHONE_6_SCALE : 220  * IPHONE_5_4_SCALE
let PC_WIDTH : CGFloat                  = DeviceType.IS_IPAD ? 180    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 180    : DeviceType.IS_IPHONE_6 ? 180  * IPHONE_6_SCALE : 150  * IPHONE_5_4_SCALE
let PC_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 70    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 70    : DeviceType.IS_IPHONE_6 ? 70  * IPHONE_6_SCALE : 60   * IPHONE_5_4_SCALE
let PC_INSET : CGFloat                  = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 0     : DeviceType.IS_IPHONE_6 ? 0   * IPHONE_6_SCALE : 0   * IPHONE_5_4_SCALE

//MARK: - WaterFall Chart

let WFCTEXT_WIDTH                       = (ScreenSize.SCREEN_WIDTH - 140)/6
let WFCTEXT_HEIGHT                      = DeviceType.IS_IPAD ?  (ScreenSize.SCREEN_HEIGHT - 160)/5 : (ScreenSize.SCREEN_HEIGHT - 90)/5

let WFCITEM_WIDTH                       = DeviceType.IS_IPAD ? 70    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 90    : DeviceType.IS_IPHONE_6 ? 70  * IPHONE_6_SCALE : DeviceType.IS_IPHONE_5 ? 60   * IPHONE_5_4_SCALE : 40
let WFCITEM_START_OFFSET                = DeviceType.IS_IPAD ? 45    * IPAD_SCALE : 50
let WFCITEM_OFFSET                      = DeviceType.IS_IPAD ? 50    * IPAD_SCALE / IPAD_SCALE : DeviceType.IS_IPHONE_6P || DeviceType.IS_IPHONE_6 ? 50 :DeviceType.IS_IPHONE_5 ? 26 : 16
let WFCHART_HEIGHT                      = DeviceType.IS_IPAD ? (ScreenSize.SCREEN_HEIGHT - DI_OFFSET - PE_OFFSET - 210 - DI_DATE_BTN_HEIGHT) : (ScreenSize.SCREEN_HEIGHT - DI_OFFSET - PE_OFFSET - 115 - DI_DATE_BTN_HEIGHT)
let WFCTEXT_START_OFFSET                = DeviceType.IS_IPAD ? 100 :  40



//MARK: - Performance Constants

let PE_INSET : CGFloat                  = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_4_SCALE
let PE_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
let PE_TBL_WIDTH : CGFloat              = DeviceType.IS_IPAD ? 200    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 200    : DeviceType.IS_IPHONE_6 ? 200  * IPHONE_6_SCALE : 200  * IPHONE_5_4_SCALE
let PE_SCROLL_BTN_WIDTH : CGFloat       = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_4_SCALE
let PE_SCROLL_BTN_HEIGHT : CGFloat      = DeviceType.IS_IPAD ? 17     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 17     : DeviceType.IS_IPHONE_6 ? 17   * IPHONE_6_SCALE : 17   * IPHONE_5_4_SCALE


//MARK: - Performance Cell Constants

let PEC_HEIGHT : CGFloat                = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_4_SCALE
let PEC_OFFSET : CGFloat                = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_4_SCALE
let PEC_NAME_LBL_FONTSIZE : CGFloat     = DeviceType.IS_IPAD ? 14     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 14     : DeviceType.IS_IPHONE_6 ? 14   * IPHONE_6_SCALE : 14   * IPHONE_5_4_SCALE
let PEC_NAME_LBL_FONT                   = UIFont.boldSystemFontOfSize(PEC_NAME_LBL_FONTSIZE)
let PEC_VALUE_LBL_FONTSIZE : CGFloat    = DeviceType.IS_IPAD ? 12     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 12     : DeviceType.IS_IPHONE_6 ? 12   * IPHONE_6_SCALE : 12   * IPHONE_5_4_SCALE
let PEC_VALUE_LBL_FONT                  = UIFont.systemFontOfSize(PEC_VALUE_LBL_FONTSIZE)
let PEC_GRAF_WIDTH : CGFloat            = DeviceType.IS_IPAD ? 50     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 50     : DeviceType.IS_IPHONE_6 ? 50   * IPHONE_6_SCALE : 50   * IPHONE_5_4_SCALE
let PEC_GRAF_HEIGHT : CGFloat           = DeviceType.IS_IPAD ? 23     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 23     : DeviceType.IS_IPHONE_6 ? 23   * IPHONE_6_SCALE : 23   * IPHONE_5_4_SCALE


//MARK: - Performance Grid Constants

let GRID_WIDTH : CGFloat                = DeviceType.IS_IPAD ? 80     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 80     : DeviceType.IS_IPHONE_6 ? 80   * IPHONE_6_SCALE : 80   * IPHONE_5_4_SCALE
let GRID_HEIGHT : CGFloat               = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_4_SCALE
let GRID_SPACE : CGFloat                = DeviceType.IS_IPAD ? 0      * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 0      : DeviceType.IS_IPHONE_6 ? 0    * IPHONE_6_SCALE : 0    * IPHONE_5_4_SCALE


//MARK: - TradesSummary Cell Constants

let TS_INSET : CGFloat                  = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_4_SCALE
let TSC_HEIGHT : CGFloat                = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_4_SCALE
let TSC_OFFSET : CGFloat                = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_4_SCALE
let TSC_LBL_WIDTH : CGFloat             = DeviceType.IS_IPAD ? 70     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 70     : DeviceType.IS_IPHONE_6 ? 70   * IPHONE_6_SCALE : 70   * IPHONE_5_4_SCALE
let TSC_NAME_FONTSIZE : CGFloat         = DeviceType.IS_IPAD ? 16     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 15     : DeviceType.IS_IPHONE_6 ? 15   * IPHONE_6_SCALE : 15   * IPHONE_5_4_SCALE
let TSC_NAME_FONT                       = UIFont.boldSystemFontOfSize(TSC_NAME_FONTSIZE)
let TSC_LBL_FONTSIZE : CGFloat          = DeviceType.IS_IPAD ? 12     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 12     : DeviceType.IS_IPHONE_6 ? 12   * IPHONE_6_SCALE : 12   * IPHONE_5_4_SCALE
let TSC_LBL_FONT                        = UIFont.boldSystemFontOfSize(TSC_LBL_FONTSIZE)


//MARK: - Files Cell Constants

let FI_INSET : CGFloat                  = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
let FI_SEARCHBAR_WIDTH : CGFloat        = DeviceType.IS_IPAD ? 200    * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 200    : DeviceType.IS_IPHONE_6 ? 200  * IPHONE_6_SCALE : 200  * IPHONE_5_4_SCALE

let FIC_HEIGHT : CGFloat                = DeviceType.IS_IPAD ? 30     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 30     : DeviceType.IS_IPHONE_6 ? 30   * IPHONE_6_SCALE : 30   * IPHONE_5_4_SCALE
let FIC_OFFSET : CGFloat                = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_4_SCALE
let FIC_ICON_SIZE : CGFloat             = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
let FIC_LBL_WIDTH : CGFloat             = DeviceType.IS_IPAD ? 70     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 70     : DeviceType.IS_IPHONE_6 ? 70   * IPHONE_6_SCALE : 70   * IPHONE_5_4_SCALE
let FIC_NAME_FONTSIZE : CGFloat         = DeviceType.IS_IPAD ? 16     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 15     : DeviceType.IS_IPHONE_6 ? 15   * IPHONE_6_SCALE : 15   * IPHONE_5_4_SCALE
let FIC_NAME_FONT                       = UIFont.boldSystemFontOfSize(FIC_NAME_FONTSIZE)
let FIC_LBL_FONTSIZE : CGFloat          = DeviceType.IS_IPAD ? 12     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 12     : DeviceType.IS_IPHONE_6 ? 12   * IPHONE_6_SCALE : 12   * IPHONE_5_4_SCALE
let FIC_LBL_FONT                        = UIFont.boldSystemFontOfSize(FIC_LBL_FONTSIZE)


//MARK: - Tranches Cell Constants

let TR_INSET : CGFloat                  = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE

let TRC_HEIGHT : CGFloat                = DeviceType.IS_IPAD ? 40     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 40     : DeviceType.IS_IPHONE_6 ? 40   * IPHONE_6_SCALE : 40   * IPHONE_5_4_SCALE
let TRC_OFFSET : CGFloat                = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_4_SCALE
let TRC_LBL_WIDTH : CGFloat             = DeviceType.IS_IPAD ? 70     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 70     : DeviceType.IS_IPHONE_6 ? 70   * IPHONE_6_SCALE : 70   * IPHONE_5_4_SCALE
let TRC_LBL_FONTSIZE : CGFloat          = DeviceType.IS_IPAD ? 12     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 12     : DeviceType.IS_IPHONE_6 ? 12   * IPHONE_6_SCALE : 12   * IPHONE_5_4_SCALE
let TRC_LBL_FONT                        = UIFont.boldSystemFontOfSize(TRC_LBL_FONTSIZE - 2)
let TRC_HEADER_LBL_FONTSIZE : CGFloat   = DeviceType.IS_IPAD ? 10     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 10     : DeviceType.IS_IPHONE_6 ? 10   * IPHONE_6_SCALE : 10   * IPHONE_5_4_SCALE
let TRC_HEADER_LBL_FONT                 = UIFont.boldSystemFontOfSize(TRC_HEADER_LBL_FONTSIZE)


//MARK: - LineChart Constants

let LC_INSET : CGFloat                  = DeviceType.IS_IPAD ? 20     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 20     : DeviceType.IS_IPHONE_6 ? 20   * IPHONE_6_SCALE : 20   * IPHONE_5_4_SCALE
let LC_OFFSET : CGFloat                 = DeviceType.IS_IPAD ? 30     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 30     : DeviceType.IS_IPHONE_6 ? 30   * IPHONE_6_SCALE : 30   * IPHONE_5_4_SCALE
let LC_NAME_FONTSIZE : CGFloat          = DeviceType.IS_IPAD ? 16     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 15     : DeviceType.IS_IPHONE_6 ? 15   * IPHONE_6_SCALE : 15   * IPHONE_5_4_SCALE
let LC_NAME_FONT                        = UIFont.boldSystemFontOfSize(LC_NAME_FONTSIZE)
let LC_BTN_FONTSIZE : CGFloat           = DeviceType.IS_IPAD ? 12     * IPAD_SCALE : DeviceType.IS_IPHONE_6P ? 12     : DeviceType.IS_IPHONE_6 ? 12   * IPHONE_6_SCALE : 12   * IPHONE_5_4_SCALE
let LC_BTN_FONT                         = UIFont.boldSystemFontOfSize(LC_BTN_FONTSIZE)

//MARK: - ALL Constants

let PICKERCONTAINERHEIGHT = 150
let WHITE = UIColor.whiteColor()
let BLACK = UIColor(red: 35.0/255, green: 35.0/255, blue: 35.0/255, alpha: 1)
let BLUE =  UIColor(red: 0, green: 166.0/255, blue: 233.0/255, alpha: 1)
let FIELD_BLACK = UIColor(red: 31.0/255, green: 29.0/255, blue: 29.0/255, alpha: 1)
let PFONT = UIFont.systemFontOfSize(DeviceType.IS_IPAD ? 15 : 12)
let NAVFONT = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 25 : 18)
let CANCELFONT = UIFont.boldSystemFontOfSize(DeviceType.IS_IPAD ? 20 : 14)

let COLORS =   [UIColor(red: 74/255, green: 213/255, blue: 148/255, alpha: 1),
    UIColor(red: 36/255, green: 166/255, blue: 103/255, alpha: 1),
    UIColor(red: 126/255, green: 208/255, blue: 81/255, alpha: 1),
    UIColor(red: 251/255, green: 233/255, blue: 138/255, alpha: 1),
    UIColor(red: 250/255, green: 209/255, blue: 110/255, alpha: 1),
    UIColor(red: 207/255, green: 108/255, blue: 102/255, alpha: 1),
    UIColor(red: 246/255, green: 60/255, blue: 46/255, alpha: 1),
    UIColor(red: 248/255, green: 89/255, blue: 68/255, alpha: 1),
    UIColor(red: 254/255, green: 118/255, blue: 65/255, alpha: 1),
    UIColor(red: 254/255, green: 173/255, blue: 81/255, alpha: 1)]

let WATERFALLCOLORS : NSArray = [UIColor(red: 123/255.0, green:209.0/255.0,
    blue:72.0/255.0, alpha: 1.0),
    UIColor(red: 250.0/255.0,green:209.0/255.0, blue: 101.0/255.0, alpha: 1.0),
    UIColor(red:255.0/255.0, green:117.0/255.0, blue: 55.0/255.0, alpha: 1.0),
    UIColor(red:255.0/255.0, green:173.0/255.0, blue:70.0/255.0, alpha:1.0),
    UIColor(red: 66.0/255.0, green:214.0/255.0, blue:146.0/255.0, alpha: 1.0),
    UIColor(red: 66.0/255.0, green:214.0/255.0, blue:146.0/255.0, alpha: 1.0)]

let CHARTCOLORS : NSArray = [UIColor(red: 22/255.0, green: 167.0/255.0, blue: 101.0/255.0, alpha: 1.0),
    UIColor(red: 255.0/255.0, green: 117.0/255.0, blue: 55.0/255.0, alpha: 1.0),
    UIColor(red:250.0/255.0, green:209.0/255.0, blue: 101.0/255.0, alpha: 1.0),
    UIColor(red:137.0/255.0, green:197.0/255.0, blue:63.0/255.0, alpha:1.0),
    UIColor(red: 208.0/255.0, green:107.0/255.0, blue:100.0/255.0, alpha: 1.0),
    UIColor(red:250.0/255.0, green:209.0/255.0, blue: 101.0/255.0, alpha: 1.0)]

let objects : NSArray = [[0.2, 0.3,0.1, 0.1, 0.1, 0.2],
    [0.2, 0.3,0.1, 0.2, 0.1, 0.1],
    [0.2, 0.3,0.1, 0.2, 0.1, 0.1],
    [0.3, 0.2,0.1, 0.1, 0.1, 0.2]]
