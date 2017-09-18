Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9DF97E00C89; Mon, 18 Sep 2017 13:54:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.77 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4DC05E00970
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 13:54:24 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IKsN7j013823
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:54:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505768063;
	bh=QiGAuFruJGq4jcRi39JY1VnMEt6B06AFTPcpx8o+fYM=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=XpdfMDilpVrxCyQkVXUdZZ7zXXBZc3NaFCo82thZZ/vJQixw8XUzp6hyszovlQUNa
	7swg1LVFYvSsCI4bgxNiN1iHLPlXtiqqcCvul2O2zmOEQTUZKFNTcLnY2ZcAE0/w4G
	bfCHEFP5E3MFzC2BWxqXw73oSKOcLbSYZb1AIhLs=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKsNDO024592
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:54:23 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Mon, 18 Sep 2017 15:54:23 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v2 31/37] board-rtos: Added board-rtos recipe
Thread-Index: AQHTABpD6jyke3KR40+u/ADervlyZaKUe1uAgCcEOkA=
Date: Mon, 18 Sep 2017 20:54:22 +0000
Message-ID: <5130E41A1BA9D145BA0F3B18D5CFB0A7437F4865@DFLE12.ent.ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-31-git-send-email-m-radhakrishnan2@ti.com>
	<20170824200211.GK28233@edge>
In-Reply-To: <20170824200211.GK28233@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2 31/37] board-rtos: Added board-rtos recipe
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
X-List-Received-Date: Mon, 18 Sep 2017 20:54:28 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4865DFLE12entticom_"

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4865DFLE12entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

HI Denys,

Please find my reply inline

I haven't submitted a new patch as there doesn't seem to be any changes req=
uired.

I have submitted board-rtos' dependent packages such as pm-lld-rtos , pruss=
-lld-rtos-, ti-ndk which should now unblock board.



Regards

Mahesh

-----Original Message-----
From: Dmytriyenko, Denys
Sent: Thursday, August 24, 2017 4:02 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2 31/37] board-rtos: Added board-rtos recipe



On Tue, Jul 18, 2017 at 07:03:42PM -0400, Mahesh Radhakrishnan wrote:

> Upstreaming board library for RTOS

> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com<mailto:m-rad=
hakrishnan2@ti.com>>

> ---

>

> v2 - Added summary & merged in to a single recipe

>

>  recipes-bsp/board-rtos/board-rtos_git.bb | 71

> ++++++++++++++++++++++++++++++++

>  1 file changed, 71 insertions(+)

>  create mode 100644 recipes-bsp/board-rtos/board-rtos_git.bb

>

> diff --git a/recipes-bsp/board-rtos/board-rtos_git.bb

> b/recipes-bsp/board-rtos/board-rtos_git.bb

> new file mode 100644

> index 0000000..5ba672f

> --- /dev/null

> +++ b/recipes-bsp/board-rtos/board-rtos_git.bb

> @@ -0,0 +1,71 @@

> +SUMMARY =3D "TI RTOS Board Library"

> +

> +inherit ti-pdk

> +

> +LICENSE =3D "BSD-3-Clause"

> +LIC_FILES_CHKSUM =3D "file://board.h;beginline=3D1;endline=3D32;md5=3D0e=
3182ba6a963da159c37eafa9752ade<file:///\\board.h;beginline=3D1;endline=3D32=
;md5=3D0e3182ba6a963da159c37eafa9752ade>"

> +

> +COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone|omapl1"

> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"

> +

> +BOARD_GIT_URI =3D "git://git.ti.com/keystone-rtos/board.git"

> +BOARD_GIT_PROTOCOL =3D "git"

> +BOARD_GIT_BRANCH =3D "master"

> +

> +# Below commit ID corresponds to "DEV.BOARD.01.00.07.00"

> +BOARD_SRCREV =3D "7d6a76ee65d75714740d468a48ca7e3668e66a94"

> +

> +BRANCH =3D"${BOARD_GIT_BRANCH}"

