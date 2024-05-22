// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"

const avatar = document.querySelector('avatar')
console.log(avatar);

avatar.document.addEventListener("onClick", function() {
  console.log("Hello World");
});