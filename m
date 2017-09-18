Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9D10CE00BB1; Mon, 18 Sep 2017 13:40:30 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26C04E00956
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 13:40:26 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IKeQlA032736
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:40:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505767226;
	bh=dlRWuY78adH4/BgdOc/eRk4RO/qP8CkIayktuyE7loY=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=g3uVQhabqAL+YlLnnLAw3FmaP6QCwLIoR383DBBgJUzibwPRr8otVP7XxuAqOIA4a
	DYcDg5j71fso6E08Xt93JjKyU52fffFhkHCRWzm5nXvSRhKvOKQLlps02s85DEPLML
	9ELwo/fA6e+8Trd0nABLJc8qNXI+Qdi0nK01YEeQ=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKeQGh018035
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:40:26 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0294.000; Mon, 18 Sep 2017 15:40:25 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v2 35/37] transport-rtos: Added transport
	recipes(bmet, nimu, nimu-icss) for rtos
Thread-Index: AQHTABpG8yefCmwFOk+YJacShx7hmaKUfgYAgCb95MA=
Date: Mon, 18 Sep 2017 20:40:25 +0000
Message-ID: <5130E41A1BA9D145BA0F3B18D5CFB0A7437F476E@DFLE12.ent.ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-35-git-send-email-m-radhakrishnan2@ti.com>
	<20170824201144.GO28233@edge>
In-Reply-To: <20170824201144.GO28233@edge>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2 35/37] transport-rtos: Added transport recipes(bmet, nimu, nimu-icss) for rtos
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
X-List-Received-Date: Mon, 18 Sep 2017 20:40:30 -0000
X-Groupsio-MsgNum: 10379
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F476EDFLE12entticom_"

--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F476EDFLE12entticom_
Content-Type: multipart/alternative;
	boundary="_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F476EDFLE12entticom_"

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F476EDFLE12entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Please see my comments inline.

I have submitted a new patch with the fix and an updated commit message (at=
tached)



Regards

Mahesh



-----Original Message-----
From: Dmytriyenko, Denys
Sent: Thursday, August 24, 2017 4:12 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2 35/37] transport-rtos: Added transport rec=
ipes(bmet, nimu, nimu-icss) for rtos



On Tue, Jul 18, 2017 at 07:03:46PM -0400, Mahesh Radhakrishnan wrote:

> Upstreaming RTOS driver for Network Interface Management Unit

> (NIMU),BMET Ethernet and NIMU ICSS

> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com<mailto:m-rad=
hakrishnan2@ti.com>>

> ---

>

> v2 - Added summary

>

>  recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb  | 21 +++++++++++++++

> recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb | 28 +++++++++++++++++++

>  recipes-bsp/transport-rtos/nimu-rtos_git.bb      | 34 ++++++++++++++++++=
++++++

>  recipes-bsp/transport-rtos/transport.inc         | 17 ++++++++++++

>  4 files changed, 100 insertions(+)

>  create mode 100644 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb

>  create mode 100644 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb

>  create mode 100644 recipes-bsp/transport-rtos/nimu-rtos_git.bb

>  create mode 100644 recipes-bsp/transport-rtos/transport.inc

>

> diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb

> b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb

> new file mode 100644

> index 0000000..775ef3d

> --- /dev/null

> +++ b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb

> @@ -0,0 +1,21 @@

> +SUMMARY =3D "RTOS driver for BMET Ethernet"

> +

> +inherit ti-pdk

> +require transport.inc

> +

> +PR =3D "${INC_PR}.0"

> +

> +LIC_FILES_CHKSUM =3D "file://bmet_transport.h;beginline=3D12;endline=3D4=
0;md5=3D7c7fbe6af03d79b61025a67a8fc96f93<file:///\\bmet_transport.h;beginli=
ne=3D12;endline=3D40;md5=3D7c7fbe6af03d79b61025a67a8fc96f93>"

> +

