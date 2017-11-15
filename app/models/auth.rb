class Auth < ActiveRecord::Base

    self.table_name = :auth

    before_save :set_defaults
    
    attr_accessor :password

    private
    def set_defaults
        self.uuid = SecureRandom.uuid
        @password = SecureRandom.uuid
        sha = Digest::SHA512.new
        sha << SECRET_BASE
        self.token = sha.hexdigest @password
    end
end