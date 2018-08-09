ThinkingSphinx::Index.define :client, with: :active_record, delta: true do

  indexes name, as: :client_name
  indexes country
end
