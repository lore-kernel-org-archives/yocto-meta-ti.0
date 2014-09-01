Return-Path: <rstreif@linuxfoundation.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AF2C7E0082A; Sun, 31 Aug 2014 21:41:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.223.173 listed in list.dnswl.org]
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44EFAE00821
	for <meta-ti@yoctoproject.org>; Sun, 31 Aug 2014 21:41:36 -0700 (PDT)
Received: by mail-ie0-f173.google.com with SMTP id lx4so5506948iec.4
	for <meta-ti@yoctoproject.org>; Sun, 31 Aug 2014 21:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Y19Q5gPrOye0U9PDyC9V3khXjPXkTwbs+bP7u2YeBc4=;
	b=YNaE6UTV92smDS39WIrGHVg5XSI8QcjPcnfHtRiDUIbriDJw7aiSx6lEuJjJj8jfbg
	F/jYPzugUiDzIl/1eiXPIX0wyw/3UpJegMDvBuI/jFdFXlnn7f6Ese45qq4YrGEZuJkf
	aZ+oYRnUN18N1tnSfRrp4iyW/j2LefxWFsEj0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Y19Q5gPrOye0U9PDyC9V3khXjPXkTwbs+bP7u2YeBc4=;
	b=XIfQzN2P9zqvH5Kr04r1Acai/te5R7MLg+trJpBffq7iJGJ7reuE0GQKcehu/SR7+f
	/H8mrtM/71YPY2qqOelqhmeYYeXvCvuuRV/6xjkRPB3sitCOUIrOfl1gy3RAWtEtTVVk
	ZDx0EteMUynSSQ5oQPrPspfu8hWP+p9X2Hfeg77xSXpE3z17uoNqzjn0UrHezlzzG12Q
	o4HFuqKOfdDVdrOZ5oBqAkM8IlBtaXV9CDBuzaEKcYr0LJkqAXzI71D4bh5EUbJvbIIY
	mP0fPj+2ZODhLZanbLmRkRyYH4fQmEE/B2WJIexVDS+f9lpGLlVuTSyJ4uBgfbCylQrn
	CWDQ==
X-Gm-Message-State: ALoCoQm4klBitFffK6rPYno4Fi1s0SpOj/SvHtd/9Rh0HQse/gwpO/2JtXIHN6mF7johJpNrvlnI
MIME-Version: 1.0
X-Received: by 10.50.41.104 with SMTP id e8mr18577393igl.35.1409546495885;
	Sun, 31 Aug 2014 21:41:35 -0700 (PDT)
Received: by 10.107.149.73 with HTTP; Sun, 31 Aug 2014 21:41:35 -0700 (PDT)
In-Reply-To: <5403809E.3000703@bertux.com>
References: <mailman.3.1409511601.29045.meta-ti@yoctoproject.org>
	<5403809E.3000703@bertux.com>
Date: Sun, 31 Aug 2014 21:41:35 -0700
Message-ID: <CA+gsK-qDoxr2OGk5WUGcJAPJNR5XXXem5U9moqtb2gFgXJKOLw@mail.gmail.com>
From: Rudolf Streif <rstreif@linuxfoundation.org>
To: Fabio Berton <fabio@bertux.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: BeagleBoard C4 with USB
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
X-List-Received-Date: Mon, 01 Sep 2014 04:41:46 -0000
Content-Type: multipart/alternative; boundary=089e01161a262e9eec0501f99efe

--089e01161a262e9eec0501f99efe
Content-Type: text/plain; charset=UTF-8

Thank you, Fabio.

However, that is not the reason. The modules phy_omap_usb2 and
phy_omap_usb3 are built into the kernel but yet the hardware does not seem
to be recognized. That is the case we two different BeagleBoard C4 boards.

:rjs


On Sun, Aug 31, 2014 at 1:07 PM, Fabio Berton <fabio@bertux.com> wrote:

