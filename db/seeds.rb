# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# the highest role with all the permissions.
# Role.create!(name: 'Super Admin', unique_code: 'SA')
# Role.create!(name: 'Admin', unique_code: 'AD')
# Role.create!(name: 'Local User', unique_code: 'LU')

# User.destroy_all
# Role.destroy_all
# Permission.destroy_all
# UserRole.destroy_all

# Permission.create!(action: 'manage', subject_class: 'all')

# create a user and assign the super admin role to him
# a = User.create!(firstname: 'Ricky', lastname: 'Mormor', email: 'ricky@appsnmobilesolutions.com', password: '123456',
#                  password_confirmation: '123456')
# UserRole.create!(user_id: a.id, role_code: 'SA', active_status: true, del_status: false) if a.save
# User.create!(firstname: "Neo", lastname: "Mormon", email: "neo@matrix.com", password: "the_one", password_confirmation: "the_one", role_id: Role.find_by_name('Admin').id)

a = User.create!(firstname: 'Ricky', lastname: 'Mormor', email: 'rickymormor@gmail.com', phone: '233555145007', password: '123456',
                 password_confirmation: '123456')
UserRole.create!(user_id: a.id, role_code: 'LU', active_status: true, del_status: false) if a.save
