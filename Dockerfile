FROM golang:1.18.3-alpine
ENV CGO_ENABLED 0
RUN go install golang.org/x/lint/golint@latest
WORKDIR /root
COPY go.mod /root
COPY go.sum /root
RUN go mod download
COPY . /root

# Add and compile the packages
RUN go install /root/cmd/hello

CMD hello
