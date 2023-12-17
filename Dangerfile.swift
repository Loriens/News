import Danger

let danger = Danger()

/// Run linter
SwiftLint.lint(inline: true)

/// Check commits count
if danger.git.commits.count > 1 {
    fail("PR should not have more than 1 commit")
}

/// Check PR size
let prLimit = 600
let prSize = danger.github.pullRequest.additions ?? 0
if prSize > prLimit {
    fail("PR should not exceed \(prLimit) lines. The current number of lines is \(prSize).")
}
