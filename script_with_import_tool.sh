#!/bin/bash
now=$(date +"%F %T")
echo "Current time: $now"
echo xml extraction

python transform_drugbank_to_tsv.py > output_transformation.txt

now=$(date +"%F %T")
echo "Current time: $now"
echo program

python file_preperation.py "/media/cassandra/Seagate Backup Plus Drive/Promotion/All_databases/Drugbank_database/drugbank_files_without_preperation/" drug_sequences/ external_links/ Protein_identifiers/ structure/ target_sequences/

now=$(date +"%F %T")
echo "Current time: $now"
echo integration


../../../../neo4j-community-3.2.9/bin/neo4j-admin import --mode=csv --nodes output/neo4j_import/drugbank_compounds.tsv --relationships output/neo4j_import/drug_target.tsv --nodes output/neo4j_import/carrier_enzyme_target_transporter.tsv --relationships output/neo4j_import/drugbank_reactions.tsv --nodes output/neo4j_import/drugbank_metabolites.tsv --nodes output/neo4j_import/drugbank_pathway.tsv --nodes output/neo4j_import/drugbank_salt.tsv --nodes output/neo4j_import/drugbank_products.tsv --nodes output/neo4j_import/drugbank_mutated_gene_enzyme.tsv --nodes output/neo4j_import/drugbank_pharmacologic_class.tsv --relationships output/neo4j_import/drugbank_target_mutated.tsv --relationships output/neo4j_import/drugbank_drug_pharmacologic_class.tsv --relationships output/neo4j_import/drugbank_drug_pathway.tsv --relationships output/neo4j_import/drugbank_drug_salt.tsv --relationships output/neo4j_import/drugbank_drug_products.tsv --relationships output/neo4j_import/drugbank_snp_effects.tsv --relationships output/neo4j_import/drugbank_snp_adverse_drug_reaction.tsv --relationships output/neo4j_import/drugbank_interaction.tsv --nodes output/neo4j_import/drugbank_enzyme.tsv --relationships output/neo4j_import/drugbank_enzyme_pathway.tsv --relationships output/neo4j_import/drugbank_target_peptide_has_component.tsv
