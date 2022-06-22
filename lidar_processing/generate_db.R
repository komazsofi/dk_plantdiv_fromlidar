library(sf)

setwd("O:/Nat_Sustain-proj/_user/ZsofiaKoma_au700510/_PostDoc_Paper1_plantdivfromlidar/Dataset/")

blocklist=read.csv("10km_blocklist.txt")

blocklist$ymin=paste0(substring(blocklist$block_id,1,3),"0000")
blocklist$xmin=paste0(substring(blocklist$block_id,5,6),"0000")

blocklist$ymin=as.numeric(blocklist$ymin)
blocklist$xmin=as.numeric(blocklist$xmin)

blocklist$wkt_astext=paste("POLYGON((",blocklist$xmin," ",blocklist$ymin,",",blocklist$xmin," ",blocklist$ymin+10000,",", blocklist$xmin+10000," ",blocklist$ymin+10000,",",
                           blocklist$xmin+10000," ", blocklist$ymin,",",blocklist$xmin," ",blocklist$ymin,"))",sep="")

df = st_as_sf(blocklist, wkt = "wkt_astext")
st_crs(df) <- 25832
st_write(df, paste("O:/Nat_Sustain-proj/_user/ZsofiaKoma_au700510/_PostDoc_Paper1_plantdivfromlidar/Dataprocessing/intermediate_files/","10km_block_DK.shp",sep=""))

#write.csv(blocklist,"O:/Nat_Sustain-proj/_user/ZsofiaKoma_au700510/_PostDoc_Paper1_plantdivfromlidar/Dataprocessing/intermediate_files/10km_blocklist_coords.txt")