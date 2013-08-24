Return-Path: <bmentink@gmail.com>
Received: from mail-ie0-f174.google.com (mail-ie0-f174.google.com
	[209.85.223.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2DEF4E003FA
	for <meta-ti@yoctoproject.org>; Fri, 23 Aug 2013 21:18:46 -0700 (PDT)
Received: by mail-ie0-f174.google.com with SMTP id k14so2130417iea.33
	for <meta-ti@yoctoproject.org>; Fri, 23 Aug 2013 21:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=jAgh8bBl/+F2kEXZssvCqLDudrifgGRHXl5LnwHNY68=;
	b=NM4svUgEeQo6PRMuL6o6ACtXSL8tiFwEUc72CULkdZ85IXuRgmLm8FiR5aY3j1L7RA
	H1tXvfWyNvox7U8b7Y60EFokYCo8Wd96pVwV69ALaNa8MfYaIqs7fatU3CLGel4iz+zm
	fvenFA8Beh/Re8HuzZyxqxyfEy3U74gJyoRqyoWba2dE3hKnLW8xJqm4Lx7X30O4K97k
	I3GnqKbvLUaUb+ReopCy7hUmvoTAe8sMqfhmpMmAqW7+9/Y6xjlnJbVG9JXSvDCgrprN
	uRqDvnC5fDbwgr6VmUqNUiwTEAFHgJt75T1LlZDpuHIVfer/hfS9emEEIME2cBVBPRoA
	OGWA==
MIME-Version: 1.0
X-Received: by 10.50.33.38 with SMTP id o6mr237428igi.52.1377317925657; Fri,
	23 Aug 2013 21:18:45 -0700 (PDT)
Received: by 10.43.83.9 with HTTP; Fri, 23 Aug 2013 21:18:45 -0700 (PDT)
In-Reply-To: <CALEed8bNfb_TDu-FmJNJh2B0vsWpxSZDOg7Bh7XjAV1nNwSg_Q@mail.gmail.com>
References: <CALEed8Ywhz3PEPEGePauXhC6b_-ahzHZSQ+BgJqk+rQMe2yDYQ@mail.gmail.com>
	<f2e868fa60b04b63b9557b8d6d4d972c@CO1PR06MB047.namprd06.prod.outlook.com>
	<CALEed8bNfb_TDu-FmJNJh2B0vsWpxSZDOg7Bh7XjAV1nNwSg_Q@mail.gmail.com>
Date: Sat, 24 Aug 2013 16:18:45 +1200
Message-ID: <CALEed8ZuF=_Omc7Nnrp4zGCYdK_brBZjTSmKFbWh06QnKEmXDg@mail.gmail.com>
From: Bernard Mentink <bmentink@gmail.com>
To: meta-ti@yoctoproject.org
Subject: Cannot boot beaglebone image
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
X-List-Received-Date: Sat, 24 Aug 2013 04:18:47 -0000
Content-Type: multipart/alternative; boundary=089e01537f20b3a2c204e4a9d13e

--089e01537f20b3a2c204e4a9d13e
Content-Type: text/plain; charset=ISO-8859-1

Hi Guys,

Thanks for all the helpful comments .... I did see in several places that
meta-ti had several bugs relating to beaglebone support so have ditched
that layer in preference
for the meta-beagleboard layer and the meta-pansenti layer as described in
the pansenti guide for installing. Now, everything works as intended..

.. and I don't need to remove the MLO from the eMMC drive, as when the chip
sees a valid boot partition on the SD card it boots that 1st.
So having to remove the MLO  is not a factual statement ..

Anyhow, I now have a minimal booting image with my own layer and all the
extra packages in it .. even built my own hello world app and module and
had them installed in the
correct places ... and ... even got application debugging going with
eclipse (latest) and the yocto plugin ... so am very happy. :)

I also did a kernel hack and added the patch to my layer ... all works very
well.

Now, I have to find out how I do kernel driver debugging in eclipse and I
will have everything I need..

Regards,
B.


On Sat, Aug 24, 2013 at 7:40 AM, Michael Donahoe <
michael.donahoe@systematicgroup.com> wrote:

>  Beagle bone black will be looking for am335x-boneblack.dtb not having
> this file in place will cause the symptoms you are describing.****
>
> ** **
>
> ** **
>
> *From:* meta-ti-bounces@yoctoproject.org [mailto:
> meta-ti-bounces@yoctoproject.org] *On Behalf Of *Bernard Mentink
> *Sent:* Wednesday, August 07, 2013 5:58 PM
> *To:* meta-ti@yoctoproject.org
> *Subject:* [meta-ti] Cannot boot beaglebone image****
>
> ** **
>
> Hi There,****
>
> ** **
>
> Very new to Yocto and the Ti BSP so be nice ;-)****
>
> ** **
>
> I have built the minimal image and created an SD card with the boot and
> rootfs partitions ..****
>
> ** **
>
> I have copied MLO (first), u-boot.img, am335x-bone.dtb, u-boot-spl.bin and
> uImage to the "boot" partition.****
>
> (I am not sure if the am33xx file or the spl file is necessary ..)****
>
> I have un-tar'ed the root filesystem to the "rootfs" partition.****
>
> ** **
>
> However when I boot this card, all I see on the beaglebone black is 4
> lights on continuous .. ****
>
> There is no serial port over USB to see what is going on, and no ethernet
> device shows up, even after including dropbear in the image ..****
>
> ** **
>
> I am at a loss ... there is no "standard" serial port to see if u-boot is
> coming up at all ..****
>
> ** **
>
> By the way, to sucessfully build meta-ti, I had to add the following line
> to my local.conf   ..****
>
> BBMASK ?= ".*/meta-ti/recipes-(misc|bsp/formfactor|graphics/mesa)/"****
>
> ** **
>
> ... if I did not do that, the build failed with all the Angstom licencing
> rubbish (it should not be in there .... I want a "distro-less" build  ;)**
> **
>
> ** **
>
> Any help much appreciated.****
>
> ** **
>
> Cheers,****
>
> Bernie****
>