> +COMPATIBLE_MACHINE =3D "k2hk-evm|k2e-evm|k2l-evm"

> +

> +DEPENDS_append =3D " qmss-lld-rtos \

> +                   cppi-lld-rtos \

> +"

> +

> +BMET_ETH_DESTSUFFIX =3D "git/bmet_eth"

> +

> +S =3D "${WORKDIR}/${BMET_ETH_DESTSUFFIX}"

> +

> +# HTML doc link params

> +PDK_COMP_LINK_TEXT =3D "Baremetal Ethernet Transport"

> diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb

> b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb

> new file mode 100644

> index 0000000..3ca196d

> --- /dev/null

> +++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb

> @@ -0,0 +1,28 @@

> +SUMMARY =3D "RTOS driver for NIMU ICSS"

> +

> +inherit ti-pdk

> +require transport.inc

> +

> +PR =3D "${INC_PR}.0"

> +

> +LIC_FILES_CHKSUM =3D "file://nimu_icssEth.h;beginline=3D1;endline=3D35;m=
d5=3Dfd897e67955a19ba88443d4bc2e7e18a<file:///\\nimu_icssEth.h;beginline=3D=
1;endline=3D35;md5=3Dfd897e67955a19ba88443d4bc2e7e18a>"

> +

> +COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g|c66x|omapl1"

> +

> +DEPENDS_append =3D " ti-ndk \



Blocked by ti-ndk

ti-ndk has been pushed now.



> +                   pruss-lld-rtos \

> +                   icss-emac-lld-rtos \ "

> +

> +NIMU_ICSS_DESTSUFFIX =3D "git/ndk/nimu_icss"

> +

> +# Build with make instead of XDC

> +TI_PDK_XDCMAKE =3D "0"

> +

> +S =3D "${WORKDIR}/${NIMU_ICSS_DESTSUFFIX}"

> +

> +export PDK_NIMU_ICSS_ROOT_PATH =3D"${WORKDIR}/build"

> +export DEST_ROOT=3D"${S}"

> +

> +export NDK_INSTALL_PATH =3D "${NDK_INSTALL_DIR}"

> +XDCPATH_append =3D ";${NDK_INSTALL_DIR}/packages"

> diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb

> b/recipes-bsp/transport-rtos/nimu-rtos_git.bb

> new file mode 100644

> index 0000000..0a415ae

> --- /dev/null

> +++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bb

> @@ -0,0 +1,34 @@

> +SUMMARY =3D "RTOS driver for Network Interface Management Unit (NIMU)"

> +

> +inherit ti-pdk

> +require transport.inc

> +

> +PR =3D "${INC_PR}.0"

> +

> +LIC_FILES_CHKSUM =3D "file://nimu_eth.h;beginline=3D1;endline=3D35;md5=
=3D52ba99291b03b91058e37115b66edb10<file:///\\nimu_eth.h;beginline=3D1;endl=
ine=3D35;md5=3D52ba99291b03b91058e37115b66edb10>"

> +

> +COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone|c66x|omapl1"

> +

> +NIMU_DESTSUFFIX =3D "git/ndk/nimu"

> +

> +S =3D "${WORKDIR}/${NIMU_DESTSUFFIX}"

> +

> +DEPENDS_append =3D " ti-ndk osal-rtos"

> +DEPENDS_append_ti33x =3D " starterware-rtos emac-lld-rtos"

> +DEPENDS_append_ti43x =3D " starterware-rtos emac-lld-rtos"

> +DEPENDS_append_omap-a15 =3D " emac-lld-rtos"

> +DEPENDS_append_dra7xx-evm =3D " emac-lld-rtos"



omap-a15 already covers dra7xx-evm.

This has been corrected in the latest patch(V4)



> +DEPENDS_append_keystone =3D " qmss-lld-rtos cppi-lld-rtos"

> +DEPENDS_append_k2hk-evm =3D " pa-lld-rtos"

> +DEPENDS_append_k2e-evm =3D " pa-lld-rtos"

