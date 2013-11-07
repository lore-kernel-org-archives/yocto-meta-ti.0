Return-Path: <jithin.raj@nestgroup.net>
Received: from mxout-tvm.nestgroup.net (mxout-tvm.nestgroup.net
	[115.248.23.134])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 845F9E017FC
	for <meta-ti@yoctoproject.org>; Thu,  7 Nov 2013 01:35:29 -0800 (PST)
Received: from mail-3.tvm.nestgroup.net ([192.168.192.79])
	by mxout-tvm.nestgroup.net (8.13.1/8.13.1) with ESMTP id rA79S9pW001194;
	Thu, 7 Nov 2013 14:58:09 +0530
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Thu, 7 Nov 2013 15:05:11 +0530
Message-ID: <245245F712CBF74D865D90E99497849F06357ACE@mail-3.tvm.nestgroup.net>
In-Reply-To: <CAB0T2v-Tf+j56YKrUvV7npQ8Jk2HnE43HA6kJh0J+FEs7rEyJQ@mail.gmail.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: [meta-ti] meat-ti(master) kernel not working with meta-ivi
Thread-Index: Ac7a88ZdBtxSI4XoRXarg+ojyC/SHwAqJhbQ
References: <245245F712CBF74D865D90E99497849F06357480@mail-3.tvm.nestgroup.net><4FEDAB2D-AA9F-499E-BDF0-8012EE7CE508@ti.com>
	<CAB0T2v-Tf+j56YKrUvV7npQ8Jk2HnE43HA6kJh0J+FEs7rEyJQ@mail.gmail.com>
From: "Jithin Raj" <jithin.raj@nestgroup.net>
To: "Baptiste Durand" <baptiste.durand@gmail.com>,
	"Heroor, Siddharth" <heroor@ti.com>
Cc: meta-ti@yoctoproject.org
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
X-List-Received-Date: Thu, 07 Nov 2013 09:35:32 -0000
Content-class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CEDB9C.A89BDA3E"

------_=_NextPart_001_01CEDB9C.A89BDA3E
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Baptiste,

Thank you very much...

With GCC 4.7 its working J

=20

=20

Thanks & regards

Jithin Raj

=20

From: Baptiste Durand [mailto:baptiste.durand@gmail.com]=20
Sent: Wednesday, November 06, 2013 6:56 PM
To: Heroor, Siddharth
Cc: Jithin Raj; meta-ti@yoctoproject.org
Subject: Re: [meta-ti] meat-ti(master) kernel not working with meta-ivi

=20

Hi,

I already saw this issue (=3D> https://github.com/baillaw/meta-x10/issues=
)
:=20

please  try to add=20
GCCVERSION=3D"4.7%" in  your local.conf.

GCC 4.8 seems to build uncorrectly the kernel for pandaboard.

=20

Baptiste=20

=20

2013/11/6 Heroor, Siddharth <heroor@ti.com>

Hi Jithin,

=20

Please comments below.

--Sid


On 06-Nov-2013, at 5:33 pm, "Jithin Raj" <jithin.raj@nestgroup.net>
wrote:

	Hi,

	=20

	I am trying to build the yocto based meta-ivi (5.0), meta-ti for
Pandaboard.

	For building  I used the below procedure

	=20

	1) git clone git://git.yoctoproject.org/poky

	   cd poky

	   git checkout dora

	   cd -

	2) git clone git://git.yoctoproject.org/meta-ivi

	   cd meta-ivi

	   git checkout 5.0

	   cd -

	3) git clone git://git.yoctoproject.org/meta-ti

	=20

	4) source poky/oe-init-build-env

	=20

	5) modified the bblayer.conf like this.

	    BBLAYERS ?=3D " \

	     /home/sfm/yocto/building/poky/meta \

	     /home/sfm/yocto/building/poky/meta-yocto \

	     /home/sfm/yocto/building/meta-ivi \

	     /home/sfm/yocto/building/meta-ti \

	=20

	6) modified the local.config with=20

	                MACHINE?=3Dpandaboard

	=20

	7) Add INCOMPATIBLE_LICENSE =3D "GPLv3" in
