# RESULTADO DA INTERMEDIAÇÃO FINACEIRA INDIVIDUALMENTE ------------------------------


Df_DRE <- bind_rows(DRE)

Receita_IF <- Df_DRE %>%
  dplyr::filter(TCB == "b1" & Código %in% AT_6$Código) %>%  
  dplyr::select(Instituição, Código, Data, `X.12`) %>%
  mutate(Data = my(Data)) %>%      
  filter(year(Data) > 2004) %>%     
  distinct()

Receita_IF <- Receita_IF %>%
  mutate(Receita_IF = as.numeric(gsub("\\.", "", Receita_IF)))

Receita_IF <- Receita_IF %>%
  filter(!(year(Data) == 2005 & month(Data) == 3))


# RESULTADO IF INDIVIDUALMENTE ------------------------------------------------------

#PARA O BANCO DO BRASIL
RIF_BB <- Receita_IF %>%
  filter(Código == "49906") %>%
  dplyr::select(Data, Código, Instituição, Receita_IF)

#PARA O SANTANDER
RIF_SANTANDER <- Receita_IF %>%
  filter(Código %in% c("30379")) %>%
  dplyr::select(Data, Código, Instituição, Receita_IF) %>%
  filter(!is.na(Receita_IF))

#PARA O BRADESCO
RIF_BRADESCO <- Receita_IF %>%
  filter(Código == "10045") %>%
  dplyr::select(Data, Código, Instituição, Receita_IF) %>%
  filter(!is.na(Receita_IF))

#PARA O CAIXA ECONOMICA FEDERAL
RIF_CAIXA <- Receita_IF %>%
  filter(Código %in% c("51626","360305")) %>%
  dplyr::select(Data, Código, Instituição, Receita_IF) %>%
  filter(!is.na(Receita_IF))

#PARA O ITAU
RIF_ITAU <- Receita_IF %>%
  filter(Código == "10069") %>%
  dplyr::select(Data, Código, Instituição, Receita_IF) %>%
  filter(!is.na(Receita_IF))

# COLOCANDO EM ORDEM ----------------------------------------------------------------

RIF_BB        <- RIF_BB[order(RIF_BB$Data), ]
RIF_BRADESCO  <- RIF_BRADESCO[order(RIF_BRADESCO$Data), ]
RIF_ITAU      <- RIF_ITAU[order(RIF_ITAU$Data), ]
RIF_CAIXA     <- RIF_CAIXA[order(RIF_CAIXA$Data), ]
RIF_SANTANDER <- RIF_SANTANDER[order(RIF_SANTANDER$Data), ]