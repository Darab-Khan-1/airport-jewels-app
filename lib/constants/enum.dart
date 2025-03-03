// ignore: constant_identifier_names
enum UserRole { DRIVER, SUPPLIER, UNKNOWN }

extension UserRoleExtension on UserRole? {
  String get value {
    switch (this) {
      case UserRole.DRIVER:
        return 'DRIVER';
      case UserRole.SUPPLIER:
        return 'SUPPLIER';
      default:
        return '';
    }
  }

  String get name {
    switch (this) {
      case UserRole.DRIVER:
        return 'driver';
      case UserRole.SUPPLIER:
        return 'supplier';
      default:
        return '';
    }
  }
}

String roleToString(UserRole role) {
  switch (role) {
    case UserRole.DRIVER:
      return 'driver';
    case UserRole.SUPPLIER:
      return 'supplier';
    default:
      return '';
  }
}

extension StringToRole on String? {
  UserRole toRole() {
    switch (this) {
      case 'DRIVER':
        return UserRole.DRIVER;
      case 'SUPPLIER':
        return UserRole.SUPPLIER;
      default:
        return UserRole.UNKNOWN;
    }
  }
}