COREBASE/build/conf/local.conf file.

	=20

	8) Set DISTRO ?=3D "poky-ivi-systemd" in
COREBASE/build/conf/local.conf file.

	=20

	9) bitbake gemini-image

	=20

	Once all the generated files are copied to the SD card I
switched on the pandaboard es.

	The pandaboard es is hanging while its loading the kernel.
Please find log here:

=20

Please also see if core-minimal and sato images are booting. There isn't
much active work happening on panda board and so could you check if a
kernel.org is booting fine?

=20





=20

U-Boot SPL 2011.12 (Nov 05 2013 - 14:12:29)

Texas Instruments OMAP4460 ES1.1       =20

OMAP SD/MMC: 0                         =20

reading u-boot.img                     =20

reading u-boot.img

=20

=20

U-Boot 2011.12 (Nov 05 2013 - 14:12:29)

=20

CPU  : OMAP4460 ES1.1

Board: OMAP4 Panda

I2C:   ready

DRAM:  1 GiB

MMC:   OMAP SD/MMC: 0

Using default environment

=20

In:    serial

Out:   serial

Err:   serial

Hit any key to stop autoboot:  0=20

reading boot.scr

=20

338 bytes read

Running bootscript from mmc0 ...

## Executing script at 82000000

reading uImage

=20

4333848 bytes read

## Booting kernel from Legacy Image at 80000000 ...

   Image Name:   Linux-3.4.11

   Image Type:   ARM Linux Kernel Image (uncompressed)

   Data Size:    4333784 Bytes =3D 4.1 MiB

   Load Address: 80008000

   Entry Point:  80008000

   Verifying Checksum ... OK

   Loading Kernel Image ... OK

OK

=20

Starting kernel ...

=20

Uncompressing Linux... done, booting the kernel.

=20

After this nothing is displayed.

=20

I have few doubts in this procedure.

=20

1)      which branch of meta-ti I have to use for dora branch?
(currently am using the master branch).

=20

Master should be fine for Dora. Please also checkout the specific
commits from poky as mentioned in meta-ivi.

	2)      Do the master branch will work with all the poky
branches (like dora, dylan?

=20

There should be Dylan branch on meta-ti that you can checkout.

=20

	       3)    Do I need to do any other modification in any file
to work with pandaboard?.

=20

I haven't tried panda recently but I could try it out early next week
and respond.=20

	=20

	Thanks in advance.

	=20

	Thanks & regards

	Jithin Raj

	=20

	=20

	***** Confidentiality Statement/Disclaimer *****
=09
	This message and any attachments is intended for the sole use of
the intended recipient. It may contain confidential information. Any
unauthorized use, dissemination or modification is strictly prohibited.
If you are not the intended recipient, please notify the sender
immediately then delete it from all your systems, and do not copy, use
or print. Internet communications are not secure and it is the
responsibility of the recipient to make sure that it is virus/malicious
code exempt.
	The company/sender cannot be responsible for any unauthorized
alterations or modifications made to the contents. If you require any
form of confirmation of the contents, please contact the company/sender.
The company/sender is not liable for any errors or omissions in the
content of this message.

	_______________________________________________
	meta-ti mailing list
	meta-ti@yoctoproject.org
	https://lists.yoctoproject.org/listinfo/meta-ti


_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti




--=20

Baptiste DURAND

=20

***** Confidentiality Statement/Disclaimer *****

This message and any attachments is intended for the sole use of the inte=
nded recipient. It may contain confidential information. Any unauthorized=
 use, dissemination or modification is strictly prohibited. If you are no=
t the intended recipient, please notify the sender immediately then delet=
e it from all your systems, and do not copy, use or print. Internet commu=
nications are not secure and it is the responsibility of the recipient to=
 make sure that it is virus/malicious code exempt.
The company/sender cannot be responsible for any unauthorized alterations=
 or modifications made to the contents. If you require any form of confir=
mation of the contents, please contact the company/sender. The company/se=
nder is not liable for any errors or omissions in the content of this mes=
sage.


------_=_NextPart_001_01CEDB9C.A89BDA3E
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-mi=
crosoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:wo=
rd" xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D=
"http://www.w3.org/TR/REC-html40"><head><META HTTP-EQUIV=3D"Content-Type"=
 CONTENT=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=
