# LIBARY PACOTES    --------------------------------------------------------------------
library(dplyr)
library(GetBCBData)
library(lubridate)
library(urca)
library(readxl)

library(lmtest)
# 10 MAIORES BANCOS -----------------------------------------------------------------

AT_10 <- dfAtivo_Total %>%
  mutate(Ativo_Total = as.numeric(gsub("\\.", "", Ativo_Total))) %>%
  filter(!is.na(Código)) %>%
  group_by(Código) %>%
  summarise(
    Instituição = first(na.omit(Instituição)),
    Média       = mean(Ativo_Total, na.rm = TRUE)
  ) %>%
  arrange(desc(Média)) %>%
  head(10)


# 5 MAIORES BANCOS  ------------------------------------------------------------------

Banco_do_Brasil_AT <- Ativo_Total %>%
  filter(Código == "49906") %>%
  dplyr::select(Instituição, Código, Ativo_Total) %>%
  distinct()

Santander_AT <- Ativo_Total %>%
  filter(Código == "30379") %>%
  dplyr::select(Instituição, Código, Ativo_Total) %>%
  distinct()

Bradesco_AT <- Ativo_Total %>%
  filter(Código == "10045") %>%
  dplyr::select(Instituição, Código, Ativo_Total) %>%
  distinct()

Caixa_AT <- Ativo_Total %>%
  filter(Código %in% c("51626", "360305")) %>%
  dplyr::select(Instituição, Código, Ativo_Total) %>%
  distinct()

Itaú_AT <- Ativo_Total %>%
  filter(Código == "10069") %>%
  dplyr::select(Instituição, Código, Ativo_Total) %>%
  distinct()


AT_5 <- dfAtivo_Total %>%
  mutate(Ativo_Total = as.numeric(gsub("\\.", "", Ativo_Total))) %>%
  filter(!is.na(Código)) %>%
  group_by(Código) %>%
  summarise(
    Instituição = first(na.omit(Instituição)),
    Média       = mean(Ativo_Total, na.rm = TRUE)
  ) %>%
  arrange(desc(Média)) %>%
  head(5)

