import Danger

let danger = Danger()

/// Запуск линтера
SwiftLint.lint(inline: true)

/// Проверка на колличество коммитов
if danger.git.commits.count > 1 {
    fail("PR должен содержать не больше 1 коммита")
}
message("\(danger.git.commits.count)")

/// Проверка на размер PR
let prLimit = 600
let prSize = danger.github.pullRequest.additions ?? 0
if prSize > prLimit {
    fail("PR не должен суммарно превышать \(prLimit) строк. Текущий размер \(prSize).")
}
