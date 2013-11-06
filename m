Return-Path: <jithin.raj@nestgroup.net>
Received: from mxout-tvm.nestgroup.net (mxout-tvm.nestgroup.net
	[115.248.23.134])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0F40E017C1
	for <meta-ti@yoctoproject.org>; Wed,  6 Nov 2013 04:01:29 -0800 (PST)
Received: from mail-3.tvm.nestgroup.net ([192.168.192.79])
	by mxout-tvm.nestgroup.net (8.13.1/8.13.1) with ESMTP id rA6BsTe2023477
	for <meta-ti@yoctoproject.org>; Wed, 6 Nov 2013 17:24:30 +0530
X-MimeOLE: Produced By Microsoft Exchange V6.5
MIME-Version: 1.0
Date: Wed, 6 Nov 2013 17:31:18 +0530
Message-ID: <245245F712CBF74D865D90E99497849F06357480@mail-3.tvm.nestgroup.net>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Thread-Topic: meat-ti(master) kernel not working with meta-ivi
Thread-Index: Ac7aIsInyaJKV1MxS7+GurxeGUdwdAAAQm5gADCvibA=
From: "Jithin Raj" <jithin.raj@nestgroup.net>
To: <meta-ti@yoctoproject.org>
Subject: meat-ti(master) kernel not working with meta-ivi
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
X-List-Received-Date: Wed, 06 Nov 2013 12:01:34 -0000
Content-class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CEDAE7.E7BCF8F0"

------_=_NextPart_001_01CEDAE7.E7BCF8F0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

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

7) Add INCOMPATIBLE_LICENSE =3D "GPLv3" in COREBASE/build/conf/local.conf=

file.

=20

8) Set DISTRO ?=3D "poky-ivi-systemd" in COREBASE/build/conf/local.conf
file.

=20

9) bitbake gemini-image

=20

Once all the generated files are copied to the SD card I switched on the
pandaboard es.

The pandaboard es is hanging while its loading the kernel. Please find
log here:

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

2)      Do the master branch will work with all the poky branches (like
dora, dylan)?

       3)    Do I need to do any other modification in any file to work
with pandaboard?.

=20

Thanks in advance.

=20

Thanks & regards

Jithin Raj

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


