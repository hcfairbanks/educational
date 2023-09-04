
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
    first_name: "Bob",
    last_name: "Exampleson",
    password: "Password1!",
    password_confirmation: "Password1!",
    email: "bexampleson@harryfairbanks.com",
    activated: true,
    role: Role.where(name: "student").first
  },
  {
    first_name: "Joe",
    last_name: "Exampleson",
    password: "Password1!",
    password_confirmation: "Password1!",
    email: "jexampleson@harryfairbanks.com",
    activated: true,
    role: Role.where(name: "teacher").first
  }
])