=3D"Microsoft Word 12 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p
	{mso-style-priority:99;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.EmailStyle18
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
=2EMsoChpDefault
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
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue v=
link=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal style=3D'mar=
gin-bottom:12.0pt'><span style=3D'font-size:11.0pt;font-family:"Calibri",=
"sans-serif";color:black'>Hi </span><span style=3D'color:black'>Baptiste,=
<o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'font-size:11.0p=
t;font-family:"Calibri","sans-serif";color:#1F497D'>Thank you very much&#=
8230;<o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'font-size:=
11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'>With GCC 4.7 its=
 working </span><span style=3D'font-size:11.0pt;font-family:Wingdings;col=
or:#1F497D'>J</span><span style=3D'font-size:11.0pt;font-family:"Calibri"=
,"sans-serif";color:#1F497D'><o:p></o:p></span></p><p class=3DMsoNormal><=
span style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#=
1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><span style=3D'f=
ont-size:11.0pt;font-family:"Calibri","sans-serif";color:#1F497D'><o:p>&n=
bsp;</o:p></span></p><p class=3DMsoNormal><b><span style=3D'font-size:11.=
0pt;font-family:"Calibri","sans-serif";color:black'>Thanks &amp; regards<=
o:p></o:p></span></b></p><p class=3DMsoNormal><b><span style=3D'font-size=
:11.0pt;font-family:"Calibri","sans-serif";color:black'>Jithin Raj<o:p></=
o:p></span></b></p><p class=3DMsoNormal><span style=3D'font-size:11.0pt;f=
ont-family:"Calibri","sans-serif";color:#1F497D'><o:p>&nbsp;</o:p></span>=
</p><div style=3D'border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0p=
t 0in 0in 0in'><p class=3DMsoNormal><b><span style=3D'font-size:10.0pt;fo=
nt-family:"Tahoma","sans-serif"'>From:</span></b><span style=3D'font-size=
:10.0pt;font-family:"Tahoma","sans-serif"'> Baptiste Durand [mailto:bapti=
ste.durand@gmail.com] <br><b>Sent:</b> Wednesday, November 06, 2013 6:56 =
PM<br><b>To:</b> Heroor, Siddharth<br><b>Cc:</b> Jithin Raj; meta-ti@yoct=
oproject.org<br><b>Subject:</b> Re: [meta-ti] meat-ti(master) kernel not =
working with meta-ivi<o:p></o:p></span></p></div><p class=3DMsoNormal><o:=
p>&nbsp;</o:p></p><div><div><p class=3DMsoNormal style=3D'margin-bottom:1=
2.0pt'>Hi,<o:p></o:p></p></div><div><p class=3DMsoNormal>I already saw th=
is issue (=3D&gt; <a href=3D"https://github.com/baillaw/meta-x10/issues">=
https://github.com/baillaw/meta-x10/issues</a>) : <o:p></o:p></p></div><d=
iv><p class=3DMsoNormal style=3D'margin-bottom:12.0pt'>please&nbsp; try t=
o add <br>GCCVERSION=3D&quot;4.7%&quot; in&nbsp; your local.conf.<o:p></o=
:p></p></div><div><p class=3DMsoNormal style=3D'margin-bottom:12.0pt'>GCC=
 4.8 seems to build uncorrectly the kernel for pandaboard.<o:p></o:p></p>=
</div><div><p class=3DMsoNormal style=3D'margin-bottom:12.0pt'><o:p>&nbsp=
;</o:p></p></div><div><p class=3DMsoNormal style=3D'margin-bottom:12.0pt'=
>Baptiste <o:p></o:p></p></div><div><p class=3DMsoNormal style=3D'margin-=
bottom:12.0pt'><o:p>&nbsp;</o:p></p><div><p class=3DMsoNormal>2013/11/6 H=
eroor, Siddharth &lt;<a href=3D"mailto:heroor@ti.com" target=3D"_blank">h=
eroor@ti.com</a>&gt;<o:p></o:p></p><div><div><p class=3DMsoNormal>Hi Jith=
in,<o:p></o:p></p></div><div><p class=3DMsoNormal><o:p>&nbsp;</o:p></p></=
div><div><p class=3DMsoNormal>Please comments below.<br><br>--Sid<o:p></o=
:p></p></div><div><div><div><p class=3DMsoNormal style=3D'margin-bottom:1=
2.0pt'><br>On 06-Nov-2013, at 5:33 pm, &quot;Jithin Raj&quot; &lt;<a href=
=3D"mailto:jithin.raj@nestgroup.net" target=3D"_blank">jithin.raj@nestgro=
up.net</a>&gt; wrote:<o:p></o:p></p></div><blockquote style=3D'margin-top=
:5.0pt;margin-bottom:5.0pt'><div><div><p class=3DMsoNormal style=3D'mso-m=
argin-top-alt:auto;mso-margin-bottom-alt:auto'>Hi,<o:p></o:p></p><p class=
=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'=
>&nbsp;<o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:au=
to;mso-margin-bottom-alt:auto'>I am trying to build the yocto based meta-=
ivi (5.0), meta-ti for Pandaboard.<o:p></o:p></p><p class=3DMsoNormal sty=
le=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>For building&nb=
sp; I used the below procedure<o:p></o:p></p><p class=3DMsoNormal style=3D=
'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;<o:p></o:p></p=
><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto'>1) git clone git://<a href=3D"http://git.yoctoproject.org/poky"=
 target=3D"_blank">git.yoctoproject.org/poky</a><o:p></o:p></p><p class=3D=
MsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&n=
bsp;&nbsp; cd poky<o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin=
-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;&nbsp; git checkout dora<=
o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-m=
argin-bottom-alt:auto'>&nbsp;&nbsp; cd -<o:p></o:p></p><p class=3DMsoNorm=
al style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>2) git cl=
one git://<a href=3D"http://git.yoctoproject.org/meta-ivi" target=3D"_bla=
nk">git.yoctoproject.org/meta-ivi</a><o:p></o:p></p><p class=3DMsoNormal =
style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;&nbsp;=
 cd meta-ivi<o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-a=
