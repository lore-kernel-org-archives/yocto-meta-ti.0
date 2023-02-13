Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78684C636D4
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 14:19:28 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.15192.1676297960550698735
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 13 Feb 2023 06:19:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=xTGOqRD5;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31DEJFSf043748;
	Mon, 13 Feb 2023 08:19:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676297955;
	bh=2MY1np6hh44zT4GFzZj+TGa3X1RarbltAFNuh4mZV7c=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=xTGOqRD5af++BHuvsCqojLVmci7s2FMRzG4Lj+Bk3gxA/XF+4PTbnPIq7iPEEcBaa
	 x6mRaaFgrYsQ2sFT1B6IznTVdQ8jJsmhDXCJsaV3X/nqYoIgAmqMJhvVSIFjALec08
	 coSvitw5jrPytvraf8tOA2+8+2+F5u4yY9/UajUc=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31DEJFju018104
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 13 Feb 2023 08:19:15 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 13
 Feb 2023 08:19:15 -0600
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
 DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
 15.01.2507.016; Mon, 13 Feb 2023 08:19:14 -0600
From: "Shilwant, Chirag" <c-shilwant@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "Bajjuri, Praneeth" <praneeth@ti.com>, "Eatmon, Ryan" <reatmon@ti.com>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Adivi,
 Sai Sree Kartheek" <s-adivi@ti.com>,
        "Bhagat, Paresh" <p-bhagat@ti.com>, "Gupta, Gyan" <g-gupta@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-ti][dunfell][PATCH] am62xx-lp-evm: Add AM62x
 LP HS-FS evm configuration
Thread-Topic: [EXTERNAL] Re: [meta-ti][dunfell][PATCH] am62xx-lp-evm: Add
 AM62x LP HS-FS evm configuration
Thread-Index: AQHZPYyKWDiY/rPW3EqrZWwOfPkpQ67M8BFp
Date: Mon, 13 Feb 2023 14:19:14 +0000
Message-ID: <e901ea4ca84346c887bc0bc1c27064ea@ti.com>
References: <20230210125615.2607653-1-c-shilwant@ti.com>,<20230210201549.GA22689@denix.org>
In-Reply-To: <20230210201549.GA22689@denix.org>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.24.69.146]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="_000_e901ea4ca84346c887bc0bc1c27064eaticom_"
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 13 Feb 2023 14:19:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15823

--_000_e901ea4ca84346c887bc0bc1c27064eaticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

True, but I see that the AM62x and AM62x LP patch is already up on dunfell-=
wip and the conflict issue seems to be already handled by Ryan.
https://git.ti.com/cgit/arago-project/meta-ti/commit/?h=3Ddunfell-wip&id=3D=
48b7e6693c750039a4b3df0dc07979f710cf0c12 is adding the k3r5-hs-fs.conf and =
hence https://git.ti.com/cgit/arago-project/meta-ti/commit/?h=3Ddunfell-wip=
&id=3D9fb233214697bc7bb6e796ad2a868cadcd5b9e7d isn't.

Also, the AM62A patch which you are mentioning is an RFC. So while re-sendi=
ng a non-RFC patch we can skip adding k3r5-hs-fs.conf provided above 2 patc=
hes are up on dunfell.

________________________________
From: Denys Dmytriyenko <denis@denix.org>
Sent: 11 February 2023 01:45:49
To: Shilwant, Chirag
Cc: Bajjuri, Praneeth; Eatmon, Ryan; meta-ti@lists.yoctoproject.org; Adivi,=
 Sai Sree Kartheek; Bhagat, Paresh; Gupta, Gyan
Subject: [EXTERNAL] Re: [meta-ti][dunfell][PATCH] am62xx-lp-evm: Add AM62x =
LP HS-FS evm configuration

I see all 3 patches are trying to add the same new multiconfig file:
>  create mode 100644 conf/multiconfig/k3r5-hs-fs.conf

AM62A:
https://patchwork.yoctoproject.org/project/ti/patch/20230210000834.24783-1-=
s-adivi@ti.com/

AM62:
https://patchwork.yoctoproject.org/project/ti/patch/20230210124534.2607360-=
1-c-shilwant@ti.com/

AM62 LP:
https://patchwork.yoctoproject.org/project/ti/patch/20230210124534.2607360-=
1-c-shilwant@ti.com/

This would cause a conflict and extra work for maintainer...


