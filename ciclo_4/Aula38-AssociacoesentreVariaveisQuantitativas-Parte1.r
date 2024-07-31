update.packages(ask = 'graphics', checkBuilt = TRUE, type = 'binary')

library(dplyr)
library(ggplot2)


# 1. Gerando os dados -----------------------------------------------------

altura_homens <- rnorm(n = 1000, mean = 180, sd = 5)
altura_mulheres <- rnorm(n = 1000, mean = 170, sd = 5)

vetor_homens <- rep('Masculino', 1000)
vetor_mulheres <- rep('Feminino', 1000)


# 2. Organizando os dados -------------------------------------------------


df <- rbind(
   cbind(altura_homens, vetor_homens),
   cbind(altura_mulheres, vetor_mulheres)
) %>%
   as_tibble()
colnames(df) <- c("Altura", "Genero")

df <- df %>% mutate(Altura = as.double(Altura))


# 3. Boxplot único --------------------------------------------------------

graphics.off()

df %>% ggplot() +
   geom_boxplot(aes(y = Altura), fill = "green", alpha = 0.3) +
   labs(title = "Boxplot das Alturas Juntas", y = "Altura (cm)") +
   theme_minimal() +
   theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())

df %>% ggplot() +
   geom_boxplot(aes(x = Altura), fill = "green", alpha = 0.3) +
   labs(title = "Boxplot das Alturas Juntas", x = "Altura (cm)") +
   theme_minimal() +
   theme(axis.text.y = element_blank(), axis.ticks.y = element_blank())


# 4. Histograma Unico -----------------------------------------------------

graphics.off()

df %>% ggplot() +
   geom_histogram(aes(x = Altura), fill = "green", color = "lightgray", alpha = 0.3) +
   labs(title = "Histograma das Alturas Juntas", x = "Altura (cm)", y = "Frequencia") +
   theme_minimal()


# 5. Boxplots por Categoria -----------------------------------------------

graphics.off()

df %>% ggplot(aes(x = Altura, y = Genero)) +
   geom_boxplot(fill = c("pink", "cyan"), alpha = 0.5) +
   labs(title = "Boxplot das Alturas por Genero", x = "Altura (cm)") +
   theme_minimal()

df %>% ggplot(aes(y = Altura, x = Genero)) +
   geom_boxplot(fill = c("pink", "cyan"), alpha = 0.5) +
   labs(title = "Boxplot das Alturas por Genero", y = "Altura (cm)") +
   theme_minimal()


# 6. Histograma por Categoria ---------------------------------------------

graphics.off()

ggplot() +
   geom_histogram(aes(x = altura_mulheres, fill = "Feminino"), color = "lightgray", alpha = 0.5) +
   geom_histogram(aes(x = altura_homens, fill = "Masculino"), color = "lightgray", alpha = 0.5) +
   scale_fill_manual(values = c("Feminino" = "pink", "Masculino" = "cyan")) +
   labs(title = "Histograma das Alturas por Genero", x = "Altura (cm)", y = "Frequencia") +
   theme_minimal() +
   theme(legend.title = element_blank(), legend.position = "top")


# 9. Limpando os arquivos temporarios -------------------------------------


graphics.off()
rm(list = ls())
gc()
cat("\f")