> +DEPENDS_append_k2l-evm =3D " pa-lld-rtos"

> +DEPENDS_append_k2g =3D " emac-lld-rtos"

> +

> +# Build with make instead of XDC

> +TI_PDK_XDCMAKE =3D "0"

> +

> +export PDK_NIMU_ROOT_PATH =3D"${WORKDIR}/build"

> +export DEST_ROOT=3D"${S}"

> +

> +export NDK_INSTALL_PATH =3D "${NDK_INSTALL_DIR}"

> +XDCPATH_append =3D ";${NDK_INSTALL_DIR}/packages"

> diff --git a/recipes-bsp/transport-rtos/transport.inc

> b/recipes-bsp/transport-rtos/transport.inc

> new file mode 100644

> index 0000000..82427fb

> --- /dev/null

> +++ b/recipes-bsp/transport-rtos/transport.inc

> @@ -0,0 +1,17 @@

> +LICENSE =3D "BSD-3-Clause"

> +

> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"

> +

> +TRANSPORT_GIT_URI =3D "git://git.ti.com/keystone-rtos/transport.git"

> +TRANSPORT_GIT_PROTOCOL =3D "git"

> +TRANSPORT_GIT_BRANCH =3D "master"

> +

> +# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.07A"

> +TRANSPORT_SRCREV =3D "099dbf371cea3b2d883f5c97a4b0e7ef40e84c6a"

> +

> +BRANCH =3D "${TRANSPORT_GIT_BRANCH}"

> +SRC_URI =3D "${TRANSPORT_GIT_URI};protocol=3D${TRANSPORT_GIT_PROTOCOL};b=
ranch=3D${BRANCH}"

> +

> +SRCREV =3D "${TRANSPORT_SRCREV}"

> +PV =3D "01.00.00.07A"

> +INC_PR =3D "r0"

> --

> 1.9.1

>

> --

> _______________________________________________

> meta-ti mailing list

> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>

> https://lists.yoctoproject.org/listinfo/meta-ti

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F476EDFLE12entticom_
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
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Please see my comme=
nts inline.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">I have submitted a =
new patch with the fix and an updated commit message (attached)<o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Regards<o:p></o:p><=
/span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Mahesh<o:p></o:p></=
span></p>
<p class=3D"MsoPlainText"><a name=3D"_MailEndCompose"><o:p>&nbsp;</o:p></a>=
</p>
<p class=3D"MsoPlainText">-----Original Message-----<br>
From: Dmytriyenko, Denys <br>
Sent: Thursday, August 24, 2017 4:12 PM<br>
To: Radhakrishnan, Mahesh<br>
Cc: meta-ti@yoctoproject.org<br>
Subject: Re: [meta-ti] [PATCH v2 35/37] transport-rtos: Added transport rec=
ipes(bmet, nimu, nimu-icss) for rtos</p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">On Tue, Jul 18, 2017 at 07:03:46PM -0400, Mahesh =
Radhakrishnan wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Upstreaming RTOS driver for Network Interfac=
e Management Unit
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; (NIMU),BMET Ethernet and NIMU ICSS<o:p></o:p=
></p>
<p class=3D"MsoPlainText">&gt; Signed-off-by: Mahesh Radhakrishnan &lt;<a h=
ref=3D"mailto:m-radhakrishnan2@ti.com"><span style=3D"color:windowtext;text=
-decoration:none">m-radhakrishnan2@ti.com</span></a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ---<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; v2 - Added summary<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; recipes-bsp/transport-rtos/bmet-eth-rt=
os_git.bb&nbsp; | 21 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&nbsp;
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; recipes-bsp/transport-rtos/nimu-icss-rtos_gi=
t.bb | 28 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; recipes-bsp/transport-rtos/nimu-rtos_g=
it.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 34 &#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; recipes-bsp/transport-rtos/transport.i=
nc&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 17 &#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; 4 files changed, 100 insertions(&#43;)=
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; create mode 100644 recipes-bsp/transpo=
rt-rtos/bmet-eth-rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; create mode 100644 recipes-bsp/transpo=
rt-rtos/nimu-icss-rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; create mode 100644 recipes-bsp/transpo=
rt-rtos/nimu-rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; create mode 100644 recipes-bsp/transpo=
rt-rtos/transport.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/recipes-bsp/transport-rtos/bmet=
-eth-rtos_git.bb
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; b/recipes-bsp/transport-rtos/bmet-eth-rtos_g=
it.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; new file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; index 0000000..775ef3d<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/recipes-bsp/transport-rtos=
/bmet-eth-rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -0,0 &#43;1,21 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SUMMARY =3D &quot;RTOS driver for BMET =
Ethernet&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;inherit ti-pdk<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;require transport.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PR =3D &quot;${INC_PR}.0&quot;<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"f=
ile:///\\bmet_transport.h;beginline=3D12;endline=3D40;md5=3D7c7fbe6af03d79b=
61025a67a8fc96f93"><span style=3D"color:windowtext;text-decoration:none">fi=
le://bmet_transport.h;beginline=3D12;endline=3D40;md5=3D7c7fbe6af03d79b6102=
5a67a8fc96f93</span></a>&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;COMPATIBLE_MACHINE =3D &quot;k2hk-evm|k=
2e-evm|k2l-evm&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append =3D &quot; qmss-lld-rtos=
 \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cppi-=
lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;BMET_ETH_DESTSUFFIX =3D &quot;git/bmet_=
eth&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;S =3D &quot;${WORKDIR}/${BMET_ETH_DESTS=
UFFIX}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# HTML doc link params<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PDK_COMP_LINK_TEXT =3D &quot;Baremetal =
Ethernet Transport&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/recipes-bsp/transport-rtos/nimu=
-icss-rtos_git.bb
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; b/recipes-bsp/transport-rtos/nimu-icss-rtos_=
git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; new file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; index 0000000..3ca196d<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/recipes-bsp/transport-rtos=
/nimu-icss-rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -0,0 &#43;1,28 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SUMMARY =3D &quot;RTOS driver for NIMU =
ICSS&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;inherit ti-pdk<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;require transport.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PR =3D &quot;${INC_PR}.0&quot;<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"f=
ile:///\\nimu_icssEth.h;beginline=3D1;endline=3D35;md5=3Dfd897e67955a19ba88=
443d4bc2e7e18a"><span style=3D"color:windowtext;text-decoration:none">file:=
//nimu_icssEth.h;beginline=3D1;endline=3D35;md5=3Dfd897e67955a19ba88443d4bc=
2e7e18a</span></a>&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;COMPATIBLE_MACHINE =3D &quot;ti33x|ti43=
x|omap-a15|k2g|c66x|omapl1&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append =3D &quot; ti-ndk \<o:p>=
</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Blocked by ti-ndk<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">ti-ndk has been pus=
hed now.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pruss=
-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; icss-=
emac-lld-rtos \ &quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;NIMU_ICSS_DESTSUFFIX =3D &quot;git/ndk/=
nimu_icss&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# Build with make instead of XDC<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;TI_PDK_XDCMAKE =3D &quot;0&quot;<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;S =3D &quot;${WORKDIR}/${NIMU_ICSS_DEST=
SUFFIX}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export PDK_NIMU_ICSS_ROOT_PATH =3D&quot=
;${WORKDIR}/build&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export DEST_ROOT=3D&quot;${S}&quot;<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export NDK_INSTALL_PATH =3D &quot;${NDK=
_INSTALL_DIR}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;XDCPATH_append =3D &quot;;${NDK_INSTALL=
_DIR}/packages&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/recipes-bsp/transport-rtos/nimu=
-rtos_git.bb
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; b/recipes-bsp/transport-rtos/nimu-rtos_git.b=
b<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; new file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; index 0000000..0a415ae<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/recipes-bsp/transport-rtos=
/nimu-rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -0,0 &#43;1,34 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SUMMARY =3D &quot;RTOS driver for Netwo=
rk Interface Management Unit (NIMU)&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;inherit ti-pdk<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;require transport.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PR =3D &quot;${INC_PR}.0&quot;<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"f=
ile:///\\nimu_eth.h;beginline=3D1;endline=3D35;md5=3D52ba99291b03b91058e371=
15b66edb10"><span style=3D"color:windowtext;text-decoration:none">file://ni=
mu_eth.h;beginline=3D1;endline=3D35;md5=3D52ba99291b03b91058e37115b66edb10<=
/span></a>&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;COMPATIBLE_MACHINE =3D &quot;ti33x|ti43=
x|omap-a15|keystone|c66x|omapl1&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;NIMU_DESTSUFFIX =3D &quot;git/ndk/nimu&=
quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;S =3D &quot;${WORKDIR}/${NIMU_DESTSUFFI=
X}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append =3D &quot; ti-ndk osal-r=
tos&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_ti33x =3D &quot; starter=
ware-rtos emac-lld-rtos&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_ti43x =3D &quot; starter=
ware-rtos emac-lld-rtos&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_omap-a15 =3D &quot; emac=
-lld-rtos&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_dra7xx-evm =3D &quot; em=
ac-lld-rtos&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">omap-a15 already covers dra7xx-evm.<o:p></o:p></p=
>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">This has been corre=
cted in the latest patch(V4)<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black"><o:p>&nbsp;</o:p></sp=
an></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_keystone =3D &quot; qmss=
-lld-rtos cppi-lld-rtos&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_k2hk-evm =3D &quot; pa-l=
ld-rtos&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_k2e-evm =3D &quot; pa-ll=
d-rtos&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_k2l-evm =3D &quot; pa-ll=
d-rtos&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_k2g =3D &quot; emac-lld-=
rtos&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# Build with make instead of XDC<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;TI_PDK_XDCMAKE =3D &quot;0&quot;<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export PDK_NIMU_ROOT_PATH =3D&quot;${WO=
RKDIR}/build&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export DEST_ROOT=3D&quot;${S}&quot;<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export NDK_INSTALL_PATH =3D &quot;${NDK=
_INSTALL_DIR}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;XDCPATH_append =3D &quot;;${NDK_INSTALL=
_DIR}/packages&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/recipes-bsp/transport-rtos/tran=
sport.inc <o:p>
</o:p></p>
<p class=3D"MsoPlainText">&gt; b/recipes-bsp/transport-rtos/transport.inc<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt; new file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; index 0000000..82427fb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/recipes-bsp/transport-rtos=
/transport.inc<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -0,0 &#43;1,17 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;LICENSE =3D &quot;BSD-3-Clause&quot;<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&=
quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;TRANSPORT_GIT_URI =3D &quot;git://git.t=
i.com/keystone-rtos/transport.git&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;TRANSPORT_GIT_PROTOCOL =3D &quot;git&qu=
ot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;TRANSPORT_GIT_BRANCH =3D &quot;master&q=
uot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# Below commit ID corresponds to &quot;=
DEV.TRANSPORT.01.00.00.07A&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;TRANSPORT_SRCREV =3D &quot;099dbf371cea=
3b2d883f5c97a4b0e7ef40e84c6a&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;BRANCH =3D &quot;${TRANSPORT_GIT_BRANCH=
}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SRC_URI =3D &quot;${TRANSPORT_GIT_URI};=
protocol=3D${TRANSPORT_GIT_PROTOCOL};branch=3D${BRANCH}&quot;<o:p></o:p></p=
>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SRCREV =3D &quot;${TRANSPORT_SRCREV}&qu=
ot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PV =3D &quot;01.00.00.07A&quot;<o:p></o=
:p></p>
<p class=3D"MsoPlainText">&gt; &#43;INC_PR =3D &quot;r0&quot;<o:p></o:p></p=
>
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

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F476EDFLE12entticom_--

