#=
res1 : result with Regex m and the matching sequences are allowed to overlap indices in the original string
res2 : result with Regex m and they must be from distinct character ranges
detail in doc with Julia
=#
function regmatch(s::String,m::Array{Regex})
	res1 = fill(0,size(m,1),size(m,2))
	res2 = fill(0,size(m,1),size(m,2))
	for i in 1:size(m,1)
		for j in 1:size(m,2)
			res1[i,j] = length(collect(eachmatch(m[i,j],s,overlap=true)))
			res2[i,j] = length(collect(eachmatch(m[i,j],s,overlap=false)))
		end
	end
	return res1,res2
end
#=
genrate():
s : "abcdef....xyz"
chars : ["aa"  "ab"  "ac"  "ad"  "ae"  "af"  "ag"  "ah"  "ai"  "aj"  …  "ar"  "as"  "at"  "au"  "av"  "aw"  "ax"  "ay"  "az"
 "ba"  "bb"  "bc"  "bd"  "be"  "bf"  "bg"  "bh"  "bi"  "bj"     "br"  "bs"  "bt"  "bu"  "bv"  "bw"  "bx"  "by"  "bz"
 "ca"  "cb"  "cc"  "cd"  "ce"  "cf"  "cg"  "ch"  "ci"  "cj"     "cr"  "cs"  "ct"  "cu"  "cv"  "cw"  "cx"  "cy"  "cz"
 "da"  "db"  "dc"  "dd"  "de"  "df"  "dg"  "dh"  "di"  "dj"     "dr"  "ds"  "dt"  "du"  "dv"  "dw"  "dx"  "dy"  "dz"
 "ea"  "eb"  "ec"  "ed"  "ee"  "ef"  "eg"  "eh"  "ei"  "ej"     "er"  "es"  "et"  "eu"  "ev"  "ew"  "ex"  "ey"  "ez"
 "fa"  "fb"  "fc"  "fd"  "fe"  "ff"  "fg"  "fh"  "fi"  "fj"  …  "fr"  "fs"  "ft"  "fu"  "fv"  "fw"  "fx"  "fy"  "fz"
 "ga"  "gb"  "gc"  "gd"  "ge"  "gf"  "gg"  "gh"  "gi"  "gj"     "gr"  "gs"  "gt"  "gu"  "gv"  "gw"  "gx"  "gy"  "gz"
 "ha"  "hb"  "hc"  "hd"  "he"  "hf"  "hg"  "hh"  "hi"  "hj"     "hr"  "hs"  "ht"  "hu"  "hv"  "hw"  "hx"  "hy"  "hz"
 "ia"  "ib"  "ic"  "id"  "ie"  "if"  "ig"  "ih"  "ii"  "ij"     "ir"  "is"  "it"  "iu"  "iv"  "iw"  "ix"  "iy"  "iz"
 "ja"  "jb"  "jc"  "jd"  "je"  "jf"  "jg"  "jh"  "ji"  "jj"     "jr"  "js"  "jt"  "ju"  "jv"  "jw"  "jx"  "jy"  "jz"
 "ka"  "kb"  "kc"  "kd"  "ke"  "kf"  "kg"  "kh"  "ki"  "kj"  …  "kr"  "ks"  "kt"  "ku"  "kv"  "kw"  "kx"  "ky"  "kz"
 ⋮                             ⋮                             ⋱                    ⋮                             ⋮
 "qa"  "qb"  "qc"  "qd"  "qe"  "qf"  "qg"  "qh"  "qi"  "qj"     "qr"  "qs"  "qt"  "qu"  "qv"  "qw"  "qx"  "qy"  "qz"
 "ra"  "rb"  "rc"  "rd"  "re"  "rf"  "rg"  "rh"  "ri"  "rj"     "rr"  "rs"  "rt"  "ru"  "rv"  "rw"  "rx"  "ry"  "rz"
 "sa"  "sb"  "sc"  "sd"  "se"  "sf"  "sg"  "sh"  "si"  "sj"     "sr"  "ss"  "st"  "su"  "sv"  "sw"  "sx"  "sy"  "sz"
 "ta"  "tb"  "tc"  "td"  "te"  "tf"  "tg"  "th"  "ti"  "tj"     "tr"  "ts"  "tt"  "tu"  "tv"  "tw"  "tx"  "ty"  "tz"
 "ua"  "ub"  "uc"  "ud"  "ue"  "uf"  "ug"  "uh"  "ui"  "uj"  …  "ur"  "us"  "ut"  "uu"  "uv"  "uw"  "ux"  "uy"  "uz"
 "va"  "vb"  "vc"  "vd"  "ve"  "vf"  "vg"  "vh"  "vi"  "vj"     "vr"  "vs"  "vt"  "vu"  "vv"  "vw"  "vx"  "vy"  "vz"
 "wa"  "wb"  "wc"  "wd"  "we"  "wf"  "wg"  "wh"  "wi"  "wj"     "wr"  "ws"  "wt"  "wu"  "wv"  "ww"  "wx"  "wy"  "wz"
 "xa"  "xb"  "xc"  "xd"  "xe"  "xf"  "xg"  "xh"  "xi"  "xj"     "xr"  "xs"  "xt"  "xu"  "xv"  "xw"  "xx"  "xy"  "xz"
 "ya"  "yb"  "yc"  "yd"  "ye"  "yf"  "yg"  "yh"  "yi"  "yj"     "yr"  "ys"  "yt"  "yu"  "yv"  "yw"  "yx"  "yy"  "yz"
 "za"  "zb"  "zc"  "zd"  "ze"  "zf"  "zg"  "zh"  "zi"  "zj"  …  "zr"  "zs"  "zt"  "zu"  "zv"  "zw"  "zx"  "zy"  "zz"]

 regs1 : Regexes with single letter
 regs2 : Regexes with double letters
