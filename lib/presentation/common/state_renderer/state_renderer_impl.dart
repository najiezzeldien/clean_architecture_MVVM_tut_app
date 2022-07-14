// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:tut_app/data/mapper/mapper.dart';
import 'package:tut_app/presentation/common/state_renderer/state_renderer.dart';
import 'package:tut_app/presentation/resources/strings_manager.dart';
import 'package:easy_localization/easy_localization.dart';

abstract class FlowState {
  StateRendererType getstateRendererType();
  String getMessage();
}

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;
  LoadingState({
    required this.stateRendererType,
    String? message,
  }) : message = message ?? AppStrings.loading.tr();
  @override
  String getMessage() {
    return message;
  }

  @override
  StateRendererType getstateRendererType() {
    return stateRendererType;
  }
}

class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;
  ErrorState(
    this.stateRendererType,
    this.message,
  );
  @override
  String getMessage() {
    return message;
  }

  @override
  StateRendererType getstateRendererType() {
    return stateRendererType;
  }
}

class ContentState extends FlowState {
  ContentState();
  @override
  String getMessage() {
    return EMPTY;
  }

  @override
  StateRendererType getstateRendererType() {
    return StateRendererType.CONTENT_SCREEN_STATE;
  }
}

class EmptyState extends FlowState {
  String messge;
  EmptyState(this.messge);
  @override
  String getMessage() {
    return messge;
  }

  @override
  StateRendererType getstateRendererType() {
    return StateRendererType.EMPTY_SCREEN_STATE;
  }
}

class SuccessState extends FlowState {
  String message;

  SuccessState(this.message);
  @override
  String getMessage() => message;
  @override
  StateRendererType getstateRendererType() => StateRendererType.POPUP_SUCCESS;
}

extension FlowStateExtention on FlowState {
  Widget getScreenWidget(BuildContext context, Widget contentScreenWidget,
      Function retryActionFunction) {
    switch (this.runtimeType) {
      case LoadingState:
        {
          if (getstateRendererType() == StateRendererType.POPUP_LOADING_STATE) {
            showPopUp(context, getstateRendererType(), getMessage());
            return contentScreenWidget;
          } else {
            return StateRenterer(
              stateRendererType: getstateRendererType(),
              retryActionFunction: retryActionFunction,
              message: getMessage(),
            );
          }
        }
      case ErrorState:
        {
          dismissDialog(context);
          if (getstateRendererType() == StateRendererType.POPUP_ERROR_STATE) {
            showPopUp(context, getstateRendererType(), getMessage());
            return contentScreenWidget;
          } else {
            return StateRenterer(
              stateRendererType: getstateRendererType(),
              retryActionFunction: retryActionFunction,
              message: getMessage(),
            );
          }
        }
      case ContentState:
        {
          dismissDialog(context);
          return contentScreenWidget;
        }
      case EmptyState:
        {
          return StateRenterer(
            stateRendererType: getstateRendererType(),
            retryActionFunction: retryActionFunction,
            message: getMessage(),
          );
        }
      case SuccessState:
        {
          // i should check if we are showing loading popup to remove it before showing success popup
          dismissDialog(context);

          // show popup
          showPopUp(context, StateRendererType.POPUP_SUCCESS, getMessage(),
              title: AppStrings.success.tr());
          // return content ui of the screen
          return contentScreenWidget;
        }
      default:
        {
          return contentScreenWidget;
        }
    }
  }

  dismissDialog(BuildContext context) {
    if (_isThereCurrentDialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  _isThereCurrentDialogShowing(BuildContext context) {
    return ModalRoute.of(context)?.isCurrent != true;
  }

  showPopUp(
      BuildContext context, StateRendererType stateRendererType, String message,
      {String title = EMPTY}) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => showDialog(
        context: context,
        builder: (BuildContext context) => StateRenterer(
          stateRendererType: stateRendererType,
          retryActionFunction: () {},
          message: message,
          title: title,
        ),
      ),
    );
  }
}
