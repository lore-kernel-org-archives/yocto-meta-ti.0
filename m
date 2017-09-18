Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6AFBE00BB1; Mon, 18 Sep 2017 13:31:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E4AAE00956
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 13:30:58 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IKUw26031919
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:30:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505766658;
	bh=oeLt/4+pjP8Br9JlVSXTJ7CiefDbOGTk3f2A3z3Yoa8=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Q8lremf0oGK44Z7cJVdUverlwdAoetT+EdOH5gcrZdg7EwzzpCgJ/60IqwF3DUzHk
	7LtgipBcg0rHs8AOWifbEiT9VEiqXUUHLxL+wDRDiyv8rQWmeP5bAqnY8b0c0LT0dW
	eG595jr2m0KfbYu/ScZZqkcGjY7VWlj36vinO5jE=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKUwwF002879
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:30:58 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Mon, 18 Sep 2017 15:30:57 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v2 34/37] ti-ndk: Adding recipe for ti-ndk
Thread-Index: AQHTABpG5oG9X5iph0aGUA1S2+OLWKKUfSeAgCb7/9A=
Date: Mon, 18 Sep 2017 20:30:57 +0000
Message-ID: <5130E41A1BA9D145BA0F3B18D5CFB0A7437F46A6@DFLE12.ent.ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-34-git-send-email-m-radhakrishnan2@ti.com>
	<20170824200837.GN28233@edge>
In-Reply-To: <20170824200837.GN28233@edge>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2 34/37] ti-ndk: Adding recipe for ti-ndk
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
X-List-Received-Date: Mon, 18 Sep 2017 20:31:02 -0000
X-Groupsio-MsgNum: 10377
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F46A6DFLE12entticom_"

--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F46A6DFLE12entticom_
Content-Type: multipart/alternative;
	boundary="_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F46A6DFLE12entticom_"

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F46A6DFLE12entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Please see my reply inline.

I have submitted the attached patch after making the changes( v3) and updat=
ing commit message (v4)



Regards

Mahesh



-----Original Message-----
From: Dmytriyenko, Denys
Sent: Thursday, August 24, 2017 4:09 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2 34/37] ti-ndk: Adding recipe for ti-ndk



On Tue, Jul 18, 2017 at 07:03:45PM -0400, Mahesh Radhakrishnan wrote:

> Upstreaming recipe for TI RTOS Networking development kit

>

> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com<mailto:m-rad=
hakrishnan2@ti.com>>

> ---

>

> v2 - Added summmary  & merged in to a single recipe

>

>  recipes-ti/ndk/ti-ndk.inc           | 21 +++++++++++++++++++++

>  recipes-ti/ndk/ti-ndk_2.25.01.11.bb | 17 +++++++++++++++++

>  2 files changed, 38 insertions(+)

>  create mode 100644 recipes-ti/ndk/ti-ndk.inc  create mode 100644

> recipes-ti/ndk/ti-ndk_2.25.01.11.bb

>

> diff --git a/recipes-ti/ndk/ti-ndk.inc b/recipes-ti/ndk/ti-ndk.inc new

> file mode 100644 index 0000000..09d9ea0

> --- /dev/null

> +++ b/recipes-ti/ndk/ti-ndk.inc

> @@ -0,0 +1,21 @@

> +SUMMARY =3D "TI RTOS_Networking"

> +HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targe=
tcontent/ndk/index.html"

> +SECTION =3D "devel"

> +LICENSE =3D "BSD"

> +

> +require recipes-ti/includes/ti-paths.inc

> +

> +S =3D "${WORKDIR}/ndk_${PV}"

> +

> +SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/ndk/${PV}/exports/ndk_${PV}.zip;name=3Dndkzip<http://software-dl.ti=
.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ndk/$%7bPV%7d/exports/ndk_$%7=
bPV%7d.zip;name=3Dndkzip>"

> +

