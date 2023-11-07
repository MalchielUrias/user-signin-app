package initializers

import "github.com/MalchielUrias/user-signin-app/models"

func SyncDatabase() {
	DB.AutoMigrate(&models.User{})
}