> +SRC_URI =3D "${BOARD_GIT_URI};protocol=3D${BOARD_GIT_PROTOCOL};branch=3D=
${BRANCH}"

> +

> +SRCREV =3D "${BOARD_SRCREV}"

> +PV =3D "01.00.07.00"

> +PR =3D "r0"

> +

> +DEPENDS_append =3D " i2c-lld-rtos \

> +                   spi-lld-rtos \

> +                   uart-lld-rtos \

> +"

> +

> +DEPENDS_append_omap-a15 =3D " osal-rtos \

> +                            ti-ndk \

> +"

> +

> +DEPENDS_append_am57xx-evm =3D " gpio-lld-rtos \

> +                              icss-emac-lld-rtos \

> +                              mmcsd-lld-rtos \

> +                              pruss-lld-rtos \

> +                              pm-lld-rtos \ "



What about dra7xx?

I have confirmed that dra7xx contains only osal-rtos & ti-ndk , which is me=
ntioned in the DEPENDS_append_omap-15





> +

> +DEPENDS_append_ti33x =3D " gpio-lld-rtos \

> +                         gpmc-lld-rtos \

> +                         icss-emac-lld-rtos \

> +                         mmcsd-lld-rtos \

> +                         osal-rtos \

> +                         pruss-lld-rtos \

> +                         starterware-rtos \

> +                         ti-ndk \



ti-ndk is patch #34 and is not yet merged, but a dependency here in #31



Please make sure the order is correct.

I have pushed ti-ndk & pm-lld-rtos a little while ago, which should unblock=
 board now.



> +"

> +

> +DEPENDS_append_ti43x =3D " gpio-lld-rtos \

> +                         gpmc-lld-rtos \

> +                         icss-emac-lld-rtos \

> +                         mmcsd-lld-rtos \

> +                         osal-rtos \

> +                         pruss-lld-rtos \

> +                         starterware-rtos \

> +                         ti-ndk \

> +"

> +

> +

> +# Build with make instead of XDC

> +TI_PDK_XDCMAKE =3D "0"

> +

> +INHIBIT_SYSROOT_STRIP =3D "1"

> +INHIBIT_PACKAGE_STRIP =3D "1"

> +

> +export PDK_BOARD_ROOT_PATH =3D"${WORKDIR}/build"

> +export DEST_ROOT=3D"${S}"

> +

> +XDCPATH_append =3D ";${PDK_INSTALL_DIR}/packages/ti/csl;${NDK_INSTALL_DI=
R}/packages"

> --

> 1.9.1

>

> --

> _______________________________________________

> meta-ti mailing list

> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>

