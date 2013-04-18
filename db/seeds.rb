User.destroy_all
Project.destroy_all
Task.destroy_all
Like.destroy_all
UploadedFile.destroy_all

user1 = User.create({
  name: "Teodor Pripoae",
  email: "toni@example.com",
  password: "mysecretpass",
  password_confirmation: "mysecretpass"
})

user2 = User.create({
  name: "Another User",
  email: "another@example.com",
  password: "is_secret",
  password_confirmation: "is_secret"
})

project1 = Project.create({
  :user_id => user2.id,
  :name => "Test project 1"
})

project2 = Project.create({
  :user_id => user2.id,
  :name => "A random name"
})

project3 = Project.create({
  :user_id => user2.id,
  :name => "With open tickets"
})

project4 = Project.create({
  :user_id => user2.id,
  :name => "Next week tasks"
})

Task.create(:project_id => project1.id, :name => "Task 1", :status => "open")
Task.create(:project_id => project1.id, :name => "Task 2", :status => "open")
Task.create(:project_id => project1.id, :name => "Task 3", :status => "open")
Task.create(:project_id => project1.id, :name => "Task 4", :status => "closed")
Task.create(:project_id => project1.id, :name => "Task 5", :status => "in_progress")

Task.create(:project_id => project2.id, :name => "Task 6", :status => "in_progress")
Task.create(:project_id => project2.id, :name => "Task 7", :status => "open")
Task.create(:project_id => project3.id, :name => "Task 8", :status => "open")


UploadedFile.create(:file_name => "file1.txt")
UploadedFile.create(:file_name => "file2.txt")