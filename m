Return-Path: <baptiste.durand@gmail.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79158E017DB
	for <meta-ti@yoctoproject.org>; Wed,  6 Nov 2013 05:26:12 -0800 (PST)
Received: by mail-wi0-f178.google.com with SMTP id hn9so3671527wib.11
	for <meta-ti@yoctoproject.org>; Wed, 06 Nov 2013 05:26:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BKO+IC2bGM6YIxAeDAcUxw1Ash3NjuRboiklek2tobE=;
	b=oEfVe+3EORvkTRZuoYUh7+1EXlHW+McA5ZS1koVhuwnafUMl66xtrqgQAJVbgz23gZ
	2LCMYxOETEBdSVdQ/ig/Sy4vWrHNgzcjoX5S7cFVI6A6Er+xmN2IegOI3j4s5ZJbywpo
	8DOVMvT9DTGL0aHsdjWWgb51Vb3qySsiNQ2kz7nRQsuOzQW7TdstbRY6PGruLM2GVbFX
	aV8wjHO1/XT/RxutFErVUuLdy7p6mtaR5CMrtrQu7gOXQGwsVSpDe6UXRqvoE4w8j1og
	egADUJRIwCOHjgZKsXlXqxx3HluG5YkbsSu4CRTxwMmgA8jIQCsdgD4TW32eMjXsGHF1
	M7IQ==
MIME-Version: 1.0
X-Received: by 10.180.126.103 with SMTP id mx7mr2450492wib.39.1383744371528;
	Wed, 06 Nov 2013 05:26:11 -0800 (PST)
Received: by 10.217.61.132 with HTTP; Wed, 6 Nov 2013 05:26:11 -0800 (PST)
In-Reply-To: <4FEDAB2D-AA9F-499E-BDF0-8012EE7CE508@ti.com>
References: <245245F712CBF74D865D90E99497849F06357480@mail-3.tvm.nestgroup.net>
	<4FEDAB2D-AA9F-499E-BDF0-8012EE7CE508@ti.com>
Date: Wed, 6 Nov 2013 14:26:11 +0100
Message-ID: <CAB0T2v-Tf+j56YKrUvV7npQ8Jk2HnE43HA6kJh0J+FEs7rEyJQ@mail.gmail.com>
From: Baptiste Durand <baptiste.durand@gmail.com>
To: "Heroor, Siddharth" <heroor@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: meat-ti(master) kernel not working with meta-ivi
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
X-List-Received-Date: Wed, 06 Nov 2013 13:26:16 -0000
Content-Type: multipart/alternative; boundary=e89a8f6479d1b99ac204ea821733

