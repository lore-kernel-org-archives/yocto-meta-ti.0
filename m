Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6855FE006D5; Mon,  7 Jul 2014 06:54:16 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 17E3BE006B6
	for <meta-ti@yoctoproject.org>; Mon,  7 Jul 2014 06:54:14 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s67DsBBL030756;
	Mon, 7 Jul 2014 08:54:11 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s67DsBEA032111;
	Mon, 7 Jul 2014 08:54:11 -0500
Received: from DLEE08.ent.ti.com ([fe80::b57d:c966:76e5:eb71]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Mon, 7 Jul 2014 08:54:11 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	"miroslav.kes@gmail.com" <miroslav.kes@gmail.com>
Thread-Topic: [meta-ti] BeagleBoard / Beagleboard-xM build
Thread-Index: AQHPmeh9+Y4e+ep9QU2xTenEkql9o5uUogpR
Date: Mon, 7 Jul 2014 13:54:10 +0000
Message-ID: <B0581B5571079145BA1CD78C126DBDE732074600@DLEE08.ent.ti.com>
References: <53BAA233.4030803@gmail.com>
In-Reply-To: <53BAA233.4030803@gmail.com>
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
X-List-Received-Date: Mon, 07 Jul 2014 13:54:16 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_B0581B5571079145BA1CD78C126DBDE732074600DLEE08entticom_"

--_000_B0581B5571079145BA1CD78C126DBDE732074600DLEE08entticom_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Missing DTB files:
http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/tree/README.hardware#n=
190


Sent from my Android phone using TouchDown (www.nitrodesk.com)

-----Original Message-----
From: Miroslav Ke=9A [miroslav.kes@gmail.com]
Received: Monday, 07 Jul 2014, 9:36
To: meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]
Subject: [meta-ti] BeagleBoard / Beagleboard-xM build

Hi!

I tried to build the kernel plus core-image-minimal for BeagleBoard using j=
ust

BBLAYERS ?=3D " \
  ${OEBASE}/meta-ti \
  ${OEBASE}/openembedded-core/meta \
  "
The build completed OK but the boot process hangs on both BeagleBoard and B=
eagleboard-xM after
the "booting the kernel" message (see the output bellow).

I have spent 3 days googling on potential reasons. I found some people havi=
ng similar problems but it looks like the kernel debugging options are turn=
ed on in the kernel configuration and the ttyO2 should be OK for kernel 3.2=
.28

I would appreciate if someone could answer these questions:

1) Is it good idea trying to build the BeagleBoard distro using just meta-t=
i and openembedded-core (i.e. without Angstrom)?
2) Is there particular combination of meta-ti and openembedded-core version=
s that should be used?
3) What is the relationship between meta-ti and meta-beagleboard (it looks =
like meta-ti supports beagleboards while meta-beagleboard supports beaglebo=
ne)

Any hints would be really welcome

Mira

---------------------------------------------------------------------

Welcome to minicom 2.6

OPTIONS: I18n
Compiled on Nov 18 2013, 11:01:02.
Port /dev/ttyS0

Press CTRL-A Z for help on special keys

...40V...=FE
U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 02 2014 - 14:36:18)
Texas Instruments Revision detection unimplemented
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 02 2014 - 14:36:18)

OMAP3530-GP ES3.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 mHz
OMAP3 Beagle board + LPDDR/NAND
I2C:   ready
DRAM:  256 MiB
WARNING: Caches not enabled
NAND:  256 MiB
MMC:   OMAP SD/MMC: 0
In:    serial
Out:   serial
Err:   serial
Beagle Rev C1/C2/C3
timed out in wait_for_pin: I2C_STAT=3D0
I2C read: I/O error
Unrecognized expansion board: 0
timed out in wait_for_pin: I2C_STAT=3D0
I2C read: I/O error
Unrecognized expansion board: 0
Die ID #5ac400030000000004013f8901001001
Net:   Net Initialization Skipped
No ethernet found.
Hit any key to stop autoboot:  0
OMAP3 beagleboard.org # mmc rescan
OMAP3 beagleboard.org # setenv bootargs console=3DttyO2,115200n8 root=3D/de=
v/mmcblk0p2 rw rootdelay=3D1
OMAP3 beagleboard.org # fatload mmc 0:1 0x80000000  uImage
reading uImage

4337768 bytes read
OMAP3 beagleboard.org # bootm 0x80000000
## Booting kernel from Legacy Image at 80000000 ...
   Image Name:   Linux-3.2.28
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    4337704 Bytes =3D 4.1 MiB
   Load Address: 80008000
   Entry Point:  80008000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK
OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_B0581B5571079145BA1CD78C126DBDE732074600DLEE08entticom_
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
pt; color:black">Missing DTB files:<br>
http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/tree/README.hardware#n=
190<br>
<br>
<br>
Sent from my Android phone using TouchDown (www.nitrodesk.com)<br>
<br>
<span style=3D"color:black">-----Original Message----- <br>
<b>From:</b> Miroslav Ke=9A [miroslav.kes@gmail.com]<br>
<b>Received:</b> Monday, 07 Jul 2014, 9:36<br>
<b>To:</b> meta-ti@yoctoproject.org [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> [meta-ti] BeagleBoard / Beagleboard-xM build<br>
<br>
</span></span></div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi!<br>
<br>
I tried to build the kernel plus core-image-minimal for BeagleBoard using j=
ust <br>
<br>
BBLAYERS ?=3D &quot; \<br>
&nbsp; ${OEBASE}/meta-ti \<br>
&nbsp; ${OEBASE}/openembedded-core/meta \<br>
&nbsp; &quot;<br>
The build completed OK but the boot process hangs on both BeagleBoard and B=
eagleboard-xM after<br>
the &quot;booting the kernel&quot; message (see the output bellow).<br>
<br>
I have spent 3 days googling on potential reasons. I found some people havi=
ng similar problems but it looks like the kernel debugging options are turn=
ed on in the kernel configuration and the ttyO2 should be OK for kernel 3.2=
.28<br>
<br>
I would appreciate if someone could answer these questions:<br>
<br>
1) Is it good idea trying to build the BeagleBoard distro using just meta-t=
i and openembedded-core (i.e. without Angstrom)?<br>
2) Is there particular combination of meta-ti and openembedded-core version=
s that should be used?<br>
3) What is the relationship between meta-ti and meta-beagleboard (it looks =
like meta-ti supports beagleboards while meta-beagleboard supports beaglebo=
ne)<br>
<br>
Any hints would be really welcome<br>
<br>
Mira<br>
<br>
---------------------------------------------------------------------<br>
<br>
Welcome to minicom 2.6<br>
<br>
OPTIONS: I18n <br>
Compiled on Nov 18 2013, 11:01:02.<br>
Port /dev/ttyS0<br>
<br>
Press CTRL-A Z for help on special keys<br>
<br>
...40V...=FE<br>
U-Boot SPL 2011.09-01172-gfdbe8b9-dirty (Jul 02 2014 - 14:36:18)<br>
Texas Instruments Revision detection unimplemented<br>
OMAP SD/MMC: 0<br>
reading u-boot.img<br>
reading u-boot.img<br>
<br>
<br>
U-Boot 2011.09-01172-gfdbe8b9-dirty (Jul 02 2014 - 14:36:18)<br>
<br>
OMAP3530-GP ES3.0, CPU-OPP2, L3-165MHz, Max CPU Clock 600 mHz<br>
OMAP3 Beagle board &#43; LPDDR/NAND<br>
I2C:&nbsp;&nbsp; ready<br>
DRAM:&nbsp; 256 MiB<br>
WARNING: Caches not enabled<br>
NAND:&nbsp; 256 MiB<br>
MMC:&nbsp;&nbsp; OMAP SD/MMC: 0<br>
In:&nbsp;&nbsp;&nbsp; serial<br>
Out:&nbsp;&nbsp; serial<br>
Err:&nbsp;&nbsp; serial<br>
Beagle Rev C1/C2/C3<br>
timed out in wait_for_pin: I2C_STAT=3D0<br>
I2C read: I/O error<br>
Unrecognized expansion board: 0<br>
timed out in wait_for_pin: I2C_STAT=3D0<br>
I2C read: I/O error<br>
Unrecognized expansion board: 0<br>
Die ID #5ac400030000000004013f8901001001<br>
Net:&nbsp;&nbsp; Net Initialization Skipped<br>
No ethernet found.<br>
Hit any key to stop autoboot:&nbsp; 0 <br>
OMAP3 beagleboard.org # mmc rescan<br>
OMAP3 beagleboard.org # setenv bootargs console=3DttyO2,115200n8 root=3D/de=
v/mmcblk0p2 rw rootdelay=3D1<br>
OMAP3 beagleboard.org # fatload mmc 0:1 0x80000000&nbsp; uImage<br>
reading uImage<br>
<br>
4337768 bytes read<br>
OMAP3 beagleboard.org # bootm 0x80000000<br>
## Booting kernel from Legacy Image at 80000000 ...<br>
&nbsp;&nbsp; Image Name:&nbsp;&nbsp; Linux-3.2.28<br>
&nbsp;&nbsp; Image Type:&nbsp;&nbsp; ARM Linux Kernel Image (uncompressed)<=
br>
&nbsp;&nbsp; Data Size:&nbsp;&nbsp;&nbsp; 4337704 Bytes =3D 4.1 MiB<br>
&nbsp;&nbsp; Load Address: 80008000<br>
&nbsp;&nbsp; Entry Point:&nbsp; 80008000<br>
&nbsp;&nbsp; Verifying Checksum ... OK<br>
&nbsp;&nbsp; Loading Kernel Image ... OK<br>
OK<br>
<br>
Starting kernel ...<br>
<br>
Uncompressing Linux... done, booting the kernel.<br>
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

--_000_B0581B5571079145BA1CD78C126DBDE732074600DLEE08entticom_--
