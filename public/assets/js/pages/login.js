const passwordInput = document.querySelector("#senha");
const passwordToggle = document.querySelector(".password-toggle");

if (passwordInput && passwordToggle) {
  passwordToggle.addEventListener("click", () => {
    const isPassword = passwordInput.type === "password";

    passwordInput.type = isPassword ? "text" : "password";

    passwordToggle.innerHTML = isPassword
      ? '<i class="ri-eye-off-line"></i>'
      : '<i class="ri-eye-line"></i>';

    passwordToggle.setAttribute(
      "aria-label",
      isPassword ? "Ocultar senha" : "Mostrar senha"
    );
  });
}