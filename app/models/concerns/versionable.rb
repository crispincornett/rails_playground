module Versionable
  extend ActiveSupport::Concern

  def changes
    p.versions.map { |v| v.event => [ v.object_changes ] }
  end

end