=#
function genrate()
    chars = fill("&",26,26)
    regs1 = fill(r"1",26)
    regs2 = fill(r"2",26,26)
    s = "abcdefghijklmnopqrstuvwxyz"
    for i in 1:26
    	x = s[i]
    	tmp1 = uppercase(s[i])
    	for j in 1:26
    		y = s[j]
    		tmp2 = uppercase(s[j])
    		chars[i,j] = string(s[i],s[j])
    		regs2[i,j] = Regex("[$x$tmp1][$y$tmp2]")
    	end
    	regs1[i] = Regex("$x|$tmp1")
    end
    return s,chars,regs1,regs2
end


#=

=#
function calcuentropy(m)
    res = 0.0
    for i in 1:size(m,1)
        for j in 1:size(m,2)
        if m[i,j] > 0
           res += -m[i,j]*log2(m[i,j]) 
        end
        end
    end
    return res
end

function tokbit(f::Real,k::Int)::String
    s = ""
    tmp = f
    for i = 1:k
        s*=string(floor(Int,tmp*2))
        tmp = tmp*2-floor(Int,tmp*2)
    end
    return s
end


function fncode(m,c)
    # sort form small to big
    m = vec(m)
    p = m[sortperm(m,rev=true)]
    s = [i for i in c]
    s = s[sortperm(m,rev=true)]
    # 
    if length(m) == 2
        return [["0","1"] p s]
    end
    if length(m) == 1
        return ["0" p s]
    end
    # find two part
    res = fill("",length(m))
    tmp = 0
    norm = 1
    flag = 0
    sumnow = sum(p)
    for i in 1:length(p)
        tmp+=p[i]
        if abs(tmp-0.5sumnow) >= norm
            flag = i-1
            break
        end
        norm = abs(tmp-0.5sumnow)
    end
    # println(flag)
    if flag!=1
        res[1:flag].*="0"
    end
    if flag!=length(m)-1
        res[flag+1:end].*="1" 
    end
    res[1:flag].*=fncode(p[1:flag],s[1:flag])[:,1]
    res[flag+1:end].*=fncode(p[flag+1:end],s[flag+1:end])[:,1]
    return [res p s]
end


function xncode(m,s::String)
    res=vec(fill("",length(s),1))
    m = vec(m)
    # sort form big to small
    v = sortperm(m,rev=true)
    p = m[v]
    s = s[v]
    suma = [sum(p[1:i])-p[i] for i in 1:length(p)]
    for i in 1:length(p)
        k = 2+ceil(Int,-log2(p[i]))
        res[i] *= tokbit(suma[i],k)
    end
    c = [i for i in s]
    return [res p c]
end

#=
data struct 2bitTree
=#

