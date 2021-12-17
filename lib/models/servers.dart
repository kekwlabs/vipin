import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_openvpn/flutter_openvpn.dart';
import 'package:http/http.dart' as http;
// import 'package:vipin/constants/stringConst.dart';

class Vpn with ChangeNotifier {
  final String id;
  final String name;
  final String country;
  final String countryCode;
  final String ovpn;
  final String status;
  final String password;
  final String username;

  Vpn({
    required this.password,
    required this.username,
    required this.id,
    required this.name,
    required this.country,
    required this.countryCode,
    required this.ovpn,
    this.status = 'Not Connected',
  });
}

class Vpns with ChangeNotifier {
  int time = 0;
  String timeString = '00:00:00';
  late List<Vpn> _vpns;
  List<Vpn> get vpns => [..._vpns];
  String _connectionState = 'Not Connected';
  String get connectionState => _connectionState;
  set connectionState(String connectionState) {
    _connectionState = connectionState;
    notifyListeners();
  }

  late Vpn _connectedVpn;
  Vpn get connectedVpn => _connectedVpn;

  set connectedVpn(Vpn vpn) {
    _connectedVpn = vpn;
    notifyListeners();
  }

  Future<void> fetchVpns() async {
    List<Vpn> _newVpns = [];
    try {
      final request = await http.get(Uri.https(
          'https://raw.githubusercontent.com',
          '/kekwlabs/vipin/main/HEAD/vpnList.json'));
      var decodedResponse = jsonDecode(request.body);
      var rawVpns = decodedResponse['vpns'];
      print(rawVpns);
      for (var v in rawVpns) {
        Vpn _vpn = Vpn(
            id: v['id'],
            name: v['name'],
            country: v['country'],
            countryCode: v['flagLogo'],
            username: v['username'],
            password: v['password'],
            ovpn: v['configScriptTCP']);
        _newVpns.add(_vpn);
      }
    } catch (err) {
      print(err);
    }

    _vpns = _newVpns;
    notifyListeners();
  }

  void connect(Vpn vpn) async {
    FlutterOpenvpn.init(
      localizedDescription: "Vipin",
      providerBundleIdentifier: "com.vipin.vpn",
    );

    FlutterOpenvpn.lunchVpn(vpn.ovpn, (isProfileLoaded) {}, (newVpnStatus) {
      _connectedVpn = vpn;
      _connectionState = newVpnStatus;
      notifyListeners();
    }, user: vpn.username, pass: vpn.password);
  }

  void disconnect() {
    FlutterOpenvpn.stopVPN();
    time = 0;
    timeString = "00:00:00";
    _connectedVpn;
    _connectionState = 'Not Connected';
    notifyListeners();
  }
}
