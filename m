Return-Path: <prathamesh.ghanekar@igate.com>
Received: from as3.igate.com (as3.igate.com [63.241.95.186])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F616E0156E
	for <meta-ti@yoctoproject.org>; Tue,  6 Aug 2013 04:43:18 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="4.89,826,1367996400"; 
	d="jpg'145?scan'145,208,217,145";a="30974064"
Received: from unknown (HELO IGTEMUMCAHT03.igatecorp.com) ([10.216.6.50])
	by as3.igate.com with ESMTP/TLS/AES128-SHA; 06 Aug 2013 04:40:15 -0700
Received: from IGTEMUMMB11.igatecorp.com ([fe80::64fc:7b51:1204:8a04]) by
	IGTEMUMCAHT03.igatecorp.com ([::1]) with mapi id 14.03.0146.000;
	Tue, 6 Aug 2013 17:13:09 +0530
From: Prathamesh P Ghanekar <prathamesh.ghanekar@igate.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: unable to fetch a repository mentioned in SRC_URI
Thread-Index: Ac6Smh64xb634eWdRHC5UAFJ5/QTlw==
Date: Tue, 6 Aug 2013 11:43:08 +0000
Message-ID: <2BC3ECFBDE78594E858F96993713F3F9011FA5E2@IGTEMUMMB11.igatecorp.com>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.216.5.8]
MIME-Version: 1.0
Subject: unable to fetch a repository mentioned in SRC_URI
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
X-List-Received-Date: Tue, 06 Aug 2013 11:43:19 -0000
X-Groupsio-MsgNum: 3100
Content-Language: en-US
Content-Type: multipart/related;
	boundary="_004_2BC3ECFBDE78594E858F96993713F3F9011FA5E2IGTEMUMMB11igat_";
	type="multipart/alternative"

--_004_2BC3ECFBDE78594E858F96993713F3F9011FA5E2IGTEMUMMB11igat_
Content-Type: multipart/alternative;
	boundary="_000_2BC3ECFBDE78594E858F96993713F3F9011FA5E2IGTEMUMMB11igat_"

--_000_2BC3ECFBDE78594E858F96993713F3F9011FA5E2IGTEMUMMB11igat_
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

I am trying to integrate meta-ti layer into the current yocto project. I wi=
sh to build the image for pandaboard.

I am adding another layer called meta-ivi in the yocto kernel which provide=
d functionality for in-vehicle infotainment systems. In the meta-ivi layer,=
 there is a recipe "foton-image", which builds GENIVI compliant baseline im=
age. Also, few recipes were masked to resolve the license issue.

So, setting all the variables in the conf/local.conf and conf/bblayers.conf=
 file, I build the image as follows.


=E8 bitbake foton-image


I ended up with following error, which indicates that there's a failure in =
fetching the repository.

Here is the output log for your reference:

prathamesh@mintos ~/workdir/poky-dylan-9.0.1/build $ bitbake foton-image
Loading cache: 100% |######################################################=
###########################################################################=
##| ETA:  00:00:00
Loaded 1220 entries from dependency cache.

Build Configuration:
BB_VERSION        =3D "1.18.0"
BUILD_SYS         =3D "i686-linux"
NATIVELSBSTRING   =3D "LinuxMint-14"
TARGET_SYS        =3D "arm-oe-linux-gnueabi"
MACHINE           =3D "pandaboard"
DISTRO            =3D "poky-ivi-systemd"
DISTRO_VERSION    =3D "4.0.2"
TUNE_FEATURES     =3D "armv7a vfp neon"
TARGET_FPU        =3D "vfp-neon"
meta
meta-yocto
meta-yocto-bsp
meta-ivi-4.0.2    =3D "<unknown>:<unknown>"
meta-ti           =3D "master:c14c386946e1ea341faeea292580e37d538d645d"

NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for u-boot (u-boot, u-boot-ti-stagin=
g)
NOTE: consider defining a PREFERRED_PROVIDER entry to match u-boot
NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
WARNING: Failed to fetch URL git://dev.omapzoom.org/pub/scm/integration/ker=
nel-ubuntu.git;protocol=3Dgit;branch=3Dti-ubuntu-3.4-1487<http://dev.omapzo=
om.org/pub/scm/integration/kernel-ubuntu.git;protocol=3Dgit;branch=3Dti-ubu=
ntu-3.4-1487>, attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command failed with exit code 128, output:
Cloning into bare repository '/home/prathamesh/workdir/poky-dylan-9.0.1/bui=
ld/downloads/git2/dev.omapzoom.org.pub.scm.integration.kernel-ubuntu.git'...

fatal: The remote end hung up unexpectedly
fatal: early EOF
fatal: index-pack failed

