import Foundation
import NetworkLayer

final class MockNetworkClient: NetworkClient {
    private let bundle: Bundle

    init(bundle: Bundle = .main) {
        self.bundle = bundle
    }

    func send<T: Decodable>(_ request: URLRequest) async throws -> T {
        guard let url = request.url else {
            throw NetworkError.unknown(URLError(.badURL))
        }

        let fileName = fileNameFrom(url: url)
        guard
            let path = bundle.path(forResource: fileName, ofType: "json"),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path))
        else {
            throw NetworkError.unknown(URLError(.fileDoesNotExist))
        }

        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch let error as DecodingError {
            throw NetworkError.decoding(error)
        } catch {
            throw NetworkError.unknown(error)
        }
    }

    private func fileNameFrom(url: URL) -> String {
        if url.pathComponents.contains("posts") {
            return url.lastPathComponent == "posts" ? "posts" : "post"
        }
        return ""
    }
}
