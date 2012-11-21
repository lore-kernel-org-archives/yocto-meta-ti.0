Return-Path: <ndec13@gmail.com>
Received: from mail-vb0-f48.google.com (mail-vb0-f48.google.com
	[209.85.212.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D3248E0141C;
	Wed, 21 Nov 2012 14:52:52 -0800 (PST)
Received: by mail-vb0-f48.google.com with SMTP id l22so6936017vbn.35
	for <multiple recipients>; Wed, 21 Nov 2012 14:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=T+KfzdzAamn/kjP0+YV6aEUw42BStzh+iz7SxtJEFLY=;
	b=chLfybvu10fhF9ybJ0tm1Kza05fAIGQxTSFuqCi1VtwIbKphlJrEGO5Lm6PDy/GRQ6
	aD8ED35hrVuj4MitGX5oUYNNbKU1yjxHMvT9zImbyZL1nvnitDogQk+92IlSE+8MmbhY
	yASd40X40RFdGutCWecsxMPOpLneXqGdc/q9009Gk4uCRNh0FfAN4hmaHghdAVHwmyTq
	ErElzvLvu2/o70Zw8GmmjwL90S+O84mkljUxmXQJ75RHEHCS+KrR27zJr1YtzDI64Vy+
	3Jm6y73IWB15cHUdsY7mtqKwr/DUqiBjRBHrKCxKZZJ1g59UJEDcrDZS5EbqEIMovtFu
	zIcQ==
Received: by 10.52.95.34 with SMTP id dh2mr26959983vdb.69.1353538372179; Wed,
	21 Nov 2012 14:52:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.248.74 with HTTP; Wed, 21 Nov 2012 14:52:30 -0800 (PST)
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Wed, 21 Nov 2012 23:52:30 +0100
Message-ID: <CAOT3miJ73uAvR0Qij3+-q3B6K46=J5ZoFZDzW79YCSUfPbLeAA@mail.gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	yocto <yocto@yoctoproject.org>
Subject: build failure with xf86-video-omap
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
X-List-Received-Date: Wed, 21 Nov 2012 22:52:53 -0000
Content-Type: multipart/alternative; boundary=20cf307cfef4dd17a004cf09354a

--20cf307cfef4dd17a004cf09354a
Content-Type: text/plain; charset=ISO-8859-1

hi ,

since xf86-video-omap was recently merged in oe-core and poky, i am trying
to remove the recipes we had staged in meta-ti trees for some weeks (
http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?id=410dc026f2ee24a2346e7563a83f0181c79809cf).
so i was trying to build  poky/master with meta-ti/master, for pandaboard,
and I get build failures in xf86-video-omap [1] and [2].

so [1] is actually trivial, as we are missing a DEPENDS in the recipe, i
can send a patch in oe-core for that.

[2] is a bit more cryptic to me.. so I quickly tried to build with danny (
i just cherry picked the commit that introduced xf86-video-omap from
master) and this time it built fine.

has anyone actually tested this recipe? if so I must be doing something
wrong, any hint would be helpful.

i also tried a build without poky, and just oe-core, and got the same
failure.

cheers

nicolas

[1] : from log_do.configure for xf86-video-omap
checking for XORG... no
configure: error: Package requirements (xorg-server >= 1.3 xproto
fontsproto libdrm >= 2.4.36 libdrm_omap xf86driproto  randrproto
renderproto videoproto xextproto) were not met:



No package 'xf86driproto' found

Consider adjusting the PKG_CONFIG_PATH environment variable if you
installed software in a non-standard prefix.


[2] : from log_do.configure for xf86-video-omap
checking dependency style of arm-poky-linux-gnueabi-gcc  -march=armv7-a
-mthumb-\
interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a9
--sysroot=/data/psi_omap_bu\
ilds_admins/ndechesne/yocto/build-poky2/tmp/sysroots/pandaboard... (cached)
none
checking for sys/ioctl.h... (cached) yes
checking if RANDR is defined... yes
checking if RENDER is defined... yes
checking if XV is defined... yes
checking if DPMSExtension is defined... yes
checking for XORG... yes
checking for ANSI C header files... (cached) yes
checking whether to include DRI support... checking for
/usr/include/xorg/dri.h...
configure: error: cannot check for file existence when cross compiling
... and configure just

--20cf307cfef4dd17a004cf09354a
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

hi ,<div><br></div><div>since xf86-video-omap was recently merged in oe-cor=
e and poky, i am trying to remove the recipes we had staged in meta-ti tree=
s for some weeks (<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta=
-ti/commit/?id=3D410dc026f2ee24a2346e7563a83f0181c79809cf">http://git.yocto=
project.org/cgit/cgit.cgi/meta-ti/commit/?id=3D410dc026f2ee24a2346e7563a83f=
0181c79809cf</a>). so=A0i was trying to build =A0poky/master with meta-ti/m=
aster, for pandaboard, and I get build failures in xf86-video-omap [1] and =
[2].</div>

<div><br></div><div>so [1] is actually trivial, as we are missing a DEPENDS=
 in the recipe, i can send a patch in oe-core for that.=A0</div><div><br></=
div><div>[2] is a bit more cryptic to me.. so I quickly tried to build with=
 danny ( i just cherry picked the commit that introduced xf86-video-omap fr=
om master) and this time it built fine.=A0<div>

<br>
</div><div>has anyone actually tested this recipe? if so I must be doing so=
mething wrong, any hint would be helpful.</div><div><br></div><div>i also t=
ried a build without poky, and just oe-core, and got the same failure.</div=
>

<div><br></div><div>cheers</div><div><br></div><div>nicolas</div><div><br><=
/div><div>[1] : from log_do.configure for xf86-video-omap=A0<br></div><div>=
<div></div></div><div>checking for XORG... no<br></div><div><div>configure:=
 error: Package requirements (xorg-server &gt;=3D 1.3 xproto fontsproto lib=
drm &gt;=3D 2.4.36 libdrm_omap xf86driproto =A0randrproto renderproto video=
proto xextproto) were not met:</div>

<div>=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=A0=
</div><div>No package &#39;xf86driproto&#39; found</div>

<div><br></div><div>Consider adjusting the PKG_CONFIG_PATH environment vari=
able if you</div><div>installed software in a non-standard prefix.</div></d=
iv><div><br></div><div><br></div><div>[2] : from log_do.configure for xf86-=
video-omap=A0<br>

</div><div><div><div>checking dependency style of arm-poky-linux-gnueabi-gc=
c =A0-march=3Darmv7-a =A0 =A0 -mthumb-\</div>
<div>interwork -mfloat-abi=3Dsoftfp -mfpu=3Dneon -mtune=3Dcortex-a9 --sysro=
ot=3D/data/psi_omap_bu\</div><div>ilds_admins/ndechesne/yocto/build-poky2/t=
mp/sysroots/pandaboard... (cached) none</div><div>checking for sys/ioctl.h.=
.. (cached) yes</div>


<div>checking if RANDR is defined... yes</div><div>checking if RENDER is de=
fined... yes</div><div>checking if XV is defined... yes</div><div>checking =
if DPMSExtension is defined... yes</div><div>checking for XORG... yes</div>


<div>checking for ANSI C header files... (cached) yes</div><div>checking wh=
ether to include DRI support... checking for /usr/include/xorg/dri.h...=A0<=
/div><div>configure: error: cannot check for file existence when cross comp=
iling=A0</div>


</div></div><div>... and configure just=A0</div>
</div>

--20cf307cfef4dd17a004cf09354a--
