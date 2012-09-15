MountDoc.config do |conf|
  #############
  # auto_mount
  #############
  # set true if you want to mount automaticaly (default false)
  #
  # conf.auto_mount = true
  #

  ##################
  # auto_mount_path
  ##################
  # path to mount document (default: /doc)
  #
  # conf.auto_mont_path = '/documents'
  #

  #####################
  # visible_components
  #####################
  # document component types you want to include into menu
  # types:  [:files, :urls, :controllers, :models]
  # default: [:files, :urls, :controllers]
  #
  # conf.visible_components = [:files, :controllers]
  #

  ################
  # doc_file_path
  ################
  # path to static documents (default: doc)
  #
  # conf.doc_file_path = 'app/view/statics'

  #########
  # markup
  #########
  # format of comments (default: rdoc)
  #
  # ** you must include gem into Gemfile, like
  #     gem 'github-markdown'
  #
  # config.markup = 'markdown'
  #

end
