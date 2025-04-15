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
  // ProfileStep1
  {
    'pw8tjlkt': {
      'en': 'Profile',
      'hi': '',
    },
    'sn8kyjo3': {
      'en': '',
      'hi': '',
    },
  },
  // SignIn
  {
    '5kbjs6ih': {
      'en': 'RNDgrid.com',
      'hi': '',
    },
    'bbi3wb6n': {
      'en': '•',
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
    'zvv3a1uw': {
      'en': 'Show More Instruments',
      'hi': '',
    },
    'lr9b7wb8': {
      'en': 'Resources',
      'hi': '',
    },
  },
  // VerifyOtp
  {
    '9pvjxviv': {
      'en': 'Codots.io',
      'hi': '',
    },
    '3dz00ae8': {
      'en': 'OTP Verification',
      'hi': '',
    },
    't151oj8k': {
      'en': 'Please enter the code send to your phone number',
      'hi': '',
    },
    'o5gbc3wb': {
      'en': 'Resend',
      'hi': '',
    },
    'gawokovb': {
      'en': 'Resend OTP in',
      'hi': '',
    },
    'yrjlero2': {
      'en': 'Continue',
      'hi': '',
    },
    'f399p4wa': {
      'en': '•',
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
      'en': 'Welcome to RNDgrid: Empowering Research Innovation',
      'hi': '',
    },
    'xb73z63u': {
      'en':
          'At RNDgrid we are passionate about fostering a vibrant research community in India. Our journey began with a vision to simplify the process of accessing R&D resources. Established by a team of enthusiastic individuals driven by the zeal for innovation, Codots emerged as a pioneering online platform.',
      'hi': '',
    },
    'r0tys1jj': {
      'en': 'Our Mission',
      'hi': '',
    },
    'i45thz4z': {
      'en':
          'Our mission is to empower research focused students, professors, scientists, startups and industries by connecting them with the right resources to drive innovation. We facilitate seamless access to a curated network of trusted laboratories, enabling users to discover, book, and utilize R&D facilities efficiently.',
      'hi': '',
    },
    'eq7g4jyp': {
      'en': 'Why choose us',
      'hi': '',
    },
    'c1zqwmgc': {
      'en': 'Simplified Access',
      'hi': '',
    },
    'l4nx6e3r': {
      'en':
          'We provide a user-friendly interface, making it easy for researchers and laboratories to connect and collaborate.',
      'hi': '',
    },
    'kgb913ct': {
      'en': 'Trusted Network',
      'hi': '',
    },
    'a6hl0dhk': {
      'en':
          'Partnering with accredited labs, we ensure access to verified facilities, instilling confidence in our users.',
      'hi': '',
    },
    's3u8hny2': {
      'en': 'Community-Driven Approach',
      'hi': '',
    },
    'nuw652yh': {
      'en':
          'We provide a collaborative space where researchers, labs, and startups come together to inspire innovation & growth.',
      'hi': '',
    },
    'vm1woejc': {
      'en': 'Innovate and Grow',
      'hi': '',
    },
    'p2yyswmd': {
      'en':
          'Our platform empowers researchers to innovate freely by providing the necessary resources and support.',
      'hi': '',
    },
    'tlpo99cr': {
      'en': 'Our Team',
      'hi': '',
    },
    '9a8m9dji': {
      'en': 'Janki Shah',
      'hi': '',
    },
    'm1qs8zna': {
      'en': 'CEO',
      'hi': '',
    },
    'cg424plw': {
      'en': 'Akash Patel',
      'hi': '',
    },
    '7u1e1aml': {
      'en': 'CTO',
      'hi': '',
    },
    'u5xuy49u': {
      'en': 'Rahul Thakur',
      'hi': '',
    },
    '3bem0zmy': {
      'en': 'Developer',
      'hi': '',
    },
    '51doyj3i': {
      'en': 'About Us',
      'hi': '',
    },
  },
  // LabOptions
  {
    'l7h7oysn': {
      'en': 'Analysis',
      'hi': '',
    },
    'z8cmizv7': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'fr825qpk': {
      'en': 'Option 1',
      'hi': '',
    },
    'cecf8jzz': {
      'en': 'Solvent/Method',
      'hi': '',
    },
    'zfk0daw7': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'p7k3m0oo': {
      'en': 'Option 1',
      'hi': '',
    },
    'fre9qy1g': {
      'en': 'City',
      'hi': '',
    },
    'w9vauynd': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'kit3ynjq': {
      'en': '1 day',
      'hi': '',
    },
    '7775jms5': {
      'en': '2-3 days',
      'hi': '',
    },
    'tgn20xpq': {
      'en': '4-5 days',
      'hi': '',
    },
    '2qmoi5n3': {
      'en': '1 week',
      'hi': '',
    },
    'er3g56uo': {
      'en': '8-10 days',
      'hi': '',
    },
    '2vy12feb': {
      'en': '10+ days',
      'hi': '',
    },
    'ybw98kdt': {
      'en': 'Result Duration',
      'hi': '',
    },
    't6ccq3jn': {
      'en': 'Search for an item...',
      'hi': '',
    },
    'xj27s3dy': {
      'en': '1 day',
      'hi': '',
    },
    '9z295hz2': {
      'en': '2-3 days',
      'hi': '',
    },
    '9aygaytq': {
      'en': '4-5 days',
      'hi': '',
    },
    'ef2yfvnn': {
      'en': '1 week',
      'hi': '',
    },
    'mheylnt6': {
      'en': '8-10 days',
      'hi': '',
    },
    'k1eh49e6': {
      'en': '10+ days',
      'hi': '',
    },
    'q59pckak': {
      'en': 'In person',
      'hi': '',
    },
    '1o1lja2l': {
      'en': 'Clear filter',
      'hi': '',
    },
    'k1i3imvi': {
      'en': 'Choose Lab',
      'hi': '',
    },
    'z5847ecv': {
      'en': '•',
      'hi': '',
    },
  },
  // LabInstruments
  {
    's9pmwrsy': {
      'en': 'Lab Instruments',
      'hi': '',
    },
    'j4bzugn4': {
      'en': 'Instruments',
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
  // Auth1
  {
    'ex5c86va': {
      'en': 'brand.ai',
      'hi': '',
    },
    '3xmvch7k': {
      'en': 'Sign In',
      'hi': '',
    },
    'fv8zexle': {
      'en': 'Let\'s get started by filling out the form below.',
      'hi': '',
    },
    'zak3mp80': {
      'en': 'Email',
      'hi': '',
    },
    'uosut61g': {
      'en': 'Password',
      'hi': '',
    },
    'l3r6q1w4': {
      'en': 'Sign In',
      'hi': '',
    },
    '8wkz3dl8': {
      'en': 'Forgot Password',
      'hi': '',
    },
    'jxvdinde': {
      'en': 'Continue with Google',
      'hi': '',
    },
    'irxogkog': {
      'en': 'Continue with Apple',
      'hi': '',
    },
    'o44d5gmm': {
      'en': 'Sign Up',
      'hi': '',
    },
    'w1roeuf7': {
      'en': 'Let\'s get started by filling out the form below.',
      'hi': '',
    },
    's2ajdtjb': {
      'en': 'Email',
      'hi': '',
    },
    'iuwtqoq8': {
      'en': 'Password',
      'hi': '',
    },
    'umy0u5p6': {
      'en': 'Confirm Password',
      'hi': '',
    },
    'u7grg7ty': {
      'en': 'Create Account',
      'hi': '',
    },
    '83d0rdl7': {
      'en': 'Or sign up with',
      'hi': '',
    },
    'nknysjqf': {
      'en': 'Continue with Google',
      'hi': '',
    },
    'gprhdq5i': {
      'en': 'Continue with Apple',
      'hi': '',
    },
    'rnl8vedf': {
      'en': 'Home',
      'hi': '',
    },
  },
  // ViewPDF
  {
    'huxns30x': {
      'en': 'Page Title',
      'hi': '',
    },
    'mhw15ful': {
      'en': 'Back',
      'hi': '',
    },
    'u8fu339d': {
      'en': 'Home',
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
      'en': 'For research & innovation \nfocused students & startups',
      'hi': '',
    },
    'i09efrwm': {
      'en': 'Find R&D labs, instruments, and tests to fuel your innovation.',
      'hi': '',
    },
    '06qae4g9': {
      'en': 'Search  Instrument...',
      'hi': '',
    },
    '3352kfsb': {
      'en': 'Search',
      'hi': '',
    },
    '4v183wv0': {
      'en': 'Compare labs',
      'hi': '',
    },
    'rjzos1fi': {
      'en': 'Contact lab',
      'hi': '',
    },
    'rk0agkm2': {
      'en': 'Search results',
      'hi': '',
    },
    '1e970197': {
      'en': 'Sophisticated instruments',
      'hi': '',
    },
    '6mx7gdev': {
      'en': 'view all',
      'hi': '',
    },
    '3t3ymk2r': {
      'en':
          'Access and book cutting-edge scientific instruments for your advanced research needs.',
      'hi': '',
    },
    'ytd3ulpa': {
      'en': 'Explore instruments',
      'hi': '',
    },
    's91xnnfm': {
      'en': 'view all',
      'hi': '',
    },
    'tniqbazd': {
      'en':
          'Find and utilize a variety of scientific instruments and tests to support your experiments and projects.',
      'hi': '',
    },
    'gmhvzvnc': {
      'en': 'Why researchers choose us',
      'hi': '',
    },
    '9vbn3m5h': {
      'en': 'Save time in finding facilities and innovate more',
      'hi': '',
    },
    'mwfc4vor': {
      'en': 'Transparent pricing and fair review system',
      'hi': '',
    },
    'pc74x4mt': {
      'en': 'Vast network of Research and Development labs',
      'hi': '',
    },
    'mpsqjpvy': {
      'en': 'We are supported by',
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
  // Labs
  {
    'vriixyjf': {
      'en': 'Labs',
      'hi': '',
    },
    'ancpwqaz': {
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
    '90izqlyv': {
      'en': 'Labs',
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
      'en': 'ex. student',
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
  // CommonDialogComponent
  {
    'r9xzvj0g': {
      'en': 'Mark this requirement as \"Resolved\"?',
      'hi': '',
    },
    'cfsxrbr0': {
      'en': 'Cancel',
      'hi': '',
    },
    'ggizmqmx': {
      'en': 'Confirm',
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
  // userProfile
  {
    '6x6zlp77': {
      'en': 'About Us',
      'hi': '',
    },
    '6zcuzzrw': {
      'en': 'Contact Us',
      'hi': '',
    },
    'kpszibm5': {
      'en': 'Logout',
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
  // InstrumentPropertiesCopy
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
