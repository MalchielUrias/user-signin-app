FROM golang:1.21.3-alpine AS Build

# Set destination for COPY
WORKDIR /user-signin 

# Download Go modules
COPY go.mod go.sum ./

RUN go mod download

COPY . .

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /user-signin/build/user-signin-app

# New Stage

FROM alpine:latest

COPY --from=Build /user-signin/build/user-signin-app /app

EXPOSE 3000

CMD [ "/user-signin/build/user-signin-app" ]