> https://lists.yoctoproject.org/listinfo/meta-ti

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4865DFLE12entticom_
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
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">HI Denys,<o:p></o:p=
></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Please find my repl=
y inline<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><a name=3D"_MailEndCompose"><span style=3D"color:=
#558ED5;mso-style-textfill-fill-color:#558ED5;mso-style-textfill-fill-alpha=
:100.0%">I haven&#8217;t submitted a new patch as there doesn&#8217;t seem =
to be any changes required.<o:p></o:p></span></a></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">I have submitted bo=
ard-rtos&#8217; dependent packages such as pm-lld-rtos , pruss-lld-rtos-, t=
i-ndk which should now unblock board.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Regards<o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Mahesh</span><o:p><=
/o:p></p>
<p class=3D"MsoPlainText">-----Original Message-----<br>
From: Dmytriyenko, Denys <br>
Sent: Thursday, August 24, 2017 4:02 PM<br>
To: Radhakrishnan, Mahesh<br>
Cc: meta-ti@yoctoproject.org<br>
Subject: Re: [meta-ti] [PATCH v2 31/37] board-rtos: Added board-rtos recipe=
</p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">On Tue, Jul 18, 2017 at 07:03:42PM -0400, Mahesh =
Radhakrishnan wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Upstreaming board library for RTOS<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; Signed-off-by: Mahesh Radhakrishnan &lt;<a h=
ref=3D"mailto:m-radhakrishnan2@ti.com"><span style=3D"color:windowtext;text=
-decoration:none">m-radhakrishnan2@ti.com</span></a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ---<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; v2 - Added summary &amp; merged in to a sing=
le recipe<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; recipes-bsp/board-rtos/board-rtos_git.=
bb | 71 <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; 1 file changed, 71 insertions(&#43;)<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; create mode 100644 recipes-bsp/board-r=
tos/board-rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/recipes-bsp/board-rtos/board-rt=
os_git.bb <o:p>
</o:p></p>
<p class=3D"MsoPlainText">&gt; b/recipes-bsp/board-rtos/board-rtos_git.bb<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt; new file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; index 0000000..5ba672f<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/recipes-bsp/board-rtos/boa=
rd-rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -0,0 &#43;1,71 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SUMMARY =3D &quot;TI RTOS Board Library=
&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;inherit ti-pdk<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;LICENSE =3D &quot;BSD-3-Clause&quot;<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"f=
ile:///\\board.h;beginline=3D1;endline=3D32;md5=3D0e3182ba6a963da159c37eafa=
9752ade"><span style=3D"color:windowtext;text-decoration:none">file://board=
.h;beginline=3D1;endline=3D32;md5=3D0e3182ba6a963da159c37eafa9752ade</span>=
</a>&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;COMPATIBLE_MACHINE =3D &quot;ti33x|ti43=
x|omap-a15|keystone|omapl1&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&=
quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;BOARD_GIT_URI =3D &quot;git://git.ti.co=
m/keystone-rtos/board.git&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;BOARD_GIT_PROTOCOL =3D &quot;git&quot;<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;BOARD_GIT_BRANCH =3D &quot;master&quot;=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# Below commit ID corresponds to &quot;=
DEV.BOARD.01.00.07.00&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;BOARD_SRCREV =3D &quot;7d6a76ee65d75714=
740d468a48ca7e3668e66a94&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;BRANCH =3D&quot;${BOARD_GIT_BRANCH}&quo=
t;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SRC_URI =3D &quot;${BOARD_GIT_URI};prot=
ocol=3D${BOARD_GIT_PROTOCOL};branch=3D${BRANCH}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SRCREV =3D &quot;${BOARD_SRCREV}&quot;<=
o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PV =3D &quot;01.00.07.00&quot;<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; &#43;PR =3D &quot;r0&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append =3D &quot; i2c-lld-rtos =
\<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; spi-l=
ld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uart-=
lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_omap-a15 =3D &quot; osal=
-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-ndk \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_am57xx-evm =3D &quot; gp=
io-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; icss-emac-lld-=
rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmcsd-lld-rtos=
 \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pruss-lld-rtos=
 \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pm-lld-rtos \ =
&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">What about dra7xx?<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">I have confirmed th=
at dra7xx contains only osal-rtos &amp; ti-ndk , which is mentioned in the =
DEPENDS_<i>append</i>_omap-15</span><o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_ti33x =3D &quot; gpio-ll=
d-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpmc-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; icss-emac-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmcsd-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; osal-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pruss-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; starterware-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-ndk \<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">ti-ndk is patch #34 and is not yet merged, but a =
dependency here in #31<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Please make sure the order is correct.<o:p></o:p>=
</p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">I have pushed ti-nd=
k &amp; pm-lld-rtos a little while ago, which should unblock board now.</sp=
an><o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_ti43x =3D &quot; gpio-ll=
d-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gpmc-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; icss-emac-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mmcsd-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; osal-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pruss-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; starterware-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ti-ndk \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# Build with make instead of XDC<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;TI_PDK_XDCMAKE =3D &quot;0&quot;<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;INHIBIT_SYSROOT_STRIP =3D &quot;1&quot;=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export PDK_BOARD_ROOT_PATH =3D&quot;${W=
ORKDIR}/build&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export DEST_ROOT=3D&quot;${S}&quot;<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;XDCPATH_append =3D &quot;;${PDK_INSTALL=
_DIR}/packages/ti/csl;${NDK_INSTALL_DIR}/packages&quot;<o:p></o:p></p>
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

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4865DFLE12entticom_--