------_=_NextPart_001_01CEDAE7.E7BCF8F0
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-mi=
crosoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:wo=
rd" xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D=
"http://www.w3.org/TR/REC-html40"><head><meta http-equiv=3DContent-Type c=
ontent=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=3D=
"Microsoft Word 12 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.5in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.EmailStyle18
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.EmailStyle19
	{mso-style-type:personal;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri","sans-serif";
	color:#1F497D;}
=2EMsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1967151220;
	mso-list-type:hybrid;
	mso-list-template-ids:-1919922562 67698705 67698713 67698715 67698703 67=
698713 67698715 67698703 67698713 67698715;}
@list l0:level1
	{mso-level-text:"%1\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level2
	{mso-level-tab-stop:1.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level3
	{mso-level-tab-stop:1.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level4
	{mso-level-tab-stop:2.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level5
	{mso-level-tab-stop:2.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level6
	{mso-level-tab-stop:3.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level7
	{mso-level-tab-stop:3.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level8
	{mso-level-tab-stop:4.0in;
	mso-level-number-position:left;
	text-indent:-.25in;}
@list l0:level9
	{mso-level-tab-stop:4.5in;
	mso-level-number-position:left;
	text-indent:-.25in;}
ol
	{margin-bottom:0in;}
ul
	{margin-bottom:0in;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue v=
link=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal>Hi,<o:p></o:=
p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>I am=
 trying to build the yocto based meta-ivi (5.0), meta-ti for Pandaboard.<=
o:p></o:p></p><p class=3DMsoNormal><span style=3D'color:black'>For buildi=
ng&nbsp; I used the below procedure<o:p></o:p></span></p><p class=3DMsoNo=
rmal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>1) git clone git://git.yoc=
toproject.org/poky<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp; cd pok=
y<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp; git checkout dora<o:p><=
/o:p></p><p class=3DMsoNormal>&nbsp;&nbsp; cd -<o:p></o:p></p><p class=3D=
MsoNormal>2) git clone git://git.yoctoproject.org/meta-ivi<o:p></o:p></p>=
<p class=3DMsoNormal>&nbsp;&nbsp; cd meta-ivi<o:p></o:p></p><p class=3DMs=
oNormal>&nbsp;&nbsp; git checkout 5.0<o:p></o:p></p><p class=3DMsoNormal>=
&nbsp;&nbsp; cd -<o:p></o:p></p><p class=3DMsoNormal>3) git clone git://g=
it.yoctoproject.org/meta-ti<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp=
;</o:p></p><p class=3DMsoNormal>4) source poky/oe-init-build-env<o:p></o:=
p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>5) m=
odified the bblayer.conf like this.<o:p></o:p></p><p class=3DMsoNormal>&n=
bsp;&nbsp;&nbsp; BBLAYERS ?=3D &quot; \<o:p></o:p></p><p class=3DMsoNorma=
l>&nbsp;&nbsp;&nbsp;&nbsp; /home/sfm/yocto/building/poky/meta \<o:p></o:p=
></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp; /home/sfm/yocto/buildi=
ng/poky/meta-yocto \<o:p></o:p></p><p class=3DMsoNormal>&nbsp;&nbsp;&nbsp=
;&nbsp; /home/sfm/yocto/building/meta-ivi \<o:p></o:p></p><p class=3DMsoN=
ormal>&nbsp;&nbsp;&nbsp;&nbsp; /home/sfm/yocto/building/meta-ti \<o:p></o=
:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>6) =
modified the local.config with <o:p></o:p></p><p class=3DMsoNormal>&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; MACHINE?=3Dpandaboard<o:p></o:p></p><p class=3DMsoNormal><o:p=
>&nbsp;</o:p></p><p class=3DMsoNormal>7) Add INCOMPATIBLE_LICENSE =3D &qu=
ot;GPLv3&quot; in COREBASE/build/conf/local.conf file.<o:p></o:p></p><p c=
lass=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal>8) Set DISTRO =
?=3D &quot;poky-ivi-systemd&quot; in COREBASE/build/conf/local.conf file.=
<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNo=
rmal>9) bitbake gemini-image<o:p></o:p></p><p class=3DMsoNormal><span sty=
le=3D'color:#1F497D'><o:p>&nbsp;</o:p></span></p><p class=3DMsoNormal><sp=
an style=3D'color:black'>Once all the generated files are copied to the S=
D card I switched on the pandaboard es.<o:p></o:p></span></p><p class=3DM=
soNormal>The pandaboard es is hanging while its loading the kernel. Pleas=
e find log here:<o:p></o:p></p><p class=3DMsoNormal>&nbsp;<o:p></o:p></p>=
<p class=3DMsoNormal><b>U-Boot SPL 2011.12 (Nov 05 2013 - 14:12:29)</b><o=
:p></o:p></p><p class=3DMsoNormal><b>Texas Instruments OMAP4460 ES1.1&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><o:p></o:p></p><p class=3DMsoN=
ormal><b>OMAP SD/MMC: 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; </b><o:p></o:p></p><p class=3DMsoNormal><b>re=
ading u-boot.img&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b=
><o:p></o:p></p><p class=3DMsoNormal><b>reading u-boot.img</b><o:p></o:p>=
</p><p class=3DMsoNormal><b>&nbsp;</b><o:p></o:p></p><p class=3DMsoNormal=
><b>&nbsp;</b><o:p></o:p></p><p class=3DMsoNormal><b>U-Boot 2011.12 (Nov =
05 2013 - 14:12:29)</b><o:p></o:p></p><p class=3DMsoNormal><b>&nbsp;</b><=
o:p></o:p></p><p class=3DMsoNormal><b>CPU&nbsp; : OMAP4460 ES1.1</b><o:p>=
</o:p></p><p class=3DMsoNormal><b>Board: OMAP4 Panda</b><o:p></o:p></p><p=
 class=3DMsoNormal><b>I2C:&nbsp;&nbsp; ready</b><o:p></o:p></p><p class=3D=
MsoNormal><b>DRAM:&nbsp; 1 GiB</b><o:p></o:p></p><p class=3DMsoNormal><b>=
MMC:&nbsp;&nbsp; OMAP SD/MMC: 0</b><o:p></o:p></p><p class=3DMsoNormal><b=
>Using default environment</b><o:p></o:p></p><p class=3DMsoNormal><b>&nbs=
p;</b><o:p></o:p></p><p class=3DMsoNormal><b>In:&nbsp;&nbsp;&nbsp; serial=
</b><o:p></o:p></p><p class=3DMsoNormal><b>Out:&nbsp;&nbsp; serial</b><o:=
p></o:p></p><p class=3DMsoNormal><b>Err:&nbsp;&nbsp; serial</b><o:p></o:p=
></p><p class=3DMsoNormal><b>Hit any key to stop autoboot:&nbsp; 0 </b><o=
:p></o:p></p><p class=3DMsoNormal><b>reading boot.scr</b><o:p></o:p></p><=
p class=3DMsoNormal><b>&nbsp;</b><o:p></o:p></p><p class=3DMsoNormal><b>3=
38 bytes read</b><o:p></o:p></p><p class=3DMsoNormal><b>Running bootscrip=
t from mmc0 ...</b><o:p></o:p></p><p class=3DMsoNormal><b>## Executing sc=
ript at 82000000</b><o:p></o:p></p><p class=3DMsoNormal><b>reading uImage=
</b><o:p></o:p></p><p class=3DMsoNormal><b>&nbsp;</b><o:p></o:p></p><p cl=
ass=3DMsoNormal><b>4333848 bytes read</b><o:p></o:p></p><p class=3DMsoNor=
mal><b>## Booting kernel from Legacy Image at 80000000 ...</b><o:p></o:p>=
</p><p class=3DMsoNormal><b>&nbsp;&nbsp; Image Name:&nbsp;&nbsp; Linux-3.=
4.11</b><o:p></o:p></p><p class=3DMsoNormal><b>&nbsp;&nbsp; Image Type:&n=
bsp;&nbsp; ARM Linux Kernel Image (uncompressed)</b><o:p></o:p></p><p cla=
ss=3DMsoNormal><b>&nbsp;&nbsp; Data Size:&nbsp;&nbsp;&nbsp; 4333784 Bytes=
 =3D 4.1 MiB</b><o:p></o:p></p><p class=3DMsoNormal><b>&nbsp;&nbsp; Load =
