Return-Path: <rstreif@linuxfoundation.org>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6B823E0161F
	for <meta-ti@yoctoproject.org>; Fri,  4 Oct 2013 10:29:23 -0700 (PDT)
Received: by mail-ee0-f45.google.com with SMTP id c50so1956017eek.4
	for <meta-ti@yoctoproject.org>; Fri, 04 Oct 2013 10:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MokmuGAlHB5GJNT8mI4lGfuWusj96QJzMrsSVyCx/58=;
	b=gzBV5wfFL2QYo/N7NrMasIP47JgOqEKRkvVlz925jlwLmPZPMrbINgSYv7YdnnkHTG
	yBC+j7ocir5TryYMfXR1ZDuEt2pCVZSbL2PWhC/RylehBy54QbQ7WalH+dHPEUDs0Lpy
	2PnRvWmoUr0/MRe7GpO90qZIrcFQ4xER3C0L4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=MokmuGAlHB5GJNT8mI4lGfuWusj96QJzMrsSVyCx/58=;
	b=nGO0bM2aRaEOUjMWuw3WK5pHZ2HXzc/jqjFBdMLu2Oov3Spu593iTH+QmF57sQuTCO
	mN7o50VlncFKzKI5em/3UwTPaKlfbGKbwD1ErNPlzgLQXuaTJotUxUnYxwkz/IwBuq9E
	2DcrfbrDSwDN6s1wypUBNtg2x0yXxkILVziGel14EySrI994Ll4rtHMU3AGiMWySORYA
	n+zhnDRwPe2Ncz3Gs2rUie7mXp2u8WaIXRnOTfYiunwkkPfYtLRxQXuptPWbSP3eA+VI
	BjF4+EtcS1tXzx+mfSQxbqe6o/UWmtC1IclLqe0rPSMuM2CbIE+J/rHdhIow/3wyx1mj
	ZsKw==
X-Gm-Message-State: ALoCoQljSOVVw2/H+W6yoMPn751YEUGruK80i2a69PgepZU9gu9BBh/FqsqT+L9XU5Uz2Qo1P0Is
MIME-Version: 1.0
X-Received: by 10.14.37.4 with SMTP id x4mr23493262eea.16.1380907761972; Fri,
	04 Oct 2013 10:29:21 -0700 (PDT)
Received: by 10.223.131.3 with HTTP; Fri, 4 Oct 2013 10:29:21 -0700 (PDT)
In-Reply-To: <20131004053354.GB2673@edge>
References: <CA+gsK-r2ve9es_X1OAOp5jd5w-zWzqWUBNxH0AhkvW55uGwM2A@mail.gmail.com>
	<20131004053354.GB2673@edge>
Date: Fri, 4 Oct 2013 10:29:21 -0700
Message-ID: <CA+gsK-o6a6SbQnq9T2derscYRJ+8gS=4COTkeeP+TRjbFDkT9g@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: Denys Dmytriyenko <denys@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: Buidling for am335x_evm
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
X-List-Received-Date: Fri, 04 Oct 2013 17:29:25 -0000
Content-Type: multipart/alternative; boundary=001a11c391989eea5c04e7eda40f

--001a11c391989eea5c04e7eda40f
Content-Type: text/plain; charset=ISO-8859-1

Hi Denys,

Thanks for your feedback.


It should be dash in there, not underscore. Although it gets converted
> internally anyway...
>
> Yes, of course that was only a typo in the e-mail.


>
> Most likely u-boot couldn't find your DTB - did you put one in the /boot of
> rootfs? Didn't u-boot complain about it? Should have been an error message.
>
> That is a question that I forgot to ask in my first e-mail. With 3.12 I
would have expected a dtb to be built but it did not. The tmp/deploy/images
directory only contains [1] but no dtb. Neither does the tar.gz for the
rootfs but I would not expect it to. And no, u-boot did not complain about
the device tree either. If it had built a dtb I would have put it in the
FAT boot partition and told u-boot to load it in the bootargs.


