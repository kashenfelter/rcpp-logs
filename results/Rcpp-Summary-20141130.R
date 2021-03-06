#!/usr/bin/Rscript
 
## -- started with Rcpp 0.11.3.3 (current on GitHub as of 2014-11-30 -- and including speculative branch)
##    as well as current RcppArmadillo and RcppEigen)

#load("~/git/rcpp-logs/results/result-20141130-142913.RData")
#good <- as.character(subset(res, res==0)[,1])
#dput(good)

skippedPkgs <- c() #c("WideLM")		# need NVidia and older g++

goodPkg <- c("accelerometry", "AdaptiveSparsity", "ALKr", "Amelia", "apcluster", 
             "BalancedSampling", "BayesComm", "BayesFactor", "bayou", "bcp", 
             "bfa", "bfp", "bifactorial", "BIFIEsurvey", "BIPOD", "blockcluster", 
             "btf", "bvarsv", "CARBayesST", "ccaPP", "cda", "CDM", "cgAUC", 
             "CIDnetworks", "cladoRcpp", "classify", "clere", "clogitL1", 
             "clusteval", "ClustVarLV", "CMF", "CompGLM", "ConConPiWiFun", 
             "coneproj", "copCAR", "CorReg", "Crossover", "dbmss", "Delaporte", 
             "dendextendRcpp", "DepthProc", "DetMCD", "dfcomb", "dfmta", "dils", 
             "disclapmix", "diversitree", "diveRsity", "DNAprofiles", "DNAtools", 
             "dslice", "DStree", "ecp", "eive", "EpiContactTrace", "ESGtoolkit", 
             "EWGoF", "fastGHQuad", "FastHCS", "fastM", "FastPCS", "FastRCS", 
             "FBFsearch", "fdaMixed", "FDGcopulas", "FDRreg", "fICA", "flip", 
             "FLSSS", "forecast", "fugeR", "Funclustering", "fwsim", "geiger", 
             "GeneticTools", "GENLIB", "geoCount", "glcm", "GMCM", "gMWT", 
             "GPvam", "gRim", "growcurves", "growfunctions", "GSE", "GUILDS", 
             "GUTS", "GxM", "hawkes", "HDPenReg", "HLMdiag", "hsphase", "httpuv", 
             "hypervolume", "iBATCGH", "IBHM", "iccbeta", "icensmis", "inarmix", 
             "IsingSampler", "iterpc", "JAGUAR", "jiebaR", "kmc", "Kmisc", 
             "LaF", "lbfgs", "lm.br", "lsgl", "marked", "MAT", "matchingMarkets", 
             "maxent", "mcIRT", "metafolio", "mets", "mice", "miceadds", "minqa", 
             "miscF", "miscset", "mkde", "mmand", "mp", "Mposterior", "MPTinR", 
             "MTS", "mvabund", "MVB", "mvnfast", "mwaved", "myTAI", "ndl", 
             "NetSim", "ngspatial", "NHMM", "NPBayesImpute", "oem", "openair", 
             "openxlsx", "orQA", "pander", "PBC", "pcalg", "PedCNV", "PerMallows", 
             "phom", "phylobase", "planar", "plotSEMM", "plyr", "polywog", 
             "PoweR", "powerr", "PP", "PReMiuM", "propagate", "prospectr", 
             "protViz", "pryr", "psgp", "pvar", "QRM", "quadrupen", "quantspec", 
             "qVarSel", "Rankcluster", "rARPACK", "Rclusterpp", "RcppAnnoy", 
             "RcppArmadillo", "RcppBDT", "rcppbugs", "RcppClassic", "RcppClassicExamples", 
             "RcppDE", "RcppEigen", "RcppExamples", "RcppGSL", "RcppMLPACK", 
             "RcppOctave", "RcppProgress", "RcppRedis", "RcppRoll", "RcppSMC", 
             "RcppXts", "RcppZiggurat", "RealVAMS", "recosystem", "remote", 
             "ReorderCluster", "resemble", "reshape2", "rexpokit", "rforensicbatwing", 
             "rgam", "RInside", "ripa", "rkvo", "rlme", "RLRsim", "Rmalschains", 
             "rmgarch", "Rmixmod", "RmixmodCombi", "robustgam", "robustHD", 
             "robustreg", "rococo", "rotations", "roxygen2", "rpf", "rpg", 
             "RProtoBuf", "RQuantLib", "RSNNS", "RSNPset", "RSofia", "Rsomoclu", 
             "rtkpp", "Rtsne", "Ruchardet", "rugarch", "Rvcg", "RVowpalWabbit", 
             "SBSA", "scrm", "scrypt", "sdcMicro", "sdcTable", "segmag", "SelvarMix", 
             "sequences", "sglOptim", "simFrame", "simPop", "slfm", "snipEM", 
             "snplist", "SocialNetworks", "SOD", "spacodiR", "spaMM", "sparseHessianFD", 
             "sparseLTSEigen", "SpatialEpi", "SpatialTools", "StereoMorph", 
             "StMoSim", "stochvol", "stosim", "survAccuracyMeasures", "surveillance", 
             "survSNP", "synlik", "tagcloud", "TAQMNGR", "TED", "termstrc", 
             "TFMPvalue", "treeclim", "trustOptim", "tvd", "unmarked", "VideoComparison", 
             "VIM", "waffect", "wordcloud", "XBRL", "zic")

