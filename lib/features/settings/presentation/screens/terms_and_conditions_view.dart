import 'package:fitted/config/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/text_spans.dart';

class TermsAndConditionsView extends StatelessWidget {
  const TermsAndConditionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        surfaceTintColor: AppColors.white,
        backgroundColor: AppColors.white,
        toolbarHeight: 40.h,
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.black,
          ),
        ),
        title: AppText.poppinsMedium(
          "Terms and Conditions ",
          fontSize: 16,
          height: 24 / 16,
          color: AppColors.black,
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 8.h,
            children: [
              Text(
                'Acceptance of These Terms of Service',
                style: TextStyle(
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: -.02 * 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
              ),
              AppText.poppinsRegular(
                "Fittd Inc. (“Fittd,” “we,” “us,” or “our”) provides our services (described below) and related content to you through our website(s) located at Fittd.ai (the “Site”) and through our mobile applications and related technologies (“Mobile Apps”, and collectively, such Mobile Apps and the Site, including any updated or new features, functionality and technology, the “Service”). All access and use of the Service is subject to the terms and conditions contained in these Terms of Service (as amended from time to time, these “Terms of Service”). By accessing, browsing, or otherwise using the Site, Mobile Apps, or any other aspect of the Service, you acknowledge that you have read, understood, and agree to be bound by these Terms of Service. If you do not accept the terms and conditions of these Terms of Service, you will not access, browse, or otherwise use the Service. We reserve the right, at our sole discretion, to change or modify portions of these Terms of Service at any time. If we do this, we will post the changes on this page and will indicate at the top of this page the date these Terms of Service were last revised. You may read a current, effective copy of these Terms of Service by visiting the “Terms of Service” link on the Site and under the “Legal — Terms of Service” section of our Mobile App. We will also notify you of any material changes, either through the Service user interface, a pop-up notice, email, or through other reasonable means. Your continued use of the Service after the date any such changes become effective constitutes your acceptance of the new Terms of Service. You should periodically visit this page to review the current Terms of Service so you are aware of any revisions. If you do not agree to abide by these or any future Terms of Service, you will not access, browse, or use (or continue to access, browse, or use) the Service.",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black.withValues(alpha: 0.6),
              ),
              AppText.poppinsMedium(
                'PLEASE READ THESE TERMS OF SERVICE CAREFULLY, AS THEY CONTAIN AN AGREEMENT TO ARBITRATE AND OTHER IMPORTANT INFORMATION REGARDING YOUR LEGAL RIGHTS, REMEDIES, AND OBLIGATIONS. THE AGREEMENT TO ARBITRATE REQUIRES (WITH LIMITED EXCEPTION) THAT YOU SUBMIT CLAIMS YOU HAVE AGAINST US TO BINDING AND FINAL ARBITRATION, AND FURTHER (1) YOU WILL ONLY BE PERMITTED TO PURSUE CLAIMS AGAINST FITTD ON AN INDIVIDUAL BASIS, NOT AS A PLAINTIFF OR CLASS MEMBER IN ANY CLASS OR REPRESENTATIVE ACTION OR PROCEEDING, (2) YOU WILL ONLY BE PERMITTED TO SEEK RELIEF (INCLUDING MONETARY, INJUNCTIVE, AND DECLARATORY RELIEF) ON AN INDIVIDUAL BASIS, AND (3) YOU MAY NOT BE ABLE TO HAVE ANY CLAIMS YOU HAVE AGAINST US RESOLVED BY A JURY OR IN A COURT OF LAW',
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              PrivacyTextSpan(
                  heading: "Your Privacy: ",
                  desc:
                      "At Fittd, we respect the privacy of our users. For more information please see our Privacy Policy, located at Fittd.ai/privacy and under the Legal — Privacy Policy section of our Mobile App (the “Privacy Policy”). By using the Service, you consent to our collection, use and disclosure of personal data and other data as outlined therein"),
              PrivacyTextSpan(
                heading: "Additional Terms: ",
                desc:
                    "In addition, when using certain features through the Service, you will be subject to any additional terms applicable to such features that may be posted on or within the Service from time to time. All such terms are hereby incorporated by reference into these Terms of Service.",
              ),
              Text(
                'Access and Use of the Service',
                style: TextStyle(
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: -.02 * 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
              ),
              PrivacyTextSpan(
                heading: "Service Description: ",
                desc:
                    "The Service is designed to provide customized recommendations of fashion brands and items to users based on their unique sizing",
              ),
              PrivacyTextSpan(
                heading: "Your Registration Obligations: ",
                desc:
                    "You may be required to register with Fittd or provide information about yourself (e.g., name and email address) in order to access and use certain features of the Service. If you choose to register for the Service, you agree to provide and maintain true, accurate, current, and complete information about yourself as prompted by the Service’s registration form. Registration data and certain other information about you are governed by our Privacy Policy. If you are under 13 years of age, you are not authorized to use the Service, with or without registering. In addition, if you are under 18 years old, you may use the Service, with or without registering, only with the express consent of your parent or guardian, and you agree to provide true, accurate, current, and complete information as requested by Fittd to confirm such express consent.",
              ),
              PrivacyTextSpan(
                heading: "Member Account, Password and Security:  ",
                desc:
                    "You are responsible for maintaining the confidentiality of your password and account details, if any, and are fully responsible for any and all activities that occur under your password or account. You agree to (a) immediately notify Fittd of any unauthorized use of your password or account or any other breach of security, and (b) ensure that you exit from your account at the end of each session when accessing the Service. Company will not be liable for any loss or damage arising from your failure to comply with this paragraph.",
              ),
              PrivacyTextSpan(
                heading: "Modifications to Service: ",
                desc:
                    "Fittd reserves the right to modify or discontinue, temporarily or permanently, the Service (or any part thereof) with or without notice. You agree that Fittd will not be liable to you or to any third party for any modification, suspension or discontinuance of the Service",
              ),
              PrivacyTextSpan(
                heading: "General Practices Regarding Use and Storage: ",
                desc:
                    "You acknowledge that Fittd may establish general practices and limits concerning use of the Service, including the maximum period of time that data or other content will be retained by the Service and the maximum storage space that will be allotted on Fittd’s or its third-party service providers’ servers on your behalf. You agree that Fittd has no responsibility or liability for the deletion or failure to store any data or other content maintained or uploaded by the Service. You acknowledge that Fittd reserves the right to terminate accounts that are inactive for an extended period of time. You further acknowledge that Fittd reserves the right to change these general practices and limits at any time, in its sole discretion, with or without notice.",
              ),
              Text(
                'Conditions of Access and Use',
                style: TextStyle(
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: -.02 * 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
              ),
              PrivacyTextSpan(
                heading: "User Conduct: ",
                desc:
                    "You are solely responsible for all code, video, images, information, data, text, software, music, sound, photographs, graphics, messages, and other materials (“content”) that you make available   to   Company,   including   by   uploading,   posting,   publishing,   or   displaying   (hereinafter, “upload(ing)”) via the Service or by emailing or otherwise making available to other users of the Service (collectively, “User Content”). The following are examples of the kinds of content and/or uses that are illegal or prohibited by Company. Company reserves the right to investigate and take appropriate legal action against anyone who, in Company’s sole discretion, violates this provision, including removing the offending content from the Service, suspending or terminating the account of such violators, and reporting the violator to law enforcement authorities. You agree to not use the Service to:",
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: PrivacyTextSpan(
                  heading: "",
                  desc:
                      "a) email or otherwise upload any content that (i) infringes any intellectual property or other proprietary rights of any party; (ii) you do not have a right to upload under any law or under contractual or fiduciary relationships; (iii) contains software viruses or any other computer code, files or programs designed to interrupt, destroy, or limit the functionality of any computer software or hardware or telecommunications equipment; (iv) poses or creates a privacy or security risk to any person; (v) constitutes unsolicited or unauthorized advertising, promotional materials, commercial activities and/or sales, “junk mail,” “spam,” “chain letters,” “pyramid schemes,” “contests,” “sweepstakes,” or any other form of solicitation; (vi) is unlawful, harmful, threatening, abusive, harassing, tortious, excessively violent, defamatory, vulgar, obscene, pornographic, libelous, invasive of another’s privacy, hateful, discriminatory, or otherwise objectionable; or (vii) in the sole judgment of Company, is objectionable or which restricts or inhibits any other person from using or enjoying the Service, or which may expose Company or its users to any harm or liability of any type;\n\nb) interfere with or disrupt the Service or servers or networks connected to the Service, or disobey any requirements, procedures, policies, or regulations of networks connected to the Service;\n\nc) violate any applicable local, state, national, or international law, or any regulations having the force of law;\n\nd) impersonate any person or entity, or falsely state or otherwise misrepresent your affiliation with a person or entity;\n\ne) solicit personal information from anyone under the age of 18;\n\nf) harvest or collect email addresses or other contact information of other users from the Service by electronic or other means for the purposes of sending unsolicited emails or other unsolicited communications;\n\ng) advertise or offer to sell or buy any goods or services for any business purpose that is not specifically authorized;\n\nh) further or promote any criminal activity or enterprise or provide instructional information about illegal activities;\n\ni) obtain or attempt to access or otherwise obtain any content or information through any means not intentionally made available or provided for through the Service;\n\nj) circumvent, remove, alter, deactivate, degrade, or thwart any of the content protections in or geographic restrictions on any content (including Service Content (as defined below)) available on or through the Service, including through the use of virtual private networks; or\n\nk) engage in or use any data mining, robots, scraping, or similar data gathering or extraction methods.",
                ),
              ),
              AppText.poppinsRegular(
                "If you are blocked by Company from accessing the Service (including by blocking your IP address), you agree not to implement any measures to circumvent such blocking (e.g., by masking your IP address or using a proxy IP address or virtual private network)",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black.withValues(alpha: 0.6),
              ),
              PrivacyTextSpan(
                heading: "Competitors: ",
                desc:
                    "No employee, independent contractor, agent, or affiliate of any competing fashion company is permitted to view, access, or use any portion of the Service without express written permission from Company. By viewing, using, or accessing the Service, you represent and warrant that you are not a competitor of Company or any of its affiliates, or acting on behalf of a competitor of Company in using or accessing the Service.",
              ),
              PrivacyTextSpan(
                heading: "Commercial Use: ",
                desc:
                    "Unless otherwise expressly authorized herein or in the Service, you agree not to display, distribute, license, perform, publish, reproduce, duplicate, copy, create derivative works from, modify, sell, resell, grant access to, transfer, or otherwise use or exploit any portion of the Service for any commercial purposes.",
              ),
              Text(
                'Mobile Services and Software',
                style: TextStyle(
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: -.02 * 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
              ),
              PrivacyTextSpan(
                heading: "Mobile Services: ",
                desc:
                    "The Service includes certain services that are available via a mobile device, including (i) the ability to upload content to the Service via a mobile device, (ii) the ability to browse the Service and the Site from a mobile device, and (iii) the ability to access certain features and content through Mobile Apps (collectively, the “Mobile Services”). To the extent you access the Service through a mobile device, your wireless service carrier’s standard charges, data rates, and other fees may apply. In addition, downloading, installing, or using certain Mobile Services may be prohibited or restricted by your carrier, and not all Mobile Services may work with all carriers or devices. ",
              ),
              PrivacyTextSpan(
                heading: "Telephonic Communications Services: ",
                desc:
                    "By using the Service and providing us with your telephone number(s), you are consenting to be contacted by Company or its affiliates or partners by telephone (including on a recorded line), automated calling, automated telephone dialing system calling, automated system calling, artificial voice or pre-recorded calling, text message, SMS and/or MMS message, fax, or other telephonic or electronic means for marketing, solicitation, informational or another purposes, even if your  telephone number(s) is registered on the National Do Not Call List, a state Do not Call List, or the internal Do Not Call List of Company or its affiliates or partners. You may be required to respond to an initial call or message as instructed to complete your registration and confirm enrollment to receive such calls, texts or other telephonic communications.  You do not have to consent to receive calls or text messages from Company or its affiliates or partners for marketing or solicitation purposes  to purchase Company’s products or services. In the event you no longer wish to receive such calls, text messages or other telephonic communications, you agree to notify Company or its affiliates or partners, as applicable, directly. In the event you change or deactivate your telephone number, you agree to promptly update your Company account information to ensure that your messages are not sent to a person that acquires your old telephone number.  There is no additional charge for telephonic communications, but your carrier’s standard message and data rates apply to any calls, text messages, SMS or MMS messages you send or receive. Your carrier may prohibit or restrict certain mobile features and certain mobile features may be incompatible with your carrier or mobile device. We are not liable for any delays in the receipt of, or any failures to receive, any calls, text messages, SMS or MMS messages, as delivery is subject to effective transmission by your mobile carrier and compatibility of your mobile device. Please contact your mobile carrier if you have any questions regarding these issues or your mobile data and messaging plan. By reply to any text, SMS or MMS message you receive from us, you may text “STOP” to cancel or “HELP” for customer support information. If you choose to cancel text, SMS or MMS messages from us, you agree to receive a final message from us confirming your cancellation. You can also invite others to use the Service through the Communication Services by providing the numbers of those you want to invite or by selecting the individuals you want to invite from your contacts list (if you have uploaded one), and taking the actions to send those individuals an invitation [call or] message. By inviting others to use the Service, you represent to us that those you invite consent to receive the invitation [calls or] messages and that you are authorized to convey that consent to us.",
              ),
              PrivacyTextSpan(
                heading: "Mobile App License: ",
                desc:
                    "Subject to these Terms of Service, Company hereby grants to you a limited, revocable, non-exclusive, non-transferable, non-sublicensable license to (a) install the Mobile App on one mobile device and (b) use the Mobile App for your own personal use solely to access and use the Service. For clarity, the foregoing is not intended to prohibit you from installing the Mobile App on another device on which you also agreed to these Terms of Service. Each instance of these Terms of Service that you agree to in connection with downloading a Mobile App grants you the aforementioned rights in connection with the installation and use of the Mobile App on one device.",
              ),
              PrivacyTextSpan(
                heading: "Ownership; Restrictions: ",
                desc:
                    "The technology and software underlying the Service or distributed in connection therewith are the property of Company, its affiliates, and its licensors (including the Mobile Apps, the “Software”). You agree not to copy, modify, create a derivative work of, reverse engineer, reverse assemble, or otherwise attempt to discover any source code, sell, assign, sublicense, or otherwise transfer any right in the Software. Any rights not expressly granted herein are reserved by Company. ",
              ),
              PrivacyTextSpan(
                heading:
                    "Special Notice for International Use; Export Controls: ",
                desc:
                    " Company is headquartered in the United States. Whether inside or outside of the United States, you are solely responsible for ensuring compliance with the laws of your specific jurisdiction. Software available in connection with the Service and the transmission of applicable data, if any, is subject to United States export controls. No Software may be downloaded from the Service or otherwise exported or re-exported in violation of U.S. export laws. Downloading, accessing or using the Software or Services is at your sole risk.",
              ),
              PrivacyTextSpan(
                heading: "Third-Party Distribution Channels: ",
                desc:
                    "Company offers Software that  may be made available through the Apple App Store, the Google Play Store, or other distribution channels (“Distribution Channels”). If you obtain such Software through a Distribution Channel, you may be subject to additional terms of the Distribution Channel. These Terms of Service are between you and us only, and not with the Distribution Channel.  To the extent that you utilize any other third-party products and services in connection with your use of the Service, you agree to comply with all applicable terms of any agreement for such third-party products and services",
              ),
              PrivacyTextSpan(
                heading: "Apple-Enabled Software: ",
                desc:
                    "With respect to Mobile Apps that are made available for your use in connection with an Apple-branded product (the “Apple-Enabled Software”), in addition to the other terms and conditions set forth in these Terms of Service, the following terms and conditions apply:",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                            "• Company and you acknowledge that these Terms of Service are concluded between Company and you only, and not with Apple Inc. (“Apple”), and that as between Company and Apple, Company, not Apple, is solely responsible for the Apple-Enabled Software and the content thereof. \n\n• You may not use the Apple-Enabled Software in any manner that is in violation of or inconsistent with the Usage Rules set forth for Apple-Enabled Software in, or otherwise be in conflict with, the Apple Media Services Terms and Conditions. \n\n• Your license to use the Apple-Enabled Software is limited to a non-transferable license to use the Apple-Enabled Software on an iOS product that you own or control, as permitted by the “Usage Rules” set forth in the Apple Media Services Terms and Conditions, except that such Apple- Enabled Software may be accessed and used by other accounts associated with the purchaser via Apple’s Family Sharing or volume purchasing programs. \n\n• Apple has no obligation whatsoever to provide any maintenance or support services with respect to the Apple-Enabled Software.  \n\n• Apple is not responsible for any product warranties, whether express or implied by law. In the event of any failure of the Apple-Enabled Software to conform to any applicable warranty, you may notify Apple, and Apple will refund the purchase price for the Apple-Enabled Software, if any, to you; and, to the maximum extent permitted by applicable law, Apple will have no other warranty obligation whatsoever with respect to the Apple-Enabled Software, or any other claims, losses, liabilities, damages, costs, or expenses attributable to any failure to conform to any warranty, which will be Company’s sole responsibility, to the extent it cannot be disclaimed under applicable law. \n\n• Company and you acknowledge that Company, not Apple, is responsible for addressing any claims of you or any third party relating to the Apple-Enabled Software or your possession and/or use of that Apple-Enabled Software, including: (a) product liability claims; (b) any claim that the Apple-Enabled Software fails to conform to any applicable legal or regulatory requirement; and (c) claims arising under consumer protection, privacy, or similar legislation.  \n\n• In the event of any third-party claim that the Apple-Enabled Software or your possession and use of that Apple-Enabled Software infringes that third party’s intellectual property rights, as between Company and Apple, Company, not Apple, will be solely responsible for the investigation, defense, settlement, and discharge of any such intellectual property infringement claim. \n\n• You represent and warrant that (a) you are not located in a country that is subject to a U.S. Government embargo, or that has been designated by the U.S. Government as a “terrorist supporting” country; and (b) you are not listed on any U.S. Government list of prohibited or restricted parties. \n\n• If you have any questions, complaints, or claims with respect to the Apple-Enabled Software, they should be directed to Company as follows: ",
                        style: AppTextStyles.poppinsMedium(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black.withValues(alpha: 0.6),
                        ),
                      ),
                      TextSpan(
                        text: "fittd.managment@gmail.com",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.04 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            launchUrl(
                                Uri.parse('mailto:fittd.managment@gmail.com'));
                          },
                      ),
                      TextSpan(
                        text:
                            "\n\n• You must comply with applicable third-party terms of agreement when using the Apple-Enabled Software, e.g., your wireless data service agreement. \n\n• Company and you acknowledge and agree that Apple, and Apple’s subsidiaries, are third-party beneficiaries of these Terms of Service with respect to the Apple-Enabled Software, and that, upon your acceptance of the terms and conditions of these Terms of Service, Apple will have the right (and will be deemed to have accepted the right) to enforce these Terms of Service against you with respect to the Apple-Enabled Software as a third-party beneficiary thereof.",
                        style: AppTextStyles.poppinsRegular(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black.withValues(alpha: 0.6),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Text(
                'Intellectual Property Rights',
                style: TextStyle(
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: -.02 * 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
              ),
              PrivacyTextSpan(
                heading: "Service Content: ",
                desc:
                    "You acknowledge and agree that the Service may contain content or features (“Service Content”) that are protected by copyright, patent, trademark, trade secret, or other proprietary rights and laws. Except as expressly authorized by Company, you agree not to modify, copy, frame, scrape, rent, lease, loan, sell, distribute, or create derivative works based on the Service or the Service Content, in whole or in part, except that the foregoing does not apply to your own User Content (as defined below) that you upload to or make available through the Service in accordance with these Terms of Service. Any use of the Service or the Service Content other than as specifically authorized herein is strictly prohibited.",
              ),
              PrivacyTextSpan(
                heading: "Trademarks:",
                desc:
                    "The Company name and logos are trademarks and service marks of Company (collectively the “Company Trademarks”). Other company, product, and service names and logos used and displayed via the Service may be trademarks or service marks of their respective owners who may or may not endorse or be affiliated with or connected to Company. Nothing in these Terms of Service or the Service should be construed as granting, by implication, estoppel, or otherwise, any license or right to use any of Company Trademarks displayed on the Service, without our prior written permission in each instance. All goodwill generated from the use of Company Trademarks will inure to our exclusive benefit.",
              ),
              PrivacyTextSpan(
                heading: "Third-Party Material: ",
                desc:
                    "Under no circumstances will Company be liable in any way for any content or materials of any third parties (including users), including for any errors or omissions in any content, or for any loss or damage of any kind incurred as a result of the use of any such content. You acknowledge that Company does not pre-screen content, but that Company and its designees will have the right (but not the obligation) in their sole discretion to refuse or remove any content that is available via the Service. Without limiting the foregoing, Company and its designees will have the right to remove any content that violates these Terms of Service or is deemed by Company, in its sole discretion, to be otherwise objectionable. You agree that you must evaluate, and bear all risks associated with, the use of any content, including any reliance on the accuracy, completeness, or usefulness of such content.",
              ),
              Text(
                'Third-Party Services and Websites',
                style: TextStyle(
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: -.02 * 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
              ),
              PrivacyTextSpan(
                heading: "",
                desc:
                    "The Service may provide links or other access to services, sites, technology, and resources that are provided or otherwise made available by third parties (the “Third-Party Services”). Additionally, you may enable or log in to the Service via various online Third-Party Services, such as social media and social networking services like Facebook. Your access and use of the Third-Party Services may also be subject to additional terms and conditions, privacy policies, or other agreements with such third party, and you may be required to authenticate to or create separate accounts to use Third-Party Services on the websites or via the technology platforms of their respective providers. Some Third-Party Services will provide us with access to certain information that you have provided to third parties, including through such Third-Party Services, and we will use, store and disclose such information in accordance with our Privacy Policy. For more information about the implications of activating Third-Party Services and our use, storage and disclosure of information related to you and your use of such Third-Party Services within the Service, please see our Privacy Policy. Company has no control over and is not responsible for such Third-Party Services, including for the accuracy, availability, reliability, or completeness of information shared by or available through Third-Party Services, or on the privacy practices of Third-Party Services. We encourage you to review the privacy policies of the third parties providing Third-Party Services prior to using such services. You, and not Company, will be responsible for any and all costs and charges associated with your use of any Third-Party Services. Company enables these Third-Party Services merely as a convenience and the integration or inclusion of such Third-Party Services does not imply an endorsement or recommendation. Any dealings you have with third parties while using the Service are between you and the third party. Company will not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any Third-Party Services.",
              ),
              Text(
                'Indemnification',
                style: TextStyle(
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: -.02 * 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
              ),
              PrivacyTextSpan(
                heading: "",
                desc:
                    "To the extent permitted under applicable law, you agree to defend, indemnify, and hold harmless Company, its affiliates, and its and their respective officers, employees, directors, service providers,licensors, and agents (collectively, the “Company Parties”) from any and all losses, damages, expenses, including reasonable attorneys’ fees, rights, claims, actions of any kind, and injury (including death) arising out of or relating to your use of the Service, any User Content, your connection to the Service, your violation of these Terms of Service, or your violation of any rights of another. Company will provide notice to you of any such claim, suit, or proceeding. Company reserves the right to assume the exclusive defense and control of any matter which is subject to indemnification under this section, and you agree to cooperate with any reasonable requests assisting Company’s defense of such matter. You may not settle or compromise any claim against the Company Parties without Company’s written consent.",
              ),
              Text(
                'Disclaimer of Warranties',
                style: TextStyle(
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: -.02 * 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
              ),
              PrivacyTextSpan(
                heading: "",
                desc:
                    "YOUR USE OF THE SERVICE IS AT YOUR SOLE RISK. THE SERVICE IS PROVIDED ON AN “AS IS” AND “AS AVAILABLE” BASIS. THE COMPANY PARTIES EXPRESSLY DISCLAIM ALL WARRANTIES OF ANY KIND, WHETHER EXPRESS, IMPLIED OR STATUTORY, INCLUDING THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, TITLE, AND NON-INFRINGEMENT.\n\nTHE COMPANY PARTIES MAKE NO WARRANTY THAT (A) THE SERVICE WILL MEET YOUR REQUIREMENTS; (B) THE SERVICE WILL BE UNINTERRUPTED, TIMELY, SECURE, OR ERROR-FREE; (C) THE RESULTS THAT MAY BE OBTAINED FROM THE USE OF THE SERVICE WILL BE ACCURATE OR RELIABLE; OR (D) THE QUALITY OF ANY PRODUCTS, SERVICES, INFORMATION, OR OTHER MATERIAL PURCHASED OR OBTAINED BY YOU THROUGH THE SERVICE WILL MEET YOUR EXPECTATIONS.",
              ),
              Text(
                'Limitation of Liability',
                style: TextStyle(
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: -.02 * 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
              ),
              PrivacyTextSpan(
                heading: "",
                desc:
                    "YOU EXPRESSLY UNDERSTAND AND AGREE THAT THE COMPANY PARTIES WILL NOT BE LIABLE FOR ANY INDIRECT, INCIDENTAL, SPECIAL, CONSEQUENTIAL, EXEMPLARY DAMAGES, OR DAMAGES FOR LOSS OF PROFITS INCLUDING DAMAGES FOR LOSS OF GOODWILL, USE, OR DATA OR OTHER INTANGIBLE LOSSES (EVEN IF THE COMPANY PARTIES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES), WHETHER BASED ON CONTRACT, TORT, NEGLIGENCE, STRICT LIABILITY, OR OTHERWISE, RESULTING FROM: (A) THE USE OR THE INABILITY TO USE THE SERVICE; (B) THE COST OF PROCUREMENT OF SUBSTITUTE GOODS AND SERVICES RESULTING FROM ANY GOODS, DATA, INFORMATION, OR SERVICES PURCHASED OR OBTAINED OR MESSAGES RECEIVED OR TRANSACTIONS ENTERED INTO THROUGH OR FROM THE SERVICE; (C) UNAUTHORIZED ACCESS TO OR ALTERATION OF YOUR TRANSMISSIONS OR DATA; (D) STATEMENTS OR CONDUCT OF ANY THIRD PARTY ON THE SERVICE; OR (E) ANY OTHER MATTER RELATING TO THE SERVICE. IN NO EVENT WILL THE COMPANY PARTIES’ TOTAL LIABILITY TO YOU FOR ALL DAMAGES, LOSSES, OR CAUSES OF ACTION EXCEED THE AMOUNT YOU HAVE PAID COMPANY IN THE LAST SIX (6) MONTHS, OR, IF GREATER, ONE HUNDRED DOLLARS (\$100).\n\n SOME JURISDICTIONS DO NOT ALLOW THE DISCLAIMER OR EXCLUSION OF CERTAIN WARRANTIES OR THE LIMITATION OR EXCLUSION OF LIABILITY FOR INCIDENTAL OR CONSEQUENTIAL DAMAGES. ACCORDINGLY, SOME OF THE ABOVE LIMITATIONS SET FORTH ABOVE MAY NOT APPLY TO YOU OR BE ENFORCEABLE WITH RESPECT TO YOU. IF YOU ARE DISSATISFIED WITH ANY PORTION OF THE SERVICE OR WITH THESE TERMS OF SERVICE, YOUR SOLE AND EXCLUSIVE REMEDY IS TO DISCONTINUE USE OF THE SERVICE. \n\n IF YOU ARE A USER FROM NEW JERSEY, THE FOREGOING SECTIONS TITLED “INDEMNIFICATION”, “DISCLAIMER OF WARRANTIES” AND “LIMITATION OF LIABILITY” ARE INTENDED TO BE ONLY AS BROAD AS IS PERMITTED UNDER THE LAWS OF THE STATE OF NEW JERSEY. IF ANY PORTION OF THESE SECTIONS IS HELD TO BE INVALID UNDER THE LAWS OF THE STATE OF NEW JERSEY, THE INVALIDITY OF SUCH PORTION WILL NOT AFFECT THE VALIDITY OF THE REMAINING PORTIONS OF THE APPLICABLE SECTIONS VALIDITY OF THE REMAINING PORTIONS OF THE APPLICABLE SECTIONS.",
              ),
              Text(
                'Dispute Resolution By Binding Arbitration',
                style: TextStyle(
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: -.02 * 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
              ),
              AppText.poppinsMedium(
                'PLEASE READ THIS SECTION CAREFULLY AS IT AFFECTS YOUR RIGHTS.',
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: PrivacyTextColumn(
                  heading: 'a. Agreement to Arbitrate',
                  desc:
                      'This Dispute Resolution by Binding Arbitration section is referred to in these Terms of Service as the “Arbitration Agreement.” You agree that any and all disputes or claims that have arisen or may arise between you and Company, whether arising out of or relating to these Terms of Service (including any alleged breach thereof), the Service, any advertising, or any aspect of the relationship or transactions between us, will be resolved exclusively through final and binding arbitration, rather than a court, in accordance with the terms of this Arbitration Agreement, except that you may assert individual claims in small claims court, if your claims qualify. Further, this Arbitration Agreement does not preclude you from bringing issues to the attention of federal, state, or local agencies, and such agencies can, if the law allows, seek relief against us on your behalf. You agree that, by entering into these Terms of Service, you and Company are each waiving the right to a trial by jury or to participate in a class action. Your rights will be determined by a neutral arbitrator, not a judge or jury. The Federal Arbitration Act governs the interpretation and enforcement of this Arbitration Agreement.',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: PrivacyTextColumn(
                  isBold: true,
                  heading:
                      'b. Prohibition of Class and Representative Actions and Non-Individualized Relief',
                  desc:
                      'YOU AND COMPANY AGREE THAT EACH OF US MAY BRING CLAIMS AGAINST THE OTHER ONLY ON AN INDIVIDUAL BASIS AND NOT AS A PLAINTIFF OR CLASS MEMBER IN ANY PURPORTED CLASS OR REPRESENTATIVE ACTION OR PROCEEDING. UNLESS BOTH YOU AND COMPANY AGREE OTHERWISE, THE ARBITRATOR MAY NOT CONSOLIDATE OR JOIN MORE THAN ONE PERSON’S OR PARTY’S CLAIMS AND MAY NOT OTHERWISE PRESIDE OVER ANY FORM OF A CONSOLIDATED, REPRESENTATIVE, OR CLASS PROCEEDING. ALSO, THE ARBITRATOR MAY AWARD RELIEF (INCLUDING MONETARY, INJUNCTIVE, AND DECLARATORY RELIEF) ONLY IN FAVOR OF THE INDIVIDUAL PARTY SEEKING RELIEF AND ONLY TO THE EXTENT NECESSARY TO PROVIDE RELIEF NECESSITATED BY THAT PARTY’S INDIVIDUAL CLAIM(S), EXCEPT THAT YOU MAY PURSUE A CLAIM FOR AND THE ARBITRATOR MAY AWARD PUBLIC INJUNCTIVE RELIEF UNDER APPLICABLE LAW TO THE EXTENT REQUIRED FOR THE ENFORCEABILITY OF THIS PROVISION.',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4.h,
                  children: [
                    AppText.poppinsMedium(
                      "c. Pre-Arbitration Dispute Resolution",
                      fontSize: 14,
                      height: 22 / 14,
                      letterSpacing: -.02 * 14,
                      color: AppColors.black,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text:
                                "Company is always interested in resolving disputes amicably and efficiently, and most customer concerns can be resolved quickly and to the customer’s satisfaction by emailing customer support at ",
                            style: AppTextStyles.poppinsMedium(
                              fontSize: 14,
                              height: 22 / 14,
                              letterSpacing: -.02 * 14,
                              color: AppColors.black.withValues(alpha: 0.6),
                            ),
                          ),
                          TextSpan(
                            text: "fittd.managment@gmail.com",
                            style: AppTextStyles.poppinsSemiBold(
                              fontSize: 14,
                              height: 22 / 14,
                              letterSpacing: -.04 * 14,
                              color: AppColors.black,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrl(Uri.parse(
                                    'mailto:fittd.managment@gmail.com'));
                              },
                          ),
                          TextSpan(
                            text:
                                " If such efforts prove unsuccessful, a party who intends to seek arbitration must first send to the other, by certified mail, a written Notice of Dispute (“Notice”). The Notice to Company should be sent to 8605 Santa Monica Blvd 479590 West Hollywood, CA 90069 (“Notice Address”). The Notice must (i) describe the nature and basis of the claim or dispute and (ii) set forth the specific relief sought. If Company and you do not resolve the claim within sixty (60) calendar days after the Notice is received, you or Company may commence an arbitration proceeding. During the arbitration, the amount of any settlement offer made by Company or you will not be disclosed to the arbitrator until after the arbitrator determines the amount, if any, to which you or Company is entitled",
                            style: AppTextStyles.poppinsRegular(
                              fontSize: 14,
                              height: 22 / 14,
                              letterSpacing: -.02 * 14,
                              color: AppColors.black.withValues(alpha: 0.6),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: PrivacyTextColumn(
                  heading: 'd. Arbitration Procedures',
                  desc:
                      'Arbitration will be conducted by a neutral arbitrator in accordance with the American Arbitration Association’s (“AAA”) rules and procedures, including the AAA’s Consumer Arbitration Rules (collectively, the “AAA Rules”), as modified by this Arbitration Agreement. For information on the AAA, please visit its website, https://www.adr.org. Information about the AAA Rules and fees for consumer disputes can be found at the AAA’s consumer arbitration page,  https://www.adr.org/consumer. If there is any inconsistency between any term of the AAA Rules and any term of this Arbitration Agreement, the applicable terms of this Arbitration Agreement will control unless the arbitrator determines that the application of the inconsistent Arbitration Agreement terms would not result in a fundamentally fair arbitration. The arbitrator must also follow the provisions of these Terms of Service as a court would. All issues are for the arbitrator to decide, including issues relating to the scope, enforceability, and arbitrability of this Arbitration Agreement. Although arbitration proceedings are usually simpler and more streamlined than trials and other judicial proceedings, the arbitrator can award the same damages and relief on an individual basis that a court can award to an individual under these Terms of Service and applicable law. Decisions by the arbitrator are enforceable in court and may be overturned by a court only for very limited reasons.\n\nUnless Company and you agree otherwise, any arbitration hearings will take place in a reasonably convenient location for both parties with due consideration of their ability to travel and other pertinent circumstances. If the parties are unable to agree on a location, the determination will be made by AAA. If your claim is for \$10,000 or less, Company agrees that you may choose whether the arbitration will be conducted solely on the basis of documents submitted to the arbitrator, through a telephonic hearing, or by an in-person hearing as established by the AAA Rules. If your claim exceeds \$10,000, the right to a hearing will be determined by the AAA Rules. Regardless of the manner in which the arbitration is conducted, the arbitrator will issue a reasoned written decision sufficient to explain the essential findings and conclusions on which the award is based.',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: PrivacyTextColumn(
                  heading: 'e. Costs of Arbitration',
                  desc:
                      'Payment of all filing, administration, and arbitrator fees (collectively, the “Arbitration Fees”) will be governed by the AAA Rules, unless otherwise provided in this Arbitration Agreement.  To the extent any Arbitration Fees are not specifically allocated to either Company or you under the AAA Rules, Company and you shall split them equally; provided that if you are able to demonstrate to the arbitrator that you are economically unable to pay your portion of such Arbitration Fees or if the arbitrator otherwise determines for any reason that you should not be required to pay your portion of any Arbitration Fees, Company will pay your portion of such fees. In addition, if you demonstrate to the arbitrator that the costs of arbitration will be prohibitive as compared to the costs of litigation, Company will pay as much of the Arbitration Fees as the arbitrator deems necessary to prevent the arbitration from being cost-prohibitive. Any payment of attorneys’ fees will be governed by the AAA Rules.',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: PrivacyTextColumn(
                    heading: 'f. Confidentiality',
                    desc:
                        "All aspects of the arbitration proceeding, and any ruling, decision, or award by the arbitrator, will be strictly confidential for the benefit of all parties."),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: PrivacyTextColumn(
                  heading: 'g. Severability',
                  desc:
                      'If a court or the arbitrator decides that any term or provision of this Arbitration Agreement (other than the subsection (b) above titled “Prohibition of Class and Representative Actions and Non-Individualized Relief” above) is invalid or unenforceable, the parties agree to replace such term or provision with a term or provision that is valid and enforceable and that comes closest to expressing the intention of the invalid or unenforceable term or provision, and this Arbitration Agreement will be enforceable as so modified. If a court or the arbitrator decides that any of the provisions of subsection (b) above titled “Prohibition of Class and Representative Actions and Non-Individualized Relief” are invalid or unenforceable, then the entirety of this Arbitration Agreement will be null and void, unless such provisions are deemed to be invalid or unenforceable solely with respect to claims for public injunctive relief. The remainder of these Terms of Service will continue to apply.',
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: PrivacyTextColumn(
                  heading: 'h. Future Changes to Arbitration Agreement',
                  desc:
                      'Notwithstanding any provision in these Terms of Service to the contrary, Company agrees that if it makes any future change to this Arbitration Agreement (other than a change to the Notice Address) while you are a user of the Service, you may reject any such change by sending Company written notice within thirty (30) calendar days of the change to the Notice Address provided above. By rejecting any future change, you are agreeing that you will arbitrate any dispute between us in accordance with the language of this Arbitration Agreement as of the date you first accepted these Terms of Service (or accepted any subsequent changes to these Terms of Service)',
                ),
              ),
              Text(
                'Termination',
                style: TextStyle(
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: -.02 * 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
              ),
              AppText.poppinsRegular(
                "You agree that Company, in its sole discretion, may suspend or terminate your account (or any part thereof) or use of the Service and remove and discard any content within the Service, for any reason, including for lack of use or if Company believes that you have violated or acted inconsistently with the letter or spirit of these Terms of Service. Any suspected fraudulent, abusive, or illegal activity that may be grounds for termination of your use of the Service, may be referred to appropriate law enforcement authorities. Company may also in its sole discretion and at any time discontinue providing the Service, or any part thereof, with or without notice. You agree that any termination of your access to the Service under any provision of these Terms of Service may be effected without prior notice, and acknowledge and agree that Company may immediately deactivate or delete your account and all related information and files in your account and/or bar any further access to such files or the Service. Further, you agree that Company will not be liable to you or any third party for any termination of your access to the Service.",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black.withValues(alpha: 0.6),
              ),
              Text(
                'User Disputes',
                style: TextStyle(
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: -.02 * 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
              ),
              AppText.poppinsRegular(
                "You agree that you are solely responsible for your interactions with any other user in connection with the Service, and Company will have no liability or responsibility with respect thereto. Company reserves the right, but has no obligation, to become involved in any way with disputes between you and any other user of the Service",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black.withValues(alpha: 0.6),
              ),
              Text(
                'General',
                style: TextStyle(
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: -.02 * 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
              ),
              AppText.poppinsRegular(
                "These Terms of Service (together with the terms incorporated by reference herein) constitute the entire agreement between you and Company governing your access and use of the Service, and supersede any prior agreements between you and Company with respect to the Service. You also may be subject to additional terms and conditions that may apply when you use Third-Party Services, third-party content or third-party software. These Terms of Service will be governed by the laws of the State of California without regard to its conflict of law provisions. With respect to any disputes or claims not subject to arbitration, as set forth above, you and Company submit to the personal and exclusive jurisdiction of the state and federal courts located within Los Angeles County, California. The failure of Company to exercise or enforce any right or provision of these Terms of Service will not constitute a waiver of such right or provision. If any provision of these Terms of Service is found by a court of competent jurisdiction to be invalid, the parties nevertheless agree that the court should endeavor to give effect to the parties’ intentions as reflected in the provision, and the other provisions of these Terms of Service remain in full force and effect. You agree that regardless of any statute or law to the contrary, any claim or cause of action arising out of or related to use of the Service or these Terms of Service must be filed within one (1) year after such claim or cause of action arose or be forever barred. A printed version of these Terms of Service and of any notice given in electronic form will be admissible in judicial or administrative proceedings based upon or relating to these Terms of Service to the same extent and subject to the same conditions as other business documents and records originally generated and maintained in printed form. You may not assign these Terms of Service without the prior written consent of Company, but Company may assign or transfer these Terms of Service, in whole or in part, without restriction. The section titles in these Terms of Service are for convenience only and have no legal or contractual effect. As used in these Terms of Service, the words “include” and “including,” and variations thereof, will not be deemed to be terms of limitation, but rather will be deemed to be followed by the words “without limitation.” Notices to you may be made via either email or regular mail. The Service may also provide notices to you of changes to these Terms of Service or other matters by displaying notices or links to notices generally on the Service. Company will not be in default hereunder by reason of any failure or delay in the performance of its obligations where such failure or delay is due to civil disturbances, riot, epidemic, hostilities, war, terrorist attack, embargo, natural disaster, acts of God, flood, fire, sabotage, fluctuations or unavailability of electrical power, network access or equipment, or any other circumstances or causes beyond Company’s reasonable control.",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black.withValues(alpha: 0.6),
              ),
              Text(
                'U.S. Government Restricted Rights',
                style: TextStyle(
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: -.02 * 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
              ),
              AppText.poppinsRegular(
                "The Service is made available to the U.S. government with “RESTRICTED RIGHTS.” Use, duplication, or disclosure by the U.S. government is subject to the restrictions contained in 48 CFR 52.227-19 and 48 CFR 252.227-7013 et seq. or its successor. Access or use of the Service (including the Software) by the U.S. government constitutes acknowledgement of our proprietary rights in the Service (including the  Software).",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black.withValues(alpha: 0.6),
              ),
              Text(
                'Questions? Concerns? Suggestions?',
                style: TextStyle(
                  fontSize: 18,
                  height: 22 / 18,
                  letterSpacing: -.02 * 18,
                  color: AppColors.black,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  decoration: TextDecoration.underline,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Please contact us at ",
                      style: AppTextStyles.poppinsMedium(
                        fontSize: 14,
                        height: 22 / 14,
                        letterSpacing: -.02 * 14,
                        color: AppColors.black.withValues(alpha: 0.6),
                      ),
                    ),
                    TextSpan(
                      text: "fittd.managment@gmail.com",
                      style: AppTextStyles.poppinsSemiBold(
                        fontSize: 14,
                        height: 22 / 14,
                        letterSpacing: -.04 * 14,
                        color: AppColors.black,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(
                              Uri.parse('mailto:fittd.managment@gmail.com'));
                        },
                    ),
                    TextSpan(
                      text:
                          " and 8605 Santa Monica Blvd 479590 West Hollywood, CA 90069 to report any violations of these Terms of Service or to pose any questions regarding these Terms of Service or the Service.",
                      style: AppTextStyles.poppinsRegular(
                        fontSize: 14,
                        height: 22 / 14,
                        letterSpacing: -.02 * 14,
                        color: AppColors.black.withValues(alpha: 0.6),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
