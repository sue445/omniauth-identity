require 'active_record'
require 'active_support/concern'

module OmniAuth
  module Identity
    module Models
      module ActiveRecordModule
        extend ActiveSupport::Concern

        included do
          include OmniAuth::Identity::Model
          include OmniAuth::Identity::SecurePassword

          has_secure_password
        end

        module ClassMethods
          def auth_key=(key)
            super
            validates_uniqueness_of key, :case_sensitive => false
          end

          def locate(search_hash)
            where(search_hash).first
          end
        end
      end
    end
  end
end