ERROR: Function failed: Fetcher failure for URL: 'git://dev.omapzoom.org/pu=
b/scm/integration/kernel-ubuntu.git;protocol=3Dgit;branch=3Dti-ubuntu-3.4-1=
487<http://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=
=3Dgit;branch=3Dti-ubuntu-3.4-1487>'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/prathamesh/workdir/poky-dylan-9.=
0.1/build/tmp-eglibc-eglibc/work/pandaboard-oe-linux-gnueabi/linux-omap4/3.=
4-r0/temp/log.do_fetch.4257
ERROR: Task 910 (/home/prathamesh/workdir/meta-ti/recipes-kernel/linux/linu=
x-omap4_3.4.bb<http://linux-omap4_3.4.bb>, do_fetch) failed with exit code =
'1'
NOTE: Tasks Summary: Attempted 2323 tasks of which 2231 didn't need to be r=
erun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /home/prathamesh/workdir/meta-ti/recipes-kernel/linux/linux-omap4_3.4.bb<=
http://linux-omap4_3.4.bb>, do_fetch
Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

Note:
1. I have successfully built the foton-image for target vexpressa9, and it =
boots without any errors in the qemu emulator.
2. I am able to 'git clone' the above mentioned repository. If you could le=
t me know how can I use the local repository for build process. I tried cop=
ying the repository in downloads folder, but it did not work somehow.
Plz help me out with this issue..!
Thanks in advance for your reply..:)

Thanks and Regards,

Prathamesh Ghanekar
Senior Software Engineer,P&ES
[Description: Description: cid:image001.jpg@01CD342D.E32AAD50]
...........................................................................=
.................................
Unit 20, SDF-7, SEEPZ SEZ, Andheri(East),Mumbai-400096



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Disclaimer~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Information contained and transmitted by this e-mail is confidential and pr=
oprietary to iGATE and its affiliates and is intended for use only by the r=
ecipient. If you are not the intended recipient, you are hereby notified th=
at any dissemination, distribution, copying or use of this e-mail is strict=
ly prohibited and you are requested to delete this e-mail immediately and n=
otify the originator or mailadmin@igate.com <mailto:mailadmin@igate.com>. i=
GATE does not enter into any agreement with any party by e-mail. Any views =
expressed by an individual do not necessarily reflect the view of iGATE. iG=
ATE is not responsible for the consequences of any actions taken on the bas=
is of information provided, through this email. The contents of an attachme=
nt to this e-mail may contain software viruses, which could damage your own=
 computer system. While iGATE has taken every reasonable precaution to mini=
mise this risk, we cannot accept liability for any damage which you sustain=
 as a result of software viruses. You should carry out your own virus check=
s before opening an attachment. To know more about iGATE please visit www.i=
gate.com <http://www.igate.com>.
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

--_000_2BC3ECFBDE78594E858F96993713F3F9011FA5E2IGTEMUMMB11igat_
Content-Type: text/html; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Wingdings;
	panose-1:5 0 0 0 0 0 0 0 0 0;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"Bookman Old Style";
	panose-1:2 5 6 4 5 5 5 2 2 4;}
@font-face
	{font-family:"MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
@font-face
	{font-family:"\@MS PGothic";
	panose-1:2 11 6 0 7 2 5 8 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0cm;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";
	mso-fareast-language:EN-US;}
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:218447156;
	mso-list-type:hybrid;
	mso-list-template-ids:471253110 1674620318 1074331651 1074331653 107433164=
9 1074331651 1074331653 1074331649 1074331651 1074331653;}
@list l0:level1
	{mso-level-start-at:0;
	mso-level-number-format:bullet;
	mso-level-text:\F0E8;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;
	mso-fareast-font-family:Calibri;
	mso-bidi-font-family:Calibri;}
@list l0:level2
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level3
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level4
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level5
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level6
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
@list l0:level7
	{mso-level-number-format:bullet;
	mso-level-text:\F0B7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Symbol;}
@list l0:level8
	{mso-level-number-format:bullet;
	mso-level-text:o;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:"Courier New";}
