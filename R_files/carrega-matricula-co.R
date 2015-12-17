###############################################
# Carrega matriculas para a região centro oeste
# Aquivo disponivel no Dropbox rodrigues@if.usp.br
# No link: https://www.dropbox.com/s/egta3rvte9imz9i/MATRICULA_CO.CSV?dl=0
##############################################

#Carrega bibliotecas
library("repmis")

#Carrega dados diretamente pelo dropbox
# mtco <- Matrículas da Reg. centro-oeste
mtco<-repmis::source_DropboxData("MATRICULA_CO.CSV","egta3rvte9imz9i")