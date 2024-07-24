import SuperwallKit

extension SuperwallEventInfo {
  func toJson() -> [String: Any] {
    return [
      "event": event.toJson(),
      "params": params
    ]
  }
}

extension SuperwallEvent {
  func toJson() -> [String: Any] {
    switch self {
      case .firstSeen:
        return ["event": "firstSeen"]
      case .reset:
        return ["event": "reset"]
      case .appOpen:
        return ["event": "appOpen"]
      case .appLaunch:
        return ["event": "appLaunch"]
      case .identityAlias:
        return ["event": "identityAlias"]
      case .appInstall:
        return ["event": "appInstall"]
      case .sessionStart:
        return ["event": "sessionStart"]
      case .deviceAttributes(let attributes):
        return ["event": "deviceAttributes", "attributes": attributes]
      case .subscriptionStatusDidChange:
        return ["event": "subscriptionStatusDidChange"]
      case .appClose:
        return ["event": "appClose"]
      case .deepLink(let url):
        return ["event": "deepLink", "url": url.absoluteString]
      case .triggerFire(let eventName, let result):
        return ["event": "triggerFire", "eventName": eventName, "result": result.toJson()]
      case .paywallOpen(let paywallInfo):
        return ["event": "paywallOpen", "paywallInfo": paywallInfo.toJson()]
      case .paywallClose(let paywallInfo):
        return ["event": "paywallClose", "paywallInfo": paywallInfo.toJson()]
      case .paywallDecline(let paywallInfo):
        return ["event": "paywallDecline", "paywallInfo": paywallInfo.toJson()]
      case .transactionStart(let product, let paywallInfo):
        return ["event": "transactionStart", "product": product.toJson(), "paywallInfo": paywallInfo.toJson()]
      case .transactionFail(let error, let paywallInfo):
        return ["event": "transactionFail", "error": error.localizedDescription, "paywallInfo": paywallInfo.toJson()]
      case .transactionAbandon(let product, let paywallInfo):
        return ["event": "transactionAbandon", "product": product.toJson(), "paywallInfo": paywallInfo.toJson()]
      case .transactionComplete(let transaction, let product, let paywallInfo):
        var json: [String: Any] = ["event": "transactionComplete", "product": product.toJson(), "paywallInfo": paywallInfo.toJson()]
        let transactionJson = transaction?.toJson()
        if let transactionJson {
          json["transaction"] = transactionJson
        }
        return json
      case .subscriptionStart(let product, let paywallInfo):
        return ["event": "subscriptionStart", "product": product.toJson(), "paywallInfo": paywallInfo.toJson()]
      case .freeTrialStart(let product, let paywallInfo):
        return ["event": "freeTrialStart", "product": product.toJson(), "paywallInfo": paywallInfo.toJson()]
      case .transactionRestore(let restoreType, let paywallInfo):
        return ["event": "transactionRestore", "restoreType": restoreType.toJson(), "paywallInfo": paywallInfo.toJson()]
      case .transactionTimeout(let paywallInfo):
        return ["event": "transactionTimeout", "paywallInfo": paywallInfo.toJson()]
      case .userAttributes(let attributes):
        return ["event": "userAttributes", "attributes": attributes]
      case .nonRecurringProductPurchase(let product, let paywallInfo):
        return ["event": "nonRecurringProductPurchase", "product": product.toJson(), "paywallInfo": paywallInfo.toJson()]
      case .paywallResponseLoadStart(let triggeredEventName):
        return ["event": "paywallResponseLoadStart", "triggeredEventName": triggeredEventName ?? ""]
      case .paywallResponseLoadNotFound(let triggeredEventName):
        return ["event": "paywallResponseLoadNotFound", "triggeredEventName": triggeredEventName ?? ""]
      case .paywallResponseLoadFail(let triggeredEventName):
        return ["event": "paywallResponseLoadFail", "triggeredEventName": triggeredEventName ?? ""]
      case .paywallResponseLoadComplete(let triggeredEventName, let paywallInfo):
        return ["event": "paywallResponseLoadComplete", "triggeredEventName": triggeredEventName ?? "", "paywallInfo": paywallInfo.toJson()]
      case .paywallWebviewLoadStart(let paywallInfo):
        return ["event": "paywallWebviewLoadStart", "paywallInfo": paywallInfo.toJson()]
      case .paywallWebviewLoadFail(let paywallInfo):
        return ["event": "paywallWebviewLoadFail", "paywallInfotoJson": paywallInfo.toJson()]
      case .paywallWebviewLoadComplete(let paywallInfo):
        return ["event": "paywallWebviewLoadComplete", "paywallInfo": paywallInfo.toJson()]
      case .paywallWebviewLoadTimeout(let paywallInfo):
        return ["event": "paywallWebviewLoadTimeout", "paywallInfo": paywallInfo.toJson()]
      case .paywallProductsLoadStart(let triggeredEventName, let paywallInfo):
        return ["event": "paywallProductsLoadStart", "triggeredEventName": triggeredEventName ?? "", "paywallInfo": paywallInfo.toJson()]
      case .paywallProductsLoadFail(let triggeredEventName, let paywallInfo):
        return ["event": "paywallProductsLoadFail", "triggeredEventName": triggeredEventName ?? "", "paywallInfo": paywallInfo.toJson()]
      case .paywallProductsLoadComplete(let triggeredEventName):
        return ["event": "paywallProductsLoadComplete", "triggeredEventName": triggeredEventName ?? ""]
      case .surveyResponse(let survey, let selectedOption, let customResponse, let paywallInfo):
        return ["event": "surveyResponse", "survey": survey.toJson(), "selectedOption": selectedOption.toJson(), "customResponse": customResponse ?? "", "paywallInfo": paywallInfo.toJson()]
      case .paywallPresentationRequest(let status, let reason):
        var json: [String: Any] = ["event": "paywallPresentationRequest", "status": status.toJson()]
        let reasonJson = reason?.toJson()
        if let reasonJson {
          json["reason"] = reasonJson
        }
        return json
      case .touchesBegan:
        return ["event": "touchesBegan"]
      case .surveyClose:
        return ["event": "surveyClose"]
      case .reset:
        return ["event": "reset"]
    case .restoreStart:
      return ["event": "restoreStart"]
    case .restoreComplete:
      return ["event": "restoreComplete"]
    case .restoreFail(message: let message):
      return ["event": "restoreFail", "message": message]
    }
  }
}
