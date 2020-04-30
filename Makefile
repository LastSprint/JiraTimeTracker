## Installs all dependencies
init:
	# Install bundler if not installed
	if ! gem spec bundler > /dev/null 2>&1; then\
  		echo "bundler gem is not installed!";\
  		-sudo gem install bundler;\
	fi
	-bundle update
	-bundle install --path .bundle
	-bundle exec pod repo update
	-bundle exec pod install

	# Install git hooks
	mkdir -p .git/hooks
	chmod +x commit-msg
	ln -s -f ../../commit-msg .git/hooks/commit-msg

## Generate screen module with name given in `modName` parameter
screen:
	bundle exec generamba gen $(modName) surf_mvp_coordinatable_module --module_path 'JiraTimeTracker/Flows/$(flow)' --test_path 'UnitTests/Flows/$(flow)'

## Generate alert module with name given in `modName` parameter
alert:
	bundle exec generamba gen $(modName) surf_mvp_coordinatable_alert --module_path 'JiraTimeTracker/Flows/$(flow)' --test_path 'UnitTests/Flows/$(flow)'

## Run SwiftLint check
lint:
	./Pods/SwiftLint/swiftlint lint --config .swiftlint.yml
	npx jscpd --config ./.jscpd.json ./JiraTimeTracker

## Autocorrect with SwiftLint
format:
	./Pods/SwiftLint/swiftlint autocorrect --config .swiftlint.yml

## Execute pod install command
pod:
	-bundle exec pod install