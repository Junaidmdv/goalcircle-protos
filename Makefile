VERSION  := v1
SERVICES := user order payment notification

# generate one service
# make gen SERVICE=user
# make gen SERVICE=order VERSION=v2
gen:
ifndef SERVICE
	$(error SERVICE is required. usage: make gen SERVICE=user)
endif
	@echo "Generating $(SERVICE) $(VERSION)..."
	
	protoc \
		--proto_path=./$(SERVICE)/$(VERSION) \
		--go_out=./$(SERVICE)/$(VERSION) \
		--go_opt=paths=source_relative \
		--go-grpc_out=./$(SERVICE)/$(VERSION) \
		--go-grpc_opt=paths=source_relative \
		./$(SERVICE)/$(VERSION)/$(SERVICE)_service.proto
	@echo "Done → /$(SERVICE)/$(VERSION)"

