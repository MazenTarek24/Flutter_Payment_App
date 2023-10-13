import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment/core/api_service.dart';
import 'package:payment/core/constant.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  static PaymentCubit get(context) => BlocProvider.of(context);
  //payment auth 1
  Future<void> getAuthToken() async {
    emit(PaymentAuthLoading());
    DioHelper.postAuthData(endPoint: ApiConstant.EndPointAuth,data:{
      "api_key": ApiConstant.paymentApiKey
    }).then((value) {
      ApiConstant.paymentFirstToken = value.data['token'].toString();
      print("first token${ApiConstant.paymentFirstToken.toString()}");
      emit(PaymentAuthSuccess());
    }).catchError((onError){
      emit(PaymentAuthFailure(onError.toString()));
      print(onError.toString());
    });
  }

  //payment order 2
  Future<void> getOrderId({
    required firstName ,
    required lastName ,
    required email ,
    required phone ,
    required price,}) async {
    emit(PaymentOrderLoading());
    DioHelper.postAuthData(endPoint: ApiConstant.EndPointOrder,
        data:{
          "auth_token": ApiConstant.paymentFirstToken,
          "delivery_needed": "false",
          "amount_cents": price,
          "currency": "EGP",
          "items": [],
        }).then((value) {
      ApiConstant.paymentOrderId = value.data['id'].toString();
      getPaymentRequest(firstName: firstName,lastName: lastName,email: email,phone: phone,price: price);
      print("orderToken${ApiConstant.paymentOrderId.toString()}");
      emit(PaymentOrderSuccess());

    }).catchError((onError){
      emit(PaymentOrderFailure(onError.toString()));
      print(onError.toString());
    });
  }

  //payment request 3
  Future<void> getPaymentRequest({
    required firstName ,
    required lastName ,
    required email ,
    required phone ,
    required price,}) async {
    emit(PaymentRequestLoading());
    DioHelper.postAuthData(endPoint: ApiConstant.EndPointPaymentRequest,
        data:{
          "auth_token": ApiConstant.paymentFirstToken,
          "amount_cents": price,
          "expiration": 3600,
          "order_id": ApiConstant.paymentOrderId,
          "billing_data": {
            "apartment": "NA",
            "email": email,
            "floor": "NA",
            "first_name": firstName,
            "street": "NA",
            "building": "NA",
            "phone_number": phone,
            "shipping_method": "NA",
            "postal_code": "NA",
            "city": "NA",
            "country": "NA",
            "last_name": lastName,
            "state": "NA"
          },
          "currency": "EGP",
          "integration_id": ApiConstant.integrationIdCard,
          "lock_order_when_paid": "false"
        }).then((value) {

      ApiConstant.paymentFinalToken = value.data['token'];
      print("final token${ApiConstant.paymentFinalToken}");
      emit(PaymentRequestSuccess());

    }).catchError((onError){
      emit(PaymentRequestFailure(onError.toString()));
      print(onError.toString());
    });
  }

  //payment Kiosk 4
  Future<void> getKioskPayment() async {
    emit(PaymentKioskLoading());
    DioHelper.postAuthData(endPoint: ApiConstant.EndPointKiosakPayment,data: {
      "source": {
        "identifier": "AGGREGATOR",
        "subtype": "AGGREGATOR",
      },
      "payment_token": ApiConstant.paymentFinalToken
    }).then((value) {
      ApiConstant.paymentKiosakId = value.data['id'].toString();
      print("ref_code = ${ApiConstant.paymentKiosakId}");
      emit(PaymentKioskSuccess());
    }).catchError((onError){
      emit(PaymentKioskFailure(onError.toString()));
      print(onError.toString());
    });
  }
}