--e89a8f6479d1b99ac204ea821733
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I already saw this issue (=> https://github.com/baillaw/meta-x10/issues) :
please  try to add
GCCVERSION="4.7%" in  your local.conf.

GCC 4.8 seems to build uncorrectly the kernel for pandaboard.



Baptiste



2013/11/6 Heroor, Siddharth <heroor@ti.com>

>  Hi Jithin,
>
>  Please comments below.
>
> --Sid
>
> On 06-Nov-2013, at 5:33 pm, "Jithin Raj" <jithin.raj@nestgroup.net> wrote:
>
>   Hi,
>
>
>
> I am trying to build the yocto based meta-ivi (5.0), meta-ti for
> Pandaboard.
>
> For building  I used the below procedure
>
>
>
> 1) git clone git://git.yoctoproject.org/poky
>
>    cd poky
>
>    git checkout dora
>
>    cd -
>
> 2) git clone git://git.yoctoproject.org/meta-ivi
>
>    cd meta-ivi
>
>    git checkout 5.0
>
>    cd -
>
> 3) git clone git://git.yoctoproject.org/meta-ti
>
>
>
> 4) source poky/oe-init-build-env
>
>
>
> 5) modified the bblayer.conf like this.
>
>     BBLAYERS ?= " \
>
>      /home/sfm/yocto/building/poky/meta \
>
>      /home/sfm/yocto/building/poky/meta-yocto \
>
>      /home/sfm/yocto/building/meta-ivi \
>
>      /home/sfm/yocto/building/meta-ti \
>
>
>
> 6) modified the local.config with
>
>                 MACHINE?=pandaboard
>
>
>
> 7) Add INCOMPATIBLE_LICENSE = "GPLv3" in COREBASE/build/conf/local.conf
> file.
>
>
>
> 8) Set DISTRO ?= "poky-ivi-systemd" in COREBASE/build/conf/local.conf file.
>
>
>
> 9) bitbake gemini-image
>
>
>
> Once all the generated files are copied to the SD card I switched on the
> pandaboard es.
>
> The pandaboard es is hanging while its loading the kernel. Please find log
> here:
>
>
>  Please also see if core-minimal and sato images are booting. There isn't
> much active work happening on panda board and so could you check if a
> kernel.org is booting fine?
>
>
>
>
> *U-Boot SPL 2011.12 (Nov 05 2013 - 14:12:29)*
>
> *Texas Instruments OMAP4460 ES1.1        *
>
> *OMAP SD/MMC: 0                          *
>
> *reading u-boot.img                      *
>
> *reading u-boot.img*
>
>
>
>
>
> *U-Boot 2011.12 (Nov 05 2013 - 14:12:29)*
>
>
>
> *CPU  : OMAP4460 ES1.1*
>
> *Board: OMAP4 Panda*
>
> *I2C:   ready*
>
> *DRAM:  1 GiB*
>
> *MMC:   OMAP SD/MMC: 0*
>
> *Using default environment*
>
>
>
> *In:    serial*
>
> *Out:   serial*
>
> *Err:   serial*
>
> *Hit any key to stop autoboot:  0 *
>
> *reading boot.scr*
>
>
>
> *338 bytes read*
>
> *Running bootscript from mmc0 ...*
>
> *## Executing script at 82000000*
>
> *reading uImage*
>
>
>
> *4333848 bytes read*
>
> *## Booting kernel from Legacy Image at 80000000 ...*
>
> *   Image Name:   Linux-3.4.11*
>
> *   Image Type:   ARM Linux Kernel Image (uncompressed)*
>
> *   Data Size:    4333784 Bytes = 4.1 MiB*
>
> *   Load Address: 80008000*
>
> *   Entry Point:  80008000*
>
> *   Verifying Checksum ... OK*
>
> *   Loading Kernel Image ... OK*
>
> *OK*
>
>
>
> *Starting kernel ...*
>
>
>
> *Uncompressing Linux... done, booting the kernel.*
>
>
>
> After this nothing is displayed.
>
>
>
> I have few doubts in this procedure.
>
>
>
> 1)      *which branch of meta-ti I have to use for dora branch*?
> (currently am using the master branch).
>
>
>  Master should be fine for Dora. Please also checkout the specific
> commits from poky as mentioned in meta-ivi.
>
>   2)      *Do the master branch will work with all the poky branches*(like dora, dylan?
>
>
>  There should be Dylan branch on meta-ti that you can checkout.
>
>           3)    *Do I need to do any other modification in any file to
> work with pandaboard*?.
>
>
>  I haven't tried panda recently but I could try it out early next week
> and respond.
>
>
>
> Thanks in advance.
>
>
>
> *Thanks & regards*
>
> *Jithin Raj*
>
>
>
> ***** Confidentiality Statement/Disclaimer *****
>
> This message and any attachments is intended for the sole use of the
> intended recipient. It may contain confidential information. Any
> unauthorized use, dissemination or modification is strictly prohibited. If
> you are not the intended recipient, please notify the sender immediately
> then delete it from all your systems, and do not copy, use or print.
> Internet communications are not secure and it is the responsibility of the
> recipient to make sure that it is virus/malicious code exempt.
> The company/sender cannot be responsible for any unauthorized alterations
> or modifications made to the contents. If you require any form of
> confirmation of the contents, please contact the company/sender. The
> company/sender is not liable for any errors or omissions in the content of
> this message.
>
>  _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>
>