@list l0:level9
	{mso-level-number-format:bullet;
	mso-level-text:\F0A7;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;
	font-family:Wingdings;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Hello,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I am trying to integra=
te meta-ti layer into the current yocto project. I wish to build the image =
for pandaboard.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I am adding another la=
yer called
</span><span style=3D"color:#00B050">meta-ivi </span><span style=3D"color:#=
1F497D">in the yocto kernel which provided functionality for in-vehicle inf=
otainment systems. In the meta-ivi layer, there is a recipe &#8220;foton-im=
age&#8221;, which builds
</span><span style=3D"color:#00B050">GENIVI compliant baseline image</span>=
<span style=3D"color:#1F497D">. Also, few recipes were masked to resolve th=
e license issue.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">So, setting all the va=
riables in the conf/local.conf and conf/bblayers.conf file, I build the ima=
ge as follows.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoListParagraph" style=3D"text-indent:-18.0pt;mso-list:l0 leve=
l1 lfo1"><![if !supportLists]><span style=3D"font-family:Wingdings;color:#0=
0B050"><span style=3D"mso-list:Ignore">=E8<span style=3D"font:7.0pt &quot;T=
imes New Roman&quot;">
</span></span></span><![endif]><i><span style=3D"color:#00B050">bitbake fot=
on-image<o:p></o:p></span></i></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">I ended up with follow=
ing error, which indicates that there&#8217;s a failure in fetching the rep=
ository.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D">Here is the output log=
 for your reference:<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#1F497D"><o:p>&nbsp;</o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">prathamesh@mintos ~/w=
orkdir/poky-dylan-9.0.1/build $ bitbake foton-image<br>
Loading cache: 100% |######################################################=
###########################################################################=
##| ETA:&nbsp; 00:00:00<br>
Loaded 1220 entries from dependency cache.<br>
<br>
Build Configuration:<br>
BB_VERSION&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;1.18.0&quot;=
<br>
BUILD_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;i686-li=
nux&quot;<br>
NATIVELSBSTRING&nbsp;&nbsp; =3D &quot;LinuxMint-14&quot;<br>
TARGET_SYS&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;arm-oe-linux=
-gnueabi&quot;<br>
MACHINE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &qu=
ot;pandaboard&quot;<br>
DISTRO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
=3D &quot;poky-ivi-systemd&quot;<br>
DISTRO_VERSION&nbsp;&nbsp;&nbsp; =3D &quot;4.0.2&quot;<br>
TUNE_FEATURES&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;armv7a vfp neon&quot;<br>
TARGET_FPU&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &quot;vfp-neon&quo=
t;<br>
meta&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; <br>
meta-yocto&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
meta-yocto-bsp&nbsp;&nbsp;&nbsp; <br>
meta-ivi-4.0.2&nbsp;&nbsp;&nbsp; =3D &quot;&lt;unknown&gt;:&lt;unknown&gt;&=
quot;<br>
meta-ti&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D &qu=
ot;master:c14c386946e1ea341faeea292580e37d538d645d&quot;<br>
<br>
NOTE: Resolving any missing task queue dependencies<br>
NOTE: multiple providers are available for u-boot (u-boot, u-boot-ti-stagin=
g)<br>
NOTE: consider defining a PREFERRED_PROVIDER entry to match u-boot<br>
NOTE: Preparing runqueue<br>
NOTE: Executing SetScene Tasks<br>
NOTE: Executing RunQueue Tasks<br>
WARNING: Failed to fetch URL git://<a href=3D"http://dev.omapzoom.org/pub/s=
cm/integration/kernel-ubuntu.git;protocol=3Dgit;branch=3Dti-ubuntu-3.4-1487=
">dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=3Dgit;bra=
nch=3Dti-ubuntu-3.4-1487</a>, attempting MIRRORS
 if available<br>
ERROR: Fetcher failure: Fetch command failed with exit code 128, output:<br>
Cloning into bare repository '/home/prathamesh/workdir/poky-dylan-9.0.1/bui=
ld/downloads/git2/dev.omapzoom.org.pub.scm.integration.kernel-ubuntu.git'..=
.<br>
<br>
fatal: The remote end hung up unexpectedly<br>
fatal: early EOF<br>
fatal: index-pack failed<br>
<br>
ERROR: Function failed: Fetcher failure for URL: 'git://<a href=3D"http://d=
ev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol=3Dgit;branch=
=3Dti-ubuntu-3.4-1487">dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.g=
it;protocol=3Dgit;branch=3Dti-ubuntu-3.4-1487</a>'.
 Unable to fetch URL from any source.<br>
ERROR: Logfile of failure stored in: /home/prathamesh/workdir/poky-dylan-9.=
0.1/build/tmp-eglibc-eglibc/work/pandaboard-oe-linux-gnueabi/linux-omap4/3.=
4-r0/temp/log.do_fetch.4257<br>
ERROR: Task 910 (/home/prathamesh/workdir/meta-ti/recipes-kernel/linux/<a h=
ref=3D"http://linux-omap4_3.4.bb">linux-omap4_3.4.bb</a>, do_fetch) failed =
with exit code '1'<br>
NOTE: Tasks Summary: Attempted 2323 tasks of which 2231 didn't need to be r=
erun and 1 failed.<br>
Waiting for 0 running tasks to finish:<br>
<br>
Summary: 1 task failed:<br>
&nbsp; /home/prathamesh/workdir/meta-ti/recipes-kernel/linux/<a href=3D"htt=
p://linux-omap4_3.4.bb">linux-omap4_3.4.bb</a>, do_fetch<br>
Summary: There was 1 WARNING message shown.<br>
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.=
<span style=3D"font-size:12.0pt;font-family:&quot;MS PGothic&quot;,&quot;sa=
ns-serif&quot;"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><i>Note:<o:p></o:p=
></i></b></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><i>1. I have succe=
ssfully built the foton-image for target vexpressa9, and it boots without a=
ny errors in the qemu emulator.<o:p></o:p></i></b></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><i>2. I am able to=
 &#8216;git clone&#8217; the above mentioned repository. If you could let m=
e know how can I use the local repository for build process. I tried copyin=
g the repository in downloads folder, but it did
 not work somehow.<o:p></o:p></i></b></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><b><i>Plz help me out=
 with this issue..!<o:p></o:p></i></b></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">Thanks in advance for=
 your reply..:)<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Bookman Old Style&q=
