class  ApiConstant {
  static String paymentApiKey = " your payment Api Key";
  static String EndPointOrder = "/ecommerce/orders";
  static String EndPointAuth = "/auth/tokens";
  static String EndPointKiosakPayment = "/acceptance/payments/pay";
  static String EndPointPaymentRequest= "/acceptance/payment_keys";
  static String paymentFirstToken = "";
  static String paymentOrderId = "";
  static String paymentFinalToken = "";
  static String paymentKiosakId = "";

  static const String integrationIdCard = 'your integrationIdCard';
  static const String integrationIdKiosk = 'your integrationIdKiosk';

  static  String visa_url = 'https://accept.paymob.com/api/acceptance/iframes/792575?payment_token=$paymentFinalToken';

}

class ImageConstants{
  static String refCodeImgUrl = "https://cdn-icons-png.flaticon.com/128/4090/4090458.png";
  static String visaImgUrl = "https://cdn-icons-png.flaticon.com/128/349/349221.png";
}