Return-Path: <heroor@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 76860E017C8
	for <meta-ti@yoctoproject.org>; Wed,  6 Nov 2013 04:28:41 -0800 (PST)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rA6CSXlP022095;
	Wed, 6 Nov 2013 06:28:34 -0600
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id rA6CSV9N019473;
	Wed, 6 Nov 2013 06:28:32 -0600
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Wed, 6 Nov 2013 20:28:31 +0800
From: "Heroor, Siddharth" <heroor@ti.com>
To: Jithin Raj <jithin.raj@nestgroup.net>
Thread-Topic: [meta-ti] meat-ti(master) kernel not working with meta-ivi
Thread-Index: AQHO2uuz0odivsLNbEmV/cao2AlRmQ==
Date: Wed, 6 Nov 2013 12:28:30 +0000
Message-ID: <4FEDAB2D-AA9F-499E-BDF0-8012EE7CE508@ti.com>
References: <245245F712CBF74D865D90E99497849F06357480@mail-3.tvm.nestgroup.net>
In-Reply-To: <245245F712CBF74D865D90E99497849F06357480@mail-3.tvm.nestgroup.net>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
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
X-List-Received-Date: Wed, 06 Nov 2013 12:28:44 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4FEDAB2DAA9F499EBDF08012EE7CE508ticom_"

--_000_4FEDAB2DAA9F499EBDF08012EE7CE508ticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Jithin,

Please comments below.

--Sid

On 06-Nov-2013, at 5:33 pm, "Jithin Raj" <jithin.raj@nestgroup.net<mailto:j=
ithin.raj@nestgroup.net>> wrote:

Hi,

I am trying to build the yocto based meta-ivi (5.0), meta-ti for Pandaboard=
.
For building  I used the below procedure

1) git clone git://git.yoctoproject.org/poky
   cd poky
   git checkout dora
   cd -
2) git clone git://git.yoctoproject.org/meta-ivi
   cd meta-ivi
   git checkout 5.0
   cd -
3) git clone git://git.yoctoproject.org/meta-ti

4) source poky/oe-init-build-env

5) modified the bblayer.conf like this.
    BBLAYERS ?=3D " \
     /home/sfm/yocto/building/poky/meta \
     /home/sfm/yocto/building/poky/meta-yocto \
     /home/sfm/yocto/building/meta-ivi \
     /home/sfm/yocto/building/meta-ti \

6) modified the local.config with
                MACHINE?=3Dpandaboard

7) Add INCOMPATIBLE_LICENSE =3D "GPLv3" in COREBASE/build/conf/local.conf f=
ile.

8) Set DISTRO ?=3D "poky-ivi-systemd" in COREBASE/build/conf/local.conf fil=
e.

9) bitbake gemini-image

Once all the generated files are copied to the SD card I switched on the pa=
ndaboard es.
The pandaboard es is hanging while its loading the kernel. Please find log =
here:

Please also see if core-minimal and sato images are booting. There isn't mu=
ch active work happening on panda board and so could you check if a kernel.=
org<http://kernel.org> is booting fine?



U-Boot SPL 2011.12 (Nov 05 2013 - 14:12:29)
Texas Instruments OMAP4460 ES1.1
OMAP SD/MMC: 0
reading u-boot.img
reading u-boot.img


U-Boot 2011.12 (Nov 05 2013 - 14:12:29)

CPU  : OMAP4460 ES1.1
Board: OMAP4 Panda
I2C:   ready
DRAM:  1 GiB
MMC:   OMAP SD/MMC: 0
Using default environment

In:    serial
Out:   serial
Err:   serial
Hit any key to stop autoboot:  0
reading boot.scr

338 bytes read
Running bootscript from mmc0 ...
## Executing script at 82000000
reading uImage

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

Starting kernel ...

Uncompressing Linux... done, booting the kernel.

After this nothing is displayed.

I have few doubts in this procedure.


1)      which branch of meta-ti I have to use for dora branch? (currently a=
m using the master branch).

Master should be fine for Dora. Please also checkout the specific commits f=
rom poky as mentioned in meta-ivi.

2)      Do the master branch will work with all the poky branches (like dor=
a, dylan?

There should be Dylan branch on meta-ti that you can checkout.

       3)    Do I need to do any other modification in any file to work wit=
