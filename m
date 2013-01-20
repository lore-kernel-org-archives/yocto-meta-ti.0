Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7668FE00496
	for <meta-ti@yoctoproject.org>; Sun, 20 Jan 2013 10:21:01 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r0KIL0Vt014975
	for <meta-ti@yoctoproject.org>; Sun, 20 Jan 2013 12:21:00 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r0KIL0lS012039
	for <meta-ti@yoctoproject.org>; Sun, 20 Jan 2013 12:21:00 -0600
Received: from DFLE09.ent.ti.com ([fe80::3103:58c3:47f:860b]) by
	DFLE72.ent.ti.com ([fe80::5c48:b90d:af93:5822%30]) with mapi id
	14.01.0323.003; Sun, 20 Jan 2013 12:20:59 -0600
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: Issue with multi-kernel.inc
Thread-Index: Ac33Ot8tXNBpTF00T1+WvU7rKdEOYw==
Date: Sun, 20 Jan 2013 18:20:58 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C374AF1@DFLE09.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Issue with multi-kernel.inc
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
X-List-Received-Date: Sun, 20 Jan 2013 18:21:01 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C374AF1DFLE09entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C374AF1DFLE09entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am currently working on an bbappend for linux-omapl138-psp_2.6.37.bb for =
the am180x-evm machine and I am having a problem with my custom defconfig n=
ot being used. When bitbaking the recipe my defconfig is copied to the ${WO=
RKDIR} like it is supposed to but after the kernel is built I noticed the .=
config within ${S} was significantly different than ${WORKDIR}/defconfig. T=
his problem was detected when the uImage I ran did not have support for opr=
ofile even though my defconfig does include the support. I did some searchi=
ng I found the ${S}/.config is the same as meta-ti/recipes-kernel/linux/lin=
ux-omap138-psp-2.6.37/am180x-evm/configs/static.

After some debugging I found the problems lies within compileconfigs task w=
hich is defined in multi-kernel.inc.

Compileconfigs renames ${WORKDIR}/defconfig to ${WORKDIR}/defconfig.save. T=
hen it loops through all the defconfigs in the ${WORKDIR}/configs directory=
 and configures, compiles, install and deploys the kernel for each of the d=
efconfigs. The final step is to restore the original defconfig file by rena=
ming ${WORKDIR}/defconfig.save to ${WORKDIR}/defconfig. After compileconfig=
s is done do_configure is ran using ${WORKDIR}/defconfig and the usual buil=
d steps are completed.

However, the problem is the patch "Multi-kernel: fix get_kernelversion retu=
rns None for do_compileconfigs" causes compileconfigs to run after do_confi=
gure instead of before it. Therefore, ${WORKDIR}/defconfig is never copied =
to ${S}/.config and the kernel is never configured to use this .config. The=
 last .config used by do_compileconfigs to compile the kernel is used inste=
ad.

I thought a simple solution would be to call do_configure at the end of com=
pileconfigs but then I get a series of
"basename: missing operand"
and
make: *** No rule to make target `oldconfig`. Stop"

Any suggestions on how to fix this problem? This should issue be affecting =
anyone who is using a kernel that includes multi-kernel.inc.

Regards,
Franklin Cooper Jr.
Texas Instruments
Application Engineer
fcooper@ti.com<mailto:fcooper@ti.com>


--_000_8F29D6B095ED194EA1980491A5E029710C374AF1DFLE09entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
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
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
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
<p class=3D"MsoNormal">I am currently working on an bbappend for linux-omap=
l138-psp_2.6.37.bb for the am180x-evm machine and I am having a problem wit=
h my custom defconfig not being used. When bitbaking the recipe my defconfi=
g is copied to the ${WORKDIR} like
 it is supposed to but after the kernel is built I noticed the .config with=
in ${S} was significantly different than ${WORKDIR}/defconfig. This problem=
 was detected when the uImage I ran did not have support for oprofile even =
though my defconfig does include
 the support. I did some searching I found the ${S}/.config is the same as =
meta-ti/recipes-kernel/linux/linux-omap138-psp-2.6.37/am180x-evm/configs/st=
atic.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">After some debugging I found the problems lies withi=
n compileconfigs task which is defined in multi-kernel.inc.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Compileconfigs renames ${WORKDIR}/defconfig to ${WOR=
KDIR}/defconfig.save. Then it loops through all the defconfigs in the ${WOR=
KDIR}/configs directory and configures, compiles, install and deploys the k=
ernel for each of the defconfigs.
 The final step is to restore the original defconfig file by renaming ${WOR=
KDIR}/defconfig.save to ${WORKDIR}/defconfig. After compileconfigs is done =
do_configure is ran using ${WORKDIR}/defconfig and the usual build steps ar=
e completed.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">However, the problem is the patch &#8220;Multi-kerne=
l: fix get_kernelversion returns None for do_compileconfigs&#8221; causes c=
ompileconfigs to run after do_configure instead of before it. Therefore, ${=
WORKDIR}/defconfig is never copied to ${S}/.config
 and the kernel is never configured to use this .config. The last .config u=
sed by do_compileconfigs to compile the kernel is used instead.<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I thought a simple solution would be to call do_conf=
igure at the end of compileconfigs but then I get a series of<o:p></o:p></p=
>
<p class=3D"MsoNormal">&#8220;basename: missing operand&#8221; <o:p></o:p><=
/p>
<p class=3D"MsoNormal">and<o:p></o:p></p>
<p class=3D"MsoNormal">make: *** No rule to make target `oldconfig`. Stop&#=
8221;<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any suggestions on how to fix this problem? This sho=
uld issue be affecting anyone who is using a kernel that includes multi-ker=
nel.inc.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
<p class=3D"MsoNormal">Franklin Cooper Jr.<o:p></o:p></p>
<p class=3D"MsoNormal">Texas Instruments<o:p></o:p></p>
<p class=3D"MsoNormal">Application Engineer<o:p></o:p></p>
<p class=3D"MsoNormal"><a href=3D"mailto:fcooper@ti.com">fcooper@ti.com</a>=
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C374AF1DFLE09entticom_--
