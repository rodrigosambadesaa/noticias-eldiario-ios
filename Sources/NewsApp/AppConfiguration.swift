import Foundation
import NewsCore

enum AppConfiguration {
    static let settings = FeedSettings(
        displayName: "elDiario.es",
        feedURL: URL(string: "https://www.eldiario.es/rss/")!,
        archive: .appendPage("https://www.eldiario.es/rss/"),
        pageSize: 20
    )
}
