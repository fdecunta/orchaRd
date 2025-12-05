library(metafor)
library(devtools)
load_all()

data(english)

# We need to calculate the effect sizes, in this case d
english <- escalc(
  measure = "SMD",
  n1i = NStartControl,
  sd1i = SD_C,
  m1i = MeanC,
  n2i = NStartExpt,
  sd2i = SD_E,
  m2i = MeanE,
  var.names=c("SMD","vSMD"),
  data = english
)

english_MA <- rma.mv(
  yi = SMD,
  V = vSMD,
  random = list( ~ 1 | StudyNo,
                 ~ 1 | EffectID),
  data = english
  )

model_results <- orchaRd::mod_results(english_MA,
                                      mod = "1",
                                      at = NULL,
                                      group = "StudyNo")

model_results


model_results$data

model_results$mod_table


orchaRd::orchard_plot2(english_MA, group = "StudyNo", xlab = "Standardised mean difference", transfm = "none", twig.size = 0.5, trunk.size = 1)