-- 
Baptiste DURAND

--e89a8f6479d1b99ac204ea821733
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,<br><br></div><div>I already saw this issue (=3D&g=
t; <a href=3D"https://github.com/baillaw/meta-x10/issues">https://github.co=
m/baillaw/meta-x10/issues</a>) : <br></div><div>please=A0 try to add <br>GC=
CVERSION=3D&quot;4.7%&quot; in=A0 your local.conf.<br>
<br></div><div>GCC 4.8 seems to build uncorrectly the kernel for pandaboard=
.<br><br></div><div><br><br></div><div>Baptiste <br><br></div><div class=3D=
"gmail_extra"><br><br><div class=3D"gmail_quote">2013/11/6 Heroor, Siddhart=
h <span dir=3D"ltr">&lt;<a href=3D"mailto:heroor@ti.com" target=3D"_blank">=
heroor@ti.com</a>&gt;</span><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">



<div dir=3D"auto">
<div>Hi Jithin,</div>
<div><br>
</div>
<div>Please comments below.<br>
<br>
--Sid</div><div><div class=3D"h5">
<div><br>
On 06-Nov-2013, at 5:33 pm, &quot;Jithin Raj&quot; &lt;<a href=3D"mailto:ji=
thin.raj@nestgroup.net" target=3D"_blank">jithin.raj@nestgroup.net</a>&gt; =
wrote:<br>
<br>
</div>
<blockquote type=3D"cite">
<div>


<div>
<p class=3D"MsoNormal">Hi,<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<p class=3D"MsoNormal">I am trying to build the yocto based meta-ivi (5.0),=
 meta-ti for Pandaboard.<u></u><u></u></p>
<p class=3D"MsoNormal"><span style>For building=A0 I used the below procedu=
re<u></u><u></u></span></p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<p class=3D"MsoNormal">1) git clone git://<a href=3D"http://git.yoctoprojec=
t.org/poky" target=3D"_blank">git.yoctoproject.org/poky</a><u></u><u></u></=
p>
<p class=3D"MsoNormal">=A0=A0 cd poky<u></u><u></u></p>
<p class=3D"MsoNormal">=A0=A0 git checkout dora<u></u><u></u></p>
<p class=3D"MsoNormal">=A0=A0 cd -<u></u><u></u></p>
<p class=3D"MsoNormal">2) git clone git://<a href=3D"http://git.yoctoprojec=
t.org/meta-ivi" target=3D"_blank">git.yoctoproject.org/meta-ivi</a><u></u><=
u></u></p>
<p class=3D"MsoNormal">=A0=A0 cd meta-ivi<u></u><u></u></p>
<p class=3D"MsoNormal">=A0=A0 git checkout 5.0<u></u><u></u></p>
<p class=3D"MsoNormal">=A0=A0 cd -<u></u><u></u></p>
<p class=3D"MsoNormal">3) git clone git://<a href=3D"http://git.yoctoprojec=
t.org/meta-ti" target=3D"_blank">git.yoctoproject.org/meta-ti</a><u></u><u>=
</u></p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<p class=3D"MsoNormal">4) source poky/oe-init-build-env<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<p class=3D"MsoNormal">5) modified the bblayer.conf like this.<u></u><u></u=
></p>
<p class=3D"MsoNormal">=A0=A0=A0 BBLAYERS ?=3D &quot; \<u></u><u></u></p>
<p class=3D"MsoNormal">=A0=A0=A0=A0 /home/sfm/yocto/building/poky/meta \<u>=
</u><u></u></p>
<p class=3D"MsoNormal">=A0=A0=A0=A0 /home/sfm/yocto/building/poky/meta-yoct=
o \<u></u><u></u></p>
<p class=3D"MsoNormal">=A0=A0=A0=A0 /home/sfm/yocto/building/meta-ivi \<u><=
/u><u></u></p>
<p class=3D"MsoNormal">=A0=A0=A0=A0 /home/sfm/yocto/building/meta-ti \<u></=
u><u></u></p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<p class=3D"MsoNormal">6) modified the local.config with <u></u><u></u></p>
<p class=3D"MsoNormal">=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 MACHIN=
E?=3Dpandaboard<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<p class=3D"MsoNormal">7) Add INCOMPATIBLE_LICENSE =3D &quot;GPLv3&quot; in=
 COREBASE/build/conf/local.conf file.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<p class=3D"MsoNormal">8) Set DISTRO ?=3D &quot;poky-ivi-systemd&quot; in C=
