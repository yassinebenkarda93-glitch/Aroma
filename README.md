# Aroma BLE API

This repository now contains a minimal BLE-based Device API for the Aroma Shooter 2 that you can use inside a Swift Playgrounds app or an iPad app project.

Files added
- Sources/AromaBLE/DeviceAPI.swift — API surface: DeviceStatus, DeviceError, DeviceController protocol
- Sources/AromaBLE/BLEDeviceController.swift — CoreBluetooth-based implementation skeleton; replace UUIDs and adjust payload parsing to match your device

Notes
- Replace the SERVICE_UUID and characteristic UUIDs in BLEDeviceController.swift with the vendor-provided UUIDs.
- When exporting as an app or running BLE on-device you must add Info.plist keys:
  - NSBluetoothAlwaysUsageDescription
  - Optionally NSBluetoothPeripheralUsageDescription
  - If you plan to use background BLE: enable Background Modes -> Uses Bluetooth LE accessories (bluetooth-central)

How to use
- Copy the Sources/AromaBLE/*.swift files into a Swift Playgrounds app or Xcode project.
- Initialize BLEDeviceController(deviceName: "Your device name or peripheral UUID string") and call connect(), then use setPower(), setIntensity(), setScent(), readStatus().

If you'd like, I can:
- Add a mock implementation and an example SwiftUI Playground app (so you can test without hardware).
- Update the BLE controller to implement robust reconnection, write confirmations with retries, and pairing flows.

