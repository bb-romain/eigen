import UIKit
import ORStackView

typealias MarkdownString = String

struct AuctionInformationFAQEntry {
    let name: String
    let content: MarkdownString
}

struct AuctionInformation {
    let partnerName: String
    let title: String
    let description: MarkdownString // TODO markdown ?
    let startsAt: String
    let contact: MarkdownString // TODO markdown ?
    let FAQEntries: [AuctionInformationFAQEntry]
}

class AuctionInformationViewController : UIViewController {
    var auctionInformation: AuctionInformation
    var scrollView: ORStackScrollView

    required init(auctionInformation: AuctionInformation) {
        self.auctionInformation = auctionInformation
        self.scrollView = ORStackScrollView()
        super.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        let FAQEntries = [
            AuctionInformationFAQEntry(name: "Bidding", content: "# BIDDING\n\n## How do I Register for an Auction?\n\nAll bidders need to register by completing an online form and providing all required information, such as their full name, contact information, and credit card details. Sometimes additional information may be required, and we’ll notify you of additional requirements when they apply.\n\n## How do I place a bid?\n\nBidding on Artsy is easy with our automatic bidding system. Enter any bid amount as long as it is greater than or equal to the next minimum bid shown on the bidding screen, then click the “Bid” button. This will automatically place a bid for you at the next increment and save the amount you entered (if higher) as your “Maximum Bid.” \n\n## What is a Maximum Bid?\n\nIf you enter a bid amount higher than the next minimum bid, the amount you enter is treated as your “Maximum Bid.” Entering a Maximum Bid does not necessarily mean you will pay that price, and you may pay less. As the auction progresses, our system will bid automatically for you against other bidders, according to our automatic bidding increments (see below), up to (but not exceeding) your Maximum Bid, only as much as necessary to maintain your position as highest bidder.  If two bidders attempt to enter the same Maximum Bid, the first bidder to enter that amount will be the winner. \n\n## What are Bidding Increments?\n\nOur automatic bidding increments determine the next minimum bid that can be placed. They are based on the current bid of each item and increase at the following intervals, when the current bid is:\n\nUnder $1,000:  $50  \n$1,000 - $1,999: $100  \n$2,000 - $4,999: $250  \n$5,000 - $9,999: $500  \n$10,000 - $19,999: $1,000  \n$20,000 - $49,999: $2,000   \n$50,000 - $99,999: $5,000  \nAt or above $100,000: $10,000\n\nNote: Our usual bidding increments are listed above, but from time to time we may increase, decrease, add or remove increments in order to help test new bidding features, optimize the bidding experience or for other purposes. This may occur before, during or after any auction. \n\n## What is a Reserve Price?\n\nA reserve price (also known as a \"reserve\") is the confidential minimum price below which the item may not be sold in the auction. If an item has a reserve, this will be indicated on the bidding screen where you enter your bid. When you bid on an item with a reserve, if your Maximum Bid meets or exceeds the reserve, your bid will be increased to meet the reserve (according to our automatic bidding increments), and bidding will continue from there. If an item is offered with a reserve, Artsy will be authorized to bid on the seller's behalf, up to the amount of the reserve."),
            AuctionInformationFAQEntry(name: "Buyer’s Premium, Taxes & Fees", content: "# BUYER'S PREMIUM, TAXES & FEES\n\n## What is a buyer’s premium?\nA buyer’s premium is an additional charge the winning bidder pays on top of the item's hammer price. If an item has a buyer's premium, this will be indicated on the bidding screen where you enter your bid, along with the rate of the buyer's premium. The buyer's premium is calculated as a percentage of the item's hammer price.\n\n## What about taxes?\nBuyers are responsible for paying all sales and use taxes, VAT and any other taxes that apply to their purchases. Applicable taxes will be added to the winning bidder’s invoice after the auction. \n"),
            AuctionInformationFAQEntry(name: "Payments and Shipping", content: "# PAYMENTS AND SHIPPING\n\n## How does payment work after an auction?\nWinning bidders will receive an email after the auction with instructions for how to checkout and pay for purchased items. Depending on the sale, either Artsy or the seller will collect payment from the buyer, and buyers will be notified accordingly upon conclusion of the auction.\n\n## How does shipping work?\nAfter an auction, the buyer will be connected with the seller to arrange shipping. Normally buyers may choose between a common carrier (like FedEx) and a specialist fine art shipper. Shipping costs are the responsibility of the buyer.\n"),
            AuctionInformationFAQEntry(name: "Emails and Alerts", content: "# EMAILS AND ALERTS\n\nBidders will receive an email to confirm when their bid has been received, and an email to notify them when they are outbid. After the auction, winning bidders will also receive an email to notify them of their winning bid. Please be sure to register with a valid email address and to check your email frequently during an auction to make sure you receive all relevant updates.  "),
            AuctionInformationFAQEntry(name: "Conditions of Sale", content: "# CONDITIONS OF SALE\n\nOur standard [Conditions of Sale](/conditions-of-sale) contain important terms, conditions and information that apply to all bidders. By bidding in an auction on Artsy, you are accepting our [Conditions of Sale](/conditions-of-sale). Please read them carefully before bidding. \n")
        ]
        
        let auctionInformation = AuctionInformation(partnerName: "Sotheby’s", title: "Sotheby’s Boundless Contemporary", description: "On Thursday, November 12, Swiss Institute will host their Annual Benefit Dinner & Auction–the most important fundraising event of the year–with proceeds going directly towards supporting their innovative exhibitions and programs. Since 1986, Swiss Institute has been dedicated to promoting forward-thinking and experimental art.", startsAt: "January 26 6:00PM EST", contact: "TODO Markdown?", FAQEntries: FAQEntries)
        
        self.auctionInformation = auctionInformation
        self.scrollView = ORStackScrollView()
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    // Required by Swift compiler, sadly.
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.view.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(self.scrollView)
        
        self.scrollView.alignTopEdgeWithView(self.flk_topLayoutGuide(), predicate: "0")
        self.scrollView.alignLeading("0", trailing: "0", toView: self.view)
        self.scrollView.alignBottomEdgeWithView(self.flk_bottomLayoutGuide(), predicate: "0")
        
        let stackView = self.scrollView.stackView
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.serifFontWithSize(18)
        titleLabel.text = "Auction Information"
        stackView.addSubview(titleLabel, withTopMargin: "20", sideMargin: "40")

        let partnerNameLabel = UILabel()
        partnerNameLabel.font = UIFont.serifSemiBoldFontWithSize(48)
        partnerNameLabel.text = self.auctionInformation.partnerName
        stackView.addSubview(partnerNameLabel, withTopMargin: "26", sideMargin: "40")
        
        // TODO sale name/reg unit
        let auctionTitleLabel = UILabel()
        auctionTitleLabel.font = UIFont.serifFontWithSize(18)
        auctionTitleLabel.text = "TODO SALE NAME/REG UNIT"
        stackView.addSubview(auctionTitleLabel, withTopMargin: "20", sideMargin: "40")
        
        let auctionDescriptionView = ARTextView()
        auctionDescriptionView.setMarkdownString(self.auctionInformation.description)
        stackView.addSubview(auctionDescriptionView, withTopMargin: "10", sideMargin: "40")
        
        let auctionBeginsHeaderLabel = UILabel()
        auctionBeginsHeaderLabel.font = UIFont.sansSerifFontWithSize(12)
        auctionBeginsHeaderLabel.text = "AUCTION BEGINS"
        stackView.addSubview(auctionBeginsHeaderLabel, withTopMargin: "20", sideMargin: "40")
        
        let auctionBeginsLabel = UILabel()
        auctionBeginsLabel.font = UIFont.serifFontWithSize(16)
        auctionBeginsLabel.text = self.auctionInformation.startsAt
        stackView.addSubview(auctionBeginsLabel, withTopMargin: "10", sideMargin: "40")
        
        let faqButtonDescription = [ARNavigationButtonClassKey: ARNavigationButton.self, ARNavigationButtonPropertiesKey: ["title": "AUCTIONS FAQ"], ARNavigationButtonHandlerKey: toBlock({ (_) -> Void in print("TAPPED FAQ") })]
        let contactButtonDescription = [ARNavigationButtonClassKey: ARNavigationButton.self, ARNavigationButtonPropertiesKey: ["title": "CONTACT"], ARNavigationButtonHandlerKey: toBlock({ (_) -> Void in print("TAPPED CONTACT") })]
        let buttonsViewController = ARNavigationButtonsViewController(buttonDescriptions: [faqButtonDescription, contactButtonDescription])

        stackView.addViewController(buttonsViewController, toParent: self, withTopMargin: "20", sideMargin: "40")
    }
    
    func toBlock(closure: @convention (block) UIButton -> Void) -> AnyObject {
        return unsafeBitCast(closure, AnyObject.self)
    }
}
