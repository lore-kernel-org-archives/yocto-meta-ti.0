Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56488E0030A; Fri, 11 Jul 2014 08:31:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04C45E0074B
	for <meta-ti@yoctoproject.org>; Fri, 11 Jul 2014 08:31:16 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s6BFVEct005082;
	Fri, 11 Jul 2014 10:31:14 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s6BFVEgl028834;
	Fri, 11 Jul 2014 10:31:14 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE71.ent.ti.com ([fe80::4dce:5c82:1ad0:d462%28]) with mapi id
	14.03.0174.001; Fri, 11 Jul 2014 10:31:14 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"miroslav.kes@gmail.com" <miroslav.kes@gmail.com>
Thread-Topic: [meta-ti] BeagleBoard / Beagleboard-xM build
Thread-Index: AQHPmeh9+Y4e+ep9QU2xTenEkql9o5uUogpRgAGs2gD//+Hwa4AFI2qA//+yPhw=
Date: Fri, 11 Jul 2014 15:31:14 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE73207AD7A@DLEE08.ent.ti.com>
References: <53BAA233.4030803@gmail.com>
	<B0581B5571079145BA1CD78C126DBDE732074600@DLEE08.ent.ti.com>,
	<53BBC7F2.50803@gmail.com>
	<B0581B5571079145BA1CD78C126DBDE7320765DF@DLEE08.ent.ti.com>,
	<53BFFE2D.10600@gmail.com>
In-Reply-To: <53BFFE2D.10600@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
Subject: Re: BeagleBoard / Beagleboard-xM build
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
X-List-Received-Date: Fri, 11 Jul 2014 15:31:23 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE73207AD7ADLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE73207AD7ADLEE08entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

http://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine/include=
/omap3.inc?h=3Ddaisy#n25

Denys


Sent from my Android phone using TouchDown (www.nitrodesk.com)

-----Original Message-----
From: Miroslav Ke=9A [miroslav.kes@gmail.com]
Received: Friday, 11 Jul 2014, 11:10
To: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: Re: [meta-ti] BeagleBoard / Beagleboard-xM build


I'm still confused concerning the correct approach for building a distroles=
s image.

In this response ...
https://lists.yoctoproject.org/pipermail/meta-ti/2014-July/004863.html

to a recent post, Maupin says that the kernel provider should be defined by=
 the distribution.

But if I compare the conf/machine/beagleboard.conf in danny and daisy branc=
hes, the danny version includes

PREFERRED_PROVIDER_virtual/kernel =3D "linux-mainline"
PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot-beagleboard"
PREFERRED_PROVIDER_u-boot =3D "u-boot-beagleboard"

while in the daisy (and also master) version there is nothing like that.

Could someone answer the first 2 questions my original post?

Thanks

Mira

