Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F184E00BB1; Mon, 18 Sep 2017 13:25:08 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.17 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B5B6EE00956
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 13:25:04 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IKP4cX031077
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:25:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505766304;
	bh=T3iMRubrI1nIH7g7lXL+8XaknKlXlCfd0+qbpkoUII8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=QbwaqiHGbaR3xbRNaFx+suyhXH6RZA19MIFgUIQJJRiFN2Nf6AI4nOmEFyaKmHQkf
	odw8MGY/Sfdu4OJqH0HAoxvydwEBp6wo2Oq9YN6tWbdo4cCXYs7L/Rg9v5OGcltuQG
	vP+xkPoJnvn5yTAulANIf4bgOae5yhmPEgsrHFVs=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKP47A011285
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:25:04 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Mon, 18 Sep 2017 15:25:04 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v2 27/37] pruss-lld: Add rtos recipe & update
	the version to 1.0.0.7
Thread-Index: AQHTABpBF6qyU9rU90CzTOBimodl7qKUeY2AgCb60eA=
Date: Mon, 18 Sep 2017 20:25:03 +0000
Message-ID: <5130E41A1BA9D145BA0F3B18D5CFB0A7437F4626@DFLE12.ent.ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-27-git-send-email-m-radhakrishnan2@ti.com>
	<20170824195543.GJ28233@edge>
In-Reply-To: <20170824195543.GJ28233@edge>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2 27/37] pruss-lld: Add rtos recipe & update the version to 1.0.0.7
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
X-List-Received-Date: Mon, 18 Sep 2017 20:25:08 -0000
X-Groupsio-MsgNum: 10375
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4626DFLE12entticom_"

--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4626DFLE12entticom_
Content-Type: multipart/alternative;
	boundary="_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4626DFLE12entticom_"

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4626DFLE12entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Please see the comments inline.



I had submitted the new patch (attached) after addressing the review commen=
ts (v3) and updating the commit message (v4)



Regards

Mahesh



-----Original Message-----
From: Dmytriyenko, Denys
Sent: Thursday, August 24, 2017 3:56 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2 27/37] pruss-lld: Add rtos recipe & update=
 the version to 1.0.0.7



On Tue, Jul 18, 2017 at 07:03:38PM -0400, Mahesh Radhakrishnan wrote:

> Upstreaming the RTOS low level driver of the PRUSS module & updating

> to the latest version

> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com<mailto:m-rad=
hakrishnan2@ti.com>>

> ---

>

> v2 - Added summary

>

>  recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb | 23 +++++++++++++++++++++++

>  recipes-bsp/pruss-lld/pruss-lld.inc         |  8 ++++----

>  2 files changed, 27 insertions(+), 4 deletions(-)  create mode 100644

> recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb

>

> diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb

> b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb

> new file mode 100644

> index 0000000..5068286

> --- /dev/null

> +++ b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb

> @@ -0,0 +1,23 @@

> +SUMMARY =3D "TI RTOS low level driver library for PRUSS"

> +

> +inherit ti-pdk

> +require recipes-bsp/pruss-lld/pruss-lld.inc

> +

> +PR =3D "${INC_PR}.0"

> +

> +S =3D "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"

> +

> +DEPENDS_append =3D " osal-rtos"

> +DEPENDS_append_ti33x =3D " starterware-rtos"

> +DEPENDS_append_ti43x =3D " starterware-rtos"

> +

> +# Build with make instead of XDC

> +TI_PDK_XDCMAKE =3D "0"

> +

> +export PDK_PRUSS_ROOT_PATH =3D"${WORKDIR}/build"

> +export DEST_ROOT=3D"${WORKDIR}/build"

> +

> +# HTML doc link params

> +PDK_COMP_LINK_TEXT =3D "PRUSS LLD"

> +

> +INSANE_SKIP_${PN} =3D "arch"

> diff --git a/recipes-bsp/pruss-lld/pruss-lld.inc

> b/recipes-bsp/pruss-lld/pruss-lld.inc

> index 8620108..1f1bfc5 100644

> --- a/recipes-bsp/pruss-lld/pruss-lld.inc

> +++ b/recipes-bsp/pruss-lld/pruss-lld.inc

> @@ -1,7 +1,7 @@

>  LICENSE =3D "BSD-3-Clause"