Address: 80008000</b><o:p></o:p></p><p class=3DMsoNormal><b>&nbsp;&nbsp; =
Entry Point:&nbsp; 80008000</b><o:p></o:p></p><p class=3DMsoNormal><b>&nb=
sp;&nbsp; Verifying Checksum ... OK</b><o:p></o:p></p><p class=3DMsoNorma=
l><b>&nbsp;&nbsp; Loading Kernel Image ... OK</b><o:p></o:p></p><p class=3D=
MsoNormal><b>OK</b><o:p></o:p></p><p class=3DMsoNormal><b>&nbsp;</b><o:p>=
</o:p></p><p class=3DMsoNormal><b>Starting kernel ...</b><o:p></o:p></p><=
p class=3DMsoNormal><b>&nbsp;</b><o:p></o:p></p><p class=3DMsoNormal><b>U=
ncompressing Linux... done, booting the kernel.</b><o:p></o:p></p><p clas=
s=3DMsoNormal>&nbsp;<o:p></o:p></p><p class=3DMsoNormal>After this nothin=
g is displayed.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><=
p class=3DMsoNormal>I have few doubts in this procedure.<o:p></o:p></p><p=
 class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoListParagraph style=
=3D'text-indent:-.25in;mso-list:l0 level1 lfo2'><![if !supportLists]><spa=
n style=3D'mso-list:Ignore'>1)<span style=3D'font:7.0pt "Times New Roman"=
'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span></span><![endif]><b>which branch =
of meta-ti I have to use for dora branch</b>? (currently am using the mas=
ter branch).<o:p></o:p></p><p class=3DMsoListParagraph style=3D'text-inde=
nt:-.25in;mso-list:l0 level1 lfo2'><![if !supportLists]><span style=3D'ms=
o-list:Ignore'>2)<span style=3D'font:7.0pt "Times New Roman"'>&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; </span></span><![endif]><b>Do the master branch will =
work with all the poky branches</b> (like dora, dylan)?<o:p></o:p></p><p =
class=3DMsoNormal>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3) &nbsp;&nbs=
p;&nbsp;<b>Do I need to do any other modification in any file to work wit=
h pandaboard</b>?.<o:p></o:p></p><p class=3DMsoNormal><o:p>&nbsp;</o:p></=
p><p class=3DMsoNormal>Thanks in advance.<o:p></o:p></p><p class=3DMsoNor=
mal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><b><span style=3D'color:bla=
ck'>Thanks &amp; regards<o:p></o:p></span></b></p><p class=3DMsoNormal><b=
><span style=3D'color:black'>Jithin Raj<o:p></o:p></span></b></p><p class=
=3DMsoNormal><o:p>&nbsp;</o:p></p></div><DIV>&nbsp;</DIV>***** Confidenti=
ality Statement/Disclaimer *****<br><br>This message and any attachments =
is intended for the sole use of the intended recipient. It may contain co=
nfidential information. Any unauthorized use, dissemination or modificati=
on is strictly prohibited. If you are not the intended recipient, please =
notify the sender immediately then delete it from all your systems, and d=
o not copy, use or print. Internet communications are not secure and it i=
s the responsibility of the recipient to make sure that it is virus/malic=
ious code exempt.<br>The company/sender cannot be responsible for any una=
uthorized alterations or modifications made to the contents. If you requi=
re any form of confirmation of the contents, please contact the company/s=
ender. The company/sender is not liable for any errors or omissions in th=
e content of this message.<br></body></html>

------_=_NextPart_001_01CEDAE7.E7BCF8F0--
