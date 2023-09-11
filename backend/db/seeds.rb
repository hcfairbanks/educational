
user_permissions_admin = Permission.create(
  [
    {
      model: "users",
      action: "index"
    },
    {
      model: "users",
      action: "show"
    },
    {
      model: "users",
      action: "edit"
    }
  ]
)

puts "Created Admin Permissions"

user_permissions_student = Permission.create(
  [
    {
      model: "users",
      action: "show"
    },
    {
      model: "users",
      action: "edit"
    }
  ]
)

puts "Created Student Permissions"

roles = Role.create(
  [
    {
      name: "admin",
      permissions: user_permissions_admin 
    },
    {
      name: "teacher",
      permissions: user_permissions_admin
    },
    {
      name: "student",
      permissions: user_permissions_student
    }
  ]
)

puts "Created Roles"
# https://api.rubyonrails.org/classes/ActiveRecord/Associations/ClassMethods.html

users = User.create([
  {
    first_name: "admin",
    last_name: "admin",
    password: "Password1!",
    password_confirmation: "Password1!",
    email: "admin@harryfairbanks.com",
    activated: true,
    role: Role.where(name: "admin").first
  },
  {
    first_name: "Student",
    last_name: "Example",
    password: "Password1!",
    password_confirmation: "Password1!",
    email: "student@harryfairbanks.com",
    activated: true,
    role: Role.where(name: "student").first
  },
  {
    first_name: "Teacher",
    last_name: "Teacher",
    password: "Password1!",
    password_confirmation: "Password1!",
    email: "teacher@harryfairbanks.com",
    activated: true,
    role: Role.where(name: "teacher").first
  }
])

puts "Created Users"