h pandaboard?.

I haven't tried panda recently but I could try it out early next week and r=
espond.

Thanks in advance.

Thanks & regards
Jithin Raj


***** Confidentiality Statement/Disclaimer *****

This message and any attachments is intended for the sole use of the intend=
ed recipient. It may contain confidential information. Any unauthorized use=
, dissemination or modification is strictly prohibited. If you are not the =
intended recipient, please notify the sender immediately then delete it fro=
m all your systems, and do not copy, use or print. Internet communications =
are not secure and it is the responsibility of the recipient to make sure t=
hat it is virus/malicious code exempt.
The company/sender cannot be responsible for any unauthorized alterations o=
r modifications made to the contents. If you require any form of confirmati=
on of the contents, please contact the company/sender. The company/sender i=
s not liable for any errors or omissions in the content of this message.
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_4FEDAB2DAA9F499EBDF08012EE7CE508ticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body dir=3D"auto">
<div>Hi Jithin,</div>
<div><br>
</div>
<div>Please comments below.<br>
<br>
--Sid</div>
<div><br>
On 06-Nov-2013, at 5:33 pm, &quot;Jithin Raj&quot; &lt;<a href=3D"mailto:ji=
thin.raj@nestgroup.net">jithin.raj@nestgroup.net</a>&gt; wrote:<br>
<br>
</div>
<blockquote type=3D"cite">
<div>
<meta name=3D"Generator" content=3D"Microsoft Word 12 (filtered medium)">
<style><!--
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
.MsoChpDefault
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
	mso-list-template-ids:-1919922562 67698705 67698713 67698715 67698703 6769=
8713 67698715 67698703 67698713 67698715;}
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
</o:shapelayout></xml><![endif]-->
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I am trying to build the yocto based meta-ivi (5.0),=
 meta-ti for Pandaboard.<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:black">For building&nbsp; I use=
d the below procedure<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">1) git clone git://git.yoctoproject.org/poky<o:p></o=
:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; cd poky<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; git checkout dora<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; cd -<o:p></o:p></p>
<p class=3D"MsoNormal">2) git clone git://git.yoctoproject.org/meta-ivi<o:p=
></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; cd meta-ivi<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; git checkout 5.0<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp; cd -<o:p></o:p></p>
<p class=3D"MsoNormal">3) git clone git://git.yoctoproject.org/meta-ti<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">4) source poky/oe-init-build-env<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">5) modified the bblayer.conf like this.<o:p></o:p></=
p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp; BBLAYERS ?=3D &quot; \<o:p></o:p>=
</p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; /home/sfm/yocto/building/po=
ky/meta \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; /home/sfm/yocto/building/po=
ky/meta-yocto \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; /home/sfm/yocto/building/me=
ta-ivi \<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp; /home/sfm/yocto/building/me=
ta-ti \<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">6) modified the local.config with <o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MACHINE?=3Dpandaboard<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">7) Add INCOMPATIBLE_LICENSE =3D &quot;GPLv3&quot; in=
 COREBASE/build/conf/local.conf file.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">8) Set DISTRO ?=3D &quot;poky-ivi-systemd&quot; in C=
