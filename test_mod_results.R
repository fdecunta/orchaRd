library(metafor)

library(devtools)

load_all()


res <- rma.mv(lnrr, lnrr_vi, 
              random = ~ 1 | paper_ID,
              data = fish,
              mod = ~ treat_end_days)



