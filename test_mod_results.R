# Add clear error messages for 'group'

library(metafor)

devtools::load_all()


res <- rma.mv(lnrr, lnrr_vi,
              random = ~ 1 | paper_ID,
              data = fish,
              mod = ~ treat_end_days)


res2 <- rma.mv(lnrr, lnrr_vi,
               random = ~ 1 | paper_ID,
               data = fish,
               mod = ~ trait.type)


# This works
mod_results(res2, mod = "trait.type", group = "paper_ID")


# This two don't define group
mod_results(res2, mod = "trait.type")


mod_results(res2, mod = "trait.type", group = NULL)

# This 'mod' is not part of the data
mod_results(res2, mod = "foo", group = "paper_ID")
