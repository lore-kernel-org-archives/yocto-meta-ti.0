Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 184D4E00C89; Mon, 18 Sep 2017 11:03:37 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 87C9FE00C89
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 11:03:35 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8II3O7p008249
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 13:03:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505757804;
	bh=GlH1F5uFpgHIU07gI4xUpI6vMP80Pjl6hztNvbDqLks=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=HUjvU1AFuZfW5wUhwEyjUqlfgIiiaWK33g65JwK2rOgve0u6x1MyZ60kKiNKMPFpF
	ttOOyerz6fHIC/ZeG5p3Gf/kr6d5zPTp7l57crFS4YnJMKDwBE0aQPPlYOmG2MhaD3
	2KkmgDIvbi1sEECdn3keFtyHbnVcQSH8SE2BTCEs=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8II3JoT016884
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 13:03:19 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Mon, 18 Sep 2017 13:03:19 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v2 25/37] pm-lld-rtos: Adding rtos recipe for
	pm-lld
Thread-Index: AQHTABo/4dA9rIaZ80qoj7DcuKpQZ6KUeIKAgCbWZKA=
Date: Mon, 18 Sep 2017 18:03:18 +0000
Message-ID: <5130E41A1BA9D145BA0F3B18D5CFB0A7437F42A1@DFLE12.ent.ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-25-git-send-email-m-radhakrishnan2@ti.com>
	<20170824195159.GH28233@edge>
In-Reply-To: <20170824195159.GH28233@edge>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.221]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2 25/37] pm-lld-rtos: Adding rtos recipe for pm-lld
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
X-List-Received-Date: Mon, 18 Sep 2017 18:03:37 -0000
X-Groupsio-MsgNum: 10372
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F42A1DFLE12entticom_"

--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F42A1DFLE12entticom_
Content-Type: multipart/alternative;
	boundary="_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F42A1DFLE12entticom_"

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F42A1DFLE12entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

Submitted a new patch for pm-lld (attached). Responses linline.

Please let me know if it looks okay now.



Regards

Mahesh

-----Original Message-----
From: Dmytriyenko, Denys
Sent: Thursday, August 24, 2017 3:52 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2 25/37] pm-lld-rtos: Adding rtos recipe for=
 pm-lld



On Tue, Jul 18, 2017 at 07:03:36PM -0400, Mahesh Radhakrishnan wrote:

> Upstreaming TI RTOS low level driver for Power Management module (PM)

> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com<mailto:m-rad=
hakrishnan2@ti.com>>

> ---

>

> v2 - Added summary & merged in to a single recipe

>

>  recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 95

> +++++++++++++++++++++++++++++++++++

>  1 file changed, 95 insertions(+)

>  create mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bb

>

> diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb

> b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb

> new file mode 100644

> index 0000000..c976deb

> --- /dev/null

> +++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb

> @@ -0,0 +1,95 @@

> +SUMMARY =3D "TI RTOS driver for Power Management module (PM)"

> +

> +require recipes-ti/includes/ti-paths.inc

> +

> +LICENSE =3D "BSD-3-Clause"

> +LIC_FILES_CHKSUM =3D "file://Power.h;beginline=3D1;endline=3D31;md5=3D52=
7b91fdcd26cd19ac07a754f45dedbe<file:///\\Power.h;beginline=3D1;endline=3D31=
;md5=3D527b91fdcd26cd19ac07a754f45dedbe>"

> +

> +COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g"

> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"

> +

> +

> +PM_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/pm-lld.git"

> +PM_LLD_GIT_PROTOCOL =3D "git"

> +PM_LLD_GIT_BRANCH =3D "int_pm_am335x"

> +PM_LLD_GIT_BRANCH_dra7xx-evm =3D "master"



^^^





> +PM_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/pm"

> +

> +# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.01"

> +PM_LLD_SRCREV =3D "c4908f94b3e655e6298aa9bfe9bbffbbc5d16111"

> +

> +# Below commit ID corresponds to "REL.PDK.TDA.01.07.00.06"

