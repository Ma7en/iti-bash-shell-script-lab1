
# # Q1
# awk -F: '

# {
#   print NR" - "$5
# }

# ' /etc/passwd


# # Q2
# # mazen-saad : x:1000:1000: Mazen Saad :/home/mazen-saad:/bin/bash
# awk -F: '
# BEGIN{
#   OFS=" - "
# }

# {
#   print NR, $1, $5, $6
# }

# ' /etc/passwd



# # Q3
# # mazen-saad : x : 1000 : 1000 : Mazen Saad :/home/mazen-saad:/bin/bash
# awk -F: '
# BEGIN{
# OFS=" - "
# }

# {
#   if ($3 > 500){
#       print NR, $1, $3, $5
#   }

# }
# ' /etc/passwd




# # Q4
# # mazen-saad : x : 1000 : 1000 : Mazen Saad :/home/mazen-saad:/bin/bash
# awk -F: '
# BEGIN {
#   OFS=" - "
# }

# {
#   if ($3 == 500){
#       print NR, $1, $3, $5
#   }
# }

# ' /etc/passwd



# # Q5
# awk -F: '
# BEGIN{
#   OFS=" - "
# }

# {
#     if (NR>=5 && NR<=15){
#         print NR, $0
#     }

# }
# ' /etc/passwd




# # Q6
# awk -F: '
# BEGIN{
#     OFS=" - "
# }

# {
#     i = 1
#     line = ""
#     while (i <= NF){
#         if($i == "lp"){
#             $i="mylp"
#             line=$0
#         }
#         i++;
#     }
#     if (line != "") {
#         print line
#     }
# }

# END{
# }
# ' /etc/passwd




# # Q7
# awk -F: '
# BEGIN {
#     max = 0
#     contline = ""
# } 

# {
#     if ($3>max) {
#         max=$3; 
#         contline=$0
#     }
# } 

# END {
#     print NR" - ", contline
# }
# ' /etc/passwd




# # Q8
# awk -F: '
# BEGIN {
#     sum=0;
# }

# {
#     sum += $3
# }

# END {
#     print "(", sum, ")"
# }
# ' /etc/passwd






# // =================================================================
# // =================================================================
# // =================================================================



# Group|  7 
# => 
# User|  7    |, Group|  7  |,
# User|  116  |, Group|  7  |,

# Group|  65534 
# =>
# User|  4      |, Group|  65534  |,
# User|  42     |, Group|  65534  |,
# User|  65534  |, Group|  65534  |,
# User|  106    |, Group|  65534  |,
# User|  999    |, Group|  65534  |,
# User|  119    |, Group|  65534  |,


# Group|  114 
# =>
# User|  112  |, Group|  114  |,
# User|  115  |, Group|  114  |,


# B1
awk -F: '
BEGIN{
    OFS=" - "
    print "------------------------"
}

{
    group[$4] += $3
}

END {
    for (grp in group) {
        print "Group ID:", grp
        print "Total Sum of IDs:", group[grp]
        print "------------------------"
    }
}' /etc/passwd




# B2
awk -F: '
BEGIN{
    print "User-Group Report"
}

{
    group[$4] = group[$4] $1 "\n";
    group_name[$4] = $1
}

END {
    for (i in group) {
        print "--------------------------"
        print "Group Name:- ", i
        print "- User:- ", group[i];
        print "--------------------------"
    }
}' /etc/passwd



