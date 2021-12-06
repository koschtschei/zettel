let g:ntr_link_rx = '\[.\{-}\](.\{-})'

command! -nargs=1 ZettelNextLink call zettel#next_link(<args>)
command! -nargs=1 ZettelPrevLink call zettel#prev_link(<args>)

command! ZettelSelectFolder call zettel#select_folder()

command! ZettelOpenLink call zettel#open_link("edit")
command! ZettelOpenLinkS call zettel#open_link("split")
command! ZettelOpenLinkVS call zettel#open_link("vsplit")

command! ZettelOpenIndex call zettel#open_index("edit")
command! ZettelOpenIndexS call zettel#open_index("split")
command! ZettelOpenIndexVS call zettel#open_index("vsplit")

command! ZettelPrevNote call zettel#prev_note("edit")
command! ZettelPrevNoteS call zettel#prev_note("split")
command! ZettelPrevNoteVS call zettel#prev_note("vsplit")

command! ZettelCreateNote call zettel#create_note("edit")
command! ZettelCreateNoteS call zettel#create_note("split")
command! ZettelCreateNoteVS call zettel#create_note("vsplit")

command! ZettelCreateEmptyNote call zettel#create_empty_note("edit")
command! ZettelCreateEmptyNoteS call zettel#create_empty_note("split")
command! ZettelCreateEmptyNoteVS call zettel#create_empty_note("vsplit")

command! ZettelCreateLink call zettel#create_link("edit")
command! ZettelCreateLinkS call zettel#create_link("split")
command! ZettelCreateLinkVS call zettel#create_link("vsplit")

command! ZettelCreateEmptyLink call zettel#create_empty_link("edit")
command! ZettelCreateEmptyLinkS call zettel#create_empty_link("split")
command! ZettelCreateEmptyLinkVS call zettel#create_empty_link("vsplit")

command! ZettelSearchNotes call zettel#search_notes("edit")
command! ZettelSearchNotesS call zettel#search_notes("split")
command! ZettelSearchNotesVS call zettel#search_notes("vsplit")

command! ZettelSearchLinksInNote call zettel#search_links_in_note("edit")
command! ZettelSearchLinksInNoteS call zettel#search_links_in_note("split")
command! ZettelSearchLinksInNoteVS call zettel#search_links_in_note("vsplit")

command! ZettelSearchOrphanNotes call zettel#search_orphan_notes("edit")
command! ZettelSearchOrphanNotesS call zettel#search_orphan_notes("split")
command! ZettelSearchOrphanNotesVS call zettel#search_orphan_notes("vsplit")

command! ZettelSearchNotesLinkingHere call zettel#search_notes_linking_here("edit")
command! ZettelSearchNotesLinkingHereS call zettel#search_notes_linking_here("split")
command! ZettelSearchNotesLinkingHereVS call zettel#search_notes_linking_here("vsplit")


if exists('g:zettel_user_mapping') == 0
  nnoremap <Leader>f :ZettelSelectFolder<cr>

  nnoremap <Leader>l :<C-U>ZettelNextLink(v:count1)<cr>
  nnoremap <Leader>h :<C-U>ZettelPrevLink(v:count1)<cr>

  nnoremap <Leader>j :ZettelOpenLink<cr>
  nnoremap <Leader>sj :ZettelOpenLinkS<cr>
  nnoremap <Leader>vj :ZettelOpenLinkVS<cr>

  nnoremap <Leader>m :ZettelCreateEmptyLink<cr>
  nnoremap <Leader>sm :ZettelCreateEmptyLinkS<cr>
  nnoremap <Leader>vm :ZettelCreateEmptyLinkVS<cr>

  vnoremap <Leader>m :<C-U>ZettelCreateLink<cr>
  vnoremap <Leader>sm :<C-U>ZettelCreateLinkS<cr>
  vnoremap <Leader>vm :<C-U>ZettelCreateLinkVS<cr>

  nnoremap <Leader>n :ZettelCreateEmptyNote<cr>
  nnoremap <Leader>sn :ZettelCreateEmptyNoteS<cr>
  nnoremap <Leader>vn :ZettelCreateEmptyNoteVS<cr>

  vnoremap <Leader>n :<C-U>ZettelCreateNote<cr>
  vnoremap <Leader>sn :<C-U>ZettelCreateNoteS<cr>
  vnoremap <Leader>vn :<C-U>ZettelCreateNoteVS<cr>

  nnoremap <Leader>k :ZettelPrevNote<cr>
  nnoremap <Leader>sk :ZettelPrevNoteS<cr>
  nnoremap <Leader>vk :ZettelPrevNoteVS<cr>

  nnoremap <Leader>u :ZettelSearchNotes<cr>
  nnoremap <Leader>su :ZettelSearchNotesS<cr>
  nnoremap <Leader>vu :ZettelSearchNotesVS<cr>

  nnoremap <Leader>o :ZettelSearchLinksInNote<cr>
  nnoremap <Leader>so :ZettelSearchLinksInNoteS<cr>
  nnoremap <Leader>vo :ZettelSearchLinksInNoteVS<cr>

  nnoremap <Leader>y :ZettelSearchNotesLinkingHere<cr>
  nnoremap <Leader>sy :ZettelSearchNotesLinkingHereS<cr>
  nnoremap <Leader>vy :ZettelSearchNotesLinkingHereVS<cr>

  nnoremap <Leader>i :ZettelSearchOrphanNotes<cr>
  nnoremap <Leader>si :ZettelSearchOrphanNotesS<cr>
  nnoremap <Leader>vi :ZettelSearchOrphanNotesVS<cr>

  nnoremap <Leader><Tab> :ZettelOpenIndex<cr>
  nnoremap <Leader>s<Tab> :ZettelOpenIndexS<cr>
  nnoremap <Leader>v<Tab> :ZettelOpenIndexVS<cr>
endif


if exists('g:zettel_file_extension') == 0
  let g:zettel_file_extension = 'md'
elseif g:zettel_file_extension[0] != '.'
  let g:zettel_file_extension = '.' . g:zettel_file_extension
endif

if exists('g:zettel_display_file_extension') != 1
  let g:zettel_display_file_extension = 0
endif

if exists('g:zettel_folders') == 0
  echom "You need to define the g:zettel_folders"
else
  let g:current_zettel_folder = g:zettel_folders[0]
  if g:current_zettel_folder[-1] != '/'
    let g:current_zettel_folder = g:current_zettel_folder . '/'
  endif
endif
