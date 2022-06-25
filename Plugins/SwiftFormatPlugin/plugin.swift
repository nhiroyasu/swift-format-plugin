import Foundation
import PackagePlugin

@main
struct SwiftFormatPlugin: CommandPlugin {
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        let formatProcess = Process()
//        formatProcess.executableURL = URL(fileURLWithPath: try context.tool(named: "swift-format").path.string)
        formatProcess.executableURL = URL(fileURLWithPath: "/Users/niitsumahiroyasu/Project/WWDC22_Package_Plugin_Demo/SwiftFormatPlugin/.build/arm64-apple-macosx/debug/swift-format")
        print("😎 \(try context.tool(named: "swift-format").path.string)")
        formatProcess.arguments = ["-r", "./Sources", "-i"]
        try formatProcess.run()
        formatProcess.waitUntilExit()
    }
}