lt:auto;mso-margin-bottom-alt:auto'>&nbsp;&nbsp; git checkout 5.0<o:p></o=
:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-b=
ottom-alt:auto'>&nbsp;&nbsp; cd -<o:p></o:p></p><p class=3DMsoNormal styl=
e=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>3) git clone git=
://<a href=3D"http://git.yoctoproject.org/meta-ti" target=3D"_blank">git.=
yoctoproject.org/meta-ti</a><o:p></o:p></p><p class=3DMsoNormal style=3D'=
mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;<o:p></o:p></p>=
<p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto'>4) source poky/oe-init-build-env<o:p></o:p></p><p class=3DMsoNor=
mal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;<o=
:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-ma=
rgin-bottom-alt:auto'>5) modified the bblayer.conf like this.<o:p></o:p><=
/p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-botto=
m-alt:auto'>&nbsp;&nbsp;&nbsp; BBLAYERS ?=3D &quot; \<o:p></o:p></p><p cl=
ass=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:au=
to'>&nbsp;&nbsp;&nbsp;&nbsp; /home/sfm/yocto/building/poky/meta \<o:p></o=
:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-b=
ottom-alt:auto'>&nbsp;&nbsp;&nbsp;&nbsp; /home/sfm/yocto/building/poky/me=
ta-yocto \<o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt=
:auto;mso-margin-bottom-alt:auto'>&nbsp;&nbsp;&nbsp;&nbsp; /home/sfm/yoct=
o/building/meta-ivi \<o:p></o:p></p><p class=3DMsoNormal style=3D'mso-mar=
gin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;&nbsp;&nbsp;&nbsp; /ho=
me/sfm/yocto/building/meta-ti \<o:p></o:p></p><p class=3DMsoNormal style=3D=
'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;<o:p></o:p></p=
><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto'>6) modified the local.config with <o:p></o:p></p><p class=3DMso=
Normal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; MACHINE?=3Dpandaboard<o:p></o:p></p><p class=3DMsoNormal sty=
le=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;<o:p></o:=
p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bo=
ttom-alt:auto'>7) Add INCOMPATIBLE_LICENSE =3D &quot;GPLv3&quot; in COREB=
ASE/build/conf/local.conf file.<o:p></o:p></p><p class=3DMsoNormal style=3D=
'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;<o:p></o:p></p=
><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto'>8) Set DISTRO ?=3D &quot;poky-ivi-systemd&quot; in COREBASE/bui=
ld/conf/local.conf file.<o:p></o:p></p><p class=3DMsoNormal style=3D'mso-=
margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;<o:p></o:p></p><p c=
lass=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:a=
uto'>9) bitbake gemini-image<o:p></o:p></p><p class=3DMsoNormal style=3D'=
mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><span style=3D'color:=
#1F497D'>&nbsp;</span><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-ma=
rgin-top-alt:auto;mso-margin-bottom-alt:auto'>Once all the generated file=
s are copied to the SD card I switched on the pandaboard es.<o:p></o:p></=
p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom=
-alt:auto'>The pandaboard es is hanging while its loading the kernel. Ple=
ase find log here:<o:p></o:p></p></div></div></blockquote><div><p class=3D=
MsoNormal><o:p>&nbsp;</o:p></p></div></div></div><div><p class=3DMsoNorma=
l>Please also see if core-minimal and sato images are booting. There isn'=
t much active work happening on panda board and so could you check if a <=
a href=3D"http://kernel.org" target=3D"_blank">kernel.org</a> is booting =
fine?<o:p></o:p></p></div><div><div><div><p class=3DMsoNormal><o:p>&nbsp;=
</o:p></p></div><p class=3DMsoNormal><br><br><o:p></o:p></p><div><div><p =
class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:=
auto'>&nbsp;<o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-a=
lt:auto;mso-margin-bottom-alt:auto'><b>U-Boot SPL 2011.12 (Nov 05 2013 - =
14:12:29)</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-=
alt:auto;mso-margin-bottom-alt:auto'><b>Texas Instruments OMAP4460 ES1.1&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><o:p></o:p></p><p class=3DM=
soNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>=
OMAP SD/MMC: 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; </b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-m=
argin-top-alt:auto;mso-margin-bottom-alt:auto'><b>reading u-boot.img&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><o:p></o:p></p><p cl=
ass=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:au=
to'><b>reading u-boot.img</b><o:p></o:p></p><p class=3DMsoNormal style=3D=
'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>&nbsp;</b><o:p></=
o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-=
bottom-alt:auto'><b>&nbsp;</b><o:p></o:p></p><p class=3DMsoNormal style=3D=
'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>U-Boot 2011.12 (N=
ov 05 2013 - 14:12:29)</b><o:p></o:p></p><p class=3DMsoNormal style=3D'ms=
o-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>&nbsp;</b><o:p></o:p=
></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bot=
tom-alt:auto'><b>CPU&nbsp; : OMAP4460 ES1.1</b><o:p></o:p></p><p class=3D=
MsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b=
>Board: OMAP4 Panda</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-m=
argin-top-alt:auto;mso-margin-bottom-alt:auto'><b>I2C:&nbsp;&nbsp; ready<=
/b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;m=
so-margin-bottom-alt:auto'><b>DRAM:&nbsp; 1 GiB</b><o:p></o:p></p><p clas=
s=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto=
'><b>MMC:&nbsp;&nbsp; OMAP SD/MMC: 0</b><o:p></o:p></p><p class=3DMsoNorm=
al style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>Using =
default environment</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-m=
argin-top-alt:auto;mso-margin-bottom-alt:auto'><b>&nbsp;</b><o:p></o:p></=
p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom=
-alt:auto'><b>In:&nbsp;&nbsp;&nbsp; serial</b><o:p></o:p></p><p class=3DM=
soNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>=
Out:&nbsp;&nbsp; serial</b><o:p></o:p></p><p class=3DMsoNormal style=3D'm=
so-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>Err:&nbsp;&nbsp; se=
rial</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:a=
uto;mso-margin-bottom-alt:auto'><b>Hit any key to stop autoboot:&nbsp; 0 =
</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;=
mso-margin-bottom-alt:auto'><b>reading boot.scr</b><o:p></o:p></p><p clas=
s=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto=
'><b>&nbsp;</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-to=
p-alt:auto;mso-margin-bottom-alt:auto'><b>338 bytes read</b><o:p></o:p></=
p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom=
-alt:auto'><b>Running bootscript from mmc0 ...</b><o:p></o:p></p><p class=
=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'=
><b>## Executing script at 82000000</b><o:p></o:p></p><p class=3DMsoNorma=
l style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>reading=
 uImage</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-al=