>  LIC_FILES_CHKSUM =3D "file://pruicss.h;beginline=3D1;endline=3D31;md5=3D=
315177aa03d58bcd124a6e799e2bd458<file:///\\pruicss.h;beginline=3D1;endline=
=3D31;md5=3D315177aa03d58bcd124a6e799e2bd458>"

>

> -COMPATIBLE_MACHINE =3D "ti33x|ti43x|am57xx-evm|k2g-evm"

> +COMPATIBLE_MACHINE =3D "ti33x|ti43x|am57xx-evm|k2g-evm|k2g-hs-evm"



That's why you want to use "k2g" SOC family to automatically cover variants=
.





Updated in the new patch to use k2g



>  PACKAGE_ARCH =3D "${MACHINE_ARCH}"

>

>  PRUSS_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/pruss-lld.git"

> @@ -9,12 +9,12 @@ PRUSS_LLD_GIT_PROTOCOL =3D "git"

>  PRUSS_LLD_GIT_BRANCH =3D "master"

>  PRUSS_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/pruss"

>

> -# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.06A"

> -PRUSS_LLD_SRCREV =3D "b98729cc1fc26c9ac32846146892646a23c28adb"

> +# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.07"

> +PRUSS_LLD_SRCREV =3D "636bb5645014723c54c08245cf8c2ee401eceb4f"

>

>  BRANCH =3D "${PRUSS_LLD_GIT_BRANCH}"