#bad <- as.character(subset(res, res==1)[,1])
#dput(bad)
#prevprevbadPkg <- c("CARBayes", "dplyr", "FisHiCal", "glcm", "HDPenReg", "HUM", 
#                    "icamix", "KernSmoothIRT", "lme4", "Morpho", "msgl", "nabor", 
#                    "pROC", "rpf", "surveillance", "tbart", "wsrf")

prevbadPkg <- c("CARBayes", "FisHiCal", "HUM", "icamix", "KernSmoothIRT", "lme4", 
                "Morpho", "msgl", "nabor", "pROC", "randomUniformForest", "rpf", 
                "strum", "surveillance", "tbart", "wsrf")

badPkg <- c("bcpa", "CARBayes", "climdex.pcic", "cqrReg", "dplyr", "FisHiCal", 
            "gRbase", "HUM", "icamix", "jaatha", "KernSmoothIRT", "lme4", 
            "lpme", "mirt", "Morpho", "msgl", "nabor", "pROC", "randomUniformForest", 
            "RcppCNPy", "repra", "revealedPrefs", "rplexos", "rPref", "sirt", 
            "spBayesSurv", "strum", "TAM", "tbart", "wsrf")

#nolongerbad <- setdiff(prevbadPkg, badPkg)
nolongerbad <- c("rpf", "surveillance")

#newbad <- setdiff(badPkg, prevbadPkg))
newbad <- c("bcpa", "climdex.pcic", "cqrReg", "dplyr", "gRbase", "jaatha", 
            "lpme", "mirt", "RcppCNPy", "repra", "revealedPrefs", "rplexos", 
            "rPref", "sirt", "spBayesSurv", "TAM")

newbadDetails <- c(
    "bcpa",            # builds, bombs in examples: "no package circular"
    "climdex.pcic",    # error: invalid conversion from ‘Rcpp::Vector<14, Rcpp::PreserveStorage>::const_iterator {aka const double*}’ to ‘double*’ [-fpermissive]
    "cqrReg",          # package required by not avilable: ‘Rmosek’
    "dplyr",           # ../inst/include/dplyr/JoinVisitorImpl.h: In constructor ‘dplyr::JoinStringFactorVisitor::JoinStringFactorVisitor(const CharacterVector&, const IntegerVector&)’: ../inst/include/dplyr/JoinVisitorImpl.h:236:36: error: invalid conversion from ‘Rcpp::Vector<13, Rcpp::PreserveStorage>::const_iterator {aka const int*}’ to ‘int*’ [-fpermissive]
    "gRbase",	       # /usr/local/lib/R/site-library/Rcpp/include/Rcpp/vector/MatrixColumn.h:47:30: error: invalid conversion from ‘Rcpp::Matrix<14>::const_iterator {aka const double*}’ to ‘Rcpp::MatrixColumn<14>::iterator {aka double*}’ [-fpermissive]
    "jaatha",          # /usr/local/lib/R/site-library/Rcpp/include/Rcpp/vector/MatrixColumn.h:47:30: error: invalid conversion from ‘Rcpp::Matrix<14>::const_iterator {aka const double*}’ to ‘Rcpp::MatrixColumn<14>::iterator {aka double*}’ [-fpermissive] 
    "lpme",            # /tmp/RcppDepends/lib/RcppArmadillo/include/armadillo_bits/Col_bones.hpp:30:39: note:   template argument deduction/substitution failed: lpme_common.cpp:231:42: note:   cannot convert ‘(& mconst)->Rcpp::Vector<RTYPE, StoragePolicy>::begin<14, Rcpp::PreserveStorage>()’ (type ‘Rcpp::Vector<14, Rcpp::PreserveStorage>::const_iterator {aka const double*}’) to type ‘arma::uword {aka unsigned int}’
    "mirt",            # /usr/local/lib/R/site-library/Rcpp/include/Rcpp/vector/MatrixColumn.h:47:30: error: invalid conversion from ‘Rcpp::Matrix<14>::const_iterator {aka const double*}’ to ‘Rcpp::MatrixColumn<14>::iterator {aka double*}’ [-fpermissive]
    "RcppCNPy",        # cnpyMod.cpp:32:14: error: invalid conversion from ‘Rcpp::Matrix<13>::const_iterator {aka const int*}’ to ‘Rcpp::Matrix<13>::iterator {aka int*}’ [-fpermissive]
    "repra",           # fails build:  Package required and available but unsuitable version: ‘dplyr’
    "revealedPrefs",   # builds, bombs in examples: Error in library(pso) : there is no package called ‘pso’
    "rplexos",         # builds, bombs in examples: Package required and available but unsuitable version: ‘dplyr’
    "rPref",           # fails build:  Package required and available but unsuitable version: ‘dplyr’
    "sirt",            # fails build:  Packages required and available but unsuitable versions: ‘TAM’ ‘mirt’
    "spBayesSurv",     # RcppArmadillo header error
    "TAM")             # fails build: Package required and available but unsuitable version: ‘mirt’