> +do_install() {

> +    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downersh=
ip"

> +    install -d ${D}${NDK_INSTALL_DIR_RECIPE}

> +    cp ${CP_ARGS} ${S}/* ${D}${NDK_INSTALL_DIR_RECIPE} }

> +

> +ALLOW_EMPTY_${PN} =3D "1"

> +FILES_${PN}-dev +=3D "${NDK_INSTALL_DIR_RECIPE}"

> +

> +INSANE_SKIP_${PN}-dev =3D "arch ldflags staticdev"

> diff --git a/recipes-ti/ndk/ti-ndk_2.25.01.11.bb

> b/recipes-ti/ndk/ti-ndk_2.25.01.11.bb

> new file mode 100644

> index 0000000..4369567

> --- /dev/null

> +++ b/recipes-ti/ndk/ti-ndk_2.25.01.11.bb

> @@ -0,0 +1,17 @@

> +require ti-ndk.inc

> +

> +PV =3D "2_25_01_11"

> +PR =3D "r0"

> +

> +LIC_FILES_CHKSUM =3D "file://ndk_${PV}_manifest.html;md5=3D80a8d9b76cf70=
0929d3f5b6df09052d6<file:///\\ndk_$%7bPV%7d_manifest.html;md5=3D80a8d9b76cf=
700929d3f5b6df09052d6>"

> +

> +SRC_URI[ndkzip.md5sum] =3D "e42bfcc8c3a6d183d60f26ec01ccc79b"

> +SRC_URI[ndkzip.sha256sum] =3D "a15bc9b570dc0628dd8b8c3665037a162610a6f86=
c5f17ebb6a329d3db60f071"

> +

> +INHIBIT_PACKAGE_STRIP =3D "1"

> +INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"

> +INHIBIT_SYSROOT_STRIP =3D "1"

> +

> +deltask do_create_srcipk

> +addtask create_srcipk after do_install before do_package



meta-ti doesn't have srcipk support.

This has been removed in the latest patch



> +

> --

> 1.9.1

>

> --

> _______________________________________________

> meta-ti mailing list

> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>

> https://lists.yoctoproject.org/listinfo/meta-ti

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F46A6DFLE12entticom_
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
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Please see my reply=
 inline.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><a name=3D"_MailEndCompose"><span style=3D"color:=
#558ED5;mso-style-textfill-fill-color:#558ED5;mso-style-textfill-fill-alpha=
:100.0%">I have submitted the attached patch after making the changes( v3) =
and updating commit message (v4)<o:p></o:p></span></a></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Regards<o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Mahesh<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">-----Original Message-----<br>
From: Dmytriyenko, Denys <br>
Sent: Thursday, August 24, 2017 4:09 PM<br>
To: Radhakrishnan, Mahesh<br>
Cc: meta-ti@yoctoproject.org<br>
Subject: Re: [meta-ti] [PATCH v2 34/37] ti-ndk: Adding recipe for ti-ndk</p=
>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">On Tue, Jul 18, 2017 at 07:03:45PM -0400, Mahesh =
Radhakrishnan wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Upstreaming recipe for TI RTOS Networking de=
velopment kit<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Signed-off-by: Mahesh Radhakrishnan &lt;<a h=
ref=3D"mailto:m-radhakrishnan2@ti.com"><span style=3D"color:windowtext;text=
-decoration:none">m-radhakrishnan2@ti.com</span></a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ---<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; v2 - Added summmary&nbsp; &amp; merged in to=
 a single recipe<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; recipes-ti/ndk/ti-ndk.inc&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 21 &#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; recipes-ti/ndk/ti-ndk_2.25.01.11.bb | =
17 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; 2 files changed, 38 insertions(&#43;)<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; create mode 100644 recipes-ti/ndk/ti-n=
dk.inc&nbsp; create mode 100644
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; recipes-ti/ndk/ti-ndk_2.25.01.11.bb<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/recipes-ti/ndk/ti-ndk.inc b/rec=
ipes-ti/ndk/ti-ndk.inc new
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; file mode 100644 index 0000000..09d9ea0<o:p>=
</o:p></p>
<p class=3D"MsoPlainText">&gt; --- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/recipes-ti/ndk/ti-ndk.inc<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -0,0 &#43;1,21 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SUMMARY =3D &quot;TI RTOS_Networking&qu=
ot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;HOMEPAGE =3D &quot;<a href=3D"http://so=
ftware-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ndk/index.html"><=
span style=3D"color:windowtext;text-decoration:none">http://software-dl.ti.=
com/dsps/dsps_public_sw/sdo_sb/targetcontent/ndk/index.html</span></a>&quot=
;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SECTION =3D &quot;devel&quot;<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; &#43;LICENSE =3D &quot;BSD&quot;<o:p></o:p><=
/p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;require recipes-ti/includes/ti-paths.in=
c<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;S =3D &quot;${WORKDIR}/ndk_${PV}&quot;<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SRC_URI =3D &quot;<a href=3D"http://sof=
tware-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/ndk/$%7bPV%7d/expo=
rts/ndk_$%7bPV%7d.zip;name=3Dndkzip"><span style=3D"color:windowtext;text-d=
ecoration:none">http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/target=
content/ndk/${PV}/exports/ndk_${PV}.zip;name=3Dndkzip</span></a>&quot;<o:p>=
</o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;do_install() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; CP_ARGS=3D&quot;-Prf=
 --preserve=3Dmode,timestamps --no-preserve=3Downership&quot;<o:p></o:p></p=
>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; install -d ${D}${NDK=
_INSTALL_DIR_RECIPE}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; cp ${CP_ARGS} ${S}/*=
 ${D}${NDK_INSTALL_DIR_RECIPE} }<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;ALLOW_EMPTY_${PN} =3D &quot;1&quot;<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;FILES_${PN}-dev &#43;=3D &quot;${NDK_IN=
STALL_DIR_RECIPE}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;INSANE_SKIP_${PN}-dev =3D &quot;arch ld=
flags staticdev&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/recipes-ti/ndk/ti-ndk_2.25.01.1=
1.bb <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; b/recipes-ti/ndk/ti-ndk_2.25.01.11.bb<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; new file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; index 0000000..4369567<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/recipes-ti/ndk/ti-ndk_2.25=
.01.11.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -0,0 &#43;1,17 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;require ti-ndk.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PV =3D &quot;2_25_01_11&quot;<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; &#43;PR =3D &quot;r0&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"f=
ile:///\\ndk_$%7bPV%7d_manifest.html;md5=3D80a8d9b76cf700929d3f5b6df09052d6=
"><span style=3D"color:windowtext;text-decoration:none">file://ndk_${PV}_ma=
nifest.html;md5=3D80a8d9b76cf700929d3f5b6df09052d6</span></a>&quot;<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SRC_URI[ndkzip.md5sum] =3D &quot;e42bfc=
c8c3a6d183d60f26ec01ccc79b&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SRC_URI[ndkzip.sha256sum] =3D &quot;a15=
bc9b570dc0628dd8b8c3665037a162610a6f86c5f17ebb6a329d3db60f071&quot;<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;INHIBIT_PACKAGE_DEBUG_SPLIT =3D &quot;1=
&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;deltask do_create_srcipk<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;addtask create_srcipk after do_install =
before do_package<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">meta-ti doesn't have srcipk support.<o:p></o:p></=
p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">This has been remov=
ed in the latest patch<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
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

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F46A6DFLE12entticom_--

--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F46A6DFLE12entticom_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Mon, 18 Sep 2017 20:30:56 GMT";
	modification-date="Mon, 18 Sep 2017 20:30:56 GMT"

Received: from DLEE103.ent.ti.com (157.170.170.33) by DFLE73.ent.ti.com
 (128.247.5.110) with Microsoft SMTP Server (TLS) id 14.3.294.0; Mon, 18 Sep
 2017 15:28:01 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34; Mon, 18
 Sep 2017 15:28:00 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend Transport;
 Mon, 18 Sep 2017 15:28:00 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
 v8IKS029027897;	Mon, 18 Sep 2017 15:28:00 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
CC: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Subject: [PATCH v4] ti-ndk: Adding recipe for ti-ndk
Thread-Topic: [PATCH v4] ti-ndk: Adding recipe for ti-ndk
Thread-Index: AQHTMLyfHk7MmqNfx0GUTbHbMRvHxQ==
Date: Mon, 18 Sep 2017 20:27:57 +0000
Message-ID: <1505766477-56677-1-git-send-email-m-radhakrishnan2@ti.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AuthSource: DLEE104.ent.ti.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Recipe for TI RTOS Networking development kit

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v4 - Updated the commit message
 v3 - Removed references to srcipk
 v2 - Added summmary  & merged in to a single recipe

 recipes-ti/ndk/ti-ndk.inc           | 21 +++++++++++++++++++++
 recipes-ti/ndk/ti-ndk_2.25.01.11.bb | 13 +++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-ti/ndk/ti-ndk.inc
 create mode 100644 recipes-ti/ndk/ti-ndk_2.25.01.11.bb

diff --git a/recipes-ti/ndk/ti-ndk.inc b/recipes-ti/ndk/ti-ndk.inc
new file mode 100644
index 0000000..09d9ea0
--- /dev/null
+++ b/recipes-ti/ndk/ti-ndk.inc
@@ -0,0 +1,21 @@
+SUMMARY =3D "TI RTOS_Networking"
+HOMEPAGE =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetc=
ontent/ndk/index.html"
+SECTION =3D "devel"
+LICENSE =3D "BSD"
+
+require recipes-ti/includes/ti-paths.inc
+
+S =3D "${WORKDIR}/ndk_${PV}"
+
+SRC_URI =3D "http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetco=
ntent/ndk/${PV}/exports/ndk_${PV}.zip;name=3Dndkzip"
+
+do_install() {
+    CP_ARGS=3D"-Prf --preserve=3Dmode,timestamps --no-preserve=3Downership=
"
+    install -d ${D}${NDK_INSTALL_DIR_RECIPE}
+    cp ${CP_ARGS} ${S}/* ${D}${NDK_INSTALL_DIR_RECIPE}
+}
+
+ALLOW_EMPTY_${PN} =3D "1"
+FILES_${PN}-dev +=3D "${NDK_INSTALL_DIR_RECIPE}"
+
+INSANE_SKIP_${PN}-dev =3D "arch ldflags staticdev"
diff --git a/recipes-ti/ndk/ti-ndk_2.25.01.11.bb b/recipes-ti/ndk/ti-ndk_2.=
25.01.11.bb
new file mode 100644
index 0000000..d5d926b
--- /dev/null
+++ b/recipes-ti/ndk/ti-ndk_2.25.01.11.bb
@@ -0,0 +1,13 @@
+require ti-ndk.inc
+
+PV =3D "2_25_01_11"
+PR =3D "r0"
+
+LIC_FILES_CHKSUM =3D "file://ndk_${PV}_manifest.html;md5=3D80a8d9b76cf7009=
29d3f5b6df09052d6"
+
+SRC_URI[ndkzip.md5sum] =3D "e42bfcc8c3a6d183d60f26ec01ccc79b"
+SRC_URI[ndkzip.sha256sum] =3D "a15bc9b570dc0628dd8b8c3665037a162610a6f86c5=
f17ebb6a329d3db60f071"
+
+INHIBIT_PACKAGE_STRIP =3D "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
+INHIBIT_SYSROOT_STRIP =3D "1"
--
1.9.1


--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F46A6DFLE12entticom_--
