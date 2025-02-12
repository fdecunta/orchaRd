library(metafor)

library(devtools)

load_all()


res <- rma.mv(lnrr, lnrr_vi,
              random = ~ 1 | paper_ID,
              data = fish,
              mod = ~ treat_end_days)


res2 <- rma.mv(lnrr, lnrr_vi,
               random = ~ 1 | paper_ID,
               data = fish,
               mod = ~ trait.type)


res3 <- rma.mv(lnrr, lnrr_vi,
               random = ~ 1 | paper_ID,
               data = fish)


mod_results(res, mod = "treat_end_days", group = "paper_ID")



mod_results(res2, mod = "trait.type", group = "paper_ID")
