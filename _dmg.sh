# test -f doppio_dev_site.dmg && rm doppio_dev_site.dmg
rm -R release/macos
cp -Rf "build/macos/Build/Products/Release/doppio_dev_site.app" "build/macos/Build/Products/Release/Doppio.dev Site.app"
echo "Start create-dmg"
create-dmg \
  --no-internet-enable \
  --volname "Doppio.dev Site Installer" \
  --volicon "logo/icon.icns" \
  --window-pos 200 120 \
  --window-size 800 529 \
  --icon-size 130 \
  --text-size 14 \
  --icon "Doppio.dev Site.app" 260 250 \
  --hide-extension "Doppio.dev Site.app" \
  --app-drop-link 540 250 \
  --hdiutil-quiet \
  "doppio_dev_site.dmg" \
  "build/macos/Build/Products/Release/Doppio.dev Site.app/"
echo "sleep"
sleep 90
echo "Finish create-dmg"
ls
mkdir release/macos
cp -Rf doppio_dev_site.dmg release/macos/
rm doppio_dev_site.dmg