> +PM_LLD_SRCREV_dra7xx-evm =3D "46ea13503d2991f636197edb206a9f62cea398d4"



^^^



In some places here you use more generic "omap-a15" SOC family, but in thes=
e 2 places I highlighted, you use very specific "dra7xx-evm", which will ex=
clude platforms like "dra7xx-hs-evm" as well as "am57xx-evm" and use "int_p=
m_am335x"

branch for those. Please confirm you actually want to do that.

Yes. I have confirmed with automotive team that we use specific versions fo=
r dra7xx-evm. This module is not used for dra7xx-hs-evm.



> +

> +BRANCH =3D "${PM_LLD_GIT_BRANCH}"

> +SRC_URI =3D "${PM_LLD_GIT_URI};destsuffix=3D${PM_LLD_GIT_DESTSUFFIX};pro=
tocol=3D${PM_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"

> +

> +#PATCHTOOL =3D "git"

> +#SRC_URI_append =3D " \

> +#    file://.patch<file:///\\.patch> \

> +#"



Leftovers ^^^

Yes. They have been removed in the latest patch.





> +SRCREV =3D "${PM_LLD_SRCREV}"

> +PV =3D "01.04.00.01"

> +PR =3D "r0"

> +

> +S =3D "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"

> +

> +DEPENDS =3D " ti-sysbios \

> +            gcc-arm-none-eabi-native \

> +            osal-rtos \

> +            ca-certificates-native \

> +            ti-pdk-setup \

> +"

> +DEPENDS_append_omap-a15 =3D " ti-cgt-arm-native \

> +                            ti-cgt6x-native \

> +                            common-csl-ip-rtos \ "

> +DEPENDS_append_ti33x =3D " starterware-rtos \ "

> +DEPENDS_append_ti43x =3D " starterware-rtos \ "

> +DEPENDS_append_k2g =3D " common-csl-ip-rtos \

> +                       ti-cgt6x-native \ "

> +

> +# Fetch task cannot be completed until after ca-certificates-native

> +populates sysroot with the SSL certificates do_fetch[depends] =3D "ca-ce=
rtificates-native:do_populate_sysroot"



Why? Shouldn't be a problem accessing git.ti.com over git protocol.

Yes. They have been removed in the latest patch.





> +export TOOLCHAIN_PATH_A15 =3D "${GCC_ARM_NONE_TOOLCHAIN}"

> +export TOOLCHAIN_PATH_A8 =3D "${GCC_ARM_NONE_TOOLCHAIN}"

> +export TOOLCHAIN_PATH_A9 =3D "${GCC_ARM_NONE_TOOLCHAIN}"

> +export FPULIB_PATH =3D "${GCC_ARM_NONE_TOOLCHAIN}/lib/gcc/arm-none-eabi/=
4.9.3/fpu/"

> +export TOOLCHAIN_PATH_M4 =3D "${M4_TOOLCHAIN_INSTALL_DIR}"

> +export C6X_GEN_INSTALL_PATH =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-=
c6x"

> +export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"

> +export BIOS_INSTALL_PATH =3D "${SYSBIOS_INSTALL_DIR}"

> +export XDC_INSTALL_PATH =3D "${XDC_INSTALL_DIR}"



Aren't those already defined in a .inc file?

In the latest patch submitted, ti-pdk.bbclass has been used and the above a=
re removed.



> +export PDK_PM_ROOT_PATH =3D "${WORKDIR}/git"

> +

> +# Used by DEST_ROOT to redirect binary and obj files away from

> +sysroot PDK tree OBJ_DIR =3D "${WORKDIR}/git/ti/binary"

> +

> +do_compile() {

> +    make clean lib xdc_meta doxygen LIMIT_SOCS=3D"${TI_PDK_LIMIT_SOCS}"

> +LIMIT_BOARDS=3D"${TI_PDK_LIMIT_BOARDS}" DEST_ROOT=3D${OBJ_DIR}



BTW, doxygen is not available in meta-ti nor in the only other dependent la=
yer which is oe-core.

The doxygen target is no longer built with the latest patch.



> +    # Remove unnecessary files from packaging

> +    rm -rf patches/

> +

> +    # Cleanup docs

> +    rm -rf docs/ReleaseNotes_PM_LLD.doc

> +    rm -rf internal/

> +

> +    #archive

> +    tar -cf pm_lld.tar --exclude=3D'*.tar' ./*

> +}

> +

> +do_install() {

> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/drv/pm

> +    find -name "*.tar" -exec tar xf {} --no-same-owner -C ${D}${PDK_INST=
ALL_DIR_RECIPE}/packages/ti/drv/pm \;



Is it necessary to tar-up everything at the end of do_compile and then un-t=
ar

in do_install?



The latest patch uses ti-pdk.bbclass and the do_Compile has been appended b=
y generating a tar file    which the do_install of ti-pdk.bbclass will unta=
r.

> +}

> +

> +FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"

> +

> +INSANE_SKIP_${PN} =3D "arch staticdev"

> --

> 1.9.1

>

> --

> _______________________________________________

> meta-ti mailing list

> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>

> https://lists.yoctoproject.org/listinfo/meta-ti

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F42A1DFLE12entticom_
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
<p class=3D"MsoPlainText"><span style=3D"color:#376092;mso-style-textfill-f=
ill-color:#376092;mso-style-textfill-fill-alpha:100.0%">Denys,<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#376092;mso-style-textfill-f=
ill-color:#376092;mso-style-textfill-fill-alpha:100.0%">Submitted a new pat=
ch for pm-lld (attached). Responses linline.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><a name=3D"_MailEndCompose"><span style=3D"color:=
#376092;mso-style-textfill-fill-color:#376092;mso-style-textfill-fill-alpha=
:100.0%">Please let me know if it looks okay now.<o:p></o:p></span></a></p>
<p class=3D"MsoPlainText"><span style=3D"color:#376092;mso-style-textfill-f=
ill-color:#376092;mso-style-textfill-fill-alpha:100.0%"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#376092;mso-style-textfill-f=
ill-color:#376092;mso-style-textfill-fill-alpha:100.0%">Regards<o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#376092;mso-style-textfill-f=
ill-color:#376092;mso-style-textfill-fill-alpha:100.0%">Mahesh<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText">-----Original Message-----<br>
From: Dmytriyenko, Denys <br>
Sent: Thursday, August 24, 2017 3:52 PM<br>
To: Radhakrishnan, Mahesh<br>
Cc: meta-ti@yoctoproject.org<br>
Subject: Re: [meta-ti] [PATCH v2 25/37] pm-lld-rtos: Adding rtos recipe for=
 pm-lld</p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">On Tue, Jul 18, 2017 at 07:03:36PM -0400, Mahesh =
Radhakrishnan wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Upstreaming TI RTOS low level driver for Pow=
er Management module (PM)<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Signed-off-by: Mahesh Radhakrishnan &lt;<a h=
ref=3D"mailto:m-radhakrishnan2@ti.com"><span style=3D"color:windowtext;text=
-decoration:none">m-radhakrishnan2@ti.com</span></a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ---<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; v2 - Added summary &amp; merged in to a sing=
le recipe<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; recipes-bsp/pm-lld/pm-lld-rtos_git.bb =
| 95 <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; 1 file changed, 95 insertions(&#43;)<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; create mode 100644 recipes-bsp/pm-lld/=
pm-lld-rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_=
git.bb <o:p>
</o:p></p>
<p class=3D"MsoPlainText">&gt; b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb<o:p>=
</o:p></p>
<p class=3D"MsoPlainText">&gt; new file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; index 0000000..c976deb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/recipes-bsp/pm-lld/pm-lld-=
rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -0,0 &#43;1,95 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SUMMARY =3D &quot;TI RTOS driver for Po=
wer Management module (PM)&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;require recipes-ti/includes/ti-paths.in=
c<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;LICENSE =3D &quot;BSD-3-Clause&quot;<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"f=
ile:///\\Power.h;beginline=3D1;endline=3D31;md5=3D527b91fdcd26cd19ac07a754f=
45dedbe"><span style=3D"color:windowtext;text-decoration:none">file://Power=
.h;beginline=3D1;endline=3D31;md5=3D527b91fdcd26cd19ac07a754f45dedbe</span>=
</a>&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;COMPATIBLE_MACHINE =3D &quot;ti33x|ti43=
x|omap-a15|k2g&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&=
quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PM_LLD_GIT_URI =3D &quot;git://git.ti.c=
om/keystone-rtos/pm-lld.git&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PM_LLD_GIT_PROTOCOL =3D &quot;git&quot;=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PM_LLD_GIT_BRANCH =3D &quot;int_pm_am33=
5x&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PM_LLD_GIT_BRANCH_dra7xx-evm =3D &quot;=
master&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">^^^<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PM_LLD_GIT_DESTSUFFIX =3D &quot;git/ti/=
drv/pm&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# Below commit ID corresponds to &quot;=
DEV.PM_LLD.01.04.00.01&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PM_LLD_SRCREV =3D &quot;c4908f94b3e655e=
6298aa9bfe9bbffbbc5d16111&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# Below commit ID corresponds to &quot;=
REL.PDK.TDA.01.07.00.06&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PM_LLD_SRCREV_dra7xx-evm =3D &quot;46ea=
13503d2991f636197edb206a9f62cea398d4&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">^^^<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">In some places here you use more generic &quot;om=
ap-a15&quot; SOC family, but in these 2 places I highlighted, you use very =
specific &quot;dra7xx-evm&quot;, which will exclude platforms like &quot;dr=
a7xx-hs-evm&quot; as well as &quot;am57xx-evm&quot; and use &quot;int_pm_am=
335x&quot;
<o:p></o:p></p>
<p class=3D"MsoPlainText">branch for those. Please confirm you actually wan=
t to do that.<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#376092;mso-style-textfill-f=
ill-color:#376092;mso-style-textfill-fill-alpha:100.0%">Yes. I have confirm=
ed with automotive team that we use specific versions for dra7xx-evm. This =
module is not used for dra7xx-hs-evm.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;BRANCH =3D &quot;${PM_LLD_GIT_BRANCH}&q=
uot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SRC_URI =3D &quot;${PM_LLD_GIT_URI};des=
tsuffix=3D${PM_LLD_GIT_DESTSUFFIX};protocol=3D${PM_LLD_GIT_PROTOCOL};branch=
=3D${BRANCH}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;#PATCHTOOL =3D &quot;git&quot;<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; &#43;#SRC_URI_append =3D &quot; \<o:p></o:p>=
</p>
<p class=3D"MsoPlainText">&gt; &#43;#&nbsp;&nbsp;&nbsp; <a href=3D"file:///=
\\.patch"><span style=3D"color:windowtext;text-decoration:none">file://.pat=
ch</span></a> \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;#&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Leftovers ^^^<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#376092;mso-style-textfill-f=
ill-color:#376092;mso-style-textfill-fill-alpha:100.0%">Yes. They have been=
 removed in the latest patch.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SRCREV =3D &quot;${PM_LLD_SRCREV}&quot;=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PV =3D &quot;01.04.00.01&quot;<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; &#43;PR =3D &quot;r0&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;S =3D &quot;${WORKDIR}/${PM_LLD_GIT_DES=
TSUFFIX}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS =3D &quot; ti-sysbios \<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; gcc-arm-none-eabi-native \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; osal-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ca-certificates-native \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ti-pdk-setup \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_omap-a15 =3D &quot; ti-c=
gt-arm-native \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-cgt6x-native \<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; common-csl-ip-rtos \ &quot=
;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_ti33x =3D &quot; starter=
ware-rtos \ &quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_ti43x =3D &quot; starter=
ware-rtos \ &quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_k2g =3D &quot; common-cs=
l-ip-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; ti-cgt6x-native \ &quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# Fetch task cannot be completed until =
after ca-certificates-native
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;populates sysroot with the SSL certific=
ates do_fetch[depends] =3D &quot;ca-certificates-native:do_populate_sysroot=
&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Why? Shouldn't be a problem accessing git.ti.com =
over git protocol.<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#376092;mso-style-textfill-f=
ill-color:#376092;mso-style-textfill-fill-alpha:100.0%">Yes. They have been=
 removed in the latest patch.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export TOOLCHAIN_PATH_A15 =3D &quot;${G=
CC_ARM_NONE_TOOLCHAIN}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export TOOLCHAIN_PATH_A8 =3D &quot;${GC=
C_ARM_NONE_TOOLCHAIN}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export TOOLCHAIN_PATH_A9 =3D &quot;${GC=
C_ARM_NONE_TOOLCHAIN}&quot;<o:p></o:p></p>
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
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Aren't those already defined in a .inc file?<o:p>=
</o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#376092;mso-style-textfill-f=
ill-color:#376092;mso-style-textfill-fill-alpha:100.0%">In the latest patch=
 submitted, ti-pdk.bbclass has been used and the above are removed.<o:p></o=
:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black"><o:p>&nbsp;</o:p></sp=
an></p>
<p class=3D"MsoPlainText">&gt; &#43;export PDK_PM_ROOT_PATH =3D &quot;${WOR=
KDIR}/git&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# Used by DEST_ROOT to redirect binary =
and obj files away from
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;sysroot PDK tree OBJ_DIR =3D &quot;${WO=
RKDIR}/git/ti/binary&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;do_compile() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; make clean lib xdc_m=
eta doxygen LIMIT_SOCS=3D&quot;${TI_PDK_LIMIT_SOCS}&quot;
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;LIMIT_BOARDS=3D&quot;${TI_PDK_LIMIT_BOA=
RDS}&quot; DEST_ROOT=3D${OBJ_DIR}<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">BTW, doxygen is not available in meta-ti nor in t=
he only other dependent layer which is oe-core.<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#376092;mso-style-textfill-f=
ill-color:#376092;mso-style-textfill-fill-alpha:100.0%">The doxygen target =
is no longer built with the latest patch.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; # Remove unnecessary=
 files from packaging<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; rm -rf patches/<o:p>=
</o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; # Cleanup docs<o:p><=
/o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; rm -rf docs/ReleaseN=
otes_PM_LLD.doc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; rm -rf internal/<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; #archive<o:p></o:p><=
/p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; tar -cf pm_lld.tar -=
-exclude=3D'*.tar' ./*<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;do_install() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; install -d ${D}${PDK=
_INSTALL_DIR_RECIPE}/packages/ti/drv/pm<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; find -name &quot;*.t=
ar&quot; -exec tar xf {} --no-same-owner -C ${D}${PDK_INSTALL_DIR_RECIPE}/p=
ackages/ti/drv/pm \;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Is it necessary to tar-up everything at the end o=
f do_compile and then un-tar
<o:p></o:p></p>
<p class=3D"MsoPlainText">in do_install?<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#376092;mso-style-textfill-f=
ill-color:#376092;mso-style-textfill-fill-alpha:100.0%">The latest patch us=
es ti-pdk.bbclass and the do_Compile has been appended by generating a tar =
file&nbsp;&nbsp;&nbsp; which the do_install of ti-pdk.bbclass
 will untar.<o:p></o:p></span></p>
<p class=3D"MsoPlainText">&gt; &#43;}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;FILES_${PN} &#43;=3D &quot;${PDK_INSTAL=
L_DIR_RECIPE}/packages&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;INSANE_SKIP_${PN} =3D &quot;arch static=
dev&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -- <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; 1.9.1<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; -- <o:p></o:p></p>
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

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F42A1DFLE12entticom_--

--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F42A1DFLE12entticom_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Mon, 18 Sep 2017 18:03:18 GMT";
	modification-date="Mon, 18 Sep 2017 18:03:18 GMT"

Received: from DFLE103.ent.ti.com (10.64.6.24) by DLEE70.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (TLS) id 14.3.294.0; Mon, 18 Sep
 2017 12:54:32 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34; Mon, 18
 Sep 2017 12:54:32 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend Transport;
 Mon, 18 Sep 2017 12:54:32 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
 v8IHsWeb012844;	Mon, 18 Sep 2017 12:54:32 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
CC: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Subject: [PATCH v4] pm-lld-rtos: Adding rtos recipe for pm-lld
Thread-Topic: [PATCH v4] pm-lld-rtos: Adding rtos recipe for pm-lld
Thread-Index: AQHTMKcuRYaJYc9W/UitrntDyLPAnw==
Date: Mon, 18 Sep 2017 17:54:28 +0000
Message-ID: <1505757268-4687-1-git-send-email-m-radhakrishnan2@ti.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AuthSource: DFLE108.ent.ti.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

TI RTOS low level driver for Power Management module (PM)
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v4 - Modified to use ti-pdk.bbclass and addressed review comments
 v3 - Removed the intermediate tar-untar for install
 v2 - Added summary & merged in to a single recipe


 recipes-bsp/pm-lld/pm-lld-rtos_git.bb | 56 +++++++++++++++++++++++++++++++=
++++
 1 file changed, 56 insertions(+)
 create mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bb

diff --git a/recipes-bsp/pm-lld/pm-lld-rtos_git.bb b/recipes-bsp/pm-lld/pm-=
lld-rtos_git.bb
new file mode 100644
index 0000000..6fedc80
--- /dev/null
+++ b/recipes-bsp/pm-lld/pm-lld-rtos_git.bb
@@ -0,0 +1,56 @@
+SUMMARY =3D "TI RTOS driver for Power Management module (PM)"
+
+require recipes-ti/includes/ti-paths.inc
+inherit ti-pdk
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://Power.h;beginline=3D1;endline=3D31;md5=3D527b=
91fdcd26cd19ac07a754f45dedbe"
+
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g"
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+
+PM_LLD_GIT_URI =3D "git://git.ti.com/keystone-rtos/pm-lld.git"
+PM_LLD_GIT_PROTOCOL =3D "git"
+PM_LLD_GIT_BRANCH =3D "int_pm_am335x"
+PM_LLD_GIT_BRANCH_dra7xx-evm =3D "master"
+PM_LLD_GIT_DESTSUFFIX =3D "git/ti/drv/pm"
+
+# Below commit ID corresponds to "DEV.PM_LLD.01.04.00.01"
+PM_LLD_SRCREV =3D "c4908f94b3e655e6298aa9bfe9bbffbbc5d16111"
+
+# Below commit ID corresponds to "REL.PDK.TDA.01.07.00.06"
+PM_LLD_SRCREV_dra7xx-evm =3D "46ea13503d2991f636197edb206a9f62cea398d4"
+
+BRANCH =3D "${PM_LLD_GIT_BRANCH}"
+SRC_URI =3D "${PM_LLD_GIT_URI};destsuffix=3D${PM_LLD_GIT_DESTSUFFIX};proto=
col=3D${PM_LLD_GIT_PROTOCOL};branch=3D${BRANCH}"
+
+SRCREV =3D "${PM_LLD_SRCREV}"
+PV =3D "01.04.00.01"
+PR =3D "r0"
+
+S =3D "${WORKDIR}/${PM_LLD_GIT_DESTSUFFIX}"
+
+DEPENDS_append =3D " ti-sysbios \
+            osal-rtos \
+"
+DEPENDS_append_ti33x =3D " starterware-rtos \
+"
+DEPENDS_append_ti43x =3D " starterware-rtos \
+"
+export PDK_PM_ROOT_PATH =3D "${WORKDIR}/build"
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
+INSANE_SKIP_${PN} =3D "arch staticdev"
--
1.9.1


--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F42A1DFLE12entticom_--