On Fri, Feb 10, 2023 at 06:26:15PM +0530, Chirag Shilwant wrote:
> Lets add the basic AM62x LP HS-FS configuration
> - Add machine conf for AM62x LP HS-FS.
> - The wic images will boot on AM62x LP HS-FS devices by default. The sysf=
w image for HS-SE will be packaged in the wic image as tiboot3-am62x-hs-evm=
.bin.
> - Add ti-sci-firmware overrides.
>
> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> ---
>  conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf | 14 ++++++++++++++
>  conf/machine/am62xx-lp-evm-k3r5-hs-se.conf |  7 +++++++
>  conf/machine/include/am62xx-lp.inc         |  8 +++++++-
>  conf/multiconfig/k3r5-hs-fs.conf           |  3 +++
>  recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb     |  1 +
>  5 files changed, 32 insertions(+), 1 deletion(-)
>  create mode 100644 conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf
>  create mode 100644 conf/multiconfig/k3r5-hs-fs.conf
>
> diff --git a/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf b/conf/machine/am=
62xx-lp-evm-k3r5-hs-fs.conf
> new file mode 100644
> index 00000000..0178fcfc
> --- /dev/null
> +++ b/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf
> @@ -0,0 +1,14 @@
> +#@TYPE: Machine
> +#@NAME: AM62xx LPSK HS-FS EVM (R5F)
> +#@DESCRIPTION: Machine configuration for the TI AM62xx LP HS-FS EVM (R5F=
 core)
> +
> +# Booting HS-FS requires different SYSFW, the rest is handled at runtime
> +
> +require conf/machine/include/k3r5.inc
> +SOC_FAMILY_append =3D ":k3r5-hs-fs"
> +
> +SYSFW_SOC =3D "am62x"
> +SYSFW_CONFIG =3D "evm"
> +SYSFW_SUFFIX =3D "hs-fs"
> +
> +UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
> diff --git a/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf b/conf/machine/am=
62xx-lp-evm-k3r5-hs-se.conf
> index b752ee7e..37e9760a 100644
> --- a/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
> +++ b/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf
> @@ -11,4 +11,11 @@ SYSFW_SOC =3D "am62x"
>  SYSFW_CONFIG =3D "evm"
>  SYSFW_SUFFIX =3D "hs"
>
> +SYSFW_TIBOOT3_SYMLINK =3D ""
> +
>  UBOOT_MACHINE =3D "am62x_lpsk_r5_defconfig"
> +
> +SPL_BINARY =3D ""
> +UBOOT_BINARY =3D "u-boot-spl.${UBOOT_SUFFIX}"
> +UBOOT_IMAGE =3D "u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${PR}.${UBOOT_S=
UFFIX}"
> +UBOOT_SYMLINK =3D "u-boot-r5spl-hs-se.${UBOOT_SUFFIX}"
> diff --git a/conf/machine/include/am62xx-lp.inc b/conf/machine/include/am=
62xx-lp.inc
> index c38de868..02937662 100644
> --- a/conf/machine/include/am62xx-lp.inc
> +++ b/conf/machine/include/am62xx-lp.inc
> @@ -8,8 +8,14 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>
>  TFA_K3_SYSTEM_SUSPEND =3D "1"
>
> -# Default tiboot3.bin on AM62x LP is for HS-SE
> +# Default tiboot3.bin on AM62x LP is for HS-FS
> +BBMULTICONFIG =3D "k3r5-hs-fs"
> +do_image_wic[mcdepends] =3D "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
> +do_image_tar[mcdepends] =3D "mc::k3r5-hs-fs:ti-sci-fw:do_deploy"
> +
> +# Since default tiboot3.bin on AM62x LP is for HS-FS, add a version for =
HS-SE
>  BBMULTICONFIG +=3D "k3r5-hs-se"
> +IMAGE_BOOT_FILES +=3D " tiboot3-am62x-hs-evm.bin"
>  do_image_wic[mcdepends] +=3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
>  do_image_tar[mcdepends] +=3D "mc::k3r5-hs-se:ti-sci-fw:do_deploy"
>
> diff --git a/conf/multiconfig/k3r5-hs-fs.conf b/conf/multiconfig/k3r5-hs-=
fs.conf
> new file mode 100644
> index 00000000..c6d58ead
> --- /dev/null
> +++ b/conf/multiconfig/k3r5-hs-fs.conf
> @@ -0,0 +1,3 @@
> +require k3r5.conf
> +
> +MACHINE_append =3D "-hs-fs"
> diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-sci-=
fw/ti-sci-fw_git.bb
> index 7896c366..24af66a2 100644
> --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> +++ b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb
> @@ -41,6 +41,7 @@ SYSFW_PREFIX_am62xx-evm-k3r5-gp =3D "fs"
>  SYSFW_PREFIX_am62xx-evm-k3r5-hs-se =3D "fs"
>  SYSFW_PREFIX_am62xx-lp-evm-k3r5 =3D "fs"
>  SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se =3D "fs"
> +SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-fs =3D "fs"
>  SYSFW_PREFIX_am62axx-evm-k3r5 =3D "fs"
>
>  SYSFW_TISCI =3D "${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-${SYSFW_SOC}-=
*.bin"
> --
> 2.34.1
>