> Try to install the packages bellow:
>
> kernel-modules
> usbutils
>
>
> On 08/31/2014 04:00 PM, meta-ti-request@yoctoproject.org wrote:
>
>> Send meta-ti mailing list submissions to
>>         meta-ti@yoctoproject.org
>>
>> To subscribe or unsubscribe via the World Wide Web, visit
>>         https://lists.yoctoproject.org/listinfo/meta-ti
>> or, via email, send a message with subject or body 'help' to
>>         meta-ti-request@yoctoproject.org
>>
>> You can reach the person managing the list at
>>         meta-ti-owner@yoctoproject.org
>>
>> When replying, please edit your Subject line so it is more specific
>> than "Re: Contents of meta-ti digest..."
>>
>>
>> Today's Topics:
>>
>>     1. [nightly] Distroless meta-ti/master minimal build
>>        2014-08-30_21-00-30 (Denys Dmytriyenko)
>>     2. BeagleBoard C4 with USB (Rudolf Streif)
>>
>>
>> ----------------------------------------------------------------------
>>
>> Message: 1
>> Date: Sat, 30 Aug 2014 21:58:30 -0400
>> From: Denys Dmytriyenko <denys@ti.com>
>> To: <meta-ti@yoctoproject.org>
>> Subject: [meta-ti] [nightly] Distroless meta-ti/master minimal build
>>         2014-08-30_21-00-30
>> Message-ID: <1330147917.535.1409450310755.JavaMail.jenkins@puget>
>> Content-Type: text/plain; charset="us-ascii"
>>
>> An HTML attachment was scrubbed...
>> URL: <http://lists.yoctoproject.org/pipermail/meta-ti/
>> attachments/20140830/406dab3a/attachment-0001.html>
>>
>> ------------------------------
>>
>> Message: 2
>> Date: Sun, 31 Aug 2014 07:48:09 -0700
>> From: Rudolf Streif <rstreif@linuxfoundation.org>
>> To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
>> Subject: [meta-ti] BeagleBoard C4 with USB
>> Message-ID:
>>         <CA+gsK-okuyjWuEp+3bm6++ojWrDfaCPwXtXEOswu7Xikxg8jfA@
>> mail.gmail.com>
>> Content-Type: text/plain; charset="utf-8"
>>
>>
>> I have a BeagleBoard C4 laying around that I want to use for a project
>> that
>> has USB devices connected to it. I built a core-image-base with YP from
>> master and meta-ti from master with this configuration:
>>
>> Build Configuration:
>> BB_VERSION        = "1.23.1"
>> BUILD_SYS         = "x86_64-linux"
>> NATIVELSBSTRING   = "Fedora-18"
>> TARGET_SYS        = "arm-poky-linux-gnueabi"
>> MACHINE           = "beagleboard"
>> DISTRO            = "poky"
>> DISTRO_VERSION    = "1.6+snapshot-20140831"
>> TUNE_FEATURES     = "arm armv7a vfp thumb neon callconvention-hard
>> cortexa8"
>> TARGET_FPU        = "vfp-neon"
>> meta
>> meta-yocto
>> meta-yocto-bsp    = "master:c16795477ea7e2159b5d3808268912b572887e2d"
>> meta-ti           = "master:d2c40099cd219493e4a6d9a6218f88f1b9f3f8fb"
>> meta-oe           = "master:1513d0e31f609ffcde9a116a50bfb0360b9e7ecf"
>>
>> It builds fine. I am installing u-boot, kernel and the device tree on the
>> SSD card.
>>
>> I use this u-boot script to boot the board:
>>
>> setenv bootcmd 'mmc init; fatload mmc 0:1 0x80300000 uImage; fatload mmc
>> 0:1 0x815f0000 beagle.dtb; bootm 0x80300000 - 0x815f0000'
>> setenv bootargs 'console=tty0 console=ttyO2,115200n8 root=/dev/mmcblk0p2
>> rootwait rootfstype=ext3 ro'
>> boot
>>
>> In the above beagle.dtb =  uImage--3.14.8-r0-omap3-beagle-<date>.dtb
>> which
>> I assumed to be the correct one for the C4 because the other dtb created
>> has xM explicitly in its name.
>>
>> The system boots fine but USB is not working. None of the typical USB host
>> controller initialization is in the dmesg output and lsusb responds with
>> 'unable to initialize libsub: -99'.
>>
>> I am not sure if I am doing anything wrong or if there is an actual issue.
>> Help appreciated.
>>
>> Cheers,
>> Rudi
>> -------------- next part --------------
>> An HTML attachment was scrubbed...
>> URL: <http://lists.yoctoproject.org/pipermail/meta-ti/
>> attachments/20140831/fc724dcd/attachment-0001.html>
>>
>> ------------------------------
>>
>>
> --
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
>