>  SRC_URI =3D "${PRUSS_LLD_GIT_URI};destsuffix=3D${PRUSS_LLD_GIT_DESTSUFFI=
X};protocol=3D${PRUSS_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"

>

>  SRCREV =3D "${PRUSS_LLD_SRCREV}"

> -PV =3D "01.00.00.06A"

> +PV =3D "01.00.00.07"

>  INC_PR =3D "r0"

> --

> 1.9.1

>

> --

> _______________________________________________

> meta-ti mailing list

> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>

> https://lists.yoctoproject.org/listinfo/meta-ti

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4626DFLE12entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:x=3D"urn:schemas-microsoft-com:office:excel" xmlns:m=3D"http://schema=
s.microsoft.com/office/2004/12/omml" xmlns=3D"http://www.w3.org/TR/REC-html=
40">
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
p.MsoPlainText, li.MsoPlainText, div.MsoPlainText
	{mso-style-priority:99;
	mso-style-link:"Plain Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:"Calibri","sans-serif";}
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
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Hi Denys,<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Please see the comm=
ents inline.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">I had submitted the=
 new patch (attached) after addressing the review comments (v3) and updatin=
g the commit message (v4)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Regards<o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Mahesh</span><o:p><=
/o:p></p>
<p class=3D"MsoPlainText"><a name=3D"_MailEndCompose"><o:p>&nbsp;</o:p></a>=
</p>
<p class=3D"MsoPlainText">-----Original Message-----<br>
From: Dmytriyenko, Denys <br>
Sent: Thursday, August 24, 2017 3:56 PM<br>
To: Radhakrishnan, Mahesh<br>
Cc: meta-ti@yoctoproject.org<br>
Subject: Re: [meta-ti] [PATCH v2 27/37] pruss-lld: Add rtos recipe &amp; up=
date the version to 1.0.0.7</p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">On Tue, Jul 18, 2017 at 07:03:38PM -0400, Mahesh =
Radhakrishnan wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Upstreaming the RTOS low level driver of the=
 PRUSS module &amp; updating
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; to the latest version<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Signed-off-by: Mahesh Radhakrishnan &lt;<a h=
ref=3D"mailto:m-radhakrishnan2@ti.com"><span style=3D"color:windowtext;text=
-decoration:none">m-radhakrishnan2@ti.com</span></a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ---<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; v2 - Added summary<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; recipes-bsp/pruss-lld/pruss-lld-rtos_g=
it.bb | 23 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; recipes-bsp/pruss-lld/pruss-lld.inc&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 &#43;&#43;&#43;&#43=
;----<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; 2 files changed, 27 insertions(&#43;),=
 4 deletions(-)&nbsp; create mode 100644
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/recipes-bsp/pruss-lld/pruss-lld=
-rtos_git.bb
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.b=
b<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; new file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; index 0000000..5068286<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/recipes-bsp/pruss-lld/prus=
s-lld-rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -0,0 &#43;1,23 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SUMMARY =3D &quot;TI RTOS low level dri=
ver library for PRUSS&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;inherit ti-pdk<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;require recipes-bsp/pruss-lld/pruss-lld=
.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PR =3D &quot;${INC_PR}.0&quot;<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;S =3D &quot;${WORKDIR}/${PRUSS_LLD_GIT_=
DESTSUFFIX}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append =3D &quot; osal-rtos&quo=
t;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_ti33x =3D &quot; starter=
ware-rtos&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_ti43x =3D &quot; starter=
ware-rtos&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# Build with make instead of XDC<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;TI_PDK_XDCMAKE =3D &quot;0&quot;<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export PDK_PRUSS_ROOT_PATH =3D&quot;${W=
ORKDIR}/build&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export DEST_ROOT=3D&quot;${WORKDIR}/bui=
ld&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# HTML doc link params<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PDK_COMP_LINK_TEXT =3D &quot;PRUSS LLD&=
quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;INSANE_SKIP_${PN} =3D &quot;arch&quot;<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/recipes-bsp/pruss-lld/pruss-lld=
.inc <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; b/recipes-bsp/pruss-lld/pruss-lld.inc<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; index 8620108..1f1bfc5 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --- a/recipes-bsp/pruss-lld/pruss-lld.inc<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/recipes-bsp/pruss-lld/prus=
s-lld.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -1,7 &#43;1,7 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; LICENSE =3D &quot;BSD-3-Clause&quot;<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; LIC_FILES_CHKSUM =3D &quot;<a href=3D"=
file:///\\pruicss.h;beginline=3D1;endline=3D31;md5=3D315177aa03d58bcd124a6e=
799e2bd458"><span style=3D"color:windowtext;text-decoration:none">file://pr=
uicss.h;beginline=3D1;endline=3D31;md5=3D315177aa03d58bcd124a6e799e2bd458</=
span></a>&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -COMPATIBLE_MACHINE =3D &quot;ti33x|ti43x|am=
57xx-evm|k2g-evm&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;COMPATIBLE_MACHINE =3D &quot;ti33x|ti43=
x|am57xx-evm|k2g-evm|k2g-hs-evm&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">That's why you want to use &quot;k2g&quot; SOC fa=
mily to automatically cover variants.<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Updated in the new =
patch to use k2g
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}=
&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; PRUSS_LLD_GIT_URI =3D &quot;git://git.=
ti.com/keystone-rtos/pruss-lld.git&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -9,12 &#43;9,12 @@ PRUSS_LLD_GIT_PROTOCOL=
 =3D &quot;git&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; PRUSS_LLD_GIT_BRANCH =3D &quot;master&=
quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; PRUSS_LLD_GIT_DESTSUFFIX =3D &quot;git=
/ti/drv/pruss&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -# Below commit ID corresponds to &quot;DEV.=
PRUSS_LLD.01.00.00.06A&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -PRUSS_LLD_SRCREV =3D &quot;b98729cc1fc26c9a=
c32846146892646a23c28adb&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# Below commit ID corresponds to &quot;=
DEV.PRUSS_LLD.01.00.00.07&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PRUSS_LLD_SRCREV =3D &quot;636bb5645014=
723c54c08245cf8c2ee401eceb4f&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; BRANCH =3D &quot;${PRUSS_LLD_GIT_BRANC=
H}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; SRC_URI =3D &quot;${PRUSS_LLD_GIT_URI}=
;destsuffix=3D${PRUSS_LLD_GIT_DESTSUFFIX};protocol=3D${PRUSS_LLD_GIT_PROTOC=
OL};branch=3D${BRANCH}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; SRCREV =3D &quot;${PRUSS_LLD_SRCREV}&q=
uot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -PV =3D &quot;01.00.00.06A&quot;<o:p></o:p><=
/p>
<p class=3D"MsoPlainText">&gt; &#43;PV =3D &quot;01.00.00.07&quot;<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; INC_PR =3D &quot;r0&quot;<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&gt; --<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; 1.9.1<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ____________________________________________=
___<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; meta-ti mailing list<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <a href=3D"mailto:meta-ti@yoctoproject.org">=
<span style=3D"color:windowtext;text-decoration:none">meta-ti@yoctoproject.=
org</span></a><o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <a href=3D"https://lists.yoctoproject.org/li=
stinfo/meta-ti">
<span style=3D"color:windowtext;text-decoration:none">https://lists.yoctopr=
oject.org/listinfo/meta-ti</span></a><o:p></o:p></p>
</div>
</body>
</html>

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4626DFLE12entticom_--

--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4626DFLE12entticom_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Mon, 18 Sep 2017 20:25:03 GMT";
	modification-date="Mon, 18 Sep 2017 20:25:03 GMT"

Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE73.ent.ti.com
 (128.247.5.110) with Microsoft SMTP Server (TLS) id 14.3.294.0; Mon, 18 Sep
 2017 15:22:43 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34; Mon, 18
 Sep 2017 15:22:43 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend Transport;
 Mon, 18 Sep 2017 15:22:42 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
 v8IKMgqm023930;	Mon, 18 Sep 2017 15:22:42 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
CC: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Subject: [PATCH v4] pruss-lld: Add rtos recipe & update the version to
 1.0.0.7
Thread-Topic: [PATCH v4] pruss-lld: Add rtos recipe & update the version to
 1.0.0.7
Thread-Index: AQHTMLvibndkxr+ouk682b3gMgVXNw==
Date: Mon, 18 Sep 2017 20:22:39 +0000
Message-ID: <1505766159-40186-1-git-send-email-m-radhakrishnan2@ti.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AuthSource: DFLE111.ent.ti.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

RTOS low level driver for the PRUSS module
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v4 - Updated the commit message
 v3 - Added k2g SOC family in place of k2g-evm & k2g-hs-evm
 v2 - Added summary

 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb | 23 +++++++++++++++++++++++
 recipes-bsp/pruss-lld/pruss-lld.inc         |  8 ++++----
 2 files changed, 27 insertions(+), 4 deletions(-)
 create mode 100644 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb

diff --git a/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb b/recipes-bsp/prus=
s-lld/pruss-lld-rtos_git.bb
new file mode 100644
index 0000000..5068286
--- /dev/null
+++ b/recipes-bsp/pruss-lld/pruss-lld-rtos_git.bb
@@ -0,0 +1,23 @@
+SUMMARY =3D "TI RTOS low level driver library for PRUSS"
+
+inherit ti-pdk
+require recipes-bsp/pruss-lld/pruss-lld.inc
+
+PR =3D "${INC_PR}.0"
+
+S =3D "${WORKDIR}/${PRUSS_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS_append =3D " osal-rtos"
+DEPENDS_append_ti33x =3D " starterware-rtos"
+DEPENDS_append_ti43x =3D " starterware-rtos"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE =3D "0"
+
+export PDK_PRUSS_ROOT_PATH =3D"${WORKDIR}/build"
+export DEST_ROOT=3D"${WORKDIR}/build"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT =3D "PRUSS LLD"
+
+INSANE_SKIP_${PN} =3D "arch"
diff --git a/recipes-bsp/pruss-lld/pruss-lld.inc b/recipes-bsp/pruss-lld/pr=
uss-lld.inc
index 8620108..44d84b8 100644
--- a/recipes-bsp/pruss-lld/pruss-lld.inc
+++ b/recipes-bsp/pruss-lld/pruss-lld.inc
@@ -1,7 +1,7 @@
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://pruicss.h;beginline=3D1;endline=3D31;md5=3D31=
5177aa03d58bcd124a6e799e2bd458"

-COMPATIBLE_MACHINE =3D "ti33x|ti43x|am57xx-evm|k2g-evm"
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|am57xx-evm|k2g"
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"

 PRUSS_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/pruss-lld.git"
@@ -9,12 +9,12 @@ PRUSS_LLD_GIT_PROTOCOL =3D "git"
 PRUSS_LLD_GIT_BRANCH =3D "master"
 PRUSS_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/pruss"

-# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.06A"
-PRUSS_LLD_SRCREV =3D "b98729cc1fc26c9ac32846146892646a23c28adb"
+# Below commit ID corresponds to "DEV.PRUSS_LLD.01.00.00.07"
+PRUSS_LLD_SRCREV =3D "636bb5645014723c54c08245cf8c2ee401eceb4f"

 BRANCH =3D "${PRUSS_LLD_GIT_BRANCH}"
 SRC_URI =3D "${PRUSS_LLD_GIT_URI};destsuffix=3D${PRUSS_LLD_GIT_DESTSUFFIX}=
;protocol=3D${PRUSS_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"

 SRCREV =3D "${PRUSS_LLD_SRCREV}"
-PV =3D "01.00.00.06A"
+PV =3D "01.00.00.07"
 INC_PR =3D "r0"
--
1.9.1


--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4626DFLE12entticom_--