> BTW, if you are not comfortable with 3.12-rc being unstable, you can also
> add
> to your config:
>
> PREFERRED_VERSION_linux-ti-staging = "3.8%"
>
> Yes, of course. I am ok with 3.12-rc. I was only surprised that the Dylan
branch of the bsp layer would build a 3.12 kernel while the default for
Poky Dylan is 3.8. Or maybe my assumption that a bsp for a particular YP
release would use the same kernel as a default is incorrect.


> It's called OMAP2+ and that's how kernel folks decided to call a
> consolidated
> config for most if not all TI platforms. Gone are the times when each
> platform
> had it's own config file - kernel folks don't allow that anymore. Anyway,
> omap2plus is the right defconfig.
>
> That's actually a great thing. (One of Linus' pet peeves, I suppose.) I
only wish the name of the file would be more intuitive. It's not quite
obvious that a file called omap2plus_defconfig is the correct file to
configure a kernel for an AM335x CPU. A different file name and/or a
comment in the file to what CPU's it applies would have been great.


>
> >       1. Check arm/arch/tools/mach-types: found:
> >       tam335x                 MACH_TAM335X            TAM335X
> >         4116
> >       Expected to find
> >       am335xevm               MACH_AM335XEVM          AM335XEVM
> >         3589 as it was for the 3.2.32 kernel.
>
> I'm not sure what you are looking for, but there are many differences
> between
> 3.2, 3.8 and 3.12
>
> I was looking for matching machine IDs in the u-boot configuration and the
kernel configuration. But that of course does not apply anymore with a
device tree. But I was thrown off by the fact that the kernel recipe did
not create a device tree. And that I still have to debug.


> >       2. Check arm/arch/configs for am335x_evm_defconfig which does not
> >       exist. Expected to see an am335x_evm_defconfig as found it in a
> 3.2.32
> >       kernel.
>
> See above - you won't find it any more, as it's not allowed any more by
> kernel
> policies to have million different defconfigs. As you can see, the entire
> arch/arm/configs directory is very scarce these days - all omaps were
> consolidated and new SOCs are added to existing defconfigs, where
> applicable.
>
> Thanks. I understand that now but a different file name and a comment
would have made it obvious. Yes, the settings are in the file


>
> >    5. Checking u-boot build environment which uses, as expected, the
> >    am335c_evm configuration which sets the machine type to 3589.
> >
> > I may be missing something but it looks to me as if the layer is broken
> for
> > building for the AM335X_EVM target machine.
>
> No, it's not broken, it's just quite different from 3.2 days.
>
>
Probably not in general but maybe on my system because I am missing the DTB
for whatever reason.


Thanks,
Rudi



[1]

core-image-minimal-am335x-evm-20131003152950.rootfs.tar.gz
core-image-minimal-am335x-evm-20131003152950.rootfs.ubi
core-image-minimal-am335x-evm-20131003152950.rootfs.ubifs
core-image-minimal-am335x-evm.tar.gz
core-image-minimal-am335x-evm.ubi
MLO
MLO-am335x-evm
MLO-am335x-evm-2013.07+2013.10-rc2-r0+gitrAUTOINC+fb18fa95a14ae875ef0a5421cd9fecc00c7c3a4c
modules--3.11+3.12-rc3-r19a+gitrAUTOINC+f7579525de9f1d6086c407a6980f4f1c1c574256-am335x-evm-20131003152950.tgz
README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt
rootfs
u-boot-am335x-evm-2013.07+2013.10-rc2-r0+gitrAUTOINC+fb18fa95a14ae875ef0a5421cd9fecc00c7c3a4c.img
u-boot-am335x-evm.img
u-boot.img
u-boot-spl.bin
u-boot-spl.bin-am335x-evm
u-boot-spl.bin-am335x-evm-2013.07+2013.10-rc2-r0+gitrAUTOINC+fb18fa95a14ae875ef0a5421cd9fecc00c7c3a4c
uImage
uImage--3.11+3.12-rc3-r19a+gitrAUTOINC+f7579525de9f1d6086c407a6980f4f1c1c574256-am335x-evm-20131003152950.bin
uImage-am335x-evm.bin

