class UserController < Devise::RegistrationsController
	after_filter :set_role, only: [:create]

	protected
	def set_role
		admin_user = User.find_by_role(User::admin_role)
		if admin_user.nil?
			@user.role = User::admin_role
		else
			@user.role = User::default_role
		end
		@user.save
	end
end