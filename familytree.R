library("kinship2")

# get data filename from command option
args <- commandArgs(TRUE)
file <- args[1]

# make pdf file name
pdf.file <- sub(".csv", ".pdf", file)

# load data from data file
sample.ped <- read.csv(file, header=T)

# make pedigree object
pedAll <- pedigree(
  id = sample.ped$id,
  dadid = sample.ped$father,
  momid = sample.ped$mother,
  sex   = sample.ped$sex,
  famid = sample.ped$ped
)

# get a family
ped1basic <- pedAll["1"]

# make id strings
ids <- paste(sample.ped$id, sample.ped$firstname, sep ="\n")

# plot and save pdf file
pdf(pdf.file)
plot(ped1basic, id = ids, status = sample.ped$avail, 
     affected = sample.ped$affected, cex = 0.7)
dev.off()