OREBASE/build/conf/local.conf file.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<p class=3D"MsoNormal">9) bitbake gemini-image<u></u><u></u></p>
<p class=3D"MsoNormal"><span style=3D"color:rgb(31,73,125)"><u></u>=A0<u></=
u></span></p>
<p class=3D"MsoNormal"><span style>Once all the generated files are copied =
to the SD card I switched on the pandaboard es.<u></u><u></u></span></p>
<p class=3D"MsoNormal">The pandaboard es is hanging while its loading the k=
ernel. Please find log here:</p>
</div>
</div>
</blockquote>
<div><br>
</div>
</div></div><div>Please also see if core-minimal and sato images are bootin=
g. There isn&#39;t much active work happening on panda board and so could y=
ou check if a
<a href=3D"http://kernel.org" target=3D"_blank">kernel.org</a> is booting f=
ine?</div><div><div class=3D"h5">
<div><br>
</div>
<br>
<blockquote type=3D"cite">
<div>
<div>
<p class=3D"MsoNormal"><u></u><u></u></p>
<p class=3D"MsoNormal">=A0<u></u><u></u></p>
<p class=3D"MsoNormal"><b>U-Boot SPL 2011.12 (Nov 05 2013 - 14:12:29)</b><u=
></u><u></u></p>
<p class=3D"MsoNormal"><b>Texas Instruments OMAP4460 ES1.1=A0=A0=A0=A0=A0=
=A0=A0 </b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>OMAP SD/MMC: 0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 </b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>reading u-boot.img=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 </b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>reading u-boot.img</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>=A0</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>=A0</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>U-Boot 2011.12 (Nov 05 2013 - 14:12:29)</b><u></u=
><u></u></p>
<p class=3D"MsoNormal"><b>=A0</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>CPU=A0 : OMAP4460 ES1.1</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>Board: OMAP4 Panda</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>I2C:=A0=A0 ready</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>DRAM:=A0 1 GiB</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>MMC:=A0=A0 OMAP SD/MMC: 0</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>Using default environment</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>=A0</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>In:=A0=A0=A0 serial</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>Out:=A0=A0 serial</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>Err:=A0=A0 serial</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>Hit any key to stop autoboot:=A0 0 </b><u></u><u>=
</u></p>
<p class=3D"MsoNormal"><b>reading boot.scr</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>=A0</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>338 bytes read</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>Running bootscript from mmc0 ...</b><u></u><u></u=
></p>
<p class=3D"MsoNormal"><b>## Executing script at 82000000</b><u></u><u></u>=
</p>
<p class=3D"MsoNormal"><b>reading uImage</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>=A0</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>4333848 bytes read</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>## Booting kernel from Legacy Image at 80000000 .=
..</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>=A0=A0 Image Name:=A0=A0 Linux-3.4.11</b><u></u><=
u></u></p>
<p class=3D"MsoNormal"><b>=A0=A0 Image Type:=A0=A0 ARM Linux Kernel Image (=
uncompressed)</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>=A0=A0 Data Size:=A0=A0=A0 4333784 Bytes =3D 4.1 =
MiB</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>=A0=A0 Load Address: 80008000</b><u></u><u></u></=
p>
<p class=3D"MsoNormal"><b>=A0=A0 Entry Point:=A0 80008000</b><u></u><u></u>=
</p>
<p class=3D"MsoNormal"><b>=A0=A0 Verifying Checksum ... OK</b><u></u><u></u=
></p>
<p class=3D"MsoNormal"><b>=A0=A0 Loading Kernel Image ... OK</b><u></u><u><=
/u></p>
<p class=3D"MsoNormal"><b>OK</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>=A0</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>Starting kernel ...</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>=A0</b><u></u><u></u></p>
<p class=3D"MsoNormal"><b>Uncompressing Linux... done, booting the kernel.<=
/b><u></u><u></u></p>
<p class=3D"MsoNormal">=A0<u></u><u></u></p>
<p class=3D"MsoNormal">After this nothing is displayed.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<p class=3D"MsoNormal">I have few doubts in this procedure.<u></u><u></u></=
p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<p><span>1)<span style=3D"font:7pt &quot;Times New Roman&quot;">=A0=A0=A0=
=A0=A0
</span></span><b>which branch of meta-ti I have to use for dora branch</b>?=
 (currently am using the master branch).</p>
