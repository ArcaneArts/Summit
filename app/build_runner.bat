cd ..
echo Adding any unstaged files to git before build
git add *
cd app
flutter packages pub run build_runner build --delete-conflicting-outputs