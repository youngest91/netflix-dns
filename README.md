# Netflix DNS Resolver

Link : [https://let.my.id/netflix/hosts.txt](https://let.my.id/netflix/hosts.txt)


## Add domain lists
Add the domains to `domain.txt`

## Add CDN lists
Add the CND domains to `cdn.txt`


`Format : link cdn + prefix x number`
#### Example 1 :
```
occ-0-64-325.1.nflxso.net
occ-1-64-325.1.nflxso.net
.....
occ-100-64-325.1.nflxso.net
```
prefix: 1 number

write: `ipv4-c -sin001-ix.1.oca.nflxvideo.net 1` to `cdn.txt` 

#### Example 2 :
```
ipv4-c001-sin001-ix.1.oca.nflxvideo.net
ipv4-c002-sin001-ix.1.oca.nflxvideo.net
...
ipv4-c100-sin001-ix.1.oca.nflxvideo.net
```
prefix : 3 number

write: `ipv4-c -sin001-ix.1.oca.nflxvideo.net 3` to `cdn.txt` 

