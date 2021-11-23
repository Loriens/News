import Danger
let danger = Danger()

SwiftLint.lint(inline: true)

if danger.git.commits.count > 1 {
    fail("PR должен содержать не больше 1 коммита")
}
