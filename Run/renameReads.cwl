cwlVersion: v1.0
class: CommandLineTool
id: "centrifuge"
doc: "Decontaminate PacBio reads using the program centrifuge"
requirements:
  - class: InlineJavascriptRequirement
hints:
  - class: DockerRequirement
    dockerPull: pakorhon/renamereads:v1.0.5-beta
inputs:
  - id: trimmedReads
    type: File
    inputBinding:
      position: 1
      prefix: -U
outputs:
  - id: renamedReads
    type: File
    outputBinding:
      glob: "rn_*"
  - id: mappedIds
    type: File
    outputBinding:
      glob: "mapped.ids"
baseCommand: ["/root/renamereads.sh"]
arguments: []
#stdout: out
