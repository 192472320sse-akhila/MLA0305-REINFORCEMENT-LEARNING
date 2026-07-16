library(DiagrammeR)

grViz("

digraph MDP {

graph [
layout = dot,
rankdir = LR,
bgcolor = white
]

node [
shape = circle,
style = filled,
fillcolor = lightblue,
fontsize = 18,
fontname = Helvetica
]

S1
S2
S3

# Best Action (A1) - Green
S1 -> S2 [label='A1 ✓', color='darkgreen', penwidth=3]
S2 -> S1 [label='A1 ✓', color='darkgreen', penwidth=3]
S3 -> S1 [label='A1 ✓', color='darkgreen', penwidth=3]

# Other Action (A2) - Red
S1 -> S3 [label='A2', color='red', style='dashed']
S2 -> S3 [label='A2', color='red', style='dashed']
S3 -> S2 [label='A2', color='red', style='dashed']

labelloc = t
label = 'MDP Policy Visualization (Best Action Highlighted)'

}
")