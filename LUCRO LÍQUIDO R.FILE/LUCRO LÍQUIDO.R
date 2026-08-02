# LUCRO LÍQUIDO ---------------------------------------------------------------------

LL_BB <- Lucro_Líquido %>%
  filter(Código == "49906") %>%
  dplyr::select(Data, Código, Instituição, Lucro_Líquido)

LL_BRADESCO <- Lucro_Líquido %>%
  filter(Código == "10045") %>%
  dplyr::select(Data, Código, Instituição, Lucro_Líquido)

LL_ITAU <- Lucro_Líquido %>%
  filter(Código == "10069") %>%
  dplyr::select(Data, Código, Instituição, Lucro_Líquido)

LL_CAIXA <- Lucro_Líquido %>%
  filter(Código %in% c("51626", "360305")) %>%
  dplyr::select(Data, Código, Instituição, Lucro_Líquido)

LL_SANTANDER <- Lucro_Líquido %>%
  filter(Código == "30379") %>%
  dplyr::select(Data, Código, Instituição, Lucro_Líquido)

# Tive que alterar já no dataframe

LL_BB$Lucro_Líquido        <- as.numeric(gsub("\\.", "", LL_BB$Lucro_Líquido))
LL_BRADESCO$Lucro_Líquido  <- as.numeric(gsub("\\.", "", LL_BRADESCO$Lucro_Líquido))
LL_CAIXA$Lucro_Líquido     <- as.numeric(gsub("\\.", "", LL_CAIXA$Lucro_Líquido))
LL_ITAU$Lucro_Líquido      <- as.numeric(gsub("\\.", "", LL_ITAU$Lucro_Líquido))
LL_SANTANDER$Lucro_Líquido <- as.numeric(gsub("\\.", "", LL_SANTANDER$Lucro_Líquido))