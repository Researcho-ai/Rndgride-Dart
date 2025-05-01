import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'hi'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? hiText = '',
  }) =>
      [enText, hiText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // PrivacyPolicy
  {
    'ren2w0zf': {
      'en':
          'RNDgrid.com is a product of Zerofold Internet Pvt Ltd and from now on referred to as RNDgrid.com.',
      'hi': '',
    },
    'v2a14psm': {
      'en': '•',
      'hi': '',
    },
  },
  // ContactUs
  {
    'nugqv9nb': {
      'en': 'How can we help you?',
      'hi': '',
    },
    '8bsnw5tu': {
      'en':
          'Please select an option below to tell us what you are looking for:',
      'hi': '',
    },
    '1wln40as': {
      'en': 'Reach out to us directly at',
      'hi': '',
    },
    'wwwnrcxj': {
      'en': 'hello@rndgrid.com',
      'hi': '',
    },
    '3xodc14y': {
      'en': '+91 90545 03803',
      'hi': '',
    },
    'lj5x4fvx': {
      'en': 'Contact Us',
      'hi': '',
    },
    'hvnx571w': {
      'en': 'Contact Us',
      'hi': '',
    },
  },
  // Instruments
  {
    'k21bwglw': {
      'en': 'Resources',
      'hi': '',
    },
    'yhistp7b': {
      'en': 'Search  Instrument...',
      'hi': '',
    },
    'rnul1obx': {
      'en': 'Show More Instruments',
      'hi': '',
    },
    'lr9b7wb8': {
      'en': 'Resources',
      'hi': '',
    },
  },
  // AboutUs
  {
    'z0rr1vdk': {
      'en': 'About Us',
      'hi': '',
    },
    'vmog8yr1': {
      'en': 'Who we are',
      'hi': '',
    },
    'xb73z63u': {
      'en':
          'RNDgrid is an innovation-driven platform designed to simplify access to analytical testing, R&D facilities, and expert consultation for startups, students, and innovators. We bridge the gap between those who need cutting-edge scientific support and the labs, facilities, and minds that offer it.\n\nThrough our advanced search, streamlined request process, and centralized booking and payment system, we help you focus on innovation - not logistics.',
      'hi': '',
    },
    'hhywz9y8': {
      'en': 'Our mission',
      'hi': '',
    },
    'bee7lppg': {
      'en':
          'To democratize access to world-class R&D infrastructure, enabling every researcher, student, and innovator to accelerate scientific breakthroughs without barriers.',
      'hi': '',
    },
    'ew3limtk': {
      'en': 'Our vision',
      'hi': '',
    },
    'a2siwj6i': {
      'en':
          'To become the global gateway for on-demand research and innovation support by connecting individuals with top-tier labs, instruments, and scientific expertise—all in one place.',
      'hi': '',
    },
    '6jrqoh2b': {
      'en': 'Why RNDgrid exists',
      'hi': '',
    },
    '4i56pwl2': {
      'en':
          'Navigating multiple websites, contacting various labs, and managing logistics can drain time and energy from what really matters - innovation.\n\nRNDgrid centralizes the entire R&D service discovery process, from searching to booking, under one platform. Whether you need a microscope analysis, material testing, or expert interpretation of results, we ensure it’s just a few clicks away.',
      'hi': '',
    },
    '89c4r3nc': {
      'en': 'Why labs partner with us',
      'hi': '',
    },
    'c1zqwmgc': {
      'en': 'Reach the Right Audience',
      'hi': '',
    },
    'l4nx6e3r': {
      'en':
          'Get discovered by startups, researchers, and institutions actively seeking R&D services.',
      'hi': '',
    },
    'kgb913ct': {
      'en': 'Streamlined Bookings',
      'hi': '',
    },
    'a6hl0dhk': {
      'en':
          'We handle inquiries, quotes, and payments—so you can focus on delivering quality services.',
      'hi': '',
    },
    's3u8hny2': {
      'en': 'Build Credibility',
      'hi': '',
    },
    'nuw652yh': {
      'en':
          'Be recognized as a trusted provider on a platform built specifically for research and innovation.',
      'hi': '',
    },
    'vm1woejc': {
      'en': 'Showcase Capabilities',
      'hi': '',
    },
    'p2yyswmd': {
      'en':
          'Highlight your lab’s instruments, testing specialties, and success stories to a qualified, research-oriented audience.',
      'hi': '',
    },
    'eq7g4jyp': {
      'en':
          'Joining RNDgrid means being part of a global ecosystem shaping the future of science and technology.',
      'hi': '',
    },
    'elbep121': {
      'en': 'Let’s Build the Future, Together',
      'hi': '',
    },
    '6s64ziso': {
      'en':
          'We believe the next scientific breakthrough could come from a garage startup, a university lab, or an independent thinker. RNDgrid is here to make sure they have what they need to make it happen.',
      'hi': '',
    },
    'tlpo99cr': {
      'en': 'Our Team',
      'hi': '',
    },
    'i97tel41': {
      'en': 'Dr. Janki Shah',
      'hi': '',
    },
    'diy2guy7': {
      'en': 'CEO',
      'hi': '',
    },
    'sagzzy3z': {
      'en': 'Akash Patel',
      'hi': '',
    },
    '3uoowwjf': {
      'en': 'CTO',
      'hi': '',
    },
    'gv1vetiz': {
      'en': 'Rahul Thakur',
      'hi': '',
    },
    'g3r6is28': {
      'en': 'Developer',
      'hi': '',
    },
    '51doyj3i': {
      'en': 'About Us',
      'hi': '',
    },
  },
  // Profile
  {
    'gxtgsiam': {
      'en': 'Profile',
      'hi': '',
    },
    'jo6lfqia': {
      'en': 'User Type Not Mentioned!',
      'hi': '',
    },
    'pkt900na': {
      'en': 'Logout',
      'hi': '',
    },
    '68pxlvcy': {
      'en': 'Research Field',
      'hi': '',
    },
    'm6z0m9p9': {
      'en': 'Affiliation',
      'hi': '',
    },
    '9w783bib': {
      'en': 'Logout',
      'hi': '',
    },
    'xhq7qg3v': {
      'en': 'Profile',
      'hi': '',
    },
  },
  // Home
  {
    'h22l0zy0': {
      'en': 'RNDgrid.com',
      'hi': '',
    },
    'rl4agx8j': {
      'en':
          'Unlock On-Demand Analytical Testing, R&D Facilities, and Expert Consultation',
      'hi': '',
    },
    'i09efrwm': {
      'en':
          'Streamline your research and innovation journey. Search, request quotes, and let RNDgrid handle the rest.',
      'hi': '',
    },
    '06qae4g9': {
      'en': 'Search  Here...',
      'hi': '',
    },
    'sgu7eikv': {
      'en': 'Who\'s on RNDgrid?',
      'hi': '',
    },
    'i8w7u8ue': {
      'en':
          'Bring your product ideas to life with seamless access to R&D testing and development facilities.',
      'hi': '',
    },
    '5q7xb7s7': {
      'en':
          'Find the right tools, data, and expert help to elevate your research and academic projects.',
      'hi': '',
    },
    '759boupv': {
      'en':
          'Whether you\'re building a prototype or scaling a solution, RNDgrid helps you validate faster.',
      'hi': '',
    },
    'rk0agkm2': {
      'en': 'Search Results',
      'hi': '',
    },
    '4dmjkr8w': {
      'en': 'Sophisticated Instruments',
      'hi': '',
    },
    'o0cppanp': {
      'en': 'Devlopment Facilities',
      'hi': '',
    },
    'w87m02gc': {
      'en': 'Tests',
      'hi': '',
    },
    '1e970197': {
      'en': 'Sophisticated instruments',
      'hi': '',
    },
    '1v4839de': {
      'en':
          'Discover a wide range of advanced scientific instruments for material analysis, imaging, spectroscopy, and more. Easily search, request, and book equipment without managing multiple lab connections. Empower your research and innovation with world-class precision at your fingertips.',
      'hi': '',
    },
    'so6vlpmi': {
      'en': 'view all',
      'hi': '',
    },
    'ytd3ulpa': {
      'en': 'Development Facilities',
      'hi': '',
    },
    'tniqbazd': {
      'en':
          'Leverage state-of-the-art R&D labs, fabrication centers, and prototyping hubs designed for breakthrough development. Find the right environment to design, test, and validate your ideas efficiently. Accelerate your innovation journey with seamless facility booking and expert support.',
      'hi': '',
    },
    'p1757jtp': {
      'en': 'view all',
      'hi': '',
    },
    'xjmv6ixy': {
      'en': 'Industrial Testing',
      'hi': '',
    },
    'rb2s7y4p': {
      'en':
          'Access specialized testing across industries such as pharma, biotech, food, chemicals, water, and cosmetics. Ensure product quality, compliance, and performance with trusted partner labs and facilities. Simplify your industrial testing process by managing everything in one place with RNDgrid.',
      'hi': '',
    },
    '3zrgqqmn': {
      'en': 'view all',
      'hi': '',
    },
    'gmhvzvnc': {
      'en': 'How it works',
      'hi': '',
    },
    'f87ikzhk': {
      'en':
          'Use our advanced search and filters to find suitable analytical testing and R&D services.',
      'hi': '',
    },
    'vbt45i8p': {
      'en':
          'Quickly submit your detailed request through RNDgrid. No need to manage multiple lab inquiries.',
      'hi': '',
    },
    'ttih53gw': {
      'en':
          'Receive a competitive quote directly from us. Approve, book, and pay easily—all in one place.',
      'hi': '',
    },
    'u6t0t1om': {
      'en': 'Key features highlight',
      'hi': '',
    },
    '5aqn35x2': {
      'en': 'One Platform, Endless Possibilities',
      'hi': '',
    },
    'me81uek4': {
      'en':
          'Access top academic and industrial laboratories without navigating multiple websites.',
      'hi': '',
    },
    'i4xp5fa7': {
      'en': 'Expert Consultations',
      'hi': '',
    },
    'h15z667u': {
      'en':
          'Connect with leading researchers and scientists for accurate data interpretation and product development advice.',
      'hi': '',
    },
    'eq5nfi5b': {
      'en': 'Simplified Workflow',
      'hi': '',
    },
    'mefhhqj1': {
      'en':
          'RNDgrid manages all communication, booking, and payments, ensuring efficiency and clarity.',
      'hi': '',
    },
    '07qs4mcn': {
      'en': 'Why researchers choose us',
      'hi': '',
    },
    'nnwde73w': {
      'en': 'Save time in finding facilities and innovate more',
      'hi': '',
    },
    'z1gvzysh': {
      'en': 'Transparent pricing and fair review system',
      'hi': '',
    },
    'c08uoeno': {
      'en': 'Vast network of Research and Development labs',
      'hi': '',
    },
    'mpsqjpvy': {
      'en': 'We are supported by',
      'hi': '',
    },
    'piibqo2e': {
      'en': 'Our partner labs',
      'hi': '',
    },
    '793nprkg': {
      'en': 'What our customers say',
      'hi': '',
    },
    'cay2j0ra': {
      'en': '150+',
      'hi': '',
    },
    'rvbr24e0': {
      'en': 'instruments',
      'hi': '',
    },
    '5tyrg7tc': {
      'en': '300+',
      'hi': '',
    },
    's4jgn7h5': {
      'en': 'tests',
      'hi': '',
    },
    'aahaxb2i': {
      'en': '10+',
      'hi': '',
    },
    '7fxl0gan': {
      'en': 'labs',
      'hi': '',
    },
    'p6wfhqya': {
      'en': 'How can we help you ?',
      'hi': '',
    },
    '2db0lfch': {
      'en':
          'Please select an option below to tell us what you are looking for :',
      'hi': '',
    },
    'mo9puuwo': {
      'en': 'Home',
      'hi': '',
    },
  },
  // SophisticatedInstrument
  {
    'n32u8q3a': {
      'en': 'Sophisticated Instruments',
      'hi': '',
    },
    '5r1cylvp': {
      'en': 'Search Sophisticated Instrument...',
      'hi': '',
    },
    'qk1kepn5': {
      'en': 'Show More Instruments',
      'hi': '',
    },
    'arzu7u1d': {
      'en': 'Labs',
      'hi': '',
    },
  },
  // Requirements
  {
    'i6f27mys': {
      'en': 'User requirement form',
      'hi': '',
    },
    'j6fo6sv2': {
      'en':
          'Please share your research, development, and testing needs so we can connect you with the right resources.',
      'hi': '',
    },
    '8yiu5svx': {
      'en': 'Home',
      'hi': '',
    },
  },
  // Tests
  {
    'roqscz37': {
      'en': 'Resources',
      'hi': '',
    },
    'p0ampu9c': {
      'en': 'Search  Tests...',
      'hi': '',
    },
    '55n9dtfn': {
      'en': 'Show More Tests',
      'hi': '',
    },
    'agxea3u4': {
      'en': 'Resources',
      'hi': '',
    },
  },
  // LogoutPopup
  {
    'hhq5pi42': {
      'en': 'Are you sure you want to logout?',
      'hi': '',
    },
    'e14z67yv': {
      'en': 'Yes',
      'hi': '',
    },
    '1jw9mn2r': {
      'en': 'No',
      'hi': '',
    },
  },
  // TopNavBar
  {
    '3v0sb94k': {
      'en': 'Instruments',
      'hi': '',
    },
    'd2f0iqxd': {
      'en': 'Lab Facilities',
      'hi': '',
    },
    '0e1v881w': {
      'en': 'Sectors',
      'hi': '',
    },
    'mwn6usg0': {
      'en': 'About',
      'hi': '',
    },
    'm4s4yhvd': {
      'en': 'Contact',
      'hi': '',
    },
  },
  // Drawer
  {
    '8kpq7rzw': {
      'en': 'LogIn / SignUp',
      'hi': '',
    },
    'utt15svu': {
      'en': 'About Us',
      'hi': '',
    },
    'y2hypsi0': {
      'en': 'Contact Us',
      'hi': '',
    },
  },
  // Footer
  {
    'zcj00tm8': {
      'en': 'Join Community',
      'hi': '',
    },
    'ws417kkg': {
      'en': 'For Researchers',
      'hi': '',
    },
    'mn3rf2lg': {
      'en':
          '1st Floor, Atal-Kalam Research Park\nBuilding, University Area, Ahmedabad, \nGujarat - 380009',
      'hi': '',
    },
    'egxc4pl0': {
      'en': 'hello@rndgrid.com',
      'hi': '',
    },
    'oxbxoe3i': {
      'en': 'T&C',
      'hi': '',
    },
    '187r90vz': {
      'en': 'Privacy',
      'hi': '',
    },
  },
  // FooterMobile
  {
    '823osy6y': {
      'en': 'For Researchers',
      'hi': '',
    },
    'ud6esqha': {
      'en': 'Join Community',
      'hi': '',
    },
    'spj88hi5': {
      'en':
          '1st Floor, Atal-Kalam Research Park Building, University Area, Ahmedabad, Gujarat 380009',
      'hi': '',
    },
    'l7f87o47': {
      'en': 'hello@rndgrid.com',
      'hi': '',
    },
    'zxnjxn2m': {
      'en': 'T&C',
      'hi': '',
    },
    'n9pknqy0': {
      'en': 'Privacy',
      'hi': '',
    },
  },
  // LabOptionsC
  {
    'qn1le94q': {
      'en': 'Tax not included.*',
      'hi': '',
    },
  },
  // ProfileDetails-1
  {
    'jwdbe6ej': {
      'en': 'Personal details',
      'hi': '',
    },
    'izv53i9d': {
      'en': 'Complete profile for better experience',
      'hi': '',
    },
    '1v4nuccf': {
      'en': 'Name *',
      'hi': '',
    },
    'ludyv1d1': {
      'en': '',
      'hi': '',
    },
    'iue48pzd': {
      'en': 'Select user type',
      'hi': '',
    },
    'poyu0zb1': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'tmw07lfe': {
      'en': 'Research Field *',
      'hi': '',
    },
    'hp88bbbe': {
      'en': '',
      'hi': '',
    },
    'fdr6dc0m': {
      'en': 'Affiliation *',
      'hi': '',
    },
    'litlh07a': {
      'en': '',
      'hi': '',
    },
    'u4no64m0': {
      'en': 'Save',
      'hi': '',
    },
  },
  // LabDetails
  {
    '5b0vjja8': {
      'en': 'by ',
      'hi': '',
    },
  },
  // ProfileDetail-2
  {
    'cgplnmk9': {
      'en': 'Research related details',
      'hi': '',
    },
    'io80qu0v': {
      'en': 'Research Field *',
      'hi': '',
    },
    '6wgj2l2y': {
      'en': '',
      'hi': '',
    },
    'br64empl': {
      'en': 'Required R&D Resources *',
      'hi': '',
    },
    'ul7mbrtw': {
      'en': '',
      'hi': '',
    },
    '48yxd64m': {
      'en': 'Affiliation *',
      'hi': '',
    },
    'oa6l1uod': {
      'en': '',
      'hi': '',
    },
    '66y14aoc': {
      'en': 'Save',
      'hi': '',
    },
    'yfl30lic': {
      'en': 'Field is required',
      'hi': '',
    },
    'zxcr5zcu': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'tr2h9mhu': {
      'en': 'Field is required',
      'hi': '',
    },
    'sfjcay5u': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'y9cykq0z': {
      'en': 'Field is required',
      'hi': '',
    },
    '3gbkthjp': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
  },
  // SignInCompoent
  {
    '5cdmc60c': {
      'en': 'Welcome to RNDgrid.com',
      'hi': '',
    },
    '2w3gbwby': {
      'en': 'Let\'s get started by entering phone number.',
      'hi': '',
    },
    'nhnv08z0': {
      'en': 'Phone Number *',
      'hi': '',
    },
    'cntjfwo3': {
      'en': '',
      'hi': '',
    },
    'xcci5zl0': {
      'en': 'Field is required',
      'hi': '',
    },
    'tvfj9ane': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'kr3vj80q': {
      'en': 'Submit',
      'hi': '',
    },
  },
  // BottomNavBar
  {
    'w2pgq0ja': {
      'en': 'Home',
      'hi': '',
    },
    'qtmvg5io': {
      'en': 'Instruments',
      'hi': '',
    },
    '6pcto925': {
      'en': 'Contact',
      'hi': '',
    },
    'vcq5zkgt': {
      'en': 'Labs',
      'hi': '',
    },
  },
  // UserRequirementCopy
  {
    '4x6yult5': {
      'en':
          ' is not available on the platform. Please submit your requirements, and we will find it for you and get back to you.',
      'hi': '',
    },
    'osc9navp': {
      'en': 'Your name',
      'hi': '',
    },
    'c7rukk2s': {
      'en': '',
      'hi': '',
    },
    '6rtxloaf': {
      'en': 'Your phone number',
      'hi': '',
    },
    'jal8nhev': {
      'en': '',
      'hi': '',
    },
    '7cbcdqpr': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'o4u07e0n': {
      'en': 'Field is required',
      'hi': '',
    },
    'p9ks5rr2': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'qnsgx86k': {
      'en': 'Field is required',
      'hi': '',
    },
    'c6pb33ll': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    '5k6hfldz': {
      'en': 'Sector or Field',
      'hi': '',
    },
    'pvefcmmj': {
      'en': '',
      'hi': '',
    },
    '3e466thn': {
      'en': 'University or Company name',
      'hi': '',
    },
    'rzwmvkaw': {
      'en': '',
      'hi': '',
    },
    'edymg4n8': {
      'en': 'Which development of testing facility you require?',
      'hi': '',
    },
    '020fbgv0': {
      'en': '',
      'hi': '',
    },
    't70be1ga': {
      'en': 'Field is required',
      'hi': '',
    },
    'zgoi2e9v': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'ixrraa12': {
      'en': 'Field is required',
      'hi': '',
    },
    'g1orrhac': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'ppn0v83b': {
      'en': 'Field is required',
      'hi': '',
    },
    'f8owkesm': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    '5ledulxk': {
      'en': 'Your requirement',
      'hi': '',
    },
    'v8hytfec': {
      'en': '',
      'hi': '',
    },
    '2okfsnho': {
      'en': 'When do you need it?',
      'hi': '',
    },
    'pg2na9iz': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '8pwbd8da': {
      'en': 'Today',
      'hi': '',
    },
    'pz05itcu': {
      'en': '2-6 days',
      'hi': '',
    },
    'p9p4axlf': {
      'en': '7-14 days',
      'hi': '',
    },
    '42lqv2a6': {
      'en': '15-30 days',
      'hi': '',
    },
    'heunencu': {
      'en': 'Later',
      'hi': '',
    },
    'k4syjwfx': {
      'en': 'Field is required',
      'hi': '',
    },
    'vogfh8jg': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'vgioif2j': {
      'en': 'Submit',
      'hi': '',
    },
    '3v7r2ab3': {
      'en': 'Submit',
      'hi': '',
    },
  },
  // InstrumentProperties
  {
    'p7iadr2x': {
      'en': 'Analysis',
      'hi': '',
    },
    '4a44owjh': {
      'en': '-',
      'hi': '',
    },
    'ws8rr55v': {
      'en': 'Solvent Method',
      'hi': '',
    },
    'ovhii362': {
      'en': '-',
      'hi': '',
    },
    '7fi046n4': {
      'en': 'Upon Request',
      'hi': '',
    },
    '03f8i950': {
      'en': 'Academic Price',
      'hi': '',
    },
    'cov4niql': {
      'en': 'Industrial Price',
      'hi': '',
    },
    '8xu82kyg': {
      'en': 'Submit Request',
      'hi': '',
    },
    'gwines28': {
      'en': 'Please login first to check price',
      'hi': '',
    },
    'hwbcbfqf': {
      'en': '-',
      'hi': '',
    },
  },
  // CommonDialog
  {
    'fnplvfhy': {
      'en': 'Cancel',
      'hi': '',
    },
    'ma0816oi': {
      'en': 'Confirm',
      'hi': '',
    },
  },
  // SophisticatedInstrumentComponent
  {
    'vy319n0z': {
      'en': 'submit request',
      'hi': '',
    },
  },
  // ResourceBooking
  {
    'yho5yuql': {
      'en': 'by ',
      'hi': '',
    },
    '9ztbrb4r': {
      'en': 'Analysis',
      'hi': '',
    },
    '18zrjwbx': {
      'en': 'Solvent / Method',
      'hi': '',
    },
    'rcl9fhuj': {
      'en': 'Specify the No of Samples :',
      'hi': '',
    },
    'v876hhm9': {
      'en': '',
      'hi': '',
    },
    'nwety40e': {
      'en': '',
      'hi': '',
    },
    'w7v0v5wo': {
      'en': 'Booking Details',
      'hi': '',
    },
    'ncsrxrtx': {
      'en': 'Base Fees',
      'hi': '',
    },
    'fl0s2857': {
      'en': 'Platform Fees',
      'hi': '',
    },
    'ml4dpckd': {
      'en': 'Total',
      'hi': '',
    },
    'msai3psm': {
      'en': '* GST (18%) & Delivery Charges are not included',
      'hi': '',
    },
    '1tnpr8xi': {
      'en': 'Confirm Request',
      'hi': '',
    },
    'ay9swqa8': {
      'en': 'Field is required',
      'hi': '',
    },
    'lpm7yh3m': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'u5fql65q': {
      'en': 'Field is required',
      'hi': '',
    },
    'ibs2mn9n': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'm1562njm': {
      'en': 'Field is required',
      'hi': '',
    },
    '3sut8t3h': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'k1bamt5j': {
      'en': 'Field is required',
      'hi': '',
    },
    'ehw5r3e0': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
    'xjapjbr2': {
      'en': 'Field is required',
      'hi': '',
    },
    'zn4bdrz4': {
      'en': 'Please choose an option from the dropdown',
      'hi': '',
    },
  },
  // instrument_test_detail_component
  {
    'yapjrmki': {
      'en': 'Academic',
      'hi': '',
    },
    'vcy2lhjj': {
      'en': 'Analysis',
      'hi': '',
    },
    '2ajiv7yv': {
      'en': '-',
      'hi': '',
    },
    'rl8b724i': {
      'en': 'Academic',
      'hi': '',
    },
    '7r05yj0e': {
      'en': 'Solvent/Method',
      'hi': '',
    },
    's1pdapm5': {
      'en': '-',
      'hi': '',
    },
    'un3pv25x': {
      'en': 'Upon Request',
      'hi': '',
    },
    '2xp55mv0': {
      'en': 'Academic',
      'hi': '',
    },
    'kos9lpru': {
      'en': 'Academic Price',
      'hi': '',
    },
    'cdf099s2': {
      'en': 'Academic',
      'hi': '',
    },
    '10yxe1ox': {
      'en': 'Industrial Price',
      'hi': '',
    },
    '3nu8tiji': {
      'en': 'Please login first to check price',
      'hi': '',
    },
    'zs00z61r': {
      'en': '-',
      'hi': '',
    },
  },
  // InstrumentPropertiesComponent
  {
    'nh2jm05y': {
      'en': 'Number of samples',
      'hi': '',
    },
    '88repdlr': {
      'en': '',
      'hi': '',
    },
    '9cwnbadk': {
      'en': 'When do you need it?',
      'hi': '',
    },
    'e7jiw0er': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '6tadkvwo': {
      'en': 'Today',
      'hi': '',
    },
    'nb4wwsgq': {
      'en': '2-6 days',
      'hi': '',
    },
    'zzfnbx1q': {
      'en': '7-14 days',
      'hi': '',
    },
    'u72e8qyx': {
      'en': '15-30 days',
      'hi': '',
    },
    'c79002cq': {
      'en': 'Later',
      'hi': '',
    },
    'wjikd30r': {
      'en': 'Submit Request',
      'hi': '',
    },
  },
  // testPropertiesComponent
  {
    'ftkrnxdv': {
      'en': 'Please selet the Field ',
      'hi': '',
    },
    'mlz0i413': {
      'en': 'Please selet the Material ',
      'hi': '',
    },
    'xuetjvlp': {
      'en': 'Please selet the Test & Method ',
      'hi': '',
    },
    '2avljgoe': {
      'en': 'Number of samples',
      'hi': '',
    },
    'n3oko1tg': {
      'en': '',
      'hi': '',
    },
    'iett80gh': {
      'en': 'When do you need it?',
      'hi': '',
    },
    'jq2eh3a7': {
      'en': 'Search for an item...',
      'hi': '',
    },
    '3qqnk5p0': {
      'en': 'Today',
      'hi': '',
    },
    '1iqjqy7c': {
      'en': '2-6 days',
      'hi': '',
    },
    'bh9s4z3g': {
      'en': '7-14 days',
      'hi': '',
    },
    'akpls8jd': {
      'en': '15-30 days',
      'hi': '',
    },
    'oyytvrl7': {
      'en': 'Later',
      'hi': '',
    },
    '7ke4gerq': {
      'en': 'Submit Request',
      'hi': '',
    },
  },
  // VerifyOTP
  {
    '4t6kpu9m': {
      'en': 'OTP Verification',
      'hi': '',
    },
    'hfal5oe8': {
      'en': 'Please enter the code send to your phone number',
      'hi': '',
    },
    'ghvtuuiy': {
      'en': 'Resend',
      'hi': '',
    },
    '2n0m8phc': {
      'en': 'Resend OTP in',
      'hi': '',
    },
    'tqgnkdrd': {
      'en': 'Continue',
      'hi': '',
    },
  },
  // Miscellaneous
  {
    'simpimdz': {
      'en': 'Allow this app to access your camera to take photos and videos.',
      'hi': '',
    },
    'koowdei0': {
      'en':
          'Allow this app to access your photo library to view and share your photos and videos.',
      'hi': '',
    },
    '15h2lyu5': {
      'en':
          'Allow this app to use your biometric information for authentication purposes.',
      'hi': '',
    },
    '0v5z6aub': {
      'en':
          'Allow this app to access your calendar to schedule events and reminders.',
      'hi': '',
    },
    'tn69enlz': {
      'en':
          'Allow this app to access your contacts to enable communication with your friends.',
      'hi': '',
    },
    'dqwieuz3': {
      'en':
          'Allow this app to access your location to provide you with nearby lab results.',
      'hi': '',
    },
    '6aqe6zf4': {
      'en':
          'Allow this app to send you notifications to keep you informed about important updates.',
      'hi': '',
    },
    '3lv8tqb7': {
      'en': '',
      'hi': '',
    },
    'cescn0th': {
      'en': '',
      'hi': '',
    },
    '7tp213kf': {
      'en': '',
      'hi': '',
    },
    '07e4ljln': {
      'en': '',
      'hi': '',
    },
    'kibecmpo': {
      'en': '',
      'hi': '',
    },
    'y38ovssq': {
      'en': '',
      'hi': '',
    },
    '783x0drb': {
      'en': '',
      'hi': '',
    },
    '7wdarlse': {
      'en': '',
      'hi': '',
    },
    'ap72wu9q': {
      'en': '',
      'hi': '',
    },
    '59qnvygl': {
      'en': '',
      'hi': '',
    },
    '3eowp6sz': {
      'en': '',
      'hi': '',
    },
    '7lja1wfy': {
      'en': '',
      'hi': '',
    },
    'lv3u9llv': {
      'en': '',
      'hi': '',
    },
    'wz4qsiy0': {
      'en': '',
      'hi': '',
    },
    'qc6nkeo5': {
      'en': '',
      'hi': '',
    },
    'ndkfob9h': {
      'en': '',
      'hi': '',
    },
    'q3v8lr4e': {
      'en': '',
      'hi': '',
    },
    'sgb2t67r': {
      'en': '',
      'hi': '',
    },
    'un2pxz7c': {
      'en': '',
      'hi': '',
    },
    '0ahyvgam': {
      'en': '',
      'hi': '',
    },
    'u7btoez1': {
      'en': '',
      'hi': '',
    },
    'goeeph9g': {
      'en': '',
      'hi': '',
    },
    'cpb241bu': {
      'en': '',
      'hi': '',
    },
    'scdgmibk': {
      'en': '',
      'hi': '',
    },
    'ber7hl4x': {
      'en': '',
      'hi': '',
    },
  },
].reduce((a, b) => a..addAll(b));
