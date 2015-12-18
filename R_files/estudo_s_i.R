###
# Estudo exploratório sobre os surdos
###


# Carrega bibliotecas
library("data.table")
library("descr")
library("ggplot2")
library("plyr")

# Carrega dados região CO -- df mtco
source('~/R/surdos/R_files/carrega_co.R')

# Carrega df como data.table
mtco<-as.data.table(mtco)


# Tabela cruzada surdos por DA
s<-crosstab(mtco$ID_TIPO_NEC_ESP_SURDEZ,mtco$ID_TIPO_NEC_ESP_DEF_AUDITIVA, prop.t=T, prop.c=T, prop.r=T, digits=2, plot=F, dnn=c("surdo", "DA"))
s

# Tabela cruzada surdos e DA por tipo de  localização da escola
s1<-crosstab(mtco$ID_TIPO_NEC_ESP_SURDEZ+mtco$ID_TIPO_NEC_ESP_DEF_AUDITIVA,mtco$ID_LOCALIZACAO_ESC , prop.t=T, prop.c=T, prop.r=T, digits=2, plot=F, dnn=c("surdo e DA", "Escola Urbana(1)/Rural(2)"))
s1

# Tabela cruzada surdos e DA por estado
s2<-crosstab(mtco$ID_TIPO_NEC_ESP_SURDEZ+mtco$ID_TIPO_NEC_ESP_DEF_AUDITIVA,mtco$FK_COD_ESTADO_ESCOLA , prop.t=T, prop.c=T, prop.r=T, digits=2, plot=F, dnn=c("surdo e DA", "COD do Estado"))
s2

# Tabela cruzada surdos e DA por Dependencia administrativa
s3<-crosstab(mtco$ID_TIPO_NEC_ESP_SURDEZ+mtco$ID_TIPO_NEC_ESP_DEF_AUDITIVA,mtco$ID_DEPENDENCIA_ADM_ESC , prop.t=T, prop.c=T, prop.r=T, digits=2, plot=F, dnn=c("surdo e DA", "Depend Adm"))
s3

# Tabela cruzada surdos e DA por etapa agredada de Ensino
s4<-crosstab(mtco$ID_TIPO_NEC_ESP_SURDEZ+mtco$ID_TIPO_NEC_ESP_DEF_AUDITIVA,mtco$ID_ETAPA_AGREGADA_MAT , prop.t=T, prop.c=T, prop.r=T, digits=2, plot=F, dnn=c("surdo e DA", "Etapa de Ensino"))
s4

# Tabela cruzada surdos e DA por Modadlidade
s5<-crosstab(mtco$ID_TIPO_NEC_ESP_SURDEZ+mtco$ID_TIPO_NEC_ESP_DEF_AUDITIVA,mtco$FK_COD_MOD_ENSINO , prop.t=T, prop.c=T, prop.r=T, digits=2, plot=F, dnn=c("surdo e DA", "Modaliade de Ensino Reg(1); Especial(2); EJA (3)"))
s5


# Seleciona apenas os alunos surdos e DA e cria grupo de interesse GINT
mtco<-mtco[ID_TIPO_NEC_ESP_SURDEZ==1 |ID_TIPO_NEC_ESP_DEF_AUDITIVA==1, GINT:=1]
mtco<-mtco[GINT!=1, GINT:=0]

# Seleciona apenas alunos surdos 
surdos<-mtco[GINT==1,]

### Summarios

summ1<- ddply(mtco, .(GINT, FK_COD_ETAPA_ENSINO),summarise, IDADEM=mean(NUM_IDADE))
summ1<-as.data.table(summ1)

### Gráficos

# p1 Distribuição de idade 
p1<-ggplot(data=mtco, aes(x=NUM_IDADE)) + geom_density()+
  facet_grid(GINT ~.)+
  theme_minimal()
p1

# p2 Distribuição de idade e sexo
p2<-ggplot(data=mtco, aes(x=NUM_IDADE)) + geom_density()+
  facet_grid(GINT ~TP_SEXO)+
  theme_minimal()
p2


# p3 Distribuição de média de idade e por etapa de ensino - Enino Fundamental
p3<-ggplot(data=summ1[FK_COD_ETAPA_ENSINO>13 & FK_COD_ETAPA_ENSINO<21], aes(x=FK_COD_ETAPA_ENSINO, y=IDADEM, fill=factor(GINT))) + 
  geom_bar(stat ="identity", position="dodge", width=.5)+
  theme_minimal()
p3


# p4 Distribuição de média de idade e por etapa de ensino - Ensino Médio
p4<-ggplot(data=summ1[FK_COD_ETAPA_ENSINO>24 & FK_COD_ETAPA_ENSINO<35], aes(x=factor(FK_COD_ETAPA_ENSINO), y=IDADEM, fill=factor(GINT))) + 
  geom_bar(stat ="identity", position="dodge", width=.5)+
  theme_minimal()
p4



