--001a11c391989eea5c04e7eda40f
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Denys,<div><br></div><div>Thanks for your feedback.</di=
v><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote"><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:=
1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left=
:1ex">

It should be dash in there, not underscore. Although it gets converted<br>
internally anyway...<br>
<br></blockquote><div>Yes, of course that was only a typo in the e-mail.</d=
iv><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-l=
eft-style:solid;padding-left:1ex">
<div class=3D"im"><br>
</div>Most likely u-boot couldn&#39;t find your DTB - did you put one in th=
e /boot of<br>
rootfs? Didn&#39;t u-boot complain about it? Should have been an error mess=
age.<br>
<br></blockquote><div>That is a question that I forgot to ask in my first e=
-mail. With 3.12 I would have expected a dtb to be built but it did not. Th=
e tmp/deploy/images directory only contains [1] but no dtb. Neither does th=
e tar.gz for the rootfs but I would not expect it to. And no, u-boot did no=
t complain about the device tree either. If it had built a dtb I would have=
 put it in the FAT boot partition and told u-boot to load it in the bootarg=
s.</div>
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex"><div class=3D"im"><br>
</div>BTW, if you are not comfortable with 3.12-rc being unstable, you can =
also add<br>
to your config:<br>
<br>
PREFERRED_VERSION_linux-ti-staging =3D &quot;3.8%&quot;<br>
<br></blockquote><div>Yes, of course. I am ok with 3.12-rc. I was only surp=
rised that the Dylan branch of the bsp layer would build a 3.12 kernel whil=
e the default for Poky Dylan is 3.8. Or maybe my assumption that a bsp for =
a particular YP release would use the same kernel as a default is incorrect=
.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex">It&#39;s called OMAP2+ and that&#39;s how ke=
rnel folks decided to call a consolidated<br>

config for most if not all TI platforms. Gone are the times when each platf=
orm<br>
had it&#39;s own config file - kernel folks don&#39;t allow that anymore. A=
nyway,<br>
omap2plus is the right defconfig.<br>
<br></blockquote><div>That&#39;s actually a great thing. (One of Linus&#39;=
 pet peeves, I suppose.) I only wish the name of the file would be more int=
uitive. It&#39;s not quite obvious that a file called omap2plus_defconfig i=
s the correct file to configure a kernel for an AM335x CPU. A different fil=
e name and/or a comment in the file to what CPU&#39;s it applies would have=
 been great.</div>
<div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><br>
&gt; =A0 =A0 =A0 1. Check arm/arch/tools/mach-types: found:<br>
<div class=3D"im">&gt; =A0 =A0 =A0 tam335x =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
MACH_TAM335X =A0 =A0 =A0 =A0 =A0 =A0TAM335X<br>
&gt; =A0 =A0 =A0 =A0 4116<br>
&gt; =A0 =A0 =A0 Expected to find<br>
&gt; =A0 =A0 =A0 am335xevm =A0 =A0 =A0 =A0 =A0 =A0 =A0 MACH_AM335XEVM =A0 =
=A0 =A0 =A0 =A0AM335XEVM<br>
&gt; =A0 =A0 =A0 =A0 3589 as it was for the 3.2.32 kernel.<br>
<br>
</div>I&#39;m not sure what you are looking for, but there are many differe=
nces between<br>
3.2, 3.8 and 3.12<br>
<br></blockquote><div>I was looking for matching machine IDs in the u-boot =
configuration and the kernel configuration. But that of course does not app=
ly anymore with a device tree. But I was thrown off by the fact that the ke=
rnel recipe did not create a device tree. And that I still have to debug.</=
div>
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-lef=
t-style:solid;padding-left:1ex">
<br>
&gt; =A0 =A0 =A0 2. Check arm/arch/configs for am335x_evm_defconfig which d=
oes not<br>
<div class=3D"im">&gt; =A0 =A0 =A0 exist. Expected to see an am335x_evm_def=
config as found it in a 3.2.32<br>
&gt; =A0 =A0 =A0 kernel.<br>
<br>
</div>See above - you won&#39;t find it any more, as it&#39;s not allowed a=
ny more by kernel<br>
policies to have million different defconfigs. As you can see, the entire<b=
r>
arch/arm/configs directory is very scarce these days - all omaps were<br>
consolidated and new SOCs are added to existing defconfigs, where applicabl=
e.<br>
<br></blockquote><div>Thanks. I understand that now but a different file na=
me and a comment would have made it obvious. Yes, the settings are in the f=
ile</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);bo=
rder-left-style:solid;padding-left:1ex">

