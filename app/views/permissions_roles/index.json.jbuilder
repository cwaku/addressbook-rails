# frozen_string_literal: true

json.array! @permissions_roles, partial: 'permissions_roles/permissions_role', as: :permissions_role
