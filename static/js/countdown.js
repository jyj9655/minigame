function startCountdown(seconds, displayElement, callback) {
    let countdownTimer = setInterval(function() {
        displayElement.textContent = `${seconds}`;
        seconds -= 1;
        if (seconds < 0) {
            clearInterval(countdownTimer);
            callback();
        }
    }, 1000);
}