process downloadFile {
publishDir "/Users/halamazid/ABI-2025-2-nextflow/output/", mode: "copy", overwrite: true
output:
path "batch1.fasta"

"""
wget https://tinyurl.com/cqbatch1 -O batch1.fasta

 """
}
workflow {
downloadFile()
}
