package main

import (
	"fmt"

	"github.com/MalchielUrias/user-signin-app/controllers"
	"github.com/MalchielUrias/user-signin-app/initializers"
	"github.com/MalchielUrias/user-signin-app/middleware"
	"github.com/gin-gonic/gin"
)

func init() {
	initializers.LoadEnvVariables()
	initializers.ConnectToDB()
	initializers.SyncDatabase()
}

func main() {

	fmt.Println("Welcome!")

	r := gin.Default()

	r.POST("/signup", controllers.Signup)
	r.POST("/login", controllers.Login)
	r.GET("/validate", middleware.RequireAuth, controllers.Validate)

	r.Run() // listen and serve on 0.0.0.0:8080

}
