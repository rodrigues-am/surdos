#####################################################
## Carrega e seleciona dados de matrícula
## Educação com necessidades especiais
## Estudo com base no censo escolar 2015
#####################################################

# Carrega bibliotecas
library(data.table)
library(bit64)

# Carrega dados de matrícula e seleciona matrículas com necessidades especiais
m.nd <- fread("~/dados/censoescolar/2015/microdados_censo_escolar_2015/DADOS/MATRICULA_NORDESTE.CSV", sep="|", header = TRUE)
m.nd <- m.nd[IN_NECESSIDADE_ESPECIAL==1]

m.co <- fread("~/dados/censoescolar/2015/microdados_censo_escolar_2015/DADOS/MATRICULA_CO.CSV", sep="|", header = TRUE)
m.co <- m.co[IN_NECESSIDADE_ESPECIAL==1]

m.sul <- fread("~/dados/censoescolar/2015/microdados_censo_escolar_2015/DADOS/MATRICULA_SUL.CSV", sep="|", header = TRUE)
m.sul <- m.sul[IN_NECESSIDADE_ESPECIAL==1]

m.sd <- fread("~/dados/censoescolar/2015/microdados_censo_escolar_2015/DADOS/MATRICULA_SUDESTE.CSV", sep="|", header = TRUE)
m.sd <- m.sd[IN_NECESSIDADE_ESPECIAL==1]

m.nt <- fread("~/dados/censoescolar/2015/microdados_censo_escolar_2015/DADOS/MATRICULA_NORTE.CSV", sep="|", header = TRUE)
m.nt <- m.nt[IN_NECESSIDADE_ESPECIAL==1]

# Combina dos dados em uma única variável de matrícula
mat.esp15 <- rbind(m.sd, m.co, m.nt, m.nd, m.sul)

# Remove variáveis auxiliares
rm(m.sd, m.co, m.nt, m.nd, m.sul)

  