mutable struct Nodes
    weight::Real
    char::String
    # code::String
    leftchild::Nodes
    rightchild::Nodes
    parentn::Nodes
    function Nodes(w::Real,c)
        x = new();
        x.weight = w
        x.char = string(c)
        x.leftchild = x
        x.rightchild = x
        x.parentn = x   
        return x
    end
    function Nodes(w::Real,c,left::Nodes,right::Nodes)
        x = new();
        x.weight = w
        x.char = string(c)
        x.leftchild = left
        x.rightchild = right
        x.parentn = x
        return x
    end
    # function Nodes(w::Real,c::String,)
        
    # end
end

function initnodes(p1,c::String)
    v = sortperm(vec(p1),rev=true)
    p1 = p1[v]
    c = c[v]
    tr = []
    for i = 1:length(p1)
        push!(tr,Nodes(p1[i],c[i]))
    end
    return p1,c,tr
end


#=
input array{Nodes}
根据数组中每个nodes的weight排序
output new array
=#
function nodessort!(tr)
    p = [x.weight for x in tr]
    v = sortperm(p,rev=true)
    tr[1:end] = tr[v]
    return tr
end
#=
input array{Nodes}
array has been sorted from big to small
return n::Nodes
=#
function creathfmtree!(tr)::Nodes
    while length(tr)!=1
        min1 = pop!(tr)
        min2 = pop!(tr)
        tmp = Nodes(min1.weight+min2.weight, min1.char*min2.char, min1, min2)# leftchild is smaller than rightchild
        min1.parentn = tmp
        min2.parentn = tmp
        push!(tr,tmp)
        nodessort!(tr)
    end
    return tr[1]
    #=while length(tr) == 1
    # 1.pop 后两个，即最小的两个
    # 2.生成新的Nodes
    # 3.push 新的Nodes
    # 4.排序
    =#
end


function hfmcode(tr,code::String)
    if tr.rightchild == tr && tr.leftchild==tr
        print(tr.weight)
        print(tr.char)
        println(code)
        return [code tr.weight tr.char]
    end
    res = ["code" 0.0 "&"]
    if tr.leftchild != tr
        res = [res; hfmcode(tr.leftchild,code*"0")]
        res = res[2:end,:]
    end
    if tr.rightchild != tr
        res = [res; hfmcode(tr.rightchild,code*"1")]
    end
    return res
end

function hfmcodet(p1,c::String)
    p1,c,tr = initnodes(p1,c)
    println(p1)
    println(c)
    tr = creathfmtree!(tr)
    res = hfmcode(tr,"")
    return res
end


#=
input:(26×3 Array{Any,2},s::String )
like this:

 "&00000"          0.134582    'e'
 "&001000"         0.0988182   't'
 "&001110"         0.078176    'a'
 "&010011"         0.0744052   'o'
 "&011000"         0.0736277   'n'
 "&011101"         0.0715285   's'
 "&100001"         0.0684575   'i'
 "&1001100"        0.0583502   'r'
 "&1010100"        0.0522858   'h'
 ⋮
 "&111101000"      0.0148499   'y'
 "&111101111"      0.0113901   'v'
 "&111110101"      0.0102239   'w'
 "&11111101010"    0.00349868  'j'
 "&11111110001"    0.00299331  'x'
 "&111111110000"   0.00194371  'k'
 "&111111111000"   0.0012051   'q'
 "&1111111111001"  0.00073861  'z'

s is the article which need to encode

 output: s::String
=#
#=
average length
=#
function calculength(encodelist::Array{Any,2})
    res = 0.0
    for i = 1:length(encodelist[:,1])
        res += encodelist[i,2]*length(encodelist[i])
    end
    return res
end

#=
计算编码效率
=#
function calcuefficien(averlength,hx)::Float64
    return hx/averlength
end


function encode(encodelist::Array{Any,2},s::String)::String

    for i = 1:length(encodelist[:,1])
        s = replace(s,encodelist[i,3]=>encodelist[i,1])
        s = replace(s,uppercase(encodelist[i,3])=>encodelist[i,1])
    end
    return s
end

#=
similar as encode
=#
function decode(encodelist::Array{Any,2},s::String)::String
    res = ""
    j = 1
    dic = Dict(encodelist[i,1]=>encodelist[i,3] for i = 1:length(encodelist[:,1]))
    for i = 1:length(s)
        if s[i] == '0' || s[i] == '1'
           if s[j:i] in encodelist[:,1]
            res *= dic[s[j:i]]
            j = i+1
            end
        else
            j = i+1
        end
        # if i-j>20
        #     error("??????")
        # end
    end
    return res
end