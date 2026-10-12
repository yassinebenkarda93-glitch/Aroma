import Foundation
import CoreBluetooth

public struct DeviceStatus: Codable, Equatable {
    public var isOn: Bool
    public var intensity: Int // 0-100
    public var scentID: String?
    public var batteryLevel: Int?
}

public enum DeviceError: Error, LocalizedError {
    case notConnected
    case transportError(String)
    case invalidResponse
    case timeout

    public var errorDescription: String? {
        switch self {
        case .notConnected: return "Not connected"
        case .transportError(let s): return "Transport error: \(s)"
        case .invalidResponse: return "Invalid response"
        case .timeout: return "Timeout"
        }
    }
}

public protocol DeviceController: AnyObject {
    var deviceName: String { get }
    var isConnected: Bool { get }
    func connect() async throws
    func disconnect() async
    func setPower(on: Bool) async throws
    func setIntensity(_ percent: Int) async throws
    func setScent(id: String) async throws
    func readStatus() async throws -> DeviceStatus
}