<br>
&gt; =A0 =A05. Checking u-boot build environment which uses, as expected, t=
he<br>
<div class=3D"im">&gt; =A0 =A0am335c_evm configuration which sets the machi=
ne type to 3589.<br>
&gt;<br>
&gt; I may be missing something but it looks to me as if the layer is broke=
n for<br>
&gt; building for the AM335X_EVM target machine.<br>
<br>
</div>No, it&#39;s not broken, it&#39;s just quite different from 3.2 days.=
<br>
<span class=3D""><font color=3D"#888888"><br></font></span></blockquote><di=
v><br></div><div>Probably not in general but maybe on my system because I a=
m missing the DTB for whatever reason.</div><div><br></div><div><br></div>
<div>Thanks,</div><div>Rudi</div><div><br></div></div><br clear=3D"all"><di=
v dir=3D"ltr"><div><font face=3D"garamond, serif"><span style=3D"border-col=
lapse:collapse;color:rgb(102,102,102);font-family:arial,sans-serif;font-siz=
e:13px"><br>
</span></font></div><div><font face=3D"garamond, serif"><span style=3D"bord=
er-collapse:collapse;color:rgb(102,102,102);font-family:arial,sans-serif;fo=
nt-size:13px">[1]</span></font></div><div><font face=3D"garamond, serif"><s=
pan style=3D"border-collapse:collapse;color:rgb(102,102,102);font-family:ar=
ial,sans-serif;font-size:13px"><br>
</span></font></div><div><font face=3D"garamond, serif"><span style=3D"bord=
er-collapse:collapse;color:rgb(102,102,102);font-family:arial,sans-serif;fo=
nt-size:13px"><div>core-image-minimal-am335x-evm-20131003152950.rootfs.tar.=
gz</div>
<div>core-image-minimal-am335x-evm-20131003152950.rootfs.ubi</div><div>core=
-image-minimal-am335x-evm-20131003152950.rootfs.ubifs</div><div>core-image-=
minimal-am335x-evm.tar.gz</div><div>core-image-minimal-am335x-evm.ubi</div>
<div>MLO</div><div>MLO-am335x-evm</div><div>MLO-am335x-evm-2013.07+2013.10-=
rc2-r0+gitrAUTOINC+fb18fa95a14ae875ef0a5421cd9fecc00c7c3a4c</div><div>modul=
es--3.11+3.12-rc3-r19a+gitrAUTOINC+f7579525de9f1d6086c407a6980f4f1c1c574256=
-am335x-evm-20131003152950.tgz</div>
<div>README_-_DO_NOT_DELETE_FILES_IN_THIS_DIRECTORY.txt</div><div>rootfs</d=
iv><div>u-boot-am335x-evm-2013.07+2013.10-rc2-r0+gitrAUTOINC+fb18fa95a14ae8=
75ef0a5421cd9fecc00c7c3a4c.img</div><div>u-boot-am335x-evm.img</div><div>
u-boot.img</div><div>u-boot-spl.bin</div><div>u-boot-spl.bin-am335x-evm</di=
v><div>u-boot-spl.bin-am335x-evm-2013.07+2013.10-rc2-r0+gitrAUTOINC+fb18fa9=
5a14ae875ef0a5421cd9fecc00c7c3a4c</div><div>uImage</div><div>uImage--3.11+3=
.12-rc3-r19a+gitrAUTOINC+f7579525de9f1d6086c407a6980f4f1c1c574256-am335x-ev=
m-20131003152950.bin</div>
<div>uImage-am335x-evm.bin</div><div><br></div></span></font></div></div>
</div></div>

--001a11c391989eea5c04e7eda40f--