--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F476EDFLE12entticom_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Mon, 18 Sep 2017 20:40:25 GMT";
	modification-date="Mon, 18 Sep 2017 20:40:25 GMT"

Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE70.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (TLS) id 14.3.294.0; Mon, 18 Sep
 2017 15:33:37 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34; Mon, 18
 Sep 2017 15:33:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend Transport;
 Mon, 18 Sep 2017 15:33:37 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
 v8IKXbZu032387;	Mon, 18 Sep 2017 15:33:37 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
CC: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Subject: [PATCH v4] transport-rtos: Added transport recipes(bmet, nimu,
 nimu-icss) for rtos
Thread-Topic: [PATCH v4] transport-rtos: Added transport recipes(bmet, nimu,
 nimu-icss) for rtos
Thread-Index: AQHTML1oBrZV47Lm5Uq/+sGLQIeh7A==
Date: Mon, 18 Sep 2017 20:33:33 +0000
Message-ID: <1505766813-61304-1-git-send-email-m-radhakrishnan2@ti.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AuthSource: DLEE108.ent.ti.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

RTOS driver for Network Interface Management Unit
(NIMU),BMET Ethernet and NIMU ICSS
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v4 - Updated the commit message
 v3 - Removed the redundant DEPENDS for dra7xx-evm
 v2 - Added summary

 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb  | 21 +++++++++++++++
 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb | 28 ++++++++++++++++++++
 recipes-bsp/transport-rtos/nimu-rtos_git.bb      | 33 ++++++++++++++++++++=
