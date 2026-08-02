# ORGANIZANDO ROAE ------------------------------------------------------------------

ROAE_TODOS <- bind_rows(
  ROAE_BB        %>% mutate(Banco = "Banco do Brasil"),
  ROAE_ITAU      %>% mutate(Banco = "Itaú"),
  ROAE_BRADESCO  %>% mutate(Banco = "Bradesco"),
  ROAE_CAIXA     %>% mutate(Banco = "Caixa Econômica Federal"),
  ROAE_SANTANDER %>% mutate(Banco = "Santander")
) %>% filter(!is.na(ROAE))

# ROAE INDIVIDUALMENTE --------------------------------------------------------------


#PARA O BANCO DO BRASIL
ROAE_BB <- ROAE_BANCO %>%
  filter(Código == "49906") %>%
  dplyr::select(Data, Código, Instituição.x, ROAE)

#PARA O SANTANDER
ROAE_SANTANDER <- ROAE_BANCO %>%
  filter(Código %in% c("30379")) %>%
  dplyr::select(Data, Código, Instituição.x, ROAE) %>%
  filter(!is.na(ROAE))

#PARA O BRADESCO
ROAE_BRADESCO <- ROAE_BANCO %>%
  filter(Código == "10045") %>%
  dplyr::select(Data, Código, Instituição.x, ROAE) %>%
  filter(!is.na(ROAE))

#PARA O CAIXA ECONOMICA FEDERAL
ROAE_CAIXA <- ROAE_BANCO %>%
  filter(Código %in% c("51626","360305")) %>%
  dplyr::select(Data, Código, Instituição.x, ROAE) %>%
  filter(!is.na(ROAE))

#PARA O ITAU
ROAE_ITAU <- ROAE_BANCO %>%
  filter(Código == "10069") %>%
  dplyr::select(Data, Código, Instituição.x, ROAE) %>%
  filter(!is.na(ROAE))