## missing BioC depends -- no longer applicable as we now explicitly set the BioC repo too
#bad4BioCdep <- c()

## ## Failing at compile time due to Rcpp issues
## bad4RcppAPI <- c()

## bad4unclear <- c("msgl")		# as CRAN had notified us, msgl fails on stop() in one of its tests
            
## bad4notrcpp <- c(
##     "CARBayes",       # builds, bombs in examples on "there is no package called ‘shapefiles’"
##     "FisHiCal",       # builds, bombs in examples on lack of rgl device
##     "HUM",            #	builds, bombs in examples on lack of rgl device
##     "icamix",         # builds, bombs in examples:  there is no package called ‘mixtools’ 
##     "KernSmoothIRT",  # builds, bombs in examples on lack of rgl device
##     "lme4",           # test fails, no object 'Orthodont'
##     "Morpho",         # builds, bombs in examples on "there is no package called ‘shapes’"
##     "nabor",          # builds, bombs in tests on "there is no package called ‘RANN’"
##     "pROC",           # builds, bombs in examples on "there is no package called ‘logcondens’"
##     "randomUniformForest",  # bombs build: "Package suggested but not available for checking: ‘R.rsp’"
##     "rpf",            # builds, bombs in tests on "there is no package called ‘tlink’"
##     "strum",	      # bombs build: "Package required but not available: ‘pedigree'"
##     "surveillance",   # builds, bombs in examples:  ‘there is no package called ‘spc’’
##     "tbart",          # builds, bombs in examples:  there is no package called ‘GISTools’
##     "wsrf")           # builds, bombs in examples:  there is no package called ‘rattle’ 
    

good <- length(goodPkg)
#badrcpp <- length(bad4RcppAPI) + length(bad4unclear) + length
#badother <- length(bad4notrcpp) 
#bad <- badrcpp + badother
bad <- length(badPkg)
skipped <- length(skippedPkgs)


cat("Good         ", good, "\n")
cat("  AsIs       ", length(goodPkg), "\n")
#cat("  w/Other    ", length(goodWithOtherChange), "\n")
#cat("  w/Question ", length(goodWithQuestion), "\n")
cat("Bad          ", bad, "\n")
#cat("  RcppApi    ", length(bad4RcppAPI), "\n")
#cat("  Unclear    ", length(bad4unclear), "\n")
#cat("  Other      ", badother, "\n")
#cat("  BioCDep    ", length(bad4BioCdep), "\n")
#cat("  NotRcpp    ", length(bad4notrcpp), "\n")
cat("Skipped      ", skipped, "\n")
cat("Total        ", good + bad + skipped, "\n")
#cat("Bad Percent  ", badrcpp / (good + bad), "\n")
cat("Bad Percent  ", bad / (good + bad), "\n")


