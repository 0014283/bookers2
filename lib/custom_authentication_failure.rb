class CustomAuthenticationFailure < Devise::FailureApp

	protected
	def redirect_url
		top_index_path
	end
end
