# PROVISIOANAMENTO INDIVIDUAL -------------------------------------------------------

#PARA O BANCO DO BRASIL
PROVISION_BB <- Provisionamento %>%
  filter(Código == "49906") %>%
  dplyr::select(Data, Código, Instituição, Provisionamento)

#PARA O SANTANDER
PROVISION_SANTANDER <- Provisionamento %>%
  filter(Código %in% c("30379")) %>%
  dplyr::select(Data, Código, Instituição, Provisionamento) %>%
  filter(!is.na(Provisionamento))

#PARA O BRADESCO
PROVISION_BRADESCO <- Provisionamento %>%
  filter(Código == "10045") %>%
  dplyr::select(Data, Código, Instituição, Provisionamento) %>%
  filter(!is.na(Provisionamento))

#PARA O CAIXA ECONOMICA FEDERAL
PROVISION_CAIXA <- Provisionamento %>%
  filter(Código %in% c("51626","360305")) %>%
  dplyr::select(Data, Código, Instituição, Provisionamento) %>%
  filter(!is.na(Provisionamento))

#PARA O ITAU
PROVISION_ITAU <- Provisionamento %>%
  filter(Código == "10069") %>%
  dplyr::select(Data, Código, Instituição, Provisionamento) %>%
  filter(!is.na(Provisionamento))

# COLANDO EM ORDEM ------------------------------------------------------------------

PROVISION_BB        <- PROVISION_BB[order(PROVISION_BB$Data), ]
PROVISION_BRADESCO  <- PROVISION_BRADESCO[order(PROVISION_BRADESCO$Data), ]
PROVISION_ITAU      <- PROVISION_ITAU[order(PROVISION_ITAU$Data), ]
PROVISION_CAIXA     <- PROVISION_CAIXA[order(PROVISION_CAIXA$Data), ]
PROVISION_SANTANDER <- PROVISION_SANTANDER[order(PROVISION_SANTANDER$Data), ]
