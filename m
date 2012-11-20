Return-Path: <ndec13@gmail.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4E49EE01423
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 09:10:38 -0800 (PST)
Received: by mail-qc0-f176.google.com with SMTP id n41so4609036qco.35
	for <meta-ti@yoctoproject.org>; Tue, 20 Nov 2012 09:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=O9ry6ebr8o9uyp9xxe6eG7BHUcC7m+liJ8BRnkDGTHU=;
	b=QLYILF9S6LGz4baZ2J/Fo65+D5pw563cJBeFmpKeLd/X7zajoJF/f6a9yC45Imapkv
	c/muQzJ16sLaaE3RlnS+mJU1BRJwkIKht6peNC1trHmYqfV6JIaEmQ1Bu51hONI7zfgn
	N88wae5FPsW1YW5/FLIOsvtW8jw5ZI6PeYUEVo5VXgthEcaC5PMjRSODcRz7ayscBqPm
	7tFR36RMSZEK5Hd5bUa7H0bdy/eNRVgF/i2AYZE05SrqwkPYtTx6bi5cOeoTxeWb8CUb
	XJM/+7n28S4ErWFW3qTohSAcxOAvZQKksZh4HKPI5Dzrv7OKdPhbtOmooV7HwdckML0S
	I8bQ==
Received: by 10.49.130.227 with SMTP id oh3mr17989101qeb.21.1353431437707;
	Tue, 20 Nov 2012 09:10:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.49.121.161 with HTTP; Tue, 20 Nov 2012 09:10:17 -0800 (PST)
In-Reply-To: <CAOT3miJT7PUO5_PRSjMwg9razGMxCzV6785Wkq2OkqO78X4pcQ@mail.gmail.com>
References: <CAOT3miJT7PUO5_PRSjMwg9razGMxCzV6785Wkq2OkqO78X4pcQ@mail.gmail.com>
From: Nicolas Dechesne <ndec13@gmail.com>
Date: Tue, 20 Nov 2012 18:10:17 +0100
Message-ID: <CAOT3mi+325AfgZqaP4D0Ky3M1T-zhdjadRDB_PsVFzgXPvv=Kw@mail.gmail.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: xf86-video-omap and libdrm for OMAP
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
X-List-Received-Date: Tue, 20 Nov 2012 17:10:38 -0000
Content-Type: multipart/alternative; boundary=047d7bd750461289ac04cef05062

--047d7bd750461289ac04cef05062
Content-Type: text/plain; charset=ISO-8859-1

well.. obviously, with the libdrm update, and our .bbappend in meta-ti
things are even worse than I had thought... and the tree doesn't even build
anymore, at least for panda, as we have:

COMPATIBLE_MACHINE = "omap4|omap5"

in the .bbappend

so now that brings another question... should we start a 'danny' branch on
meta-ti? if we remove the libdrm and xf86-video-omap recipes from
meta-ti/master, then we break meta-ti/master with poky/danny...






On Tue, Nov 20, 2012 at 5:50 PM, Nicolas Dechesne <ndec13@gmail.com> wrote:

> hi
>
> i just noticed that the recipe for xf86-video-omap was just merged into
> poky/master, and that libdrm was updated as well (and OMAP experimental
> support was enabled too):
>
> 0ed7c53 xf86-video-omap: add new recipe to follow the maintained repo
> cb758f9 libdrm: upgrade to 2.4.40
>
> from a quick review, i believe this should supersede the recipes from
> meta-ti that got merged recently:
>
> 410dc02 xf86-video-omap: add new recipe for OMAP4/5 X11 video driver
> cce5a7a libdrm: enable omap experimental api support
>
> i won't be able to get that tested in the next couple of days, very
> likely, so i wanted to know:
>
> - if anyone tested poky/master (or oe-core as this came from oe-core) on
> panda and/or beagle?
> - what is the policy in this situation? should we simply remove our
> recipes from meta-ti?
>
> cheers
>
> nicolas
>
>
>
>

--047d7bd750461289ac04cef05062
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

well.. obviously, with the libdrm update, and our .bbappend in meta-ti thin=
gs are even worse than I had thought... and the tree doesn&#39;t even build=
 anymore, at least for panda, as we have:<div><br></div><div><div>COMPATIBL=
E_MACHINE =3D &quot;omap4|omap5&quot;</div>

<div><br></div><div>in the .bbappend</div><div><br></div><div>so now that b=
rings another question... should we start a &#39;danny&#39; branch on meta-=
ti? if we remove the libdrm and xf86-video-omap recipes from meta-ti/master=
, then we break meta-ti/master with poky/danny...</div>

<div><br></div><div><br></div><div><br></div><div><br></div></div><div clas=
s=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Tue, Nov 20, 2012 a=
t 5:50 PM, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=3D"mailto:ndec13@=
gmail.com" target=3D"_blank">ndec13@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">hi<div><br></div><div>i just noticed that th=
e recipe for xf86-video-omap was just merged into poky/master,=A0and that l=
ibdrm was updated as well (and OMAP experimental support was enabled too):<=
/div>

<div><br></div><div><div>
0ed7c53 xf86-video-omap: add new recipe to follow the maintained repo</div>=
</div><div><div>cb758f9 libdrm: upgrade to 2.4.40</div></div><div><br></div=
><div>from a quick review, i believe this should=A0supersede the recipes fr=
om meta-ti that got merged recently:</div>


<div><br></div><div>410dc02 xf86-video-omap: add new recipe for OMAP4/5 X11=
 video driver</div><div><div>cce5a7a libdrm: enable omap experimental api s=
upport</div></div><div><br></div><div>i won&#39;t be able to get that teste=
d in the next couple of days, very likely, so i wanted to know:</div>


<div><br></div><div>- if anyone tested poky/master (or oe-core as this came=
 from oe-core) on panda and/or beagle?</div><div>- what is the policy in th=
is situation? should we simply remove our recipes from meta-ti?</div><div>


<br></div><div>cheers</div><span class=3D"HOEnZb"><font color=3D"#888888"><=
div><br></div><div>nicolas</div><div><br></div><div><br></div><div><br></di=
v>
</font></span></blockquote></div><br></div>

--047d7bd750461289ac04cef05062--
