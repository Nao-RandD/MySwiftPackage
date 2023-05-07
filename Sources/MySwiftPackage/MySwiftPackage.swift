import OpenAISwift

public struct MySwiftPackage {
    public private(set) var text = "Hello, World!"

    public init() {
    }

    public static func hello() {
        print("Hello, world!")
    }

    public static func getRandomEmoji(token: String) async -> String {
        let openAPI = OpenAISwift(authToken: token)
        do {
            let result = try await openAPI.sendCompletion(with: "A random emoji")
            return result.data?[0].text ?? "nilだったよ"
        } catch {
            return "失敗：\(error.localizedDescription)"
        }
    }
}
