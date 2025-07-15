console.log("欢迎来到上海民兴如愿信息技术有限公司官网！");

document.addEventListener("DOMContentLoaded", function() {
    // Simple image slider
    const slider = document.querySelector('.slider');
    if (slider) {
        const slides = slider.querySelectorAll('.slide');
        let currentSlide = 0;

        setInterval(() => {
            slides[currentSlide].style.opacity = 0;
            currentSlide = (currentSlide + 1) % slides.length;
            slides[currentSlide].style.opacity = 1;
            slider.style.transform = `translateX(-${currentSlide * 100}%)`;
        }, 5000);
    }

    // Contact form handler
    const form = document.getElementById('contact-form-id');
    if (form) {
        const formMessages = document.getElementById('form-messages');

        form.addEventListener('submit', function(event) {
            event.preventDefault();

            const formData = new FormData(form);

            fetch('contact-form-handler.php', {
                method: 'POST',
                body: formData
            })
            .then(response => response.text())
            .then(data => {
                formMessages.textContent = data;
                form.reset();
            })
            .catch(error => {
                formMessages.textContent = 'Oops! An error occurred and your message could not be sent.';
            });
        });
    }
});
