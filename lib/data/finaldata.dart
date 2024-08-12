import 'package:lyshoppingmain/data/language/Multi_language.dart';
import 'package:lyshoppingmain/data/otherdata/Time.dart';

import 'Account/Account.dart';
import 'noticeData/noticeData.dart';

class finaldata {
  static Account account = Account(id: '', username: '', password: '', address: '', createTime: Time(second: 0, minute: 0, hour: 0, day: 4, month: 8, year: 2024), money: 200, firstName: '', lastName: '', phoneNum: '', lockstatus: 1, voucherList: []);
  static String avatarUrl = '';
  static Multi_language en = Multi_language(
    WelcomeBack: 'Welcome Back',
    Loginwithyouraccounttocontinue: 'Login with your account to continue.',
    Username: 'Username(Your email)',
    Password: 'Password',
    Forgotpassword: 'Forgot password?',
    Login: 'Login',
    donthaveaccount: "Don't have Account?",
    registernow: "Register Now",
    createaccount: "Create an account",
    createaaccounttoshoppinginbuysmart: "Create an account to shopping in Buy Smart.",
    youhaveaaccount: "You already have an account?",
    firstName: 'First Name',
    lastName: 'Last Name',
    home: 'Home',
    search: 'Search',
    account: 'Account',
    voucher: 'Voucher',
    notice: 'Notice',
    SmartconsumptionwithBuySmart: 'Smart consumption with Buy Smart',
    SearchproductsinBuySmart: 'Search products in Buy Smart',
  );

  static Multi_language vi = Multi_language(
    WelcomeBack: 'Chào mừng',
    Loginwithyouraccounttocontinue: 'Đăng nhập bằng tài khoản của bạn để tiếp tục.',
    Username: 'Tên đăng nhập(Email)',
    Password: 'Mật khẩu',
    Forgotpassword: 'Quên mật khẩu?',
    Login: 'Đăng nhập',
    donthaveaccount: 'Bạn chưa có tài khoản?',
    registernow: "Đăng ký ngay",
    createaccount: "Tạo tài khoản",
    createaaccounttoshoppinginbuysmart: "Tạo một tài khoản để mua sắm trên Buy Smart.",
    youhaveaaccount: "Bạn đã có tài khoản?",
    firstName: 'Họ của bạn',
    lastName: 'Tên của bạn',
    home: 'Trang chủ',
    search: 'Tìm kiếm',
    account: 'Tài khoản',
    voucher: 'Voucher',
    notice: 'Thông báo',
    SmartconsumptionwithBuySmart: 'Tiêu dùng thông minh với Buy Smart',
    SearchproductsinBuySmart: 'Tìm kiếm trên Buy Smart',
  );

  static Multi_language mainLang = en;

  static int currentPage = 0;

  static List<String> img_test_data = [
    'assets/image/ads_example/1.png',
    'assets/image/ads_example/2.png',
    'assets/image/ads_example/3.png',
    'assets/image/ads_example/4.png',
  ];

  static List<String> type_img_test_data = [
    'assets/image/product_type_example/1.png',
    'assets/image/product_type_example/2.png',
    'assets/image/product_type_example/3.png',
    'assets/image/product_type_example/4.png',
    'assets/image/product_type_example/5.png',
  ];

  static List<String> type_name_test_data = [
    'Motor bike',
    'Watches',
    'Smart Phone',
    'Suit & Vest',
    'Clothes',
  ];

  static List<noticeData> noticeList = [
    noticeData(id: 'abc', title: 'Buy Smart open graning', sub: 'Buy Smart open graning', create: Time(second: 0, minute: 15, hour: 17, day: 4, month: 8, year: 2024), send: Time(second: 0, minute: 15, hour: 17, day: 4, month: 8, year: 2024), status: 1, content: 'Buy Smart open graning'),
  ];
}