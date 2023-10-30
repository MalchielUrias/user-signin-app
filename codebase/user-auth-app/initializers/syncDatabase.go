package initializers

import models "command-line-argumentsC:\\Users\\malchiel.urias\\Documents\\Personal Projects\\user-signup-app-go\\codebase\\models\\userModel.go"

func SyncDatabase() {
	DB.AutoMigrate(&models.User{})
}
