Return-Path: <f-lefeuvre@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B6CABE013AC
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2012 14:18:24 -0700 (PDT)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q2GLINs9028944
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2012 16:18:24 -0500
Received: from DNCE72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q2GLINlM011017
	for <meta-ti@yoctoproject.org>; Fri, 16 Mar 2012 16:18:23 -0500 (CDT)
Received: from DNCE03.ent.ti.com ([fe80::19cb:d761:16a6:9b51]) by
	DNCE72.ent.ti.com ([fe80::8e3:61e5:a5b9:593c%23]) with mapi id
	14.01.0323.003; Fri, 16 Mar 2012 22:18:22 +0100
From: "Lefeuvre, Florian" <f-lefeuvre@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti][Beagleboard] problem with kernel 3.0.23
Thread-Index: Ac0DukqP0tIpUqsqSAikMi1a0ICIjQ==
Date: Fri, 16 Mar 2012 21:18:22 +0000
Message-ID: <2A8F2F339F14564DA7ABAD5C4810943518E8703D@DNCE03.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [146.252.192.198]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 16 Mar 2012 14:59:59 -0700
Subject: [Beagleboard] problem with kernel 3.0.23
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2012 21:18:24 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_2A8F2F339F14564DA7ABAD5C4810943518E8703DDNCE03entticom_"

--_000_2A8F2F339F14564DA7ABAD5C4810943518E8703DDNCE03entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

Excuse me in advance if I post in the wrong forum.

I'm trying to do some development on a beagleboard in order connect some of=
 our devices to the SPI/I2C bus. (TI CC253x, Zigbee/RF4CE)
I already succeed to do some driver in the user space and use SPI/I2C.
However, I work on a SD card provided by someone and everything was already=
 activated.

I would like to get the source code of the kernel in order to do some speci=
fic customer development and learn how to activate myself SPI/I2C.

It's now several days I'm trying to achieve this goal without success:
I tried to use openembedded, by following your instruction:
MACHINE=3Dbeagleboard ./oebb.sh config beagleboard
MACHINE=3Dbeagleboard ./oebb.sh update
MACHINE=3Dbeagleboard ./oebb.sh bitbake virtual/kernel
MACHINE=3Dbeagleboard ./oebb.sh bitbake console-image

Everything works fine, I compile the kernel, rootfs, etc... (version 3.0.23=
),install it on a SD card
But when I try to run it, I fall in the following error:
http://www.mail-archive.com/angstrom-distro-devel@linuxtogo.org/msg05653.ht=
ml
(the loading procedure hang)

I just want a linux kernel I can compile myself that boot on the beagle boa=
rd (with basic functionality like networks, console...)

How can I reverse bitbake/OE to a working version of Angstrom to beagleboar=
d?

I know the version 3.0.17 is working fine, how can I get the source and con=
fig file for this version?

I can't found this information anywhere on the internet...

I know your time is precious, I will appreciate if you can point me to the =
good direction (wiki, blog, forum)...

Thanks for your help.


Florian Lefeuvre
Application Engineer
Low Power RF - San Diego
Wireless BU


--_000_2A8F2F339F14564DA7ABAD5C4810943518E8703DDNCE03entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Excuse me in advance if I post in the wrong forum.<o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m trying to do some development on a beagleb=
oard in order connect some of our devices to the SPI/I2C bus. (TI CC253x, Z=
igbee/RF4CE)
<o:p></o:p></p>
<p class=3D"MsoNormal">I already succeed to do some driver in the user spac=
e and use SPI/I2C.<o:p></o:p></p>
<p class=3D"MsoNormal">However, I work on a SD card provided by someone and=
 everything was already activated.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I would like to get the source code of the kernel in=
 order to do some specific customer development and learn how to activate m=
yself SPI/I2C.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">It&#8217;s now several days I&#8217;m trying to achi=
eve this goal without success:<o:p></o:p></p>
<p class=3D"MsoNormal">I tried to use openembedded, by following your instr=
uction:<o:p></o:p></p>
<p class=3D"MsoNormal">MACHINE=3Dbeagleboard ./oebb.sh config beagleboard<o=
:p></o:p></p>
<p class=3D"MsoNormal">MACHINE=3Dbeagleboard ./oebb.sh update<o:p></o:p></p=
>
<p class=3D"MsoNormal">MACHINE=3Dbeagleboard ./oebb.sh bitbake virtual/kern=
el<o:p></o:p></p>
<p class=3D"MsoNormal">MACHINE=3Dbeagleboard ./oebb.sh bitbake console-imag=
e <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Everything works fine, I compile the kernel, rootfs,=
 etc&#8230; (version 3.0.23),install it on a SD card<o:p></o:p></p>
<p class=3D"MsoNormal">But when I try to run it, I fall in the following er=
ror:<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"http://www.mail-archive.com/angstrom-dist=
ro-devel@linuxtogo.org/msg05653.html">http://www.mail-archive.com/angstrom-=
distro-devel@linuxtogo.org/msg05653.html</a><o:p></o:p></p>
<p class=3D"MsoNormal">(the loading procedure hang)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I just want a linux kernel I can compile myself that=
 boot on the beagle board (with basic functionality like networks, console&=
#8230;)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">How can I reverse bitbake/OE to a working version of=
 Angstrom to beagleboard?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I know the version 3.0.17 is working fine, how can I=
 get the source and config file for this version?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I can&#8217;t found this information anywhere on the=
 internet&#8230;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I know your time is precious, I will appreciate if y=
ou can point me to the good direction (wiki, blog, forum)&#8230;<o:p></o:p>=
</p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for your help.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Florian Lefeuvre<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Application Enginee=
r<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Low Power RF - San =
Diego<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Wireless BU<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_2A8F2F339F14564DA7ABAD5C4810943518E8703DDNCE03entticom_--
