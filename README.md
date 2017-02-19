# Github Issues Puller

Short simple elixir app that creates a command line application script that allows to fetch issues from a github repository and present them in ascending order

### Example usage
```bash
$ ./github_issue_puller pinterest pymemcache 2
 number|      created_at      |                                 title
-------+----------------------+----------------------------------------------------------------------
   53  | 2015-06-20T06:27:29Z |                 Add support for pluggable compression
   54  | 2015-06-20T06:36:06Z |                  Add support for the binary protocol
```

## Installation

```bash
mix deps.get
mix deps.build
mix escript.compile
```