--_000_e901ea4ca84346c887bc0bc1c27064eaticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p></p>
<p style=3D"margin-top:12px; margin-bottom:12px; margin-left:0px; margin-ri=
ght:0px; text-indent:0px; line-height:22px">
True, but I see that the AM62x and AM62x LP patch is already up on dunfell-=
wip and the conflict issue seems to be already handled by Ryan.<br>
<a href=3D"https://git.ti.com/cgit/arago-project/meta-ti/commit/?h=3Ddunfel=
l-wip&amp;id=3D48b7e6693c750039a4b3df0dc07979f710cf0c12" class=3D"x_OWAAuto=
Link" id=3D"LPlnk178998">https://git.ti.com/cgit/arago-project/meta-ti/comm=
it/?h=3Ddunfell-wip&amp;id=3D48b7e6693c750039a4b3df0dc07979f710cf0c12</a>&n=
bsp;is
 adding the k3r5-hs-fs.conf and hence <a href=3D"https://git.ti.com/cgit/ar=
ago-project/meta-ti/commit/?h=3Ddunfell-wip&amp;id=3D9fb233214697bc7bb6e796=
ad2a868cadcd5b9e7d" class=3D"x_OWAAutoLink" id=3D"LPlnk103229">
https://git.ti.com/cgit/arago-project/meta-ti/commit/?h=3Ddunfell-wip&amp;i=
d=3D9fb233214697bc7bb6e796ad2a868cadcd5b9e7d</a> isn't.<br>
</p>
<br>
Also, the AM62A patch which you are mentioning is an RFC. So while re-sendi=
ng a non-RFC patch we can skip adding k3r5-hs-fs.conf provided above 2 patc=
hes are up on dunfell.<br>
<p></p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Denys Dmytriyenko &=
lt;denis@denix.org&gt;<br>
<b>Sent:</b> 11 February 2023 01:45:49<br>
<b>To:</b> Shilwant, Chirag<br>
<b>Cc:</b> Bajjuri, Praneeth; Eatmon, Ryan; meta-ti@lists.yoctoproject.org;=
 Adivi, Sai Sree Kartheek; Bhagat, Paresh; Gupta, Gyan<br>
<b>Subject:</b> [EXTERNAL] Re: [meta-ti][dunfell][PATCH] am62xx-lp-evm: Add=
 AM62x LP HS-FS evm configuration</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">I see all 3 patches are trying to add the same new=
 multiconfig file:<br>