On 07/08/2014 03:41 PM, Dmytriyenko, Denys wrote:
> Sorry, missed it was BeagleBoard and 3.2 kernel...
>
>
> Sent from my Android phone using TouchDown (www.nitrodesk.com<http://www.=
nitrodesk.com>)
>
> -----Original Message-----
> *From:* Miroslav Ke=9A [miroslav.kes@gmail.com]
> *Received:* Tuesday, 08 Jul 2014, 6:29
> *To:* Dmytriyenko, Denys [denys@ti.com]; meta-ti@yoctoproject.org [meta-t=
i@yoctoproject.org]
> *Subject:* Re: [meta-ti] BeagleBoard / Beagleboard-xM build
>
> On 07/07/14 15:54, Dmytriyenko, Denys wrote:
> > Missing DTB files:
> > http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/tree/README.hardwa=
re#n190
> >
> >
> Denys,
>
> The hardware README note in your link is related to BeagleBone. Is the DT=
B true also for BeagleBoard?
> I'm asking because my BeagleBoard build doesn't produce any .dtb image. S=
hould it create one?
>
> Thanks
>
> Mira
> > Sent from my Android phone using TouchDown (<http://>www.nitrodesk.com =
<http://www.nitrodesk.com>)
> >
> > -----Original Message-----
> > *From:* Miroslav Ke=9A [miroslav.kes@gmail.com]
> > *Received:* Monday, 07 Jul 2014, 9:36
> > *To:* meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
> > *Subject:* [meta-ti] BeagleBoard / Beagleboard-xM build
> >
> > Hi!
> >
> > I tried to build the kernel plus core-image-minimal for BeagleBoard usi=
ng just
> >
> > BBLAYERS ?=3D " \
> >   ${OEBASE}/meta-ti \
> >   ${OEBASE}/openembedded-core/meta \
> >   "
> > The build completed OK but the boot process hangs on both BeagleBoard a=
nd Beagleboard-xM after
> > the "booting the kernel" message (see the output bellow).
> >
> > I have spent 3 days googling on potential reasons. I found some people =
having similar problems but it looks like the kernel debugging options are =
turned on in the kernel configuration and the ttyO2 should be OK for kernel=
 3.2.28
> >
> > I would appreciate if someone could answer these questions:
> >
> > 1) Is it good idea trying to build the BeagleBoard distro using just me=
ta-ti and openembedded-core (i.e. without Angstrom)?
> > 2) Is there particular combination of meta-ti and openembedded-core ver=
sions that should be used?
> > 3) What is the relationship between meta-ti and meta-beagleboard (it lo=
oks like meta-ti supports beagleboards while meta-beagleboard supports beag=
lebone)
> >
> > Any hints would be really welcome
> >
> > Mira
> >
> > ---------------------------------------------------------------------
> >
> > Welcome to minicom 2.6
> >
> > OPTIONS: I18n
> > Compiled on Nov 18 2013, 11:01:02.
> > Port /dev/ttyS0
> >
> > Press CTRL-A Z for help on special keys
> >
> > ...40V...=FE
> > U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 02 2014 - 14:36:18)
> > Texas Instruments Revision detection unimplemented
> > OMAP SD/MMC: 0
> > reading u-boot.img
> > reading u-boot.img
> >
> >
> > U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 02 2014 - 14:36:18)
> >
> > OMAP3530-GP ES3.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 mHz
> > OMAP3 Beagle board + LPDDR/NAND
> > I2C:   ready
> > DRAM:  256 MiB
> > WARNING: Caches not enabled
> > NAND:  256 MiB
> > MMC:   OMAP SD/MMC: 0
> > In:    serial
> > Out:   serial
> > Err:   serial
> > Beagle Rev C1/C2/C3
> > timed out in wait_for_pin: I2C_STAT=3D0
> > I2C read: I/O error
> > Unrecognized expansion board: 0
> > timed out in wait_for_pin: I2C_STAT=3D0
> > I2C read: I/O error
> > Unrecognized expansion board: 0
> > Die ID #5ac400030000000004013f8901001001
> > Net:   Net Initialization Skipped
> > No ethernet found.
> > Hit any key to stop autoboot:  0
> > OMAP3 beagleboard.org # mmc rescan
> > OMAP3 beagleboard.org # setenv bootargs console=3DttyO2,115200n8 root=
=3D/dev/mmcblk0p2 rw rootdelay=3D1
> > OMAP3 beagleboard.org # fatload mmc 0:1 0x80000000  uImage
> > reading uImage
> >
> > 4337768 bytes read
> > OMAP3 beagleboard.org # bootm 0x80000000
> > ## Booting kernel from Legacy Image at 80000000 ...
> >    Image Name:   Linux-3.2.28
> >    Image Type:   ARM Linux Kernel Image (uncompressed)
> >    Data Size:    4337704 Bytes =3D 4.1 MiB
> >    Load Address: 80008000
> >    Entry Point:  80008000
> >    Verifying Checksum ... OK
> >    Loading Kernel Image ... OK
> > OK
> >
> > Starting kernel ...
> >
> > Uncompressing Linux... done, booting the kernel.
> > --
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
>

--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_B0581B5571079145BA1CD78C126DBDE73207AD7ADLEE08entticom_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11p=
t; color:black">
<span style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:11=
pt; color:black"><a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-=
ti/tree/conf/machine/include/omap3.inc?h=3Ddaisy#n25">http://git.yoctoproje=
ct.org/cgit/cgit.cgi/meta-ti/tree/conf/machine/include/omap3.inc?h=3Ddaisy#=
n25</a><br>
<br>
Denys<br>
<br>
<br>
Sent from my Android phone using TouchDown (www.nitrodesk.com)<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Miroslav Ke=9A [miroslav.kes@gmail.com]<br>
<b>Received:</b> Friday, 11 Jul 2014, 11:10<br>
<b>To:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> Re: [meta-ti] BeagleBoard / Beagleboard-xM build<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText"><br>
I'm still confused concerning the correct approach for building a distroles=
s image.<br>
<br>
In this response ...<br>
<a href=3D"https://lists.yoctoproject.org/pipermail/meta-ti/2014-July/00486=
3.html">https://lists.yoctoproject.org/pipermail/meta-ti/2014-July/004863.h=
tml</a><br>
<br>
to a recent post, Maupin says that the kernel provider should be defined by=
 the distribution.<br>
