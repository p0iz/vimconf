" Buffer completion
call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'blacklist': [],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))

" Tags completion
call asyncomplete#register_source(asyncomplete#sources#tags#get_source_options({
    \ 'name': 'tags',
    \ 'whitelist': ['c','cpp'],
    \ 'completor': function('asyncomplete#sources#tags#completor'),
    \ 'config': {
    \   'max_file_size': -1,
    \ },
    \ }))