t:auto;mso-margin-bottom-alt:auto'><b>&nbsp;</b><o:p></o:p></p><p class=3D=
MsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b=
>4333848 bytes read</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-m=
argin-top-alt:auto;mso-margin-bottom-alt:auto'><b>## Booting kernel from =
Legacy Image at 80000000 ...</b><o:p></o:p></p><p class=3DMsoNormal style=
=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>&nbsp;&nbsp; I=
mage Name:&nbsp;&nbsp; Linux-3.4.11</b><o:p></o:p></p><p class=3DMsoNorma=
l style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>&nbsp;&=
nbsp; Image Type:&nbsp;&nbsp; ARM Linux Kernel Image (uncompressed)</b><o=
:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-ma=
rgin-bottom-alt:auto'><b>&nbsp;&nbsp; Data Size:&nbsp;&nbsp;&nbsp; 433378=
4 Bytes =3D 4.1 MiB</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-m=
argin-top-alt:auto;mso-margin-bottom-alt:auto'><b>&nbsp;&nbsp; Load Addre=
ss: 80008000</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-t=
op-alt:auto;mso-margin-bottom-alt:auto'><b>&nbsp;&nbsp; Entry Point:&nbsp=
; 80008000</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top=
-alt:auto;mso-margin-bottom-alt:auto'><b>&nbsp;&nbsp; Verifying Checksum =
=2E.. OK</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-a=
lt:auto;mso-margin-bottom-alt:auto'><b>&nbsp;&nbsp; Loading Kernel Image =
=2E.. OK</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-a=
lt:auto;mso-margin-bottom-alt:auto'><b>OK</b><o:p></o:p></p><p class=3DMs=
oNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>&=
nbsp;</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:=
auto;mso-margin-bottom-alt:auto'><b>Starting kernel ...</b><o:p></o:p></p=
><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto'><b>&nbsp;</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-m=
argin-top-alt:auto;mso-margin-bottom-alt:auto'><b>Uncompressing Linux... =
done, booting the kernel.</b><o:p></o:p></p><p class=3DMsoNormal style=3D=
'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;<o:p></o:p></p=
><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto'>After this nothing is displayed.<o:p></o:p></p><p class=3DMsoNo=
rmal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&nbsp;<=
o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-m=
argin-bottom-alt:auto'>I have few doubts in this procedure.<o:p></o:p></p=
><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-=
alt:auto'>&nbsp;<o:p></o:p></p><p>1)<span style=3D'font-size:7.0pt'>&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; </span><b>which branch of meta-ti I have to use=
 for dora branch</b>? (currently am using the master branch).<o:p></o:p><=
