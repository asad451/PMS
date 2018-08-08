ThinkingSphinx::Index.define :project, with: :active_record, delta: true do

  indexes title, sortable: true
  indexes client.name, as: :client
end
