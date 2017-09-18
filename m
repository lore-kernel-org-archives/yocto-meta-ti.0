Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79010E00C89; Mon, 18 Sep 2017 13:47:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1827EE00BB1
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 13:46:58 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IKkvx6000991
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:46:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505767617;
	bh=z0U8KJCY0zRaTHOjLb4BZsxr+iz9oDijpHZuaIDdy6w=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=BNJeyLlRI0ycaung/BrGl/8ttco2CiFih0jBVVwP65EOYDjSHcdNCYHcsRSYRgJ1u
	FZ7G0ePG2dcDMpEKzH04WHMUskw0tdSbmQUrLGC4n6v7+2f+3jkuYkNLeKzBqsVqD4
	7WAw/ArJ55QtcMO21z9+TISRb/pJ1WD7jtpKrBTc=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKkvH1013950
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:46:57 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Mon, 18 Sep 2017 15:46:57 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v2 33/37] vps-lld-rtos: Added rtos recipe for
	vps-lld
Thread-Index: AQHTABpFFGW/xmU4jUOYqXa+6OkkYaKUfKSAgCcA1sA=
Date: Mon, 18 Sep 2017 20:46:57 +0000
Message-ID: <5130E41A1BA9D145BA0F3B18D5CFB0A7437F47EE@DFLE12.ent.ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-33-git-send-email-m-radhakrishnan2@ti.com>
	<20170824200647.GM28233@edge>
In-Reply-To: <20170824200647.GM28233@edge>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2 33/37] vps-lld-rtos: Added rtos recipe for vps-lld
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
X-List-Received-Date: Mon, 18 Sep 2017 20:47:01 -0000
X-Groupsio-MsgNum: 10381
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F47EEDFLE12entticom_"

--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F47EEDFLE12entticom_
Content-Type: multipart/alternative;
	boundary="_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F47EEDFLE12entticom_"

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F47EEDFLE12entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



HI Denys,

My comments inline.

I have submitted a new patch for vps-lld incorporating these changes. (atta=
ched)



Regards

Mahesh



-----Original Message-----
From: Dmytriyenko, Denys
Sent: Thursday, August 24, 2017 4:07 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2 33/37] vps-lld-rtos: Added rtos recipe for=
 vps-lld



Same exact questions/comments as for #25 pm-lld-rtos...

This recipe has been modified to use ti-pdk.bbclass (similar to the changes=
 done for pm-lld-rtos)



On Tue, Jul 18, 2017 at 07:03:44PM -0400, Mahesh Radhakrishnan wrote:

> Upstreaming RTOS low level driver for Video processing subsystem.

>

> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com<mailto:m-rad=
hakrishnan2@ti.com>>

> ---

>

> v2 - Added summary & merged in to a single recipe

>

>  recipes-bsp/vps-lld/vps-lld-rtos_git.bb | 94

> +++++++++++++++++++++++++++++++++

>  1 file changed, 94 insertions(+)

>  create mode 100644 recipes-bsp/vps-lld/vps-lld-rtos_git.bb

>

> diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb

> b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb

> new file mode 100644

> index 0000000..8f759b8

> --- /dev/null

> +++ b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb

> @@ -0,0 +1,94 @@

> +SUMMARY =3D "TI RTOS Low level driver for Video Processing Subsystem (VP=
S) "

> +

> +require recipes-ti/includes/ti-paths.inc

> +

> +LICENSE =3D "BSD-3-Clause"

> +LIC_FILES_CHKSUM =3D "file://COPYING.txt;beginline=3D1;endline=3D32;md5=
=3D4303d306ea53eb66132983d6901c137d<file:///\\COPYING.txt;beginline=3D1;end=
line=3D32;md5=3D4303d306ea53eb66132983d6901c137d>"

> +

> +COMPATIBLE_MACHINE =3D "omap-a15"

> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"

> +

> +VPS_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/vps.git"

> +VPS_LLD_GIT_PROTOCOL =3D "git"

> +VPS_LLD_GIT_BRANCH =3D "master"

> +VPS_LLD_GIT_DESTSUFFIX =3D "git"

> +VPS_PACKAGE_BASE   =3D "${S}/../vps_base"

