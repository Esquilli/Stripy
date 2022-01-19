<div align="center">
    <h1>Stripy</h1>
    <i>A simple app showing how to use SwiftUI and Stripe API to accept payments</i>
</div>

<br />

<div align="center">
    <sup>Information</sup>
    <br />
    <img alt="Platform iOS" src="https://img.shields.io/badge/platform-iOS-orange.svg" />
    <img alt="License MIT" src="https://img.shields.io/badge/licence-MIT-brightgreen.svg" />
</div>

---

## Key Features
- SwiftUI + Combine + MVVM
- Stripe API
- Glitch

## Screenshot
![App Screenshot](./Assets/Mockup.gif)

## Getting Started

### Prerequisites
1. Xcode 12.2 or later
2. Stripe API [keys](https://stripe.com/docs/keys)
3. Host a checkout endpoint in [Glitch](https://glitch.com/edit/#!/odd-faithful-parsnip?path=.env%3A5%3A16) or your own server.

### Installation
1. Clone or download the project to your local machine
2. Open and replace `<YOUR ENDPOINT BASE URL>` with your own endpoint in `Endpoint+Stripe.swift`

```swift
extension Endpoint {
    struct Stripe: EndpointProtocol {
        ...
        components.host = "<YOUR ENDPOINT BASE URL>" // Example: odd-faithful-parsnip.glitch.me
        ...
    }
```
3. Run the simulator

## Notes
Apple Pay needs additional setup per [this](https://stripe.com/docs/payments/accept-a-payment?platform=ios&ui=payment-sheet&uikit-swiftui=swiftui#ios-apple-pay) tutorial 

## Licence
Stripy is released under the MIT license. See [LICENSE](./LICENSE) for details.
