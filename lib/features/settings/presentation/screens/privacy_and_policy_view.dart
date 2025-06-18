import 'package:fitted/config/helper/typography/app_text_styles.dart';
import 'package:fitted/config/widgets/app_text.dart';
import 'package:fitted/features/settings/presentation/widgets/text_spans.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../config/colors/colors.dart';

class PrivacyAndPolicyView extends StatelessWidget {
  const PrivacyAndPolicyView({super.key});

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
          "Privacy Policy ",
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
              AppText.poppinsSemiBold(
                "Last Updated May 9, 2024",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              AppText.poppinsRegular(
                "Fittd, Inc. (“Company,” “we,” “us,” or “our”) has prepared this Privacy Policy to explain what personal information we collect, how we use and share that information, and your choices concerning our information practices. Through our mobile application and website, we customized recommendations of fashion brands and items to users based on their unique sizing (collectively, the “Service”).\n\nThis Privacy Policy explains what personal information we collect, how we use and share that information, and your choices concerning our information practices.\n\nBefore using the Service or submitting any personal information to Company, please review this Privacy Policy carefully and contact us if you have any questions. By using the Service, you agree to the practices described in this Privacy Policy. If you do not agree to this Privacy Policy, please do not access the Site or otherwise use the Service.",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black.withValues(alpha: 0.6),
              ),
              AppText.poppinsSemiBold(
                "1. PERSONAL INFORMATION COLLECTION",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              AppText.poppinsSemiBold(
                "Personal Information We Collect From You:",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Column(
                  spacing: 4.h,
                  children: [
                    PrivacyTextSpan(
                      heading: "• Identification Information: ",
                      desc: "We collect your name, and email address.",
                    ),
                    PrivacyTextSpan(
                      heading: "• Communication Information:",
                      desc:
                          "We may collect information when you contact us with questions or concerns and when you voluntarily respond to questionnaires, surveys or requests for market research seeking your opinion and feedback",
                    ),
                    PrivacyTextSpan(
                      heading: "• Commercial Information: ",
                      desc:
                          "We may retain a history of the products you browse and/or purchase using the Service.",
                    ),
                    PrivacyTextSpan(
                      heading: "•Demographic Information:",
                      desc: "We collect your age and gender.",
                    ),
                  ],
                ),
              ),
              PrivacyTextSpan(
                heading: "Internet Activity Information: ",
                desc:
                    "When you use the Service, we may automatically log the following information",
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Column(
                  spacing: 4.h,
                  children: [
                    PrivacyTextSpan(
                      heading: "• Device Information: ",
                      desc:
                          "The manufacturer and model, operating system, browser type, IP address, and unique identifiers of the device you use to access the Service. The information we collect may vary based on your device type and settings.",
                    ),
                    LinkTextSpan(
                      heading: "• Usage Information: ",
                      beforeLinkText:
                          "Information about how you use our Service, such as the types of content that you view or engage with, the features you use,   the   actions   you   take,   and   the   time, frequency, and duration of your activities. We use Google Analytics, a web analytics service provided by Google LLC (“Google”) to help collect and analyze Usage Information. For more information on how Google uses this information, click",
                      link: " here.",
                      onTap: () => launchUrl(
                        Uri.parse(
                            "https://policies.google.com/technologies/partner-sites"),
                      ),
                      afterLinkText: "",
                    ),
                    PrivacyTextSpan(
                      heading: "• Email Open/Click Information: ",
                      desc:
                          "We may collect information about the date and time you open or click links in emails we send.",
                    ),
                    PrivacyTextSpan(
                      heading: "•Demographic Information:",
                      desc: "We collect your age and gender.",
                    ),
                  ],
                ),
              ),
              PrivacyTextSpan(
                desc: "",
                heading:
                    "We may use the following technologies to collect Internet Activity Information:",
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Column(
                  spacing: 4.h,
                  children: [
                    PrivacyTextSpan(
                        heading: "• Cookies,",
                        desc:
                            "which are text files stored on your device to uniquely identify your browser or to store information or settings in the browser to help you navigate between pages efficiently, remember your preferences, enable functionality, help us understand user activity and patterns, and facilitate online advertising."),
                    PrivacyTextSpan(
                      heading: "• Local storage technologies, ",
                      desc:
                          "like HTML5, that provide cookie-equivalent functionality but can store larger amounts of data, including on your device outside of your browser in connection with specific applications.",
                    ),
                    PrivacyTextSpan(
                      heading: "• Web beacons, ",
                      desc:
                          "also known as pixel tags or clear GIFs, which are used to demonstrate that a webpage or email was accessed or opened, or that certain content was viewed or clicked",
                    ),
                  ],
                ),
              ),
              PrivacyTextSpan(
                heading: "Derived Information: ",
                desc:
                    "We may infer your preferences for suggested brands and clothing based on the personal information we collect about you.",
              ),
              AppText.poppinsSemiBold(
                "2. PERSONAL INFORMATION USE",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              PrivacyTextSpan(
                heading: "",
                desc:
                    "We use your personal information for the following purposes:",
              ),
              PrivacyTextSpan(
                heading: "Service Delivery,",
                desc: " including to:",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: PrivacyTextSpan(
                  heading: "",
                  desc:
                      "• Provide, operate, maintain, and secure the Service;\n\n• Create, maintain, and authenticate your account; and",
                ),
              ),
              PrivacyTextSpan(
                heading: "Communicating with You,",
                desc: " including to:",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: PrivacyTextSpan(
                  heading: "",
                  desc:
                      "• send you updates about administrative matters such as changes to our terms or policies; and\n\n• provide user support, and respond to your requests, questions and feedback.",
                ),
              ),
              PrivacyTextSpan(
                heading: "Marketing and Advertising,",
                desc: " including for:",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: PrivacyTextSpan(
                  heading: "• Direct Marketing:",
                  desc:
                      " To send you marketing communications, including notifying you of special promotions, offers and events via email and other means; and",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: PrivacyTextSpan(
                  heading: "• Interest-Based Advertising:",
                  desc:
                      " We engage advertising partners, including third party advertising companies and social media companies, to display ads on the Service and other online services. These companies may use cookies and similar technologies to collect Internet Activity Information over time across the Service, our communications, and other online services, and use that information to serve online ads that they think will interest you. This is called interest-based advertising. We may also share information about our users with these companies to facilitate interest-based advertising to similar users (known as a “lookalike audience”) on other online platforms. You can learn more about your choices for limiting interest-based advertising in the Limit Online Tracking section below.",
                ),
              ),
              PrivacyTextSpan(
                heading: "Compliance and Protection,",
                desc: " including to:",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: PrivacyTextSpan(
                  heading: "",
                  desc:
                      "• Comply with applicable laws, lawful requests, and legal process, such as to respond to subpoenas or requests from government authorities;\n\n"
                      "• Protect our, your or others’ rights, privacy, safety or property (including by making and defending legal claims);\n\n"
                      "• Audit our compliance with legal and contractual requirements and internal policies; and\n\n"
                      "• Prevent, identify, investigate and deter fraudulent, harmful, unauthorized, unethical or illegal activity, including cyberattacks and identity theft.",
                ),
              ),
              AppText.poppinsSemiBold(
                "PERSONAL INFORMATION SHARING",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              PrivacyTextSpan(
                heading: "Our Sharing:",
                desc:
                    " We do not sell, rent, license, or lease your personal information to third parties. However, we may share personal information with:",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: PrivacyTextSpan(
                  heading: "",
                  desc:
                      "• Service Providers, including hosting services, email services, advertising and marketing services, customer support services, and analytics services. We take commercially reasonable steps to ensure our service providers adhere to the security standards we apply to your personal information.\n\n"
                      "• Professional Advisors, such as lawyers and accountants, where doing so is necessary to facilitate the services they render to us.\n\n"
                      "• Business Transaction Recipients, such as counterparties and others assisting with a merger, acquisition, financing, reorganization, bankruptcy, receivership, dissolution, asset sale, or similar transaction, and with successors or affiliates as part of or following that transaction.\n\n"
                      "• Government Authorities, where required to do so for the Compliance and Protection purposes described above.",
                ),
              ),
              PrivacyTextSpan(
                heading: "Your Sharing:",
                desc:
                    " Through the Service, you may be able to make your personal information available to others, including:",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: PrivacyTextSpan(
                  heading: "",
                  desc:
                      "• Other users and the public, when you share information particular to you with other individuals of your choosing through the Service;\n\n"
                      "• Social media platforms, when you choose to share content on social media.",
                ),
              ),
              AppText.poppinsSemiBold(
                "4. PERSONAL INFORMATION RETENTION",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              PrivacyTextSpan(
                heading: "",
                desc:
                    "We keep personal information until we no longer need it to satisfy the purposes described in this Privacy Policy and we have no legal obligation to keep it.",
              ),
              AppText.poppinsSemiBold(
                "5. NOTICE TO CALIFORNIA RESIDENTS",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              PrivacyTextSpan(
                heading: "",
                desc:
                    "Where provided for by law and subject to any applicable exceptions, California residents may have the following rights:",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: PrivacyTextSpan(
                  heading: "",
                  desc:
                      "• Know: You can request to know the categories of personal information that Company has collected about you, the business purpose for collecting your personal information, the categories of sources from which the personal information was collected, whether Company has disclosed your personal information for business purposes, the categories of personal information so disclosed, and the categories of third parties to whom we have disclosed your personal information (we provide this information in the Personal Information Collection, Use, and Sharing sections above);\n\n"
                      "• Access: You can request access to the specific pieces of personal information that Company has collected about you;\n\n"
                      "• Delete: You can request that we delete the personal information we collected from you;\n\n"
                      "• Opt out: To opt out: we may share Identification Information and Internet Activity Information with social media platforms and other advertising partners that will use that information to serve you targeted advertisements on social media platforms and other third party websites – under certain regulations such sharing may be considered a “sale” of personal information.",
                ),
              ),
              PrivacyTextSpan(
                heading: "",
                desc:
                    "If you would like to exercise any of these rights, or want an alternative form of this Privacy Policy, please contact us. After we receive your request, we may request additional information from you to verify your identity. Your authorized agent may submit requests in the same manner, although we may require the agent to present signed written permission to act on your behalf, and you may also be required to independently verify your identity with us and confirm that you authorized the agent to submit the request. We will not treat you differently for exercising your rights.",
              ),
              LinkTextSpan(
                  heading: "Third Party Marketing: ",
                  link: " fittd.managment@gmail.com ",
                  beforeLinkText:
                      "If you are a California resident and wish to opt out of sharing"
                      "your personal information with third parties for their direct marketing purposes, please email  Company at",
                  onTap: () =>
                      launchUrl(Uri.parse('mailto:fittd.managment@gmail.com')),
                  afterLinkText:
                      "and clearly state your request, including your name, mailing address, email address, and phone number. Please see the “Your Choices” section of this Privacy Policy for additional information."),
              AppText.poppinsSemiBold(
                "6. CHILDREN",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              PrivacyTextSpan(
                heading: "",
                desc:
                    "Our Service is not directed to children who are under the age of 16. Company does not knowingly collect personal information from children under the age of 16. If we learn that we have collected personal information from a child under the age of 16 without the consent of the child’s parent or guardian as required by law, we will delete that information.",
              ),
              AppText.poppinsSemiBold(
                "7. LINKS TO OTHER WEBSITES",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              PrivacyTextSpan(
                heading: "",
                desc:
                    "The Service may contain links to other websites not operated or controlled by Company, including social media services (“Third Party Sites”). The information that you share with Third Party Sites will be governed by the specific privacy policies and terms of service of the Third Party Sites and not by this Privacy Policy. By providing these links we do not imply that we endorse or have reviewed these sites. Please contact the Third Party Sites directly for information on their privacy practices and policies.",
              ),
              AppText.poppinsSemiBold(
                "8. SECURITY",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              PrivacyTextSpan(
                heading: "",
                desc:
                    "We employ a number of technical, organizational and physical safeguards designed to protect the personal information we collect. However, we cannot guarantee the security of your personal information and you use the Service at your own risk.",
              ),
              AppText.poppinsSemiBold(
                "9. YOUR CHOICES",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              PrivacyTextSpan(
                heading: "Update or Correct Personal Information:",
                desc:
                    " You can contact us and request any updates or corrections needed to keep your personal information accurate, current, and complete.",
              ),
              PrivacyTextSpan(
                heading: "Opt Out of Marketing Communications:",
                desc:
                    " You may opt out of marketing communications by following the unsubscribe instructions in any marketing email we send you. Please note, however, that you may continue to receive communications as described in the Communicating with You section after opting out of marketing communications.",
              ),
              PrivacyTextSpan(
                heading: "Limit Online Tracking:",
                desc:
                    " Here are some of the ways you can limit online tracking:",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: PrivacyTextSpan(
                    heading: "• Block Cookies:",
                    desc:
                        "Most browsers let you remove or reject cookies, including cookies used for interest-based advertising. To do this, follow the instructions in your browser settings. Many browsers accept cookies by default until you change your settings. Use the following links to learn more about how to control cookies and online tracking through your browser"),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "• FireFox",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrl(Uri.parse(
                              "https://support.mozilla.org/en-US/kb/enhanced-tracking-protection-firefox-desktop")),
                      ),
                      TextSpan(
                        text: "; Chrome",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrl(Uri.parse(
                              "https://support.google.com/chrome/answer/95647")),
                      ),
                      TextSpan(
                        text: "; Edge",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrl(Uri.parse(
                              "https://support.microsoft.com/en-us/microsoft-edge/learn-about-tracking-prevention-in-microsoft-edge-5ac125e8-9b90-8d59-fa2c-7f2e9a44d869")),
                      ),
                      TextSpan(
                        text: "; Safari",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrl(Uri.parse(
                              "https://support.apple.com/guide/safari/manage-cookies-sfri11471/mac")),
                      ),
                    ]),
                  )),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: PrivacyTextSpan(
                  heading: "• Limit the Use of Advertising ID:",
                  desc:
                      " You may be able to limit use of your mobile device’s advertising ID for interest-based advertising purposes through your device’s settings.",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "• Use Privacy Plug-Ins or Browsers: ",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                      ),
                      TextSpan(
                        text:
                            "You can block our Services from setting cookies used for interest-based ads by using a browser with privacy features, like ",
                        style: AppTextStyles.poppinsRegular(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black.withValues(alpha: 0.6),
                        ),
                      ),
                      TextSpan(
                        text: "Brave ",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () => launchUrl(Uri.parse("https://brave.com/")),
                      ),
                      TextSpan(
                        text: ",or installing browser plugins like",
                        style: AppTextStyles.poppinsRegular(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black.withValues(alpha: 0.6),
                        ),
                      ),
                      TextSpan(
                        text: " Privacy Badger",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrl(
                              Uri.parse("https://www.eff.org/privacybadger")),
                      ),
                      TextSpan(
                        text: " Privacy Badger",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrl(
                              Uri.parse("https://www.eff.org/privacybadger")),
                      ),
                      TextSpan(
                        text: ", DuckDuckGo",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrl(
                              Uri.parse("https://www.eff.org/privacybadger")),
                      ),
                      TextSpan(
                        text: ", Ghostery",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrl(
                              Uri.parse("https://www.eff.org/privacybadger")),
                      ),
                      TextSpan(
                        text: " or,",
                        style: AppTextStyles.poppinsRegular(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black.withValues(alpha: 0.6),
                        ),
                      ),
                      TextSpan(
                        text: " uBlock Origin ",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap =
                              () => launchUrl(Uri.parse("https://ublock.org/")),
                      ),
                      TextSpan(
                        text:
                            "and configuring them to block third party cookies/trackers. You can also install a browser add-on to opt out of",
                        style: AppTextStyles.poppinsRegular(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black.withValues(alpha: 0.6),
                        ),
                      ),
                      TextSpan(
                        text: " Google Analytics",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrl(Uri.parse(
                              "https://tools.google.com/dlpage/gaoptout")),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: PrivacyTextSpan(
                  heading: "• Advertising Industry Opt-Outs:",
                  desc:
                      " You can also use these opt-out options to limit use of your information for interest-based advertising by participating companies.",
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(
                        text: "• Digital Advertising Alliance",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrl(
                              Uri.parse("http://optout.aboutads.info/")),
                      ),
                      TextSpan(
                        text: "\n• Network Advertisiing Initiative",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrl(Uri.parse(
                              "http://optout.networkadvertising.org/?c=1")),
                      ),
                    ],
                  ))),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: PrivacyTextSpan(
                  heading: "• Platform Opt-Outs:",
                  desc:
                      " The following advertising platforms offer opt-out features that let you opt out of use of your information for interest-based advertising.",
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: RichText(
                      text: TextSpan(
                    children: [
                      TextSpan(
                        text: "• Google Opt Out",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrl(
                              Uri.parse("https://adssettings.google.com/")),
                      ),
                      TextSpan(
                        text: "\n• Pintrest Opt Out",
                        style: AppTextStyles.poppinsSemiBold(
                          fontSize: 14,
                          height: 22 / 14,
                          letterSpacing: -.02 * 14,
                          color: AppColors.black,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launchUrl(
                              Uri.parse("https://www.pinterest.com/")),
                      ),
                    ],
                  ))),
              PrivacyTextSpan(
                heading: "",
                desc:
                    "Note that the above opt-out mechanisms are specific to the device or browser on which they are exercised. You will need to opt out on every browser and device that you use.",
              ),
              LinkTextSpan(
                heading: "",
                beforeLinkText:
                    "Facebook also allows you to limit how your Internet Activity Information and browsing history can used to serve advertisements. Click",
                link: ' here ',
                onTap: () => launchUrl(
                    Uri.parse("https://www.facebook.com/help/568137493302217")),
                afterLinkText: "to learn more",
              ),
              LinkTextSpan(
                heading: "Do Not Track:",
                beforeLinkText:
                    " We currently do not respond to \"Do Not Track\" or similar signals. Learn more about \"Do Not Track\" ",
                link: " here",
                onTap: () => launchUrl(Uri.parse(
                    "https://fpf.org/thank-you-for-visiting-allaboutdnt-com/")),
                afterLinkText: ".",
              ),
              AppText.poppinsSemiBold(
                "10. CHANGES TO THE PRIVACY POLICY",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              PrivacyTextSpan(
                heading: "",
                desc:
                    "The Service and our business may change from time to time. As a result we may change this Privacy Policy at any time. When we do we will post an updated version on this page, unless another type of notice is required by applicable law. By continuing to use our Service or providing us with personal information after we have posted an updated Privacy Policy, or notified you by other means if applicable, you consent to the revised Privacy Policy and the practices described in it.",
              ),
              AppText.poppinsSemiBold(
                "11. CONTACT US",
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              LinkTextSpan(
                heading: "",
                beforeLinkText:
                    "If you have any questions about our Privacy Policy or information practices, please feel free to contact us at our designated request address: ",
                link: "fittd.managment@gmail.com",
                onTap: () =>
                    launchUrl(Uri.parse('mailto:fittd.managment@gmail.com')),
                afterLinkText: "",
              ),

              // GestureDetector(
              //   onTap: () async {
              //     final emailUri =
              //         Uri(scheme: 'mailto', path: 'fittd.managment@gmail.com');
              //     if (await canLaunchUrl(emailUri)) {
              //       await launchUrl(emailUri);
              //     }
              //   },
              //   child: Text(
              //
              //     style: TextStyle(
              //       color: AppColors.primary,
              //       decoration: TextDecoration.underline,
              //       fontSize: 14,
              //       height: 22 / 14,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class LinkTextSpan extends StatelessWidget {
  final String heading;
  final String link;
  final String beforeLinkText;
  final String afterLinkText;
  final VoidCallback onTap;

  const LinkTextSpan(
      {super.key,
      required this.heading,
      required this.link,
      required this.beforeLinkText,
      required this.onTap,
      required this.afterLinkText});
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: heading,
            style: AppTextStyles.poppinsMedium(
              fontSize: 14,
              height: 22 / 14,
              letterSpacing: -.02 * 14,
              color: AppColors.black,
            ),
          ),
          TextSpan(
            text: beforeLinkText,
            style: AppTextStyles.poppinsRegular(
              fontSize: 14,
              height: 22 / 14,
              letterSpacing: -.02 * 14,
              color: AppColors.black.withValues(alpha: 0.6),
            ),
          ),
          TextSpan(
              text: link,
              style: AppTextStyles.poppinsSemiBold(
                fontSize: 14,
                height: 22 / 14,
                letterSpacing: -.02 * 14,
                color: AppColors.black,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTap),
          TextSpan(
            text: afterLinkText,
            style: AppTextStyles.poppinsRegular(
              fontSize: 14,
              height: 22 / 14,
              letterSpacing: -.02 * 14,
              color: AppColors.black.withValues(alpha: 0.6),
            ),
          )
        ],
      ),
    );
  }
}
