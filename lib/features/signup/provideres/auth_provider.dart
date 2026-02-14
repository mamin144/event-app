import 'package:event/core/routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../services/auth_services.dart';

class AuthProvider extends ChangeNotifier {
  final FirebaseAuthService _authService = FirebaseAuthService();

  bool isLoading = false;
  String? errorMessage;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  String get userName => currentUser?.displayName ?? '';

  String get email => currentUser?.email ?? '';

  String get uid => currentUser?.uid ?? '';

  void refreshUser() {
    _auth.currentUser?.reload();
    notifyListeners();
  }

  // ================= Register =================
  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    _setLoading(true);

    try {
      await _authService.register(name: name, email: email, password: password);
    } catch (e) {
      errorMessage = _handleError(e);
    } finally {
      _setLoading(false);
    }
  }

  // ================= Login =================

  Future<void> login({required String email, required String password}) async {
    try {
      isLoading = true;
      errorMessage = null;
      notifyListeners();

      await _authService.login(email: email, password: password);
    } catch (e) {
      errorMessage = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  // ================= Logout =================

  Future<void> logout() async {
    await _authService.logout();

    notifyListeners();
  }

  // ================= Helpers =================
  void clearError() {
    errorMessage = null;
    notifyListeners();
  }

  void _setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  String _handleError(Object e) {
    return e.toString().replaceAll('Exception:', '').trim();
  }
}
