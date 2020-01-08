# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  email                  :string(255)      default(""), not null
#  username               :string(255)      default(""), not null
#  first_name             :string(255)      default(""), not null
#  last_name              :string(255)      default(""), not null
#  position               :string(255)      default(""), not null
#  company                :string(255)      default(""), not null
#  type                   :string(255)      default(""), not null
#  country                :string(255)      default(""), not null
#  city                   :string(255)      default(""), not null
#  address                :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  confirmation_token     :string(255)
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def admin?
    is_a? Admin
  end

  def role
    self.class.name
  end

  def self.policy_class
    Admin::UserPolicy
  end
end
