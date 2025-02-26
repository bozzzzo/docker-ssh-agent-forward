all: install
	./pinata-build-sshd.sh

PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin

install:
	@if [ ! -d "$(PREFIX)" ]; then echo Error: need a $(PREFIX) directory; exit 1; fi
	@mkdir -p $(PREFIX)/share/pinata-ssh-agent
	cp Dockerfile $(PREFIX)/share/pinata-ssh-agent
	cp ssh-build.sh $(PREFIX)/share/pinata-ssh-agent/ssh-build
	cp ssh-find-agent.sh $(PREFIX)/share/pinata-ssh-agent/ssh-find-agent.sh
	@mkdir -p $(BINDIR)
	cp pinata-build-sshd.sh $(BINDIR)/pinata-build-sshd
	cp pinata-ssh-forward.sh $(BINDIR)/pinata-ssh-forward
	cp pinata-ssh-mount.sh $(BINDIR)/pinata-ssh-mount

clean:
	docker stop pinata-sshd; docker rm pinata-sshd; docker rmi pinata-sshd; true
