// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum L10n {

  public enum Auth {
    public enum Button {
      public enum SignIn {
        /// Sign in
        public static let title = L10n.tr("Localizable", "Auth.Button.SignIn.title")
      }
    }
    public enum Messages {
      /// Incorrect login and password
      public static let error = L10n.tr("Localizable", "Auth.Messages.error")
    }
    public enum TextField {
      public enum Login {
        /// Login
        public static let placeholder = L10n.tr("Localizable", "Auth.TextField.Login.placeholder")
      }
      public enum Password {
        /// Password
        public static let placeholder = L10n.tr("Localizable", "Auth.TextField.Password.placeholder")
      }
    }
  }

  public enum TabBar {
    public enum Items {
      public enum Projects {
        /// Projects
        public static let title = L10n.tr("Localizable", "TabBar.Items.Projects.title")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