&gt;&nbsp; create mode 100644 conf/multiconfig/k3r5-hs-fs.conf<br>
<br>
AM62A:<br>
<a href=3D"https://patchwork.yoctoproject.org/project/ti/patch/202302100008=
34.24783-1-s-adivi@ti.com/">https://patchwork.yoctoproject.org/project/ti/p=
atch/20230210000834.24783-1-s-adivi@ti.com/</a><br>
<br>
AM62:<br>
<a href=3D"https://patchwork.yoctoproject.org/project/ti/patch/202302101245=
34.2607360-1-c-shilwant@ti.com/">https://patchwork.yoctoproject.org/project=
/ti/patch/20230210124534.2607360-1-c-shilwant@ti.com/</a><br>
<br>
AM62 LP:<br>
<a href=3D"https://patchwork.yoctoproject.org/project/ti/patch/202302101245=
34.2607360-1-c-shilwant@ti.com/">https://patchwork.yoctoproject.org/project=
/ti/patch/20230210124534.2607360-1-c-shilwant@ti.com/</a><br>
<br>
This would cause a conflict and extra work for maintainer...<br>
<br>
<br>
On Fri, Feb 10, 2023 at 06:26:15PM &#43;0530, Chirag Shilwant wrote:<br>
&gt; Lets add the basic AM62x LP HS-FS configuration<br>
&gt; - Add machine conf for AM62x LP HS-FS.<br>
&gt; - The wic images will boot on AM62x LP HS-FS devices by default. The s=
ysfw image for HS-SE will be packaged in the wic image as tiboot3-am62x-hs-=
evm.bin.<br>
&gt; - Add ti-sci-firmware overrides.<br>
&gt; <br>
&gt; Signed-off-by: Chirag Shilwant &lt;c-shilwant@ti.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf | 14 &#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; conf/machine/am62xx-lp-evm-k3r5-hs-se.conf |&nbsp; 7 &#43;&#43;&=
#43;&#43;&#43;&#43;&#43;<br>
&gt;&nbsp; conf/machine/include/am62xx-lp.inc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; |&nbsp; 8 &#43;&#43;&#43;&#43;&#43;&#43;&#43;-<br>
&gt;&nbsp; conf/multiconfig/k3r5-hs-fs.conf&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 3 &#43;&#43;&#43;<br>
&gt;&nbsp; recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb&nbsp;&nbsp;&nbsp;&nbsp; |=
&nbsp; 1 &#43;<br>
&gt;&nbsp; 5 files changed, 32 insertions(&#43;), 1 deletion(-)<br>
&gt;&nbsp; create mode 100644 conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf<br=
>
&gt;&nbsp; create mode 100644 conf/multiconfig/k3r5-hs-fs.conf<br>
&gt; <br>
&gt; diff --git a/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf b/conf/machine=
/am62xx-lp-evm-k3r5-hs-fs.conf<br>
&gt; new file mode 100644<br>
&gt; index 00000000..0178fcfc<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/conf/machine/am62xx-lp-evm-k3r5-hs-fs.conf<br>
&gt; @@ -0,0 &#43;1,14 @@<br>
&gt; &#43;#@TYPE: Machine<br>
&gt; &#43;#@NAME: AM62xx LPSK HS-FS EVM (R5F)<br>
&gt; &#43;#@DESCRIPTION: Machine configuration for the TI AM62xx LP HS-FS E=
VM (R5F core)<br>
&gt; &#43;<br>
&gt; &#43;# Booting HS-FS requires different SYSFW, the rest is handled at =
runtime<br>
&gt; &#43;<br>
&gt; &#43;require conf/machine/include/k3r5.inc<br>
&gt; &#43;SOC_FAMILY_append =3D &quot;:k3r5-hs-fs&quot;<br>
&gt; &#43;<br>
&gt; &#43;SYSFW_SOC =3D &quot;am62x&quot;<br>
&gt; &#43;SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt; &#43;SYSFW_SUFFIX =3D &quot;hs-fs&quot;<br>
&gt; &#43;<br>
&gt; &#43;UBOOT_MACHINE =3D &quot;am62x_lpsk_r5_defconfig&quot;<br>
&gt; diff --git a/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf b/conf/machine=
/am62xx-lp-evm-k3r5-hs-se.conf<br>
&gt; index b752ee7e..37e9760a 100644<br>
&gt; --- a/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf<br>
&gt; &#43;&#43;&#43; b/conf/machine/am62xx-lp-evm-k3r5-hs-se.conf<br>
&gt; @@ -11,4 &#43;11,11 @@ SYSFW_SOC =3D &quot;am62x&quot;<br>
&gt;&nbsp; SYSFW_CONFIG =3D &quot;evm&quot;<br>
&gt;&nbsp; SYSFW_SUFFIX =3D &quot;hs&quot;<br>
&gt;&nbsp; <br>
&gt; &#43;SYSFW_TIBOOT3_SYMLINK =3D &quot;&quot;<br>
&gt; &#43;<br>
&gt;&nbsp; UBOOT_MACHINE =3D &quot;am62x_lpsk_r5_defconfig&quot;<br>
&gt; &#43; <br>
&gt; &#43;SPL_BINARY =3D &quot;&quot;<br>
&gt; &#43;UBOOT_BINARY =3D &quot;u-boot-spl.${UBOOT_SUFFIX}&quot;<br>
&gt; &#43;UBOOT_IMAGE =3D &quot;u-boot-r5spl-hs-se-${MAINMACHINE}-${PV}-${P=
R}.${UBOOT_SUFFIX}&quot;<br>
&gt; &#43;UBOOT_SYMLINK =3D &quot;u-boot-r5spl-hs-se.${UBOOT_SUFFIX}&quot;<=
br>
&gt; diff --git a/conf/machine/include/am62xx-lp.inc b/conf/machine/include=
/am62xx-lp.inc<br>
&gt; index c38de868..02937662 100644<br>
&gt; --- a/conf/machine/include/am62xx-lp.inc<br>
&gt; &#43;&#43;&#43; b/conf/machine/include/am62xx-lp.inc<br>
&gt; @@ -8,8 &#43;8,14 @@ SERIAL_CONSOLES_CHECK =3D &quot;${SERIAL_CONSOLES=
}&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; TFA_K3_SYSTEM_SUSPEND =3D &quot;1&quot;<br>
&gt;&nbsp; <br>
&gt; -# Default tiboot3.bin on AM62x LP is for HS-SE<br>
&gt; &#43;# Default tiboot3.bin on AM62x LP is for HS-FS<br>
&gt; &#43;BBMULTICONFIG =3D &quot;k3r5-hs-fs&quot;<br>
&gt; &#43;do_image_wic[mcdepends] =3D &quot;mc::k3r5-hs-fs:ti-sci-fw:do_dep=
loy&quot;<br>
&gt; &#43;do_image_tar[mcdepends] =3D &quot;mc::k3r5-hs-fs:ti-sci-fw:do_dep=
loy&quot;<br>
&gt; &#43;<br>
&gt; &#43;# Since default tiboot3.bin on AM62x LP is for HS-FS, add a versi=
on for HS-SE<br>
&gt;&nbsp; BBMULTICONFIG &#43;=3D &quot;k3r5-hs-se&quot;<br>
&gt; &#43;IMAGE_BOOT_FILES &#43;=3D &quot; tiboot3-am62x-hs-evm.bin&quot;<b=
r>
&gt;&nbsp; do_image_wic[mcdepends] &#43;=3D &quot;mc::k3r5-hs-se:ti-sci-fw:=
do_deploy&quot;<br>
&gt;&nbsp; do_image_tar[mcdepends] &#43;=3D &quot;mc::k3r5-hs-se:ti-sci-fw:=
do_deploy&quot;<br>
&gt;&nbsp; <br>
&gt; diff --git a/conf/multiconfig/k3r5-hs-fs.conf b/conf/multiconfig/k3r5-=
hs-fs.conf<br>
&gt; new file mode 100644<br>
&gt; index 00000000..c6d58ead<br>
&gt; --- /dev/null<br>
&gt; &#43;&#43;&#43; b/conf/multiconfig/k3r5-hs-fs.conf<br>
&gt; @@ -0,0 &#43;1,3 @@<br>
&gt; &#43;require k3r5.conf<br>
&gt; &#43;<br>
&gt; &#43;MACHINE_append =3D &quot;-hs-fs&quot;<br>
&gt; diff --git a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb b/recipes-bsp/ti-s=
ci-fw/ti-sci-fw_git.bb<br>
&gt; index 7896c366..24af66a2 100644<br>
&gt; --- a/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb<br>
&gt; &#43;&#43;&#43; b/recipes-bsp/ti-sci-fw/ti-sci-fw_git.bb<br>
&gt; @@ -41,6 &#43;41,7 @@ SYSFW_PREFIX_am62xx-evm-k3r5-gp =3D &quot;fs&quo=
t;<br>
&gt;&nbsp; SYSFW_PREFIX_am62xx-evm-k3r5-hs-se =3D &quot;fs&quot;<br>
&gt;&nbsp; SYSFW_PREFIX_am62xx-lp-evm-k3r5 =3D &quot;fs&quot;<br>
&gt;&nbsp; SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-se =3D &quot;fs&quot;<br>
&gt; &#43;SYSFW_PREFIX_am62xx-lp-evm-k3r5-hs-fs =3D &quot;fs&quot;<br>
&gt;&nbsp; SYSFW_PREFIX_am62axx-evm-k3r5 =3D &quot;fs&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; SYSFW_TISCI =3D &quot;${S}/ti-sysfw/ti-${SYSFW_PREFIX}-firmware-=
${SYSFW_SOC}-*.bin&quot;<br>
&gt; -- <br>
&gt; 2.34.1<br>
&gt; <br>
</div>
</span></font>
</body>
</html>

--_000_e901ea4ca84346c887bc0bc1c27064eaticom_--

