### Get path where libraries have been installed

## from configuraiton file
env_configs = read.csv('../conda_environment/Environment_Configs.csv', sep = ',')
path_to_conda_env = env_configs$value[env_configs$parameter == 'conda_env_path']
path_to_conda_env = paste0(path_to_conda_env, '/lib/R/library')
print(path_to_conda_env)

### Libraries for all the project scripts
library(Seurat, quietly = TRUE, verbose = FALSE, lib.loc = path_to_conda_env)
library(SeuratData, quietly = TRUE, verbose = FALSE, lib.loc = path_to_conda_env)
library(SeuratDisk, quietly = TRUE, verbose = FALSE, lib.loc = path_to_conda_env)  # conversion hd5f to seurat file


library(data.table, lib.loc = path_to_conda_env)
library(stringr, quietly = TRUE, verbose = FALSE, lib.loc = path_to_conda_env)
library(dplyr, lib.loc = path_to_conda_env)
library(tidyverse, lib.loc = path_to_conda_env)
library('reshape2', lib.loc = path_to_conda_env)
library(caret, lib.loc = path_to_conda_env)
library(gridExtra, lib.loc = path_to_conda_env)
library(scales, lib.loc = path_to_conda_env)

library(ggplot2, lib.loc = path_to_conda_env)
library(ggraph, lib.loc = path_to_conda_env)
library(ggpubr, lib.loc = path_to_conda_env)
library(corrplot, lib.loc = path_to_conda_env)
library(ggokabeito, lib.loc = path_to_conda_env)


library(MOFA2, lib.loc = path_to_conda_env)
library(MOFAdata, lib.loc = path_to_conda_env)
library(reticulate, quietly = TRUE, verbose = FALSE, lib.loc = path_to_conda_env)
reticulate::py_config() 


library(DESeq2, lib.loc = path_to_conda_env)
library(muscat, lib.loc = path_to_conda_env)


