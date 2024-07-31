# An amateur VPN App - VIPIN

Vipin is a cross-platform VPN application built using Flutter, leveraging the free proxy servers provided by VPNGate. The aim of Vipin is to offer a secure, fast, and reliable VPN service for Android, iOS, Mac, Windows, and Linux users.

## Objectives

- **Cross-Platform**: Providing an executable for Android, iOS, MacOS and Windows. A browser extension is planned too after the initial release.
- **Ease of Use**: Create a user-friendly interface that is easy to navigate for users of all technical levels.
- **Custom Proxy**: Allow users to create and modify their ISP ports, and provide them the option to add custom proxy routing for all their requests.
- **Free Access**: Only to be used for development purposes and taking an inspiration for development of corporate private networks
- **Combining Networks**: Have an option for the users to merge two or more networks into a single channel effectively increasing the bandwidth (sharing the same bandwidth and pulling data packets from multiple networks concurrently). Preferable for those having both a WiFi and an Ethernet connection.

## Technology Stack

### Frontend

- **Flutter**

### Backend

- **VPNGate API**: Retrieving the proxy servers, thanks to their free and for-education networks for testing and research.
- **OpenVPN**: For establishing VPN connections.
- **WireGuard**: As an alternative to OpenVPN, providing a modern, efficient, and high-performance VPN protocol.
- **Golang**
- **Go Dispatch Proxy**: Load balancing and network combining proxy. (Acts as a load balancer)

### Platform Support

- **Android**: Native support using Flutter’s Android SDK.
- **iOS**: Native support using Flutter’s iOS SDK.
- **Mac**: Desktop support using Flutter’s macOS SDK.
- **Windows**: Desktop support using Flutter’s Windows SDK.
- **Linux**: Desktop support using Flutter’s Linux SDK.
- **Browser Plugin/Extension**: Development after the initial cross-platform release for the aforementioned.

## Getting Started

### Prerequisites

- **Flutter SDK**: Ensure you have the Flutter SDK installed. Follow the instructions [here](https://flutter.dev/docs/get-started/install) to install Flutter.
- **VPNGate API Key**: Obtain an API key from VPNGate for accessing the proxy servers.
- **Golang**

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/your-username/vipin.git
    cd vipin
    ```

2. Install dependencies:
    ```bash
    flutter pub get
    ```

3. Run the application:
    - For Android:
        ```bash
        flutter run -d android
        ```
    - For iOS:
        ```bash
        flutter run -d ios
        ```
    - For Mac:
        ```bash
        flutter run -d macos
        ```
    - For Windows:
        ```bash
        flutter run -d windows
        ```
    - For Linux:
        ```bash
        flutter run -d linux
        ```

## Code of Conduct

Please read [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).