--089e01161a262e9eec0501f99efe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you, Fabio.<div><br></div><div>However, that is not =
the reason. The modules phy_omap_usb2 and phy_omap_usb3 are built into the =
kernel but yet the hardware does not seem to be recognized. That is the cas=
e we two different BeagleBoard C4 boards.</div>
<div><br></div><div>:rjs<br><div class=3D"gmail_extra"><br><br><div class=
=3D"gmail_quote">On Sun, Aug 31, 2014 at 1:07 PM, Fabio Berton <span dir=3D=
"ltr">&lt;<a href=3D"mailto:fabio@bertux.com" target=3D"_blank">fabio@bertu=
x.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Try to install the packages bellow:<br>
<br>
kernel-modules<br>
usbutils<br>
<br>
<br>
On 08/31/2014 04:00 PM, <a href=3D"mailto:meta-ti-request@yoctoproject.org"=
 target=3D"_blank">meta-ti-request@yoctoproject.<u></u>org</a> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Send meta-ti mailing list submissions to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:meta-ti@yoctoproject.org" tar=
get=3D"_blank">meta-ti@yoctoproject.org</a><br>
<br>
To subscribe or unsubscribe via the World Wide Web, visit<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://lists.yoctoproject.org/listi=
nfo/meta-ti" target=3D"_blank">https://lists.yoctoproject.<u></u>org/listin=
fo/meta-ti</a><br>
or, via email, send a message with subject or body &#39;help&#39; to<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:meta-ti-request@yoctoproject.=
org" target=3D"_blank">meta-ti-request@yoctoproject.<u></u>org</a><br>
<br>
You can reach the person managing the list at<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"mailto:meta-ti-owner@yoctoproject.or=
g" target=3D"_blank">meta-ti-owner@yoctoproject.org</a><br>
<br>
When replying, please edit your Subject line so it is more specific<br>
than &quot;Re: Contents of meta-ti digest...&quot;<br>
<br>
<br>
Today&#39;s Topics:<br>
<br>
=C2=A0 =C2=A0 1. [nightly] Distroless meta-ti/master minimal build<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A02014-08-30_21-00-30 (Denys Dmytriyenko)<br>
=C2=A0 =C2=A0 2. BeagleBoard C4 with USB (Rudolf Streif)<br>
<br>
<br>
------------------------------<u></u>------------------------------<u></u>-=
---------<br>
<br>
Message: 1<br>
Date: Sat, 30 Aug 2014 21:58:30 -0400<br>
From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com" target=3D"_blan=
k">denys@ti.com</a>&gt;<br>
To: &lt;<a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-=
ti@yoctoproject.org</a>&gt;<br>
Subject: [meta-ti] [nightly] Distroless meta-ti/master minimal build<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 2014-08-30_21-00-30<br>
Message-ID: &lt;1330147917.535.1409450310755.<u></u>JavaMail.jenkins@puget&=
gt;<br>
Content-Type: text/plain; charset=3D&quot;us-ascii&quot;<br>
<br>
An HTML attachment was scrubbed...<br>
URL: &lt;<a href=3D"http://lists.yoctoproject.org/pipermail/meta-ti/attachm=
ents/20140830/406dab3a/attachment-0001.html" target=3D"_blank">http://lists=
.yoctoproject.<u></u>org/pipermail/meta-ti/<u></u>attachments/20140830/406d=
ab3a/<u></u>attachment-0001.html</a>&gt;<br>