/p></div></div><div><p class=3DMsoNormal><o:p>&nbsp;</o:p></p></div></div=
></div><div><p class=3DMsoNormal>Master should be fine for Dora. Please a=
lso checkout the specific commits from poky as mentioned in meta-ivi.<o:p=
></o:p></p></div><blockquote style=3D'margin-top:5.0pt;margin-bottom:5.0p=
t'><div><div><p>2)<span style=3D'font-size:7.0pt'>&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; </span><b>Do the master branch will work with all the poky branch=
es</b> (like dora, dylan?<o:p></o:p></p></div></div></blockquote><div><p =
class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><div><p class=3DMsoNormal>Th=
ere should be Dylan branch on meta-ti that you can checkout.<o:p></o:p></=
p></div><div><div><p class=3DMsoNormal><o:p>&nbsp;</o:p></p></div><blockq=
uote style=3D'margin-top:5.0pt;margin-bottom:5.0pt'><div><div><p class=3D=
MsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3) &nbsp;&nbsp;&nbsp;<b>Do I need=
 to do any other modification in any file to work with pandaboard</b>?.<o=
:p></o:p></p></div></div></blockquote><div><p class=3DMsoNormal><o:p>&nbs=
p;</o:p></p></div></div><div><p class=3DMsoNormal>I haven't tried panda r=
ecently but I could try it out early next week and respond.&nbsp;<o:p></o=
:p></p></div><div><blockquote style=3D'margin-top:5.0pt;margin-bottom:5.0=
pt'><div><div><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-m=
argin-bottom-alt:auto'>&nbsp;<o:p></o:p></p><p class=3DMsoNormal style=3D=
'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>Thanks in advance.<o=
:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:auto;mso-ma=
rgin-bottom-alt:auto'>&nbsp;<o:p></o:p></p><p class=3DMsoNormal style=3D'=
mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'><b>Thanks &amp; regar=
ds</b><o:p></o:p></p><p class=3DMsoNormal style=3D'mso-margin-top-alt:aut=
o;mso-margin-bottom-alt:auto'><b>Jithin Raj</b><o:p></o:p></p><p class=3D=
MsoNormal style=3D'mso-margin-top-alt:auto;mso-margin-bottom-alt:auto'>&n=
bsp;<o:p></o:p></p></div><div><p class=3DMsoNormal>&nbsp;<o:p></o:p></p><=
/div><p class=3DMsoNormal>***** Confidentiality Statement/Disclaimer ****=
*<br><br>This message and any attachments is intended for the sole use of=
 the intended recipient. It may contain confidential information. Any una=
