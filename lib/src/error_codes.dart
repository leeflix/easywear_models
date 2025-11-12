/// Error codes for API responses
/// These codes are used for localization on the frontend
class ErrorCodes {
  // Request/Order errors
  static const String requestNotFound = "REQUEST_NOT_FOUND";
  static const String requestAlreadyCompleted = "REQUEST_ALREADY_COMPLETED";
  static const String requestWrongStatus = "REQUEST_WRONG_STATUS";
  static const String requestNotInShoppingCart = "REQUEST_NOT_IN_SHOPPING_CART";
  static const String cannotCompleteShoppingCart = "CANNOT_COMPLETE_SHOPPING_CART";
  static const String notOrderOwner = "NOT_ORDER_OWNER";

  // Budget errors
  static const String insufficientBudget = "INSUFFICIENT_BUDGET";
  static const String budgetDeductionFailed = "BUDGET_DEDUCTION_FAILED";
  static const String budgetSystemDisabled = "BUDGET_SYSTEM_DISABLED";

  // Feature errors
  static const String correctionFeatureDisabled = "CORRECTION_FEATURE_DISABLED";
  static const String depositFeatureDisabled = "DEPOSIT_FEATURE_DISABLED";

  // Authorization errors
  static const String onlyAdmins = "ONLY_ADMINS";
  static const String notAuthorized = "NOT_AUTHORIZED";

  // User errors
  static const String userNotFound = "USER_NOT_FOUND";
  static const String userNotVerified = "USER_NOT_VERIFIED";

  // Generic errors
  static const String invalidInput = "INVALID_INPUT";
  static const String operationFailed = "OPERATION_FAILED";
}