--089e01537f20b3a2c204e4a9d13e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_quote"><br><br><div dir=3D"ltr">Hi=
 Guys,<div><br></div><div>Thanks for all the helpful comments .... I did se=
e in several places that meta-ti had several bugs relating to beaglebone su=
pport so have ditched that layer in preference</div>
<div>
for the meta-beagleboard layer and the meta-pansenti layer as described in =
the pansenti guide for installing. Now, everything works as intended..</div=
><div><br></div><div>.. and I don&#39;t need to remove the MLO from the eMM=
C drive, as when the chip sees a valid boot partition on the SD card it boo=
ts that 1st.</div>

<div>So having to remove the MLO =A0is not a factual statement ..<br><br></=
div><div>Anyhow, I now have a minimal booting image with my own layer and a=
ll the extra packages in it .. even built my own hello world app and module=
 and had them installed in the=A0</div>

<div>correct places ... and ... even got application debugging going with e=
clipse (latest) and the yocto plugin ... so am very happy. :)</div><div><br=
></div><div>I also did a kernel hack and added the patch to my layer ... al=
l works very well.</div>

<div><br></div><div>Now, I have to find out how I do kernel driver debuggin=
g in eclipse and I will have everything I need..</div><div><br></div><div>R=
egards,</div><div>B.</div></div><div class=3D"HOEnZb"><div class=3D"h5"><di=
v class=3D"gmail_extra">
<br><br><div class=3D"gmail_quote">
On Sat, Aug 24, 2013 at 7:40 AM, Michael Donahoe <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:michael.donahoe@systematicgroup.com" target=3D"_blank">michae=
l.donahoe@systematicgroup.com</a>&gt;</span> wrote:<br><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex">







<div lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div>
<p>Beagle bone black will be looking for am335x-boneblack.dtb not having th=
is file in place will cause the symptoms you are describing.<u></u><u></u><=
/p>
<p><span style=3D"color:#1f497d"><u></u>=A0<u></u></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1f497d"><u></u>=A0<u></u></span><=
/p>
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> <a href=
=3D"mailto:meta-ti-bounces@yoctoproject.org" target=3D"_blank">meta-ti-boun=
ces@yoctoproject.org</a> [mailto:<a href=3D"mailto:meta-ti-bounces@yoctopro=
ject.org" target=3D"_blank">meta-ti-bounces@yoctoproject.org</a>]
<b>On Behalf Of </b>Bernard Mentink<br>
<b>Sent:</b> Wednesday, August 07, 2013 5:58 PM<br>
<b>To:</b> <a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">me=
ta-ti@yoctoproject.org</a><br>
<b>Subject:</b> [meta-ti] Cannot boot beaglebone image<u></u><u></u></span>=
</p><div><div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
<div>
<p class=3D"MsoNormal">Hi There,<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Very new to Yocto and the Ti BSP so be nice ;-)<u></=
u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I have built the minimal image and created an SD car=
d with the boot and rootfs partitions ..<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I have copied MLO (first), u-boot.img, am335x-bone.d=
tb, u-boot-spl.bin and uImage to the &quot;boot&quot; partition.<u></u><u><=
/u></p>
</div>
<div>
<p class=3D"MsoNormal">(I am not sure if the am33xx file or the spl file is=
 necessary ..)<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I have un-tar&#39;ed the root filesystem to the &quo=
t;rootfs&quot; partition.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">However when I boot this card, all I see on the beag=
lebone black is 4 lights on continuous ..=A0<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">There is no serial port over USB to see what is goin=
g on, and no ethernet device shows up, even after including dropbear in the=
 image ..<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">I am at a loss ... there is no &quot;standard&quot; =
serial port to see if u-boot is coming up at all ..<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">By the way, to sucessfully build meta-ti, I had to a=
dd the following line to my local.conf =A0 ..<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">BBMASK ?=3D &quot;.*/meta-ti/recipes-(misc|bsp/formf=
actor|graphics/mesa)/&quot;<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">... if I did not do that, the build failed with all =
the Angstom licencing rubbish (it should not be in there .... I want a &quo=
t;distro-less&quot; build =A0;)<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Any help much appreciated.<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal"><u></u>=A0<u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Cheers,<u></u><u></u></p>
</div>
<div>
<p class=3D"MsoNormal">Bernie<u></u><u></u></p>
</div>
</div>
</div></div></div>
</div>

</blockquote></div><br></div>
</div></div></div><br></div>

--089e01537f20b3a2c204e4a9d13e--
