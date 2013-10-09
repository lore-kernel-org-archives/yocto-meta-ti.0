Return-Path: <b.hutchman@gmail.com>
Received: from mail-ea0-f181.google.com (mail-ea0-f181.google.com
	[209.85.215.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10750E011C5
	for <meta-ti@yoctoproject.org>; Wed,  9 Oct 2013 12:15:18 -0700 (PDT)
Received: by mail-ea0-f181.google.com with SMTP id d10so652383eaj.12
	for <meta-ti@yoctoproject.org>; Wed, 09 Oct 2013 12:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=/Zy6PVTX7YhB1vMU4TCTGglVD+AEgJDEXSJSfYKP3qM=;
	b=o6JbEJSgl9VVIpKM/SBaEuOa+fjXjrvgOWHwc2v2Xyb/TXwH6iKhH8CPHIZExgXF/U
	1mNZyeuqvIMddo52KNy8lPWFWdjGptcAwZwEdzF6/DzTvXWXb8JNTyNn/qaUH+MJqayM
	jYlFlraAgiSHlF56OouObzz39TY5aV+/YB57FtIKmdiH6KCAkl8SPAliQtnl9jSyCNcl
	kCXIVJHJ7M131+oX0/tpHgHKgRzogP2wFhVkGe6mKUzM9YjDXL800Qz6ler5E3v9zGYD
	CkRIVhdmSuDLOwlz+wiziOayvKSg7OVuXFsN4kSS1Ycn05n5gakK+O8Urvy6+XuDWRkY
	mJ3w==
MIME-Version: 1.0
X-Received: by 10.15.75.73 with SMTP id k49mr13741097eey.36.1381346117315;
	Wed, 09 Oct 2013 12:15:17 -0700 (PDT)
Received: by 10.223.144.205 with HTTP; Wed, 9 Oct 2013 12:15:17 -0700 (PDT)
In-Reply-To: <20131009180902.GB15357@edge>
References: <CAFZh4h9H3bTQveLafJY-3rCz-qy=dqhVq36CTqFt4RCPqJWDcQ@mail.gmail.com>
	<20131009180902.GB15357@edge>
Date: Wed, 9 Oct 2013 15:15:17 -0400
Message-ID: <CAFZh4h8zkeU6JysvkAuHDPMES9NdQFPkbxxXPPcOQwO61r32PQ@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: Denys Dmytriyenko <denys@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Kernel recipe that works with OECore + meta-ti fails with Poky + meta-ti
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 09 Oct 2013 19:15:19 -0000
Content-Type: multipart/alternative; boundary=001a11c1af4ca276d004e853b4fe

--001a11c1af4ca276d004e853b4fe
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 9, 2013 at 2:09 PM, Denys Dmytriyenko <denys@ti.com> wrote:

>
> 1. Which bitbake you use when building oe-core+meta-ti? Since Poky comes
> with
> own copy of bitbake, you may want to compare them.
>

Poky is: BitBake Build Tool Core version 1.20.0, bitbake version 1.20.0
OECore is:  BitBake Build Tool Core version 1.19.1, bitbake version 1.19.1


> 2. Not that it would affect packaging, but where in bblayer.conf did you
> add
> meta-ti?
>

My bblayers.conf in Poky is:
BBLAYERS ?= " \
  /home/hutch/yocto_master_wcs_10_4_2013/poky/meta \
  /home/hutch/yocto_master_wcs_10_4_2013/poky/meta-yocto \
  /home/hutch/yocto_master_wcs_10_4_2013/poky/meta-yocto-bsp \
  /home/hutch/yocto_master_wcs_10_4_2013/poky/meta-ti \
  /home/hutch/yocto_master_wcs_10_4_2013/layers/meta-oe/meta-oe \
  /home/hutch/yocto_master_wcs_10_4_2013/layers/meta-oe/meta-networking \
  /home/hutch/yocto_master_wcs_10_4_2013/layers/meta-oe/meta-webserver \
  "
BBLAYERS_NON_REMOVABLE ?= " \
  /home/hutch/yocto_master_wcs_10_4_2013/poky/meta \
  /home/hutch/yocto_master_wcs_10_4_2013/poky/meta-yocto \

My bblayers.conf in OECore (that works) is:
BBLAYERS ?= " \
  /home/hutch/oe_core_beagleboard/oe-core/meta \
  /home/hutch/oe_core_beagleboard/oe-core/meta-ti \
  /home/hutch/oe_core_beagleboard/oe-core/meta-openembedded/meta-oe \
  /home/hutch/oe_core_beagleboard/oe-core/meta-openembedded/meta-networking
\
  /home/hutch/oe_core_beagleboard/oe-core/meta-openembedded/meta-webserver \
  "

BBLAYERS_NON_REMOVABLE ?= " \
  /home/hutch/oe_core_beagleboard/oe-core/meta \
  "

I killed the build.  I can't afford to tie up the server that long.  Looks
like I'll have to go back to using Poky for only building my rootfs and
build kernel with poky generated sdk outside of bitbake.  The other problem
I saw was in OECore, I added the linux-libc-headers for 2.6.37.2 so
packages would be built with headers that matched my TI PSP based kernel
and I was able to get that to work.  In Poky, I made the same mods to try
and build everything against 2.6.37.2 headers and no matter what I tried it
would always use 3.10 headers.  Probably OK but I still worry it could
cause a problem.


> And one more suggestion - you may want to compare classes between oe-core
> and
> poky/meta to see if there are any big differences, especially in the
> packaging
> area...
>

Will do.  Thanks!

Brian

--001a11c1af4ca276d004e853b4fe
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Oct 9, 2013 at 2:09 PM, Denys Dmytriyenko <span dir=3D"ltr">&lt;<a href=
=3D"mailto:denys@ti.com" target=3D"_blank">denys@ti.com</a>&gt;</span> wrot=
e:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
1. Which bitbake you use when building oe-core+meta-ti? Since Poky comes wi=
th<br>
own copy of bitbake, you may want to compare them.<br></blockquote><div><br=
></div><div>Poky is: BitBake Build Tool Core version 1.20.0, bitbake versio=
n 1.20.0<br></div><div>OECore is:=A0 BitBake Build Tool Core version 1.19.1=
, bitbake version 1.19.1<br>
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
2. Not that it would affect packaging, but where in bblayer.conf did you ad=
d<br>
meta-ti?<br></blockquote><div><br></div><div>My bblayers.conf in Poky is:<b=
r>BBLAYERS ?=3D &quot; \<br>=A0 /home/hutch/yocto_master_wcs_10_4_2013/poky=
/meta \<br>=A0 /home/hutch/yocto_master_wcs_10_4_2013/poky/meta-yocto \<br>=
=A0 /home/hutch/yocto_master_wcs_10_4_2013/poky/meta-yocto-bsp \<br>
=A0 /home/hutch/yocto_master_wcs_10_4_2013/poky/meta-ti \<br>=A0 /home/hutc=
h/yocto_master_wcs_10_4_2013/layers/meta-oe/meta-oe \<br>=A0 /home/hutch/yo=
cto_master_wcs_10_4_2013/layers/meta-oe/meta-networking \<br>=A0 /home/hutc=
h/yocto_master_wcs_10_4_2013/layers/meta-oe/meta-webserver \<br>
=A0 &quot;<br>BBLAYERS_NON_REMOVABLE ?=3D &quot; \<br>=A0 /home/hutch/yocto=
_master_wcs_10_4_2013/poky/meta \<br>=A0 /home/hutch/yocto_master_wcs_10_4_=
2013/poky/meta-yocto \<br>=A0<br></div><div>My bblayers.conf in OECore (tha=
t works) is:<br>
BBLAYERS ?=3D &quot; \<br>=A0 /home/hutch/oe_core_beagleboard/oe-core/meta =
\<br>=A0 /home/hutch/oe_core_beagleboard/oe-core/meta-ti \<br>=A0 /home/hut=
ch/oe_core_beagleboard/oe-core/meta-openembedded/meta-oe \<br>=A0 /home/hut=
ch/oe_core_beagleboard/oe-core/meta-openembedded/meta-networking \<br>
=A0 /home/hutch/oe_core_beagleboard/oe-core/meta-openembedded/meta-webserve=
r \<br>=A0 &quot;<br><br>BBLAYERS_NON_REMOVABLE ?=3D &quot; \<br>=A0 /home/=
hutch/oe_core_beagleboard/oe-core/meta \<br>=A0 &quot;<br><br></div><div>I =
killed the build.=A0 I can&#39;t afford to tie up the server that long.=A0 =
Looks like I&#39;ll have to go back to using Poky for only building my root=
fs and build kernel with poky generated sdk outside of bitbake.=A0 The othe=
r problem I saw was in OECore, I added the linux-libc-headers for 2.6.37.2 =
so packages would be built with headers that matched my TI PSP based kernel=
 and I was able to get that to work.=A0 In Poky, I made the same mods to tr=
y and build everything against 2.6.37.2 headers and no matter what I tried =
it would always use 3.10 headers.=A0 Probably OK but I still worry it could=
 cause a problem.<br>
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
And one more suggestion - you may want to compare classes between oe-core a=
nd<br>
poky/meta to see if there are any big differences, especially in the packag=
ing<br>
area...<br></blockquote></div><br></div><div class=3D"gmail_extra">Will do.=
=A0 Thanks!<br><br>Brian<br></div></div>

--001a11c1af4ca276d004e853b4fe--