OREBASE/build/conf/local.conf file.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">9) bitbake gemini-image<o:p></o:p></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:black">Once all the generated f=
iles are copied to the SD card I switched on the pandaboard es.<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal">The pandaboard es is hanging while its loading the k=
ernel. Please find log here:</p>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>Please also see if core-minimal and sato images are booting. There isn=
't much active work happening on panda board and so could you check if a
<a href=3D"http://kernel.org">kernel.org</a> is booting fine?</div>
<div><br>
</div>
<br>
<blockquote type=3D"cite">
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal"><b>U-Boot SPL 2011.12 (Nov 05 2013 - 14:12:29)</b><o=
:p></o:p></p>
<p class=3D"MsoNormal"><b>Texas Instruments OMAP4460 ES1.1&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; </b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>OMAP SD/MMC: 0&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>reading u-boot.img&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; </b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>reading u-boot.img</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>U-Boot 2011.12 (Nov 05 2013 - 14:12:29)</b><o:p><=
/o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>CPU&nbsp; : OMAP4460 ES1.1</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>Board: OMAP4 Panda</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>I2C:&nbsp;&nbsp; ready</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>DRAM:&nbsp; 1 GiB</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>MMC:&nbsp;&nbsp; OMAP SD/MMC: 0</b><o:p></o:p></p=
>
<p class=3D"MsoNormal"><b>Using default environment</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>In:&nbsp;&nbsp;&nbsp; serial</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>Out:&nbsp;&nbsp; serial</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>Err:&nbsp;&nbsp; serial</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>Hit any key to stop autoboot:&nbsp; 0 </b><o:p></=
o:p></p>
<p class=3D"MsoNormal"><b>reading boot.scr</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>338 bytes read</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>Running bootscript from mmc0 ...</b><o:p></o:p></=
p>
<p class=3D"MsoNormal"><b>## Executing script at 82000000</b><o:p></o:p></p=
>
<p class=3D"MsoNormal"><b>reading uImage</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>4333848 bytes read</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>## Booting kernel from Legacy Image at 80000000 .=
..</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;&nbsp; Image Name:&nbsp;&nbsp; Linux-3.4.11=
</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;&nbsp; Image Type:&nbsp;&nbsp; ARM Linux Ke=
rnel Image (uncompressed)</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;&nbsp; Data Size:&nbsp;&nbsp;&nbsp; 4333784=
 Bytes =3D 4.1 MiB</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;&nbsp; Load Address: 80008000</b><o:p></o:p=
></p>
<p class=3D"MsoNormal"><b>&nbsp;&nbsp; Entry Point:&nbsp; 80008000</b><o:p>=
</o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;&nbsp; Verifying Checksum ... OK</b><o:p></=
o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;&nbsp; Loading Kernel Image ... OK</b><o:p>=
</o:p></p>
<p class=3D"MsoNormal"><b>OK</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>Starting kernel ...</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>&nbsp;</b><o:p></o:p></p>
<p class=3D"MsoNormal"><b>Uncompressing Linux... done, booting the kernel.<=
/b><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
<p class=3D"MsoNormal">After this nothing is displayed.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I have few doubts in this procedure.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo2"><!--[if !supportLists]--><span style=3D"mso-list:Ignore">1)<span st=
yle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;
</span></span><!--[endif]--><b>which branch of meta-ti I have to use for do=
ra branch</b>? (currently am using the master branch).</p>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>Master should be fine for Dora. Please also checkout the specific comm=
its from poky as mentioned in meta-ivi.</div>
<blockquote type=3D"cite">
<div>
<div class=3D"WordSection1">
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo2"><o:p></o:p></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo2"><!--[if !supportLists]--><span style=3D"mso-list:Ignore">2)<span st=
yle=3D"font:7.0pt &quot;Times New Roman&quot;">&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;
</span></span><!--[endif]--><b>Do the master branch will work with all the =
poky branches</b> (like dora, dylan?</p>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>There should be Dylan branch on meta-ti that you can checkout.</div>
<div><br>
</div>
<blockquote type=3D"cite">
<div>
<div class=3D"WordSection1">
<p class=3D"MsoListParagraph" style=3D"text-indent:-.25in;mso-list:l0 level=
1 lfo2"><o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3) &nbsp;&=
nbsp;&nbsp;<b>Do I need to do any other modification in any file to work wi=
th pandaboard</b>?.</p>
</div>
</div>
</blockquote>
<div><br>
</div>
<div>I haven't tried panda recently but I could try it out early next week =
and respond.&nbsp;</div>
<blockquote type=3D"cite">
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks in advance.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><b><span style=3D"color:black">Thanks &amp; regards<=
o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><b><span style=3D"color:black">Jithin Raj<o:p></o:p>=
</span></b></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>&nbsp;</div>
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
<blockquote type=3D"cite">
<div><span>_______________________________________________</span><br>
<span>meta-ti mailing list</span><br>
<span><a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org<=
/a></span><br>
<span><a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://l=
ists.yoctoproject.org/listinfo/meta-ti</a></span><br>
</div>
</blockquote>
</body>
</html>

--_000_4FEDAB2DAA9F499EBDF08012EE7CE508ticom_--
