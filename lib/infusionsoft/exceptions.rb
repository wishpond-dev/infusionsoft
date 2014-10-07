class InfusionsoftError < StandardError

  def initialize(message)
    super(message)
  end

end

module Infusionsoft
  class InvalidConfigError < InfusionsoftError
  end

  class InvalidKeyError < InfusionsoftError
  end

  class UnexpectedError < InfusionsoftError
  end

  class DatabaseError < InfusionsoftError
  end

  class RecordNotFoundError < InfusionsoftError
  end

  class LoadingError < InfusionsoftError
  end

  class NoTableAccessError < InfusionsoftError
  end

  class NoFieldAccessError < InfusionsoftError
  end

  class NoTableFoundError < InfusionsoftError
  end

  class NoFieldFoundError < InfusionsoftError
  end

  class NoFieldsError < InfusionsoftError
  end

  class InvalidParameterError < InfusionsoftError
  end

  class FailedLoginAttemptError < InfusionsoftError
  end

  class NoAccessError < InfusionsoftError
  end

  class FailedLoginAttemptPasswordExpiredError < InfusionsoftError
  end

  class ExpiredAccessToken < InfusionsoftError
  end

  class FailedToRefreshTokenError < InfusionsoftError
  end
end
