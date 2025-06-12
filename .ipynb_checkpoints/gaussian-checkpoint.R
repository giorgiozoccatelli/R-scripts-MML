# Parametri della distribuzione gaussiana
mu <- 0  # Media
sigma <- 1  # Deviazione standard

# Creazione di un vettore di valori x per il grafico
x <- seq(mu - 4*sigma, mu + 4*sigma, length.out = 1000)

# Calcolo della densità della distribuzione normale
y <- dnorm(x, mean = mu, sd = sigma)

# Grafico della distribuzione
plot(x, y, type = "l", lwd = 2, 
     main = "Normal Distribution", 
     xlab = "x", ylab = "f(x)",
     xlim = c(mu - 4*sigma, mu + 4*sigma))

# Aggiunta della linea verticale per la media
abline(v = mu, lwd = 2)

# Aggiunta delle linee per la deviazione standard
abline(v = mu - sigma, lwd = 2, lty = 2)
abline(v = mu + sigma, lwd = 2, lty = 2)

# Aggiunta dei testi spostati
text(mu, 0.2, expression(mu), pos = 4, cex = 1.2)  # Media, spostata a destra
text(mu - sigma, 0.2, expression(mu - sigma), pos = 2, cex = 1.2)  # Mu - sigma, spostata a sinistra
text(mu + sigma, 0.2, expression(mu + sigma), pos = 4, cex = 1.2)  # Mu + sigma, spostata a destra

