# Set up Git

library(usethis)

git_sitrep()

use_git_config(
  user.email = "xingdavid2026@vt.edu",
  core.editor = "nano"
)

git_default_branch_configure()

use_git()

# how you can restore/revert a commit
# git restore HEAD~1 scripts/tidy-data.R

# I am making a change yeah