uot;,&quot;serif&quot;;mso-fareast-language:EN-IN">Thanks and Regards,<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:#365F91;mso-fareast-language:EN=
-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Bookman Old Style&q=
uot;,&quot;serif&quot;;color:black;mso-fareast-language:EN-IN">Prathamesh G=
hanekar<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Bookman Old Style&q=
uot;,&quot;serif&quot;;color:black;mso-fareast-language:EN-IN">Senior Softw=
are Engineer,P&amp;ES<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"color:navy;mso-fareast-language:EN-IN=
"><img border=3D"0" width=3D"142" height=3D"52" id=3D"Picture_x0020_1" src=
=3D"cid:image001.jpg@01CE92C7.54ACA1B0" alt=3D"Description: Description: ci=
d:image001.jpg@01CD342D.E32AAD50"></span><span style=3D"mso-fareast-languag=
e:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#7F7F7F;mso-fareast-la=
nguage:EN-IN">&#8230;&#8230;&#8230;&#8230;&#8230;&#8230;&#8230;&#8230;&#823=
0;&#8230;&#8230;&#8230;&#8230;&#8230;&#8230;&#8230;&#8230;&#8230;&#8230;&#8=
230;&#8230;&#8230;&#8230;&#8230;&#8230;&#8230;&#8230;&#8230;&#8230;&#8230;&=
#8230;&#8230;&#8230;&#8230;&#8230;&#8230;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:9.0pt;font-f=
amily:&quot;Arial&quot;,&quot;sans-serif&quot;;color:#7F7F7F;mso-fareast-la=
nguage:EN-IN">Unit 20, SDF-7, SEEPZ SEZ, Andheri(East),Mumbai-400096</span>=
<span lang=3D"EN-US" style=3D"color:#7F7F7F;mso-fareast-language:EN-IN"><o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-IN"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"color:#7F7F7F;mso-fare=
ast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<P>~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Disclaimer~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>Informat=
ion contained and transmitted by this e-mail is confidential and proprietar=
y to iGATE and its affiliates and is intended for use only by the recipient=
. If you are not the intended recipient, you are hereby notified that any d=
issemination, distribution, copying or use of this e-mail is strictly prohi=
bited and you are requested to delete this e-mail immediately and notify th=
e originator or <A href=3D"mailto:mailadmin@igate.com">mailadmin@igate.com<=
/A>. iGATE does not enter into any agreement with any party by e-mail. Any =
views expressed by an individual do not necessarily reflect the view of iGA=
TE. iGATE is not responsible for the consequences of any actions taken on t=
he basis of information provided, through this email. The contents of an at=
tachment to this e-mail may contain software viruses, which could damage yo=
ur own computer system. While iGATE has taken every reasonable precaution t=
o minimise this risk, we cannot accept liability for any damage which you s=
ustain as a result of software viruses. You should carry out your own virus=
 checks before opening an attachment. To know more about iGATE please visit=
 <A href=3D"http://www.igate.com">www.igate.com</A>.<br>~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br></P></body>
</html>

--_000_2BC3ECFBDE78594E858F96993713F3F9011FA5E2IGTEMUMMB11igat_--

--_004_2BC3ECFBDE78594E858F96993713F3F9011FA5E2IGTEMUMMB11igat_
Content-Type: image/jpeg; name="image001.jpg"
Content-Description: image001.jpg
Content-Disposition: inline; filename="image001.jpg"; size=3118;
	creation-date="Tue, 06 Aug 2013 11:43:08 GMT";
	modification-date="Tue, 06 Aug 2013 11:43:08 GMT"
Content-ID: <image001.jpg@01CE92C7.54ACA1B0>
Content-Transfer-Encoding: base64

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

--_004_2BC3ECFBDE78594E858F96993713F3F9011FA5E2IGTEMUMMB11igat_--
