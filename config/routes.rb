MountDoc::Engine.routes.draw do
  match 'controllers/:id' => 'mount_doc#controller_doc'
  match 'controllers/:ctrl_id/actions/:id' => 'mount_doc#action_doc'
  match 'models/:id' => 'mount_doc#model_doc'
  match 'files/*id' => 'mount_doc#file_doc'
  match '/' => 'mount_doc#index', :as => 'mount_doc_root'
end