++++
 recipes-bsp/transport-rtos/transport.inc         | 17 ++++++++++++
 4 files changed, 99 insertions(+)
 create mode 100644 recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
 create mode 100644 recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
 create mode 100644 recipes-bsp/transport-rtos/nimu-rtos_git.bb
 create mode 100644 recipes-bsp/transport-rtos/transport.inc

diff --git a/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb b/recipes-bsp/=
transport-rtos/bmet-eth-rtos_git.bb
new file mode 100644
index 0000000..775ef3d
--- /dev/null
+++ b/recipes-bsp/transport-rtos/bmet-eth-rtos_git.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "RTOS driver for BMET Ethernet"
+
+inherit ti-pdk
+require transport.inc
+
+PR =3D "${INC_PR}.0"
+
+LIC_FILES_CHKSUM =3D "file://bmet_transport.h;beginline=3D12;endline=3D40;=
md5=3D7c7fbe6af03d79b61025a67a8fc96f93"
+
+COMPATIBLE_MACHINE =3D "k2hk-evm|k2e-evm|k2l-evm"
+
+DEPENDS_append =3D " qmss-lld-rtos \
+                   cppi-lld-rtos \
+"
+
+BMET_ETH_DESTSUFFIX =3D "git/bmet_eth"
+
+S =3D "${WORKDIR}/${BMET_ETH_DESTSUFFIX}"
+
+# HTML doc link params
+PDK_COMP_LINK_TEXT =3D "Baremetal Ethernet Transport"
diff --git a/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb b/recipes-bsp=
/transport-rtos/nimu-icss-rtos_git.bb
new file mode 100644
index 0000000..3ca196d
--- /dev/null
+++ b/recipes-bsp/transport-rtos/nimu-icss-rtos_git.bb
@@ -0,0 +1,28 @@
+SUMMARY =3D "RTOS driver for NIMU ICSS"
+
+inherit ti-pdk
+require transport.inc
+
+PR =3D "${INC_PR}.0"
+
+LIC_FILES_CHKSUM =3D "file://nimu_icssEth.h;beginline=3D1;endline=3D35;md5=
=3Dfd897e67955a19ba88443d4bc2e7e18a"
+
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|k2g|c66x|omapl1"
+
+DEPENDS_append =3D " ti-ndk \
+                   pruss-lld-rtos \
+                   icss-emac-lld-rtos \
+"
+
+NIMU_ICSS_DESTSUFFIX =3D "git/ndk/nimu_icss"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE =3D "0"
+
+S =3D "${WORKDIR}/${NIMU_ICSS_DESTSUFFIX}"
+
+export PDK_NIMU_ICSS_ROOT_PATH =3D"${WORKDIR}/build"
+export DEST_ROOT=3D"${S}"
+
+export NDK_INSTALL_PATH =3D "${NDK_INSTALL_DIR}"
+XDCPATH_append =3D ";${NDK_INSTALL_DIR}/packages"
diff --git a/recipes-bsp/transport-rtos/nimu-rtos_git.bb b/recipes-bsp/tran=
sport-rtos/nimu-rtos_git.bb
new file mode 100644
index 0000000..5366da7
--- /dev/null
+++ b/recipes-bsp/transport-rtos/nimu-rtos_git.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "RTOS driver for Network Interface Management Unit (NIMU)"
+
+inherit ti-pdk
+require transport.inc
+
+PR =3D "${INC_PR}.0"
+
+LIC_FILES_CHKSUM =3D "file://nimu_eth.h;beginline=3D1;endline=3D35;md5=3D5=
2ba99291b03b91058e37115b66edb10"
+
+COMPATIBLE_MACHINE =3D "ti33x|ti43x|omap-a15|keystone|c66x|omapl1"
+
+NIMU_DESTSUFFIX =3D "git/ndk/nimu"
+
+S =3D "${WORKDIR}/${NIMU_DESTSUFFIX}"
+
+DEPENDS_append =3D " ti-ndk osal-rtos"
+DEPENDS_append_ti33x =3D " starterware-rtos emac-lld-rtos"
+DEPENDS_append_ti43x =3D " starterware-rtos emac-lld-rtos"
+DEPENDS_append_omap-a15 =3D " emac-lld-rtos"
+DEPENDS_append_keystone =3D " qmss-lld-rtos cppi-lld-rtos"
+DEPENDS_append_k2hk-evm =3D " pa-lld-rtos"
+DEPENDS_append_k2e-evm =3D " pa-lld-rtos"
+DEPENDS_append_k2l-evm =3D " pa-lld-rtos"
+DEPENDS_append_k2g =3D " emac-lld-rtos"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE =3D "0"
+
+export PDK_NIMU_ROOT_PATH =3D"${WORKDIR}/build"
+export DEST_ROOT=3D"${S}"
+
+export NDK_INSTALL_PATH =3D "${NDK_INSTALL_DIR}"
+XDCPATH_append =3D ";${NDK_INSTALL_DIR}/packages"
diff --git a/recipes-bsp/transport-rtos/transport.inc b/recipes-bsp/transpo=
rt-rtos/transport.inc
new file mode 100644
index 0000000..82427fb
--- /dev/null
+++ b/recipes-bsp/transport-rtos/transport.inc
@@ -0,0 +1,17 @@
+LICENSE =3D "BSD-3-Clause"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+TRANSPORT_GIT_URI =3D "git://git.ti.com/keystone-rtos/transport.git"
+TRANSPORT_GIT_PROTOCOL =3D "git"
+TRANSPORT_GIT_BRANCH =3D "master"
+
+# Below commit ID corresponds to "DEV.TRANSPORT.01.00.00.07A"
+TRANSPORT_SRCREV =3D "099dbf371cea3b2d883f5c97a4b0e7ef40e84c6a"
+
+BRANCH =3D "${TRANSPORT_GIT_BRANCH}"
+SRC_URI =3D "${TRANSPORT_GIT_URI};protocol=3D${TRANSPORT_GIT_PROTOCOL};bra=
nch=3D${BRANCH}"
+
+SRCREV =3D "${TRANSPORT_SRCREV}"
+PV =3D "01.00.00.07A"
+INC_PR =3D "r0"
--
1.9.1


--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F476EDFLE12entticom_--