> +VPS_LLD_ROOTPATH =3D "${VPS_PACKAGE_BASE}/package/all/pdk_/packages/ti/d=
rv/vps"

> +

> +# Below commit ID corresponds to "DEV.VPS_LLD.01.00.01.06B"

> +VPS_LLD_SRCREV =3D "58729317b65bdb24d4343cbb1f7f6cb90ca2faf0"

> +

> +BRANCH =3D "${VPS_LLD_GIT_BRANCH}"

> +SRC_URI =3D "${VPS_LLD_GIT_URI};destsuffix=3D${VPS_LLD_GIT_DESTSUFFIX};p=
rotocol=3D${VPS_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"

> +

> +SRCREV =3D "${VPS_LLD_SRCREV}"

> +PV =3D "01.00.01.06B"

> +PR =3D "r0"

> +

> +S =3D "${WORKDIR}/${VPS_LLD_GIT_DESTSUFFIX}"

> +

> +DEPENDS =3D " ti-cgt6x-native \

> +            ti-cgt-arm-native \

> +            ti-sysbios \

> +            common-csl-ip-rtos \

> +            gcc-arm-none-eabi-native \

> +            osal-rtos \

> +            ca-certificates-native \

> +            ti-pdk-setup \

> +            edma3-lld-rtos \

> +            board-rtos \

> +            uart-lld-rtos \

> +            i2c-lld-rtos \

> +            pm-lld-rtos \

> +"

> +

> +# Fetch task cannot be completed until after ca-certificates-native

> +populates sysroot with the SSL certificates do_fetch[depends] =3D "ca-ce=
rtificates-native:do_populate_sysroot"

> +

> +export TOOLCHAIN_PATH_A15 =3D "${GCC_ARM_NONE_TOOLCHAIN}"

> +export FPULIB_PATH =3D "${GCC_ARM_NONE_TOOLCHAIN}/lib/gcc/arm-none-eabi/=
4.9.3/fpu/"

> +export TOOLCHAIN_PATH_M4 =3D "${M4_TOOLCHAIN_INSTALL_DIR}"

> +export C6X_GEN_INSTALL_PATH =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-=
c6x"

> +export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"

> +export BIOS_INSTALL_PATH =3D "${SYSBIOS_INSTALL_DIR}"

> +export XDC_INSTALL_PATH =3D "${XDC_INSTALL_DIR}"

> +export EDMA3LLD_BIOS6_INSTALLDIR =3D "${EDMA3_LLD_INSTALL_DIR}"

> +

> +export PDK_VPS_ROOT_PATH =3D "${VPS_PACKAGE_BASE}/package/all/pdk_/packa=
ges"

> +

> +BOARD_PACKAGE =3D ""

> +BOARD_PACKAGE_am57xx-evm =3D "evmAM572x"

> +BOARD_PACKAGE_dra7xx-evm =3D "evmDRA75x"

> +

> +

> +do_configure() {

> +    rm -rf ${VPS_PACKAGE_BASE}

> +    cd ${S}

> +

> +    # remove any previous package

> +    rm -f ${VPS_PACKAGE_BASE}

> +

> +    # make the release package before building it

> +    make package BOARD=3D${BOARD_PACKAGE} DEST_ROOT=3D${VPS_PACKAGE_BASE=
}

> +PDK_VPS_COMP_PATH=3D${S} }

> +

> +do_compile() {

> +    echo "vps lld root path is ${VPS_LLD_ROOTPATH}"

> +    cd ${VPS_LLD_ROOTPATH}

> +

> +    # Build am572x and am571x libraries

> +    make clean lib xdc_meta doxygen LIMIT_SOCS=3D"${TI_PDK_LIMIT_SOCS}" =
LIMIT_BOARDS=3D"${TI_PDK_LIMIT_BOARDS}"

> +

> +    #archive

> +    tar -cf vps_lld.tar --exclude=3D'*.tar' ./* }

> +

> +do_install() {

> +    cd ${VPS_LLD_ROOTPATH}

> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/vps

> +    find -name "*.tar" -exec tar xf {} --no-same-owner -C

> +${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/vps \; }

> +

> +FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"

> +

> +INSANE_SKIP_${PN} =3D "arch ldflags"

> --

> 1.9.1

>

> --

> _______________________________________________

> meta-ti mailing list

> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>

> https://lists.yoctoproject.org/listinfo/meta-ti

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F47EEDFLE12entticom_
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
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><a name=3D"_MailEndCompose"><span style=3D"color:=
#558ED5;mso-style-textfill-fill-color:#558ED5;mso-style-textfill-fill-alpha=
:100.0%">HI Denys,<o:p></o:p></span></a></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">My comments inline.=
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">I have submitted a =
new patch for vps-lld incorporating these changes. (attached)<o:p></o:p></s=
pan></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Regards<o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Mahesh<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText">-----Original Message-----<br>
From: Dmytriyenko, Denys <br>
Sent: Thursday, August 24, 2017 4:07 PM<br>
To: Radhakrishnan, Mahesh<br>
Cc: meta-ti@yoctoproject.org<br>
Subject: Re: [meta-ti] [PATCH v2 33/37] vps-lld-rtos: Added rtos recipe for=
 vps-lld</p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Same exact questions/comments as for #25 pm-lld-r=
tos...<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">This recipe has bee=
n modified to use ti-pdk.bbclass (similar to the changes done for pm-lld-rt=
os)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText">On Tue, Jul 18, 2017 at 07:03:44PM -0400, Mahesh =
Radhakrishnan wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Upstreaming RTOS low level driver for Video =
processing subsystem.<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Signed-off-by: Mahesh Radhakrishnan &lt;<a h=
ref=3D"mailto:m-radhakrishnan2@ti.com"><span style=3D"color:windowtext;text=
-decoration:none">m-radhakrishnan2@ti.com</span></a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ---<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; v2 - Added summary &amp; merged in to a sing=
le recipe<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; recipes-bsp/vps-lld/vps-lld-rtos_git.b=
b | 94 <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; 1 file changed, 94 insertions(&#43;)<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; create mode 100644 recipes-bsp/vps-lld=
/vps-lld-rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/recipes-bsp/vps-lld/vps-lld-rto=
s_git.bb <o:p>
</o:p></p>
<p class=3D"MsoPlainText">&gt; b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt; new file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; index 0000000..8f759b8<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/recipes-bsp/vps-lld/vps-ll=
d-rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -0,0 &#43;1,94 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SUMMARY =3D &quot;TI RTOS Low level dri=
ver for Video Processing Subsystem (VPS) &quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;require recipes-ti/includes/ti-paths.in=
c<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;LICENSE =3D &quot;BSD-3-Clause&quot;<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"f=
ile:///\\COPYING.txt;beginline=3D1;endline=3D32;md5=3D4303d306ea53eb6613298=
3d6901c137d"><span style=3D"color:windowtext;text-decoration:none">file://C=
OPYING.txt;beginline=3D1;endline=3D32;md5=3D4303d306ea53eb66132983d6901c137=
d</span></a>&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;COMPATIBLE_MACHINE =3D &quot;omap-a15&q=
uot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&=
quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;VPS_LLD_GIT_URI =3D &quot;git://git.ti.=
com/keystone-rtos/vps.git&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;VPS_LLD_GIT_PROTOCOL =3D &quot;git&quot=
;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;VPS_LLD_GIT_BRANCH =3D &quot;master&quo=
t;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;VPS_LLD_GIT_DESTSUFFIX =3D &quot;git&qu=
ot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;VPS_PACKAGE_BASE&nbsp;&nbsp; =3D &quot;=
${S}/../vps_base&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;VPS_LLD_ROOTPATH =3D &quot;${VPS_PACKAG=
E_BASE}/package/all/pdk_/packages/ti/drv/vps&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# Below commit ID corresponds to &quot;=
DEV.VPS_LLD.01.00.01.06B&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;VPS_LLD_SRCREV =3D &quot;58729317b65bdb=
24d4343cbb1f7f6cb90ca2faf0&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;BRANCH =3D &quot;${VPS_LLD_GIT_BRANCH}&=
quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SRC_URI =3D &quot;${VPS_LLD_GIT_URI};de=
stsuffix=3D${VPS_LLD_GIT_DESTSUFFIX};protocol=3D${VPS_LLD_GIT_PROTOCOL};bra=
nch=3D${BRANCH}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SRCREV =3D &quot;${VPS_LLD_SRCREV}&quot=
;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PV =3D &quot;01.00.01.06B&quot;<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PR =3D &quot;r0&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;S =3D &quot;${WORKDIR}/${VPS_LLD_GIT_DE=
STSUFFIX}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS =3D &quot; ti-cgt6x-native \<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ti-cgt-arm-native \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ti-sysbios \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; common-csl-ip-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; gcc-arm-none-eabi-native \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; osal-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ca-certificates-native \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ti-pdk-setup \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; edma3-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; board-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; uart-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; i2c-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; pm-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# Fetch task cannot be completed until =
after ca-certificates-native
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;populates sysroot with the SSL certific=
ates do_fetch[depends] =3D &quot;ca-certificates-native:do_populate_sysroot=
&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export TOOLCHAIN_PATH_A15 =3D &quot;${G=
CC_ARM_NONE_TOOLCHAIN}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export FPULIB_PATH =3D &quot;${GCC_ARM_=
NONE_TOOLCHAIN}/lib/gcc/arm-none-eabi/4.9.3/fpu/&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export TOOLCHAIN_PATH_M4 =3D &quot;${M4=
_TOOLCHAIN_INSTALL_DIR}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export C6X_GEN_INSTALL_PATH =3D &quot;$=
{STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export PDK_INSTALL_PATH =3D &quot;${PDK=
_INSTALL_DIR}/packages&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export BIOS_INSTALL_PATH =3D &quot;${SY=
SBIOS_INSTALL_DIR}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export XDC_INSTALL_PATH =3D &quot;${XDC=
_INSTALL_DIR}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export EDMA3LLD_BIOS6_INSTALLDIR =3D &q=
uot;${EDMA3_LLD_INSTALL_DIR}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export PDK_VPS_ROOT_PATH =3D &quot;${VP=
S_PACKAGE_BASE}/package/all/pdk_/packages&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;BOARD_PACKAGE =3D &quot;&quot;<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; &#43;BOARD_PACKAGE_am57xx-evm =3D &quot;evmA=
M572x&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;BOARD_PACKAGE_dra7xx-evm =3D &quot;evmD=
RA75x&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;do_configure() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; rm -rf ${VPS_PACKAGE=
_BASE}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp; &nbsp;cd ${S}<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; # remove any previou=
s package<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; rm -f ${VPS_PACKAGE_=
BASE}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; # make the release p=
ackage before building it<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; make package BOARD=
=3D${BOARD_PACKAGE} DEST_ROOT=3D${VPS_PACKAGE_BASE}
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PDK_VPS_COMP_PATH=3D${S} }<o:p></o:p></=
p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;do_compile() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; echo &quot;vps lld r=
oot path is ${VPS_LLD_ROOTPATH}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; cd ${VPS_LLD_ROOTPAT=
H}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; # Build am572x and a=
m571x libraries<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; make clean lib xdc_m=
eta doxygen LIMIT_SOCS=3D&quot;${TI_PDK_LIMIT_SOCS}&quot; LIMIT_BOARDS=3D&q=
uot;${TI_PDK_LIMIT_BOARDS}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; #archive<o:p></o:p><=
/p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; tar -cf vps_lld.tar =
--exclude=3D'*.tar' ./* }<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;do_install() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; cd ${VPS_LLD_ROOTPAT=
H}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; install -d ${D}${PDK=
_INSTALL_DIR_RECIPE}/packages/ti/drv/vps<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; find -name &quot;*.t=
ar&quot; -exec tar xf {} --no-same-owner -C
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;${D}${PDK_INSTALL_DIR_RECIPE}/packages/=
ti/drv/vps \; }<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;FILES_${PN} &#43;=3D &quot;${PDK_INSTAL=
L_DIR_RECIPE}/packages&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;INSANE_SKIP_${PN} =3D &quot;arch ldflag=
s&quot;<o:p></o:p></p>
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

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F47EEDFLE12entticom_--

--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F47EEDFLE12entticom_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Mon, 18 Sep 2017 20:46:56 GMT";
	modification-date="Mon, 18 Sep 2017 20:46:56 GMT"

Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE73.ent.ti.com
 (128.247.5.110) with Microsoft SMTP Server (TLS) id 14.3.294.0; Mon, 18 Sep
 2017 15:43:36 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34; Mon, 18
 Sep 2017 15:43:36 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend Transport;
 Mon, 18 Sep 2017 15:43:36 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
 v8IKhaXF023220;	Mon, 18 Sep 2017 15:43:36 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
CC: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Subject: [PATCH v4] vps-lld-rtos: Added rtos recipe for vps-lld
Thread-Topic: [PATCH v4] vps-lld-rtos: Added rtos recipe for vps-lld
Thread-Index: AQHTML7NMUXkl9VmIECyCHBI5rECHA==
Date: Mon, 18 Sep 2017 20:43:34 +0000
Message-ID: <1505767414-4178-1-git-send-email-m-radhakrishnan2@ti.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AuthSource: DFLE113.ent.ti.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

RTOS low level driver for Video processing subsystem.

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v4 - Modifications to use ti-pdk.bbclass
 v3 - Removed intermediate tar-untar for do-install
 v2 - Added summary

 recipes-bsp/vps-lld/vps-lld-rtos_git.bb | 52 +++++++++++++++++++++++++++++=
++++
 1 file changed, 52 insertions(+)
 create mode 100644 recipes-bsp/vps-lld/vps-lld-rtos_git.bb

diff --git a/recipes-bsp/vps-lld/vps-lld-rtos_git.bb b/recipes-bsp/vps-lld/=
vps-lld-rtos_git.bb
new file mode 100644
index 0000000..f13e2fc
--- /dev/null
+++ b/recipes-bsp/vps-lld/vps-lld-rtos_git.bb
@@ -0,0 +1,52 @@
+SUMMARY =3D "TI RTOS Low level driver for Video Processing Subsystem (VPS)=
 "
+
+require recipes-ti/includes/ti-paths.inc
+inherit ti-pdk
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://COPYING.txt;beginline=3D1;endline=3D32;md5=3D=
4303d306ea53eb66132983d6901c137d"
+
+COMPATIBLE_MACHINE =3D "omap-a15"
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+VPS_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/vps.git"
+VPS_LLD_GIT_PROTOCOL =3D "git"
+VPS_LLD_GIT_BRANCH =3D "master"
+VPS_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/vps"
+
+# Below commit ID corresponds to "DEV.VPS_LLD.01.00.01.06B"
+VPS_LLD_SRCREV =3D "58729317b65bdb24d4343cbb1f7f6cb90ca2faf0"
+
+BRANCH =3D "${VPS_LLD_GIT_BRANCH}"
+SRC_URI =3D "${VPS_LLD_GIT_URI};destsuffix=3D${VPS_LLD_GIT_DESTSUFFIX};pro=
tocol=3D${VPS_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
+
+SRCREV =3D "${VPS_LLD_SRCREV}"
+PV =3D "01.00.01.06B"
+PR =3D "r0"
+
+S =3D "${WORKDIR}/${VPS_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS =3D " ti-sysbios \
+            osal-rtos \
+            edma3-lld-rtos \
+            board-rtos \
+            uart-lld-rtos \
+            i2c-lld-rtos \
+            pm-lld-rtos \
+"
+export PDK_VPS_COMP_PATH =3D "${WORKDIR}/build"
+export DEST_ROOT=3D"${S}"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE =3D "0"
+
+do_compile_append() {
+    # Delete archive created by XDC release command since it does not cont=
ain all content
+    find -name "*.tar" -exec rm -f {} \;
+
+    # Archive from build/ to capture ti/drv/pm/ in archive
+    cd ${B}
+    tar -cf pm_lld.tar --exclude=3D'*.tar' ./*
+}
+
+INSANE_SKIP_${PN} =3D "arch ldflags"
--
1.9.1


--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F47EEDFLE12entticom_--