## Checking: packages as of June 21
##
## R> dput(as.character(res[,1]))
allPkg <- c("accelerometry", "AdaptiveSparsity", "ALKr", "Amelia", "apcluster", 
            "BalancedSampling", "BayesComm", "BayesFactor", "bayou", "bcp", 
            "bcpa", "bfa", "bfp", "bifactorial", "BIFIEsurvey", "BIPOD", 
            "blockcluster", "btf", "bvarsv", "CARBayes", "CARBayesST", "ccaPP", 
            "cda", "CDM", "cgAUC", "CIDnetworks", "cladoRcpp", "classify", 
            "clere", "climdex.pcic", "clogitL1", "clusteval", "ClustVarLV", 
            "CMF", "CompGLM", "ConConPiWiFun", "coneproj", "copCAR", "CorReg", 
            "cqrReg", "Crossover", "dbmss", "Delaporte", "dendextendRcpp", 
            "DepthProc", "DetMCD", "dfcomb", "dfmta", "dils", "disclapmix", 
            "diversitree", "diveRsity", "DNAprofiles", "DNAtools", "dplyr", 
            "dslice", "DStree", "ecp", "eive", "EpiContactTrace", "ESGtoolkit", 
            "EWGoF", "fastGHQuad", "FastHCS", "fastM", "FastPCS", "FastRCS", 
            "FBFsearch", "fdaMixed", "FDGcopulas", "FDRreg", "fICA", "FisHiCal", 
            "flip", "FLSSS", "forecast", "fugeR", "Funclustering", "fwsim", 
            "geiger", "GeneticTools", "GENLIB", "geoCount", "glcm", "GMCM", 
            "gMWT", "GPvam", "gRbase", "gRim", "growcurves", "growfunctions", 
            "GSE", "GUILDS", "GUTS", "GxM", "hawkes", "HDPenReg", "HLMdiag", 
            "hsphase", "httpuv", "HUM", "hypervolume", "iBATCGH", "IBHM", 
            "icamix", "iccbeta", "icensmis", "inarmix", "IsingSampler", "iterpc", 
            "jaatha", "JAGUAR", "jiebaR", "KernSmoothIRT", "kmc", "Kmisc", 
            "LaF", "lbfgs", "lm.br", "lme4", "lpme", "lsgl", "marked", "MAT", 
            "matchingMarkets", "maxent", "mcIRT", "metafolio", "mets", "mice", 
            "miceadds", "minqa", "mirt", "miscF", "miscset", "mkde", "mmand", 
            "Morpho", "mp", "Mposterior", "MPTinR", "msgl", "MTS", "mvabund", 
            "MVB", "mvnfast", "mwaved", "myTAI", "nabor", "ndl", "NetSim", 
            "ngspatial", "NHMM", "NPBayesImpute", "oem", "openair", "openxlsx", 
            "orQA", "pander", "PBC", "pcalg", "PedCNV", "PerMallows", "phom", 
            "phylobase", "planar", "plotSEMM", "plyr", "polywog", "PoweR", 
            "powerr", "PP", "PReMiuM", "pROC", "propagate", "prospectr", 
            "protViz", "pryr", "psgp", "pvar", "QRM", "quadrupen", "quantspec", 
            "qVarSel", "randomUniformForest", "Rankcluster", "rARPACK", "Rclusterpp", 
            "RcppAnnoy", "RcppArmadillo", "RcppBDT", "rcppbugs", "RcppClassic", 
            "RcppClassicExamples", "RcppCNPy", "RcppDE", "RcppEigen", "RcppExamples", 
            "RcppGSL", "RcppMLPACK", "RcppOctave", "RcppProgress", "RcppRedis", 
            "RcppRoll", "RcppSMC", "RcppXts", "RcppZiggurat", "RealVAMS", 
            "recosystem", "remote", "ReorderCluster", "repra", "resemble", 
            "reshape2", "revealedPrefs", "rexpokit", "rforensicbatwing", 
            "rgam", "RInside", "ripa", "rkvo", "rlme", "RLRsim", "Rmalschains", 
            "rmgarch", "Rmixmod", "RmixmodCombi", "robustgam", "robustHD", 
            "robustreg", "rococo", "rotations", "roxygen2", "rpf", "rpg", 
            "rplexos", "rPref", "RProtoBuf", "RQuantLib", "RSNNS", "RSNPset", 
            "RSofia", "Rsomoclu", "rtkpp", "Rtsne", "Ruchardet", "rugarch", 
            "Rvcg", "RVowpalWabbit", "SBSA", "scrm", "scrypt", "sdcMicro", 
            "sdcTable", "segmag", "SelvarMix", "sequences", "sglOptim", "simFrame", 
            "simPop", "sirt", "slfm", "snipEM", "snplist", "SocialNetworks", 
            "SOD", "spacodiR", "spaMM", "sparseHessianFD", "sparseLTSEigen", 
            "SpatialEpi", "SpatialTools", "spBayesSurv", "StereoMorph", "StMoSim", 
            "stochvol", "stosim", "strum", "survAccuracyMeasures", "surveillance", 
            "survSNP", "synlik", "tagcloud", "TAM", "TAQMNGR", "tbart", "TED", 
            "termstrc", "TFMPvalue", "treeclim", "trustOptim", "tvd", "unmarked", 
            "VideoComparison", "VIM", "waffect", "wordcloud", "wsrf", "XBRL", 
            "zic")

checkPkg <- c(goodPkg, badPkg, skippedPkgs)
stopifnot(length(setdiff(checkPkg, allPkg))==0)
stopifnot(length(setdiff(allPkg, checkPkg))==0)



