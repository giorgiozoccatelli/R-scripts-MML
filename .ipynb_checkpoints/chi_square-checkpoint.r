# Load necessary package
library(ggplot2)

# Parameters
L <- 5  # Example: Number of levels in a categorical test
df <- L - 1  # Degrees of freedom
alpha <- 0.05  # Significance level

# Critical value
critical_value <- qchisq(1 - alpha, df)

# Generate x values for the chi-square curve
x_vals <- seq(0, critical_value + 5, length = 200)
y_vals <- dchisq(x_vals, df)

# Create data frame for ggplot
data <- data.frame(X2 = x_vals, fX2 = y_vals)

# Define critical region (right tail, alpha)
crit_region <- data[data$X2 >= critical_value, ]

# Define main (non-rejection) region (left, 1-alpha)
main_region <- data[data$X2 < critical_value, ]

# Plot
ggplot() +
  # Main region (1 - alpha)
  geom_ribbon(data = main_region, aes(x = X2, ymin = 0, ymax = fX2), fill = "lightblue", alpha = 0.6) +
  # Critical region (alpha)
  geom_ribbon(data = crit_region, aes(x = X2, ymin = 0, ymax = fX2), fill = "red", alpha = 0.6) +
  # Density curve
  geom_line(data = data, aes(x = X2, y = fX2), color = "blue", size = 1) +
  # Critical value line
  geom_vline(xintercept = critical_value, linetype = "dashed", color = "red", size = 1) +
  # Labels
  annotate("text", x = critical_value - 2, y = max(y_vals) / 2,
           label = expression(1 - alpha), color = "blue", size = 5) +
  annotate("text", x = critical_value + 1.5, y = max(y_vals) / 4,
           label = expression(alpha), color = "red", size = 5) +
  # Titles and labels
  labs(
    x = expression(X^2),
    y = expression(f(X^2)),
    title = "Chi-Square Distribution",
    subtitle = bquote("Degrees of Freedom: " ~ df)
  ) +
  theme_minimal(base_size = 14)
