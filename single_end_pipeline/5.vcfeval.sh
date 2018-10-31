if [ "$#" -ne 2 ]; then
    echo "useage : ./vcfeval generated.vcf output_folder"
	exit	
fi

/home/hasindu/installs/rtgtools/rtg bgzip $1
/home/hasindu/installs/rtgtools/rtg index $1.gz
/home/hasindu/installs/rtgtools/rtg vcfeval -b /storage/store2/hasindu/human_genome/giab_truthset/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_PGandRTGphasetransfer.vcf.gz --bed-regions /storage/store2/hasindu/human_genome/giab_truthset/HG001_GRCh37_GIAB_highconf_CG-IllFB-IllGATKHC-Ion-10X-SOLID_CHROM1-X_v.3.3.2_highconf_nosomaticdel.bed -c $1.gz -o $2 -t /storage/store2/hasindu/human_genome/hs37d5.sdf --all-records -f QUAL --ref-overlap

