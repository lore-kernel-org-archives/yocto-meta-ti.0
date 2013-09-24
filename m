Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D64BE015E1
	for <meta-ti@yoctoproject.org>; Tue, 24 Sep 2013 06:02:27 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8OD2Oin013639;
	Tue, 24 Sep 2013 08:02:24 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8OD2OW1010028;
	Tue, 24 Sep 2013 08:02:24 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.02.0342.003; Tue, 24 Sep 2013 08:02:24 -0500
From: "Cooper Jr., Franklin" <fcooper@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "denis@denix.org" <denis@denix.org>, 
	"meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] [PATCH 1/4] linux*: don't force KERNEL_IMAGETYPE
	from recipes, let machine config set it
Thread-Index: AQHOuM29vOGDmgXwS0mi8rOrIj4k4pnU1T9AgABXFID//60pkA==
Date: Tue, 24 Sep 2013 13:02:23 +0000
Message-ID: <8F29D6B095ED194EA1980491A5E029710C55C293@DFLE08.ent.ti.com>
References: <1379989631-8098-1-git-send-email-denis@denix.org>,
	<8F29D6B095ED194EA1980491A5E029710C55C1D9@DFLE08.ent.ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E8AFDD6@DLEE08.ent.ti.com>
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE72E8AFDD6@DLEE08.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Subject: Re: [PATCH 1/4] linux*: don't force KERNEL_IMAGETYPE from recipes, let machine config set it
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
X-List-Received-Date: Tue, 24 Sep 2013 13:02:30 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8F29D6B095ED194EA1980491A5E029710C55C293DFLE08entticom_"

--_000_8F29D6B095ED194EA1980491A5E029710C55C293DFLE08entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

But what happens to the 335x 3.2 kernel recipe? I am ok with the machine's =
setting the default KERNEL_IMAGE but to unbreak similar recipes the KERNEL_=
IMAGE would need to be overridden.

From: Dmytriyenko, Denys
Sent: Tuesday, September 24, 2013 7:53 AM
To: denis@denix.org; meta-ti@yoctoproject.org; Cooper Jr., Franklin
Subject: RE: [meta-ti] [PATCH 1/4] linux*: don't force KERNEL_IMAGETYPE fro=
m recipes, let machine config set it

All machines set their kernel image types. The default is uImage. Only thos=
e with newer u-boot and 3.12 kernel by default change to zImage. The old on=
es are still uImage.


Denys


-----Original Message-----
From: Cooper Jr., Franklin [fcooper@ti.com]
Received: Tuesday, 24 Sep 2013, 8:47
To: Denys Dmytriyenko [denis@denix.org]; meta-ti@yoctoproject.org<mailto:me=
ta-ti@yoctoproject.org> [meta-ti@yoctoproject.org]
Subject: Re: [meta-ti] [PATCH 1/4] linux*: don't force KERNEL_IMAGETYPE fro=
m recipes, let machine config set it
Since the uImage -> zImage change is being pushed by U-boot I am assuming t=
his has more to do with the newer U-boot versions. Since a lot of these ker=
nels will not work on a newer u-boot I wouldn't make this change on any <3.=
8 kernel recipes.

