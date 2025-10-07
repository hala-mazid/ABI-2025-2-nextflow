params.out = "/Users/halamazid/ABI-2025-2-nextflow/output/"
params.downloadurl = 'https://tinyurl.com/cqbatch1'
params.store = "${baseDir}/downloads"   // temporary storeDir for caching


process downloadFile {
publishDir params.out, mode: "copy", overwrite: true
storeDir "${params.temp}/downloadFile"   // cache directory for this process
output:
path "batch1.fasta"

"""
wget ${params.downloadurl} -O batch1.fasta

 """
}

process countSequences {
publishDir params.out, mode: 'copy', overwrite: true

input:
path fastafile

output:
path "numseqs.txt"

 """
grep ">" ${fastafile} | wc -l > numseqs.txt
"""
}
workflow {
    downloadChannel = downloadFile()
    countSequences(downloadChannel)
}

