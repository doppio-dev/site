# test -f doppio_dev_site.dmg && rm doppio_dev_site.dmg
rm -R release/macos
cp -r "build/macos/Build/Products/Release/doppio_dev_site.app" "build/macos/Build/Products/Release/Doppio.dev Site.app"
echo "Start create-dmg"
mkdir release
mkdir release/macos
# https://github.com/sindresorhus/create-dmg
create-dmg  'build/macos/Build/Products/Release/Doppio.dev Site.app' 'release/macos'
echo "Finish create-dmg"