<br>
But if I compare the conf/machine/beagleboard.conf in danny and daisy branc=
hes, the danny version includes<br>
<br>
PREFERRED_PROVIDER_virtual/kernel =3D &quot;linux-mainline&quot;<br>
PREFERRED_PROVIDER_virtual/bootloader =3D &quot;u-boot-beagleboard&quot;<br=
>
PREFERRED_PROVIDER_u-boot =3D &quot;u-boot-beagleboard&quot;<br>
<br>
while in the daisy (and also master) version there is nothing like that.<br=
>
<br>
Could someone answer the first 2 questions my original post?<br>
<br>
Thanks<br>
<br>
Mira<br>
<br>
On 07/08/2014 03:41 PM, Dmytriyenko, Denys wrote:<br>
&gt; Sorry, missed it was BeagleBoard and 3.2 kernel...<br>
&gt;<br>
&gt;<br>
&gt; Sent from my Android phone using TouchDown (<a href=3D"http://www.nitr=
odesk.com">www.nitrodesk.com</a>)<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; *From:* Miroslav Ke=9A [miroslav.kes@gmail.com]<br>
&gt; *Received:* Tuesday, 08 Jul 2014, 6:29<br>
&gt; *To:* Dmytriyenko, Denys [denys@ti.com]; meta-ti@yoctoproject.org [met=
a-ti@yoctoproject.org]<br>
&gt; *Subject:* Re: [meta-ti] BeagleBoard / Beagleboard-xM build<br>
&gt;<br>
&gt; On 07/07/14 15:54, Dmytriyenko, Denys wrote:<br>
&gt; &gt; Missing DTB files:<br>
&gt; &gt; <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/t=
ree/README.hardware#n190">
http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/tree/README.hardware#n=
190</a><br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; Denys,<br>
&gt;<br>
&gt; The hardware README note in your link is related to BeagleBone. Is the=
 DTB true also for BeagleBoard?<br>
&gt; I'm asking because my BeagleBoard build doesn't produce any .dtb image=
. Should it create one?<br>
&gt;<br>
&gt; Thanks<br>
&gt;<br>
&gt; Mira<br>
&gt; &gt; Sent from my Android phone using TouchDown (<a href=3D"http://"><=
/a>www.nitrodesk.com &lt;<a href=3D"http://www.nitrodesk.com">http://www.ni=
trodesk.com</a>&gt;)<br>
&gt; &gt;<br>
&gt; &gt; -----Original Message-----<br>
&gt; &gt; *From:* Miroslav Ke=9A [miroslav.kes@gmail.com]<br>
&gt; &gt; *Received:* Monday, 07 Jul 2014, 9:36<br>
&gt; &gt; *To:* meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
&gt; &gt; *Subject:* [meta-ti] BeagleBoard / Beagleboard-xM build<br>
&gt; &gt;<br>
&gt; &gt; Hi!<br>
&gt; &gt;<br>
&gt; &gt; I tried to build the kernel plus core-image-minimal for BeagleBoa=
rd using just<br>
&gt; &gt;<br>
&gt; &gt; BBLAYERS ?=3D &quot; \<br>
&gt; &gt;&nbsp;&nbsp; ${OEBASE}/meta-ti \<br>
&gt; &gt;&nbsp;&nbsp; ${OEBASE}/openembedded-core/meta \<br>
&gt; &gt;&nbsp;&nbsp; &quot;<br>
&gt; &gt; The build completed OK but the boot process hangs on both BeagleB=
oard and Beagleboard-xM after<br>
&gt; &gt; the &quot;booting the kernel&quot; message (see the output bellow=
).<br>
&gt; &gt;<br>
&gt; &gt; I have spent 3 days googling on potential reasons. I found some p=
eople having similar problems but it looks like the kernel debugging option=
s are turned on in the kernel configuration and the ttyO2 should be OK for =
kernel 3.2.28<br>
&gt; &gt;<br>
&gt; &gt; I would appreciate if someone could answer these questions:<br>
&gt; &gt;<br>
&gt; &gt; 1) Is it good idea trying to build the BeagleBoard distro using j=
ust meta-ti and openembedded-core (i.e. without Angstrom)?<br>
&gt; &gt; 2) Is there particular combination of meta-ti and openembedded-co=
re versions that should be used?<br>
&gt; &gt; 3) What is the relationship between meta-ti and meta-beagleboard =
(it looks like meta-ti supports beagleboards while meta-beagleboard support=
s beaglebone)<br>
&gt; &gt;<br>
&gt; &gt; Any hints would be really welcome<br>
&gt; &gt;<br>
&gt; &gt; Mira<br>
&gt; &gt;<br>
&gt; &gt; -----------------------------------------------------------------=
----<br>
&gt; &gt;<br>
&gt; &gt; Welcome to minicom 2.6<br>
&gt; &gt;<br>
&gt; &gt; OPTIONS: I18n<br>
&gt; &gt; Compiled on Nov 18 2013, 11:01:02.<br>
&gt; &gt; Port /dev/ttyS0<br>
&gt; &gt;<br>
&gt; &gt; Press CTRL-A Z for help on special keys<br>
&gt; &gt;<br>
&gt; &gt; ...40V...=FE<br>
&gt; &gt; U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 02 2014 - 14:36:18)<=
br>
&gt; &gt; Texas Instruments Revision detection unimplemented<br>
&gt; &gt; OMAP SD/MMC: 0<br>
&gt; &gt; reading u-boot.img<br>
&gt; &gt; reading u-boot.img<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 02 2014 - 14:36:18)<br>
&gt; &gt;<br>
&gt; &gt; OMAP3530-GP ES3.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 mHz<br>
&gt; &gt; OMAP3 Beagle board &#43; LPDDR/NAND<br>
&gt; &gt; I2C:&nbsp;&nbsp; ready<br>
&gt; &gt; DRAM:&nbsp; 256 MiB<br>
&gt; &gt; WARNING: Caches not enabled<br>
&gt; &gt; NAND:&nbsp; 256 MiB<br>
&gt; &gt; MMC:&nbsp;&nbsp; OMAP SD/MMC: 0<br>
&gt; &gt; In:&nbsp;&nbsp;&nbsp; serial<br>
&gt; &gt; Out:&nbsp;&nbsp; serial<br>
&gt; &gt; Err:&nbsp;&nbsp; serial<br>
&gt; &gt; Beagle Rev C1/C2/C3<br>
&gt; &gt; timed out in wait_for_pin: I2C_STAT=3D0<br>
&gt; &gt; I2C read: I/O error<br>
&gt; &gt; Unrecognized expansion board: 0<br>
&gt; &gt; timed out in wait_for_pin: I2C_STAT=3D0<br>
&gt; &gt; I2C read: I/O error<br>
&gt; &gt; Unrecognized expansion board: 0<br>
&gt; &gt; Die ID #5ac400030000000004013f8901001001<br>
&gt; &gt; Net:&nbsp;&nbsp; Net Initialization Skipped<br>
&gt; &gt; No ethernet found.<br>
&gt; &gt; Hit any key to stop autoboot:&nbsp; 0<br>
&gt; &gt; OMAP3 beagleboard.org # mmc rescan<br>
&gt; &gt; OMAP3 beagleboard.org # setenv bootargs console=3DttyO2,115200n8 =
root=3D/dev/mmcblk0p2 rw rootdelay=3D1<br>
&gt; &gt; OMAP3 beagleboard.org # fatload mmc 0:1 0x80000000&nbsp; uImage<b=
r>
&gt; &gt; reading uImage<br>
&gt; &gt;<br>
&gt; &gt; 4337768 bytes read<br>
&gt; &gt; OMAP3 beagleboard.org # bootm 0x80000000<br>
&gt; &gt; ## Booting kernel from Legacy Image at 80000000 ...<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Image Name:&nbsp;&nbsp; Linux-3.2.28<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Image Type:&nbsp;&nbsp; ARM Linux Kernel Image =
(uncompressed)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Data Size:&nbsp;&nbsp;&nbsp; 4337704 Bytes =3D =
4.1 MiB<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Load Address: 80008000<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Entry Point:&nbsp; 80008000<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Verifying Checksum ... OK<br>
&gt; &gt;&nbsp;&nbsp;&nbsp; Loading Kernel Image ... OK<br>
&gt; &gt; OK<br>
&gt; &gt;<br>
&gt; &gt; Starting kernel ...<br>
&gt; &gt;<br>
&gt; &gt; Uncompressing Linux... done, booting the kernel.<br>
&gt; &gt; --<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; meta-ti mailing list<br>
&gt; &gt; meta-ti@yoctoproject.org<br>
&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https=
://lists.yoctoproject.org/listinfo/meta-ti</a><br>
&gt;<br>
<br>
-- <br>
_______________________________________________<br>
meta-ti mailing list<br>
meta-ti@yoctoproject.org<br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><br>
</div>
</span></font>
</body>
</html>

--_000_B0581B5571079145BA1CD78C126DBDE73207AD7ADLEE08entticom_--