uthorized use, dissemination or modification is strictly prohibited. If y=
ou are not the intended recipient, please notify the sender immediately t=
hen delete it from all your systems, and do not copy, use or print. Inter=
net communications are not secure and it is the responsibility of the rec=
ipient to make sure that it is virus/malicious code exempt.<br>The compan=
y/sender cannot be responsible for any unauthorized alterations or modifi=
cations made to the contents. If you require any form of confirmation of =
the contents, please contact the company/sender. The company/sender is no=
t liable for any errors or omissions in the content of this message.<o:p>=
</o:p></p></div></blockquote></div><blockquote style=3D'margin-top:5.0pt;=
margin-bottom:5.0pt'><div><p class=3DMsoNormal>__________________________=
_____________________<br>meta-ti mailing list<br><a href=3D"mailto:meta-t=
i@yoctoproject.org" target=3D"_blank">meta-ti@yoctoproject.org</a><br><a =
href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" target=3D"_blank=
">https://lists.yoctoproject.org/listinfo/meta-ti</a><o:p></o:p></p></div=
></blockquote></div><p class=3DMsoNormal style=3D'margin-bottom:12.0pt'><=
br>_______________________________________________<br>meta-ti mailing lis=
t<br><a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org=
</a><br><a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti" targe=
t=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-ti</a><o:p></o:=
p></p></div><p class=3DMsoNormal><br><br clear=3Dall><br>-- <o:p></o:p></=
p><div><div><div><p class=3DMsoNormal><span style=3D'color:#888888'>Bapti=
ste DURAND</span><o:p></o:p></p></div></div><p class=3DMsoNormal><o:p>&nb=
sp;</o:p></p></div></div></div></div><DIV>&nbsp;</DIV>***** Confidentiali=
ty Statement/Disclaimer *****<br><br>This message and any attachments is =
intended for the sole use of the intended recipient. It may contain confi=
dential information. Any unauthorized use, dissemination or modification =
is strictly prohibited. If you are not the intended recipient, please not=
ify the sender immediately then delete it from all your systems, and do n=
ot copy, use or print. Internet communications are not secure and it is t=
he responsibility of the recipient to make sure that it is virus/maliciou=
s code exempt.<br>The company/sender cannot be responsible for any unauth=
orized alterations or modifications made to the contents. If you require =
any form of confirmation of the contents, please contact the company/send=
er. The company/sender is not liable for any errors or omissions in the c=
ontent of this message.<br></body></html>

------_=_NextPart_001_01CEDB9C.A89BDA3E--