</div>
</div>
</blockquote>
<div><br>
</div>
</div></div><div>Master should be fine for Dora. Please also checkout the s=
pecific commits from poky as mentioned in meta-ivi.</div>
<blockquote type=3D"cite">
<div>
<div>
<p><u></u><u></u></p>
<p><span>2)<span style=3D"font:7pt &quot;Times New Roman&quot;">=A0=A0=A0=
=A0=A0
</span></span><b>Do the master branch will work with all the poky branches<=
/b> (like dora, dylan?</p>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>There should be Dylan branch on meta-ti that you can checkout.</div><d=
iv class=3D"im">
<div><br>
</div>
<blockquote type=3D"cite">
<div>
<div>
<p><u></u><u></u></p>
<p class=3D"MsoNormal">=A0=A0=A0=A0=A0=A0=A03) =A0=A0=A0<b>Do I need to do =
any other modification in any file to work with pandaboard</b>?.</p>
</div>
</div>
</blockquote>
<div><br>
</div>
</div><div>I haven&#39;t tried panda recently but I could try it out early =
next week and respond.=A0</div><div class=3D"im">
<blockquote type=3D"cite">
<div>
<div>
<p class=3D"MsoNormal"><u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<p class=3D"MsoNormal">Thanks in advance.<u></u><u></u></p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<p class=3D"MsoNormal"><b><span style>Thanks &amp; regards<u></u><u></u></s=
pan></b></p>
<p class=3D"MsoNormal"><b><span style>Jithin Raj<u></u><u></u></span></b></=
p>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>=A0</div>
***** Confidentiality Statement/Disclaimer *****<br>
<br>
This message and any attachments is intended for the sole use of the intend=
ed recipient. It may contain confidential information. Any unauthorized use=
, dissemination or modification is strictly prohibited. If you are not the =
intended recipient, please notify
 the sender immediately then delete it from all your systems, and do not co=
py, use or print. Internet communications are not secure and it is the resp=
onsibility of the recipient to make sure that it is virus/malicious code ex=
empt.<br>

The company/sender cannot be responsible for any unauthorized alterations o=
r modifications made to the contents. If you require any form of confirmati=
on of the contents, please contact the company/sender. The company/sender i=
s not liable for any errors or omissions
 in the content of this message.<br>
</div>
</blockquote>
</div><blockquote type=3D"cite">
<div><span>_______________________________________________</span><br>
<span>meta-ti mailing list</span><br>
<span><a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti=
@yoctoproject.org</a></span><br>
<span><a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D=
"_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a></span><br>
</div>
</blockquote>
</div>

<br>_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.org/listinfo/meta-ti</a><br>
<br></blockquote></div><br><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><d=
iv><div><span><font color=3D"#888888">Baptiste DURAND<br></font></span></di=
v></div><br></div>
</div></div>

--e89a8f6479d1b99ac204ea821733--