<br>
------------------------------<br>
<br>
Message: 2<br>
Date: Sun, 31 Aug 2014 07:48:09 -0700<br>
From: Rudolf Streif &lt;<a href=3D"mailto:rstreif@linuxfoundation.org" targ=
et=3D"_blank">rstreif@linuxfoundation.org</a>&gt;<br>
To: &quot;<a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">met=
a-ti@yoctoproject.org</a>&quot; &lt;<a href=3D"mailto:meta-ti@yoctoproject.=
org" target=3D"_blank">meta-ti@yoctoproject.org</a>&gt;<br>
Subject: [meta-ti] BeagleBoard C4 with USB<br>
Message-ID:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;<a href=3D"mailto:CA%2BgsK-okuyjWuEp%2B3bm6=
%2B%2BojWrDfaCPwXtXEOswu7Xikxg8jfA@mail.gmail.com" target=3D"_blank">CA+gsK=
-okuyjWuEp+3bm6++<u></u>ojWrDfaCPwXtXEOswu7Xikxg8jfA@<u></u>mail.gmail.com<=
/a>&gt;<br>
Content-Type: text/plain; charset=3D&quot;utf-8&quot;<div><div class=3D"h5"=
><br>
<br>
I have a BeagleBoard C4 laying around that I want to use for a project that=
<br>
has USB devices connected to it. I built a core-image-base with YP from<br>
master and meta-ti from master with this configuration:<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.23.1&quot;<br>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0=3D &quot;Fedora-18&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm-poky-linux-gnueabi&quot=
;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;beagleboard&quot;=
<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;poky&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;1.6+snapshot-20140831&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;arm armv7a vfp thumb neon callco=
nvention-hard cortexa8&quot;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;vfp-neon&quot;<br>
meta<br>
meta-yocto<br>
meta-yocto-bsp=C2=A0 =C2=A0 =3D &quot;master:<u></u>c16795477ea7e2159b5d380=
8268912<u></u>b572887e2d&quot;<br>
meta-ti=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;master:<u></u>d2c=
40099cd219493e4a6d9a6218f88<u></u>f1b9f3f8fb&quot;<br>
meta-oe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;master:<u></u>151=
3d0e31f609ffcde9a116a50bfb0<u></u>360b9e7ecf&quot;<br>
<br>
It builds fine. I am installing u-boot, kernel and the device tree on the<b=
r>
SSD card.<br>
<br>
I use this u-boot script to boot the board:<br>
<br>
setenv bootcmd &#39;mmc init; fatload mmc 0:1 0x80300000 uImage; fatload mm=
c<br>
0:1 0x815f0000 beagle.dtb; bootm 0x80300000 - 0x815f0000&#39;<br>
setenv bootargs &#39;console=3Dtty0 console=3DttyO2,115200n8 root=3D/dev/mm=
cblk0p2<br>
rootwait rootfstype=3Dext3 ro&#39;<br>
boot<br>
<br>
In the above beagle.dtb =3D=C2=A0 uImage--3.14.8-r0-omap3-<u></u>beagle-&lt=
;date&gt;.dtb which<br>
I assumed to be the correct one for the C4 because the other dtb created<br=
>
has xM explicitly in its name.<br>
<br>
The system boots fine but USB is not working. None of the typical USB host<=
br>
controller initialization is in the dmesg output and lsusb responds with<br=
>
&#39;unable to initialize libsub: -99&#39;.<br>
<br>
I am not sure if I am doing anything wrong or if there is an actual issue.<=
br>
Help appreciated.<br>
<br>
Cheers,<br>
Rudi<br></div></div>
-------------- next part --------------<br>
An HTML attachment was scrubbed...<br>
URL: &lt;<a href=3D"http://lists.yoctoproject.org/pipermail/meta-ti/attachm=
ents/20140831/fc724dcd/attachment-0001.html" target=3D"_blank">http://lists=
.yoctoproject.<u></u>org/pipermail/meta-ti/<u></u>attachments/20140831/fc72=
4dcd/<u></u>attachment-0001.html</a>&gt;<br>

<br>
------------------------------<br>
<br><span class=3D"HOEnZb"><font color=3D"#888888">
</font></span></blockquote><span class=3D"HOEnZb"><font color=3D"#888888">
<br>
-- <br>
______________________________<u></u>_________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org" target=3D"_blank">meta-ti@yocto=
project.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blan=
k">https://lists.yoctoproject.<u></u>org/listinfo/meta-ti</a><br>
</font></span></blockquote></div><br><div dir=3D"ltr"><div><font face=3D"ga=
ramond, serif"><span style=3D"border-collapse:collapse;color:rgb(102,102,10=
2);font-family:arial,sans-serif;font-size:13px"><br></span></font></div></d=
iv>

</div></div></div>

--089e01161a262e9eec0501f99efe--