I don't understand the reason for this switch so I could be wrong.

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org<mailto:meta-ti-bounces@yoctoprojec=
t.org> [mailto:meta-ti-
> bounces@yoctoproject.org<mailto:bounces@yoctoproject.org>] On Behalf Of D=
enys Dmytriyenko
> Sent: Monday, September 23, 2013 9:27 PM
> To: meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> Subject: [meta-ti] [PATCH 1/4] linux*: don't force KERNEL_IMAGETYPE from
> recipes, let machine config set it
>
> From: Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com>>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com<mailto:denys@ti.com>>
> ---
>  recipes-kernel/linux/linux-am335x-psp_3.2.bb      | 2 --
>  recipes-kernel/linux/linux-davinci_git.bb         | 1 -
>  recipes-kernel/linux/linux-mainline_3.2.bb        | 1 -
>  recipes-kernel/linux/linux-omap-psp_2.6.32.bb     | 1 -
>  recipes-kernel/linux/linux-omap_2.6.37.bb         | 1 -
>  recipes-kernel/linux/linux-omap_2.6.39.bb         | 1 -
>  recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb | 1 -
>  recipes-kernel/linux/linux-ti-glsdk_3.8.bb        | 1 -
>  recipes-kernel/linux/linux-ti-staging_3.8.bb      | 1 -
>  recipes-kernel/linux/linux-ti-staging_git.bb      | 1 -
>  recipes-kernel/linux/linux-ti33x-psp_3.2.bb       | 1 -
>  recipes-kernel/linux/linux_3.0.bb                 | 1 -
>  recipes-kernel/linux/linux_3.1.bb                 | 1 -
>  recipes-kernel/linux/linux_3.3.7.bb               | 2 --
>  14 files changed, 16 deletions(-)
>
> diff --git a/recipes-kernel/linux/linux-am335x-psp_3.2.bb b/recipes-
> kernel/linux/linux-am335x-psp_3.2.bb
> index eaf788f..b5783eb 100644
> --- a/recipes-kernel/linux/linux-am335x-psp_3.2.bb
> +++ b/recipes-kernel/linux/linux-am335x-psp_3.2.bb
> @@ -12,8 +12,6 @@ require setup-defconfig.inc  # Stage the power
> management firmware before building the kernel  DEPENDS +=3D "am33x-cm3"
>
> -KERNEL_IMAGETYPE =3D "uImage"
> -
>  # The main PR is now using MACHINE_KERNEL_PR, for ti33x see
> conf/machine/include/ti33x.inc  MACHINE_KERNEL_PR_append =3D
> "h+gitr${SRCPV}"
>
> diff --git a/recipes-kernel/linux/linux-davinci_git.bb b/recipes-kernel/l=
inux/linux-
> davinci_git.bb
> index e4b85d6..03eeb46 100644
> --- a/recipes-kernel/linux/linux-davinci_git.bb
> +++ b/recipes-kernel/linux/linux-davinci_git.bb
> @@ -1,7 +1,6 @@
>  require multi-kernel.inc
>
>  DESCRIPTION =3D "Linux kernel for DaVinci processors"
> -KERNEL_IMAGETYPE =3D "uImage"
>
>  COMPATIBLE_MACHINE =3D "hawkboard"
>
> diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-
> kernel/linux/linux-mainline_3.2.bb
> index 7eafdfa..7b4a2a2 100644
> --- a/recipes-kernel/linux/linux-mainline_3.2.bb
> +++ b/recipes-kernel/linux/linux-mainline_3.2.bb
> @@ -1,7 +1,6 @@
>  require linux.inc
>
>  DESCRIPTION =3D "Linux kernel for TI processors"
> -KERNEL_IMAGETYPE =3D "uImage"
>
>  COMPATIBLE_MACHINE =3D "(beagleboard)"
>
> diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb b/recipes-
> kernel/linux/linux-omap-psp_2.6.32.bb
> index 61fc24f..9f7c472 100644
> --- a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
> +++ b/recipes-kernel/linux/linux-omap-psp_2.6.32.bb
> @@ -3,7 +3,6 @@ require multi-kernel.inc  MULTI_CONFIG_BASE_SUFFIX =3D ""
>
>  DESCRIPTION =3D "Linux kernel for OMAP processors"
> -KERNEL_IMAGETYPE =3D "uImage"
>
>  COMPATIBLE_MACHINE =3D "am3517-crane|beagleboard|omap3evm|am3517-
> evm|dm37x-evm|am37x-evm|omap3-touchbook|overo"
>
> diff --git a/recipes-kernel/linux/linux-omap_2.6.37.bb b/recipes-
> kernel/linux/linux-omap_2.6.37.bb
> index 62076fb..0a14cc8 100644
> --- a/recipes-kernel/linux/linux-omap_2.6.37.bb
> +++ b/recipes-kernel/linux/linux-omap_2.6.37.bb
> @@ -1,7 +1,6 @@
>  require multi-kernel.inc
>
>  DESCRIPTION =3D "Linux kernel for OMAP processors"
> -KERNEL_IMAGETYPE =3D "uImage"
>
>  COMPATIBLE_MACHINE =3D "(beagleboard|overo|omap3evm|omap3-
> touchbook)"
>
> diff --git a/recipes-kernel/linux/linux-omap_2.6.39.bb b/recipes-
> kernel/linux/linux-omap_2.6.39.bb
> index ae90ad2..430fa09 100644
> --- a/recipes-kernel/linux/linux-omap_2.6.39.bb
> +++ b/recipes-kernel/linux/linux-omap_2.6.39.bb
> @@ -1,7 +1,6 @@
>  require linux.inc
>
>  DESCRIPTION =3D "Linux kernel for OMAP processors"
> -KERNEL_IMAGETYPE =3D "uImage"
>
>  COMPATIBLE_MACHINE =3D "(beagleboard)"
>
> diff --git a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb b/recipes-
> kernel/linux/linux-omapl138-psp_2.6.37.bb
> index e4a5451..a138fb6 100644
> --- a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
> +++ b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb
> @@ -1,7 +1,6 @@
>  SECTION =3D "kernel"
>  DESCRIPTION =3D "Linux kernel for OMAPL1 machines from PSP, based on lin=
ux-
> davinci kernel"
>  LICENSE =3D "GPLv2"
> -KERNEL_IMAGETYPE =3D "uImage"
>
>  require multi-kernel.inc
>  require tipspkernel.inc
> diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-
> kernel/linux/linux-ti-glsdk_3.8.bb
> index 5fd17f8..09204a6 100644
> --- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> +++ b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb
> @@ -2,7 +2,6 @@ SECTION =3D "kernel"
>  DESCRIPTION =3D "Linux kernel for TI devices supported by the GLSDK prod=
uct"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7<file:///\\COPYING;=
md5=3Dd7810fab7487fb0aad327b76f1be7cd7>"
> -KERNEL_IMAGETYPE =3D "uImage"
>
>  inherit kernel
>
> diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-
> kernel/linux/linux-ti-staging_3.8.bb
> index fd7b671..f0659f2 100644
> --- a/recipes-kernel/linux/linux-ti-staging_3.8.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_3.8.bb
> @@ -2,7 +2,6 @@ SECTION =3D "kernel"
>  DESCRIPTION =3D "Linux kernel for TI devices"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7<file:///\\COPYING;=
md5=3Dd7810fab7487fb0aad327b76f1be7cd7>"
> -KERNEL_IMAGETYPE =3D "uImage"
>
>  inherit kernel
>
> diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-
> kernel/linux/linux-ti-staging_git.bb
> index 694a164..d3d11d2 100644
> --- a/recipes-kernel/linux/linux-ti-staging_git.bb
> +++ b/recipes-kernel/linux/linux-ti-staging_git.bb
> @@ -2,7 +2,6 @@ SECTION =3D "kernel"
>  DESCRIPTION =3D "Linux kernel for TI devices"
>  LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7<file:///\\COPYING;=
md5=3Dd7810fab7487fb0aad327b76f1be7cd7>"
> -KERNEL_IMAGETYPE =3D "uImage"
>
>  inherit kernel
>
> diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-
> kernel/linux/linux-ti33x-psp_3.2.bb
> index 4200d03..a9f7ac2 100644
> --- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> +++ b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb
> @@ -1,7 +1,6 @@
>  SECTION =3D "kernel"
>  DESCRIPTION =3D "Linux kernel for TI33x EVM from PSP, based on am335x-
> kernel"
>  LICENSE =3D "GPLv2"
> -KERNEL_IMAGETYPE =3D "uImage"
>
>  require multi-kernel.inc
>  require tipspkernel.inc
> diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/lin=
ux_3.0.bb
> index 522a87d..3aae2ca 100644
> --- a/recipes-kernel/linux/linux_3.0.bb
> +++ b/recipes-kernel/linux/linux_3.0.bb
> @@ -1,7 +1,6 @@
>  require linux.inc
>
>  DESCRIPTION =3D "Linux kernel for TI processors"
> -KERNEL_IMAGETYPE =3D "uImage"
>
>  COMPATIBLE_MACHINE =3D "(beagleboard)"
>
> diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/lin=
ux_3.1.bb
> index d6ed98c..110d26c 100644
> --- a/recipes-kernel/linux/linux_3.1.bb
> +++ b/recipes-kernel/linux/linux_3.1.bb
> @@ -3,7 +3,6 @@ require linux.inc
>  COMPATIBLE_MACHINE =3D "beagleboard"
>
>  DESCRIPTION =3D "Linux kernel for TI processors"
> -KERNEL_IMAGETYPE =3D "uImage"
>
>  DEFAULT_PREFERENCE =3D "-99"
>
> diff --git a/recipes-kernel/linux/linux_3.3.7.bb b/recipes-
> kernel/linux/linux_3.3.7.bb
> index e38b6c2..aca5c53 100644
> --- a/recipes-kernel/linux/linux_3.3.7.bb
> +++ b/recipes-kernel/linux/linux_3.3.7.bb
> @@ -11,8 +11,6 @@ COMPATIBLE_MACHINE =3D "beagleboard"
>  inherit kernel
>  require setup-defconfig.inc
>
> -KERNEL_IMAGETYPE =3D "uImage"
> -
>  # The main PR is now using MACHINE_KERNEL_PR, for beagleboard see  #
> conf/machine/include/omap3.inc  MACHINE_KERNEL_PR_append =3D
> "b+gitr${SRCREV}"
> --
> 1.8.3.2
>
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
> https://lists.yoctoproject.org/listinfo/meta-ti
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_8F29D6B095ED194EA1980491A5E029710C55C293DFLE08entticom_
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
p.emailquote, li.emailquote, div.emailquote
	{mso-style-name:emailquote;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:1.0pt;
	border:none;
	padding:0in;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
span.EmailStyle18
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
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">But what happens to the 3=
35x 3.2 kernel recipe? I am ok with the machine&#8217;s setting the default=
 KERNEL_IMAGE but to unbreak similar recipes the KERNEL_IMAGE
 would need to be overridden.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Dmytriye=
nko, Denys
<br>
<b>Sent:</b> Tuesday, September 24, 2013 7:53 AM<br>
<b>To:</b> denis@denix.org; meta-ti@yoctoproject.org; Cooper Jr., Franklin<=
br>
<b>Subject:</b> RE: [meta-ti] [PATCH 1/4] linux*: don't force KERNEL_IMAGET=
YPE from recipes, let machine config set it<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt;font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;color:bla=
ck">All machines set their kernel image types. The default is uImage. Only =
those with newer u-boot and 3.12 kernel by default change
 to zImage. The old ones are still uImage.<br>
<br>
<br>
Denys<br>
<br>
<br>
-----Original Message----- <br>
<b>From:</b> Cooper Jr., Franklin [fcooper@ti.com]<br>
<b>Received:</b> Tuesday, 24 Sep 2013, 8:47<br>
<b>To:</b> Denys Dmytriyenko [denis@denix.org]; <a href=3D"mailto:meta-ti@y=
octoproject.org">
meta-ti@yoctoproject.org</a> [meta-ti@yoctoproject.org]<br>
<b>Subject:</b> Re: [meta-ti] [PATCH 1/4] linux*: don't force KERNEL_IMAGET=
YPE from recipes, let machine config set it<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">Since the uImage -&=
gt; zImage change is being pushed by U-boot I am assuming this has more to =
do with the newer U-boot versions. Since a lot of these kernels will not wo=
rk on a newer u-boot I wouldn't make this
 change on any &lt;3.8 kernel recipes.<br>
<br>
I don't understand the reason for this switch so I could be wrong.<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:meta-ti-bounces@yoctoproject.org">meta-ti-boun=
ces@yoctoproject.org</a> [mailto:meta-ti-<br>
&gt; <a href=3D"mailto:bounces@yoctoproject.org">bounces@yoctoproject.org</=
a>] On Behalf Of Denys Dmytriyenko<br>
&gt; Sent: Monday, September 23, 2013 9:27 PM<br>
&gt; To: <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.o=
rg</a><br>
&gt; Subject: [meta-ti] [PATCH 1/4] linux*: don't force KERNEL_IMAGETYPE fr=
om<br>
&gt; recipes, let machine config set it<br>
&gt; <br>
&gt; From: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@ti.c=
om</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">d=
enys@ti.com</a>&gt;<br>
&gt; ---<br>
&gt;&nbsp; recipes-kernel/linux/linux-am335x-psp_3.2.bb&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | 2 --<br>
&gt;&nbsp; recipes-kernel/linux/linux-davinci_git.bb&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 1 -<br>
&gt;&nbsp; recipes-kernel/linux/linux-mainline_3.2.bb&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; | 1 -<br>
&gt;&nbsp; recipes-kernel/linux/linux-omap-psp_2.6.32.bb&nbsp;&nbsp;&nbsp;&=
nbsp; | 1 -<br>
&gt;&nbsp; recipes-kernel/linux/linux-omap_2.6.37.bb&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 1 -<br>
&gt;&nbsp; recipes-kernel/linux/linux-omap_2.6.39.bb&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; | 1 -<br>
&gt;&nbsp; recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb | 1 -<br>
&gt;&nbsp; recipes-kernel/linux/linux-ti-glsdk_3.8.bb&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; | 1 -<br>
&gt;&nbsp; recipes-kernel/linux/linux-ti-staging_3.8.bb&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | 1 -<br>
&gt;&nbsp; recipes-kernel/linux/linux-ti-staging_git.bb&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; | 1 -<br>
&gt;&nbsp; recipes-kernel/linux/linux-ti33x-psp_3.2.bb&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; | 1 -<br>
&gt;&nbsp; recipes-kernel/linux/linux_3.0.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 -<br>
&gt;&nbsp; recipes-kernel/linux/linux_3.1.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 1 -<br>
&gt;&nbsp; recipes-kernel/linux/linux_3.3.7.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 2 --<br>
&gt;&nbsp; 14 files changed, 16 deletions(-)<br>
&gt; <br>
&gt; diff --git a/recipes-kernel/linux/linux-am335x-psp_3.2.bb b/recipes-<b=
r>
&gt; kernel/linux/linux-am335x-psp_3.2.bb<br>
&gt; index eaf788f..b5783eb 100644<br>
&gt; --- a/recipes-kernel/linux/linux-am335x-psp_3.2.bb<br>
&gt; &#43;&#43;&#43; b/recipes-kernel/linux/linux-am335x-psp_3.2.bb<br>
&gt; @@ -12,8 &#43;12,6 @@ require setup-defconfig.inc&nbsp; # Stage the po=
wer<br>
&gt; management firmware before building the kernel&nbsp; DEPENDS &#43;=3D =
&quot;am33x-cm3&quot;<br>
&gt; <br>
&gt; -KERNEL_IMAGETYPE =3D &quot;uImage&quot;<br>
&gt; -<br>
&gt;&nbsp; # The main PR is now using MACHINE_KERNEL_PR, for ti33x see<br>
&gt; conf/machine/include/ti33x.inc&nbsp; MACHINE_KERNEL_PR_append =3D<br>
&gt; &quot;h&#43;gitr${SRCPV}&quot;<br>
&gt; <br>
&gt; diff --git a/recipes-kernel/linux/linux-davinci_git.bb b/recipes-kerne=
l/linux/linux-<br>
&gt; davinci_git.bb<br>
&gt; index e4b85d6..03eeb46 100644<br>
&gt; --- a/recipes-kernel/linux/linux-davinci_git.bb<br>
&gt; &#43;&#43;&#43; b/recipes-kernel/linux/linux-davinci_git.bb<br>
&gt; @@ -1,7 &#43;1,6 @@<br>
&gt;&nbsp; require multi-kernel.inc<br>
&gt; <br>
&gt;&nbsp; DESCRIPTION =3D &quot;Linux kernel for DaVinci processors&quot;<=
br>
&gt; -KERNEL_IMAGETYPE =3D &quot;uImage&quot;<br>
&gt; <br>
&gt;&nbsp; COMPATIBLE_MACHINE =3D &quot;hawkboard&quot;<br>
&gt; <br>
&gt; diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-<br>
&gt; kernel/linux/linux-mainline_3.2.bb<br>
&gt; index 7eafdfa..7b4a2a2 100644<br>
&gt; --- a/recipes-kernel/linux/linux-mainline_3.2.bb<br>
&gt; &#43;&#43;&#43; b/recipes-kernel/linux/linux-mainline_3.2.bb<br>
&gt; @@ -1,7 &#43;1,6 @@<br>
&gt;&nbsp; require linux.inc<br>
&gt; <br>
&gt;&nbsp; DESCRIPTION =3D &quot;Linux kernel for TI processors&quot;<br>
&gt; -KERNEL_IMAGETYPE =3D &quot;uImage&quot;<br>
&gt; <br>
&gt;&nbsp; COMPATIBLE_MACHINE =3D &quot;(beagleboard)&quot;<br>
&gt; <br>
&gt; diff --git a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb b/recipes-<=
br>
&gt; kernel/linux/linux-omap-psp_2.6.32.bb<br>
&gt; index 61fc24f..9f7c472 100644<br>
&gt; --- a/recipes-kernel/linux/linux-omap-psp_2.6.32.bb<br>
&gt; &#43;&#43;&#43; b/recipes-kernel/linux/linux-omap-psp_2.6.32.bb<br>
&gt; @@ -3,7 &#43;3,6 @@ require multi-kernel.inc&nbsp; MULTI_CONFIG_BASE_S=
UFFIX =3D &quot;&quot;<br>
&gt; <br>
&gt;&nbsp; DESCRIPTION =3D &quot;Linux kernel for OMAP processors&quot;<br>
&gt; -KERNEL_IMAGETYPE =3D &quot;uImage&quot;<br>
&gt; <br>
&gt;&nbsp; COMPATIBLE_MACHINE =3D &quot;am3517-crane|beagleboard|omap3evm|a=
m3517-<br>
&gt; evm|dm37x-evm|am37x-evm|omap3-touchbook|overo&quot;<br>
&gt; <br>
&gt; diff --git a/recipes-kernel/linux/linux-omap_2.6.37.bb b/recipes-<br>
&gt; kernel/linux/linux-omap_2.6.37.bb<br>
&gt; index 62076fb..0a14cc8 100644<br>
&gt; --- a/recipes-kernel/linux/linux-omap_2.6.37.bb<br>
&gt; &#43;&#43;&#43; b/recipes-kernel/linux/linux-omap_2.6.37.bb<br>
&gt; @@ -1,7 &#43;1,6 @@<br>
&gt;&nbsp; require multi-kernel.inc<br>
&gt; <br>
&gt;&nbsp; DESCRIPTION =3D &quot;Linux kernel for OMAP processors&quot;<br>
&gt; -KERNEL_IMAGETYPE =3D &quot;uImage&quot;<br>
&gt; <br>
&gt;&nbsp; COMPATIBLE_MACHINE =3D &quot;(beagleboard|overo|omap3evm|omap3-<=
br>
&gt; touchbook)&quot;<br>
&gt; <br>
&gt; diff --git a/recipes-kernel/linux/linux-omap_2.6.39.bb b/recipes-<br>
&gt; kernel/linux/linux-omap_2.6.39.bb<br>
&gt; index ae90ad2..430fa09 100644<br>
&gt; --- a/recipes-kernel/linux/linux-omap_2.6.39.bb<br>
&gt; &#43;&#43;&#43; b/recipes-kernel/linux/linux-omap_2.6.39.bb<br>
&gt; @@ -1,7 &#43;1,6 @@<br>
&gt;&nbsp; require linux.inc<br>
&gt; <br>
&gt;&nbsp; DESCRIPTION =3D &quot;Linux kernel for OMAP processors&quot;<br>
&gt; -KERNEL_IMAGETYPE =3D &quot;uImage&quot;<br>
&gt; <br>
&gt;&nbsp; COMPATIBLE_MACHINE =3D &quot;(beagleboard)&quot;<br>
&gt; <br>
&gt; diff --git a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb b/recip=
es-<br>
&gt; kernel/linux/linux-omapl138-psp_2.6.37.bb<br>
&gt; index e4a5451..a138fb6 100644<br>
&gt; --- a/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb<br>
&gt; &#43;&#43;&#43; b/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb<br=
>
&gt; @@ -1,7 &#43;1,6 @@<br>
&gt;&nbsp; SECTION =3D &quot;kernel&quot;<br>
&gt;&nbsp; DESCRIPTION =3D &quot;Linux kernel for OMAPL1 machines from PSP,=
 based on linux-<br>
&gt; davinci kernel&quot;<br>
&gt;&nbsp; LICENSE =3D &quot;GPLv2&quot;<br>
&gt; -KERNEL_IMAGETYPE =3D &quot;uImage&quot;<br>
&gt; <br>
&gt;&nbsp; require multi-kernel.inc<br>
&gt;&nbsp; require tipspkernel.inc<br>
&gt; diff --git a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb b/recipes-<br>
&gt; kernel/linux/linux-ti-glsdk_3.8.bb<br>
&gt; index 5fd17f8..09204a6 100644<br>
&gt; --- a/recipes-kernel/linux/linux-ti-glsdk_3.8.bb<br>
&gt; &#43;&#43;&#43; b/recipes-kernel/linux/linux-ti-glsdk_3.8.bb<br>
&gt; @@ -2,7 &#43;2,6 @@ SECTION =3D &quot;kernel&quot;<br>
&gt;&nbsp; DESCRIPTION =3D &quot;Linux kernel for TI devices supported by t=
he GLSDK product&quot;<br>
&gt;&nbsp; LICENSE =3D &quot;GPLv2&quot;<br>
&gt;&nbsp; LIC_FILES_CHKSUM =3D<br>
&gt; &quot;<a href=3D"file:///\\COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7">file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7</a>&quot;<br>
&gt; -KERNEL_IMAGETYPE =3D &quot;uImage&quot;<br>
&gt; <br>
&gt;&nbsp; inherit kernel<br>
&gt; <br>
&gt; diff --git a/recipes-kernel/linux/linux-ti-staging_3.8.bb b/recipes-<b=
r>
&gt; kernel/linux/linux-ti-staging_3.8.bb<br>
&gt; index fd7b671..f0659f2 100644<br>
&gt; --- a/recipes-kernel/linux/linux-ti-staging_3.8.bb<br>
&gt; &#43;&#43;&#43; b/recipes-kernel/linux/linux-ti-staging_3.8.bb<br>
&gt; @@ -2,7 &#43;2,6 @@ SECTION =3D &quot;kernel&quot;<br>
&gt;&nbsp; DESCRIPTION =3D &quot;Linux kernel for TI devices&quot;<br>
&gt;&nbsp; LICENSE =3D &quot;GPLv2&quot;<br>
&gt;&nbsp; LIC_FILES_CHKSUM =3D<br>
&gt; &quot;<a href=3D"file:///\\COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7">file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7</a>&quot;<br>
&gt; -KERNEL_IMAGETYPE =3D &quot;uImage&quot;<br>
&gt; <br>
&gt;&nbsp; inherit kernel<br>
&gt; <br>
&gt; diff --git a/recipes-kernel/linux/linux-ti-staging_git.bb b/recipes-<b=
r>
&gt; kernel/linux/linux-ti-staging_git.bb<br>
&gt; index 694a164..d3d11d2 100644<br>
&gt; --- a/recipes-kernel/linux/linux-ti-staging_git.bb<br>
&gt; &#43;&#43;&#43; b/recipes-kernel/linux/linux-ti-staging_git.bb<br>
&gt; @@ -2,7 &#43;2,6 @@ SECTION =3D &quot;kernel&quot;<br>
&gt;&nbsp; DESCRIPTION =3D &quot;Linux kernel for TI devices&quot;<br>
&gt;&nbsp; LICENSE =3D &quot;GPLv2&quot;<br>
&gt;&nbsp; LIC_FILES_CHKSUM =3D<br>
&gt; &quot;<a href=3D"file:///\\COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7=
cd7">file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd7</a>&quot;<br>
&gt; -KERNEL_IMAGETYPE =3D &quot;uImage&quot;<br>
&gt; <br>
&gt;&nbsp; inherit kernel<br>
&gt; <br>
&gt; diff --git a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb b/recipes-<br=
>
&gt; kernel/linux/linux-ti33x-psp_3.2.bb<br>
&gt; index 4200d03..a9f7ac2 100644<br>
&gt; --- a/recipes-kernel/linux/linux-ti33x-psp_3.2.bb<br>
&gt; &#43;&#43;&#43; b/recipes-kernel/linux/linux-ti33x-psp_3.2.bb<br>
&gt; @@ -1,7 &#43;1,6 @@<br>
&gt;&nbsp; SECTION =3D &quot;kernel&quot;<br>
&gt;&nbsp; DESCRIPTION =3D &quot;Linux kernel for TI33x EVM from PSP, based=
 on am335x-<br>
&gt; kernel&quot;<br>
&gt;&nbsp; LICENSE =3D &quot;GPLv2&quot;<br>
&gt; -KERNEL_IMAGETYPE =3D &quot;uImage&quot;<br>
&gt; <br>
&gt;&nbsp; require multi-kernel.inc<br>
&gt;&nbsp; require tipspkernel.inc<br>
&gt; diff --git a/recipes-kernel/linux/linux_3.0.bb b/recipes-kernel/linux/=
linux_3.0.bb<br>
&gt; index 522a87d..3aae2ca 100644<br>
&gt; --- a/recipes-kernel/linux/linux_3.0.bb<br>
&gt; &#43;&#43;&#43; b/recipes-kernel/linux/linux_3.0.bb<br>
&gt; @@ -1,7 &#43;1,6 @@<br>
&gt;&nbsp; require linux.inc<br>
&gt; <br>
&gt;&nbsp; DESCRIPTION =3D &quot;Linux kernel for TI processors&quot;<br>
&gt; -KERNEL_IMAGETYPE =3D &quot;uImage&quot;<br>
&gt; <br>
&gt;&nbsp; COMPATIBLE_MACHINE =3D &quot;(beagleboard)&quot;<br>
&gt; <br>
&gt; diff --git a/recipes-kernel/linux/linux_3.1.bb b/recipes-kernel/linux/=
linux_3.1.bb<br>
&gt; index d6ed98c..110d26c 100644<br>
&gt; --- a/recipes-kernel/linux/linux_3.1.bb<br>
&gt; &#43;&#43;&#43; b/recipes-kernel/linux/linux_3.1.bb<br>
&gt; @@ -3,7 &#43;3,6 @@ require linux.inc<br>
&gt;&nbsp; COMPATIBLE_MACHINE =3D &quot;beagleboard&quot;<br>
&gt; <br>
&gt;&nbsp; DESCRIPTION =3D &quot;Linux kernel for TI processors&quot;<br>
&gt; -KERNEL_IMAGETYPE =3D &quot;uImage&quot;<br>
&gt; <br>
&gt;&nbsp; DEFAULT_PREFERENCE =3D &quot;-99&quot;<br>
&gt; <br>
&gt; diff --git a/recipes-kernel/linux/linux_3.3.7.bb b/recipes-<br>
&gt; kernel/linux/linux_3.3.7.bb<br>
&gt; index e38b6c2..aca5c53 100644<br>
&gt; --- a/recipes-kernel/linux/linux_3.3.7.bb<br>
&gt; &#43;&#43;&#43; b/recipes-kernel/linux/linux_3.3.7.bb<br>
&gt; @@ -11,8 &#43;11,6 @@ COMPATIBLE_MACHINE =3D &quot;beagleboard&quot;<b=
r>
&gt;&nbsp; inherit kernel<br>
&gt;&nbsp; require setup-defconfig.inc<br>
&gt; <br>
&gt; -KERNEL_IMAGETYPE =3D &quot;uImage&quot;<br>
&gt; -<br>
&gt;&nbsp; # The main PR is now using MACHINE_KERNEL_PR, for beagleboard se=
e&nbsp; #<br>
&gt; conf/machine/include/omap3.inc&nbsp; MACHINE_KERNEL_PR_append =3D<br>
&gt; &quot;b&#43;gitr${SRCREV}&quot;<br>
&gt; --<br>
&gt; 1.8.3.2<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; meta-ti mailing list<br>
&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</=
a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://li=
sts.yoctoproject.org/listinfo/meta-ti</a><br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><o:p></o:p></span></p>
</div>
</div>
</div>
</body>
</html>

--_000_8F29D6B095ED194EA1980491A5E029710C55C293DFLE08entticom_--
