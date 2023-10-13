part of 'payment_cubit.dart';

@immutable
abstract class PaymentState {}

class PaymentInitial extends PaymentState {}
class PaymentAuthLoading extends PaymentState {}
class PaymentAuthSuccess extends PaymentState {}
class PaymentAuthFailure extends PaymentState {
 final String error;
  PaymentAuthFailure(this.error);
}


class PaymentOrderLoading extends PaymentState {}
class PaymentOrderSuccess extends PaymentState {}
class PaymentOrderFailure extends PaymentState {
 final String error;
 PaymentOrderFailure(this.error);
}

class PaymentKioskLoading extends PaymentState {}
class PaymentKioskSuccess extends PaymentState {}
class PaymentKioskFailure extends PaymentState {
 final String error;
 PaymentKioskFailure(this.error);
}

class PaymentRequestLoading extends PaymentState {}
class PaymentRequestSuccess extends PaymentState {}
class PaymentRequestFailure extends PaymentState {
 final String error;
 PaymentRequestFailure(this.error);
}


