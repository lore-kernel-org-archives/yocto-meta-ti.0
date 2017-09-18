Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A950EE00C82; Mon, 18 Sep 2017 13:57:50 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CDBEE00970
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 13:57:46 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IKvaCB030137
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:57:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505768256;
	bh=bQYMAysclot6NHOSOEDNihWZ4jW9jBKqkZzG/8iFvnU=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=yU/brcreJmPRaVoWTSO4FtjsV98ltuvlLxjI0kLaz1B38RmQoIgTcpfVFw6KMGiWC
	i5RH/m7M/wdvc68aohx5YZB9rWmAnGWj59y9iHfxs0wKzv7ej+pIPovaGiIGuakd6n
	xl6teEBi3suRgBC11NF8ET/5AXU7o1+DZESKFZLE=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IKvVvA028271
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 15:57:31 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE72.ent.ti.com ([fe80::e5e2:bab6:34dc:a483%28]) with mapi id
	14.03.0294.000; Mon, 18 Sep 2017 15:57:31 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v2 36/37] cmb-addon-rtos: Adding CMB rtos recipe
Thread-Index: AQHTABpHPH+KuNixLEyGN2IWHgICAqKUfmoAgCcANXA=
Date: Mon, 18 Sep 2017 20:57:30 +0000
Message-ID: <5130E41A1BA9D145BA0F3B18D5CFB0A7437F48A7@DFLE12.ent.ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-36-git-send-email-m-radhakrishnan2@ti.com>
	<20170824201308.GP28233@edge>
In-Reply-To: <20170824201308.GP28233@edge>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2 36/37] cmb-addon-rtos: Adding CMB rtos recipe
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
X-List-Received-Date: Mon, 18 Sep 2017 20:57:50 -0000
X-Groupsio-MsgNum: 10384
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F48A7DFLE12entticom_"

--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F48A7DFLE12entticom_
Content-Type: multipart/alternative;
	boundary="_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F48A7DFLE12entticom_"

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F48A7DFLE12entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



Hi Denys,

Please find my reply inline.

Attached is the new patch with the changes



Regards

Mahesh



-----Original Message-----
From: Dmytriyenko, Denys
Sent: Thursday, August 24, 2017 4:13 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2 36/37] cmb-addon-rtos: Adding CMB rtos rec=
ipe



On Tue, Jul 18, 2017 at 07:03:47PM -0400, Mahesh Radhakrishnan wrote:

> Upstreaming the recipe for Circular Microphone array board (CMB) RTOS

> software

> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com<mailto:m-rad=
hakrishnan2@ti.com>>

> ---

>

> v2 - Added summary

>

>  recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb | 62

> +++++++++++++++++++++++++++++

>  1 file changed, 62 insertions(+)

>  create mode 100644 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb

>

> diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb

> b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb

> new file mode 100644

> index 0000000..0ff8bba

> --- /dev/null

> +++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb

> @@ -0,0 +1,62 @@

> +SUMMARY =3D "TI RTOS software supporting circular microphone array board=
"

> +require recipes-ti/includes/ti-paths.inc

> +

> +LICENSE =3D "BSD-3-Clause"

> +LIC_FILES_CHKSUM =3D "file://cmbaddonver.h;beginline=3D8;endline=3D47;md=
5=3Dd0cb159bf210cfafed63042da01c83e0<file:///\\cmbaddonver.h;beginline=3D8;=
endline=3D47;md5=3Dd0cb159bf210cfafed63042da01c83e0>"

> +

> +COMPATIBLE_MACHINE =3D "k2g|omapl137-evm"

> +

> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"

> +

> +CMB_ADDON_GIT_URI =3D "git://git.ti.com/processor-sdk/circmicarray-addon=
.git"

> +CMB_ADDON_GIT_PROTOCOL =3D "git"

> +CMB_ADDON_GIT_BRANCH =3D "master"

> +CMB_ADDON_GIT_DESTSUFFIX =3D "git/ti/addon"

> +

> +# Below commit ID corresponds to "DEV.CMB.01.01.00.00"

> +CMB_ADDON_SRCREV =3D "29c05572b82251bac73cd685afcffdb8549eaaaf"

> +

> +SRCREV =3D "${CMB_ADDON_SRCREV}"

> +PV =3D "01.01.00.00"

> +PR =3D "r0"

> +

> +BRANCH =3D "${CMB_ADDON_GIT_BRANCH}"

> +SRC_URI =3D "${CMB_ADDON_GIT_URI};destsuffix=3D${CMB_ADDON_GIT_DESTSUFFI=
X};protocol=3D${CMB_ADDON_GIT_PROTOCOL};branch=3D${BRANCH}"

> +

> +

> +S =3D "${WORKDIR}/git/ti/addon/cmb"

> +

> +DEPENDS =3D " ti-cgt6x-native \

> +            ti-sysbios \

> +            ti-xdctools \

> +            ti-pdk-build-rtos \

> +            common-csl-ip-rtos \

> +            gpio-lld-rtos \

> +            i2c-lld-rtos \

> +            mcasp-lld-rtos \

> +            board-rtos \



Blocked by board-rtos

Board-rtos' dependent packages have been submitted now,  it should unblock =
board.





> +"

> +

> +export C6X_GEN_INSTALL_PATH =3D "${STAGING_DIR_NATIVE}/usr/share/ti/cgt-=
c6x"

> +export PDK_INSTALL_PATH =3D "${PDK_INSTALL_DIR}/packages"

> +export BIOS_INSTALL_PATH =3D "${SYSBIOS_INSTALL_DIR}"

> +export XDC_INSTALL_PATH =3D "${XDC_INSTALL_DIR}"

> +

> +export XDCPATH =3D "${XDC_INSTALL_DIR}/packages;${SYSBIOS_INSTALL_DIR}/p=
ackages;${PDK_INSTALL_DIR}/packages"

> +

> +export PDK_CMB_ROOT_PATH =3D "${WORKDIR}/git"

> +

> +do_compile() {

> +    cd ${S}



Not needed ^

It has been removed now as ti-pdk bbclass is being used



> +    make release LIMIT_SOCS=3D"${TI_PDK_LIMIT_SOCS}" LIMIT_BOARDS=3D"${T=
I_PDK_LIMIT_BOARDS}"

> +}

> +

> +do_install() {

> +    cd ${S}



Not needed ^

It has been removed now as ti-pdk bbclass is being used





> +    install -d ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ti/addon/cmb

> +    find -name "*.tar" -exec tar xf {} -C

> + ${D}${PDK_INSTALL_DIR_RECIPE}/packages/ \;



Is this needed?

It has been removed now as ti-pdk bbclass is being used





> +}

> +

> +FILES_${PN} +=3D "${PDK_INSTALL_DIR_RECIPE}/packages"

> --

> 1.9.1

>

> --

> _______________________________________________

> meta-ti mailing list

> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>

> https://lists.yoctoproject.org/listinfo/meta-ti

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F48A7DFLE12entticom_
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
:100.0%">Hi Denys,<o:p></o:p></span></a></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Please find my repl=
y inline.<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Attached is the new=
 patch with the changes<o:p></o:p></span></p>
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
Sent: Thursday, August 24, 2017 4:13 PM<br>
To: Radhakrishnan, Mahesh<br>
Cc: meta-ti@yoctoproject.org<br>
Subject: Re: [meta-ti] [PATCH v2 36/37] cmb-addon-rtos: Adding CMB rtos rec=
ipe</p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">On Tue, Jul 18, 2017 at 07:03:47PM -0400, Mahesh =
Radhakrishnan wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Upstreaming the recipe for Circular Micropho=
ne array board (CMB) RTOS
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; software<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Signed-off-by: Mahesh Radhakrishnan &lt;<a h=
ref=3D"mailto:m-radhakrishnan2@ti.com"><span style=3D"color:windowtext;text=
-decoration:none">m-radhakrishnan2@ti.com</span></a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ---<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; v2 - Added summary<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; recipes-bsp/cmb-addon/cmb-addon-rtos_g=
it.bb | 62 <o:p>
</o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43=
;&#43;&#43;&#43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; 1 file changed, 62 insertions(&#43;)<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; create mode 100644 recipes-bsp/cmb-add=
on/cmb-addon-rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/recipes-bsp/cmb-addon/cmb-addon=
-rtos_git.bb
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.b=
b<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; new file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; index 0000000..0ff8bba<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/recipes-bsp/cmb-addon/cmb-=
addon-rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -0,0 &#43;1,62 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SUMMARY =3D &quot;TI RTOS software supp=
orting circular microphone array board&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;require recipes-ti/includes/ti-paths.in=
c<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;LICENSE =3D &quot;BSD-3-Clause&quot;<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D"f=
ile:///\\cmbaddonver.h;beginline=3D8;endline=3D47;md5=3Dd0cb159bf210cfafed6=
3042da01c83e0"><span style=3D"color:windowtext;text-decoration:none">file:/=
/cmbaddonver.h;beginline=3D8;endline=3D47;md5=3Dd0cb159bf210cfafed63042da01=
c83e0</span></a>&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;COMPATIBLE_MACHINE =3D &quot;k2g|omapl1=
37-evm&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&=
quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;CMB_ADDON_GIT_URI =3D &quot;git://git.t=
i.com/processor-sdk/circmicarray-addon.git&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;CMB_ADDON_GIT_PROTOCOL =3D &quot;git&qu=
ot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;CMB_ADDON_GIT_BRANCH =3D &quot;master&q=
uot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;CMB_ADDON_GIT_DESTSUFFIX =3D &quot;git/=
ti/addon&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# Below commit ID corresponds to &quot;=
DEV.CMB.01.01.00.00&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;CMB_ADDON_SRCREV =3D &quot;29c05572b822=
51bac73cd685afcffdb8549eaaaf&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SRCREV =3D &quot;${CMB_ADDON_SRCREV}&qu=
ot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PV =3D &quot;01.01.00.00&quot;<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; &#43;PR =3D &quot;r0&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;BRANCH =3D &quot;${CMB_ADDON_GIT_BRANCH=
}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SRC_URI =3D &quot;${CMB_ADDON_GIT_URI};=
destsuffix=3D${CMB_ADDON_GIT_DESTSUFFIX};protocol=3D${CMB_ADDON_GIT_PROTOCO=
L};branch=3D${BRANCH}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;S =3D &quot;${WORKDIR}/git/ti/addon/cmb=
&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS =3D &quot; ti-cgt6x-native \<o:=
p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ti-sysbios \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ti-xdctools \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; ti-pdk-build-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; common-csl-ip-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; gpio-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; i2c-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; mcasp-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; board-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Blocked by board-rtos<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Board-rtos&#8217; d=
ependent packages have been submitted now,&nbsp; it should unblock board.<o=
:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:black"><o:p>&nbsp;</o:p></sp=
an></p>
<p class=3D"MsoPlainText"><span style=3D"color:black"><o:p>&nbsp;</o:p></sp=
an></p>
<p class=3D"MsoPlainText">&gt; &#43;&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export C6X_GEN_INSTALL_PATH =3D &quot;$=
{STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export PDK_INSTALL_PATH =3D &quot;${PDK=
_INSTALL_DIR}/packages&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export BIOS_INSTALL_PATH =3D &quot;${SY=
SBIOS_INSTALL_DIR}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export XDC_INSTALL_PATH =3D &quot;${XDC=
_INSTALL_DIR}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export XDCPATH =3D &quot;${XDC_INSTALL_=
DIR}/packages;${SYSBIOS_INSTALL_DIR}/packages;${PDK_INSTALL_DIR}/packages&q=
uot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export PDK_CMB_ROOT_PATH =3D &quot;${WO=
RKDIR}/git&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;do_compile() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; cd ${S}<o:p></o:p></=
p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Not needed ^<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">It has been removed=
 now as ti-pdk bbclass is being used</span><o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; make release LIMIT_S=
OCS=3D&quot;${TI_PDK_LIMIT_SOCS}&quot; LIMIT_BOARDS=3D&quot;${TI_PDK_LIMIT_=
BOARDS}&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;do_install() {<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; cd ${S}<o:p></o:p></=
p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Not needed ^<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">It has been removed=
 now as ti-pdk bbclass is being used</span><o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; install -d ${D}${PDK=
_INSTALL_DIR_RECIPE}/packages/ti/addon/cmb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp; find -name &quot;*.t=
ar&quot; -exec tar xf {} -C <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43; ${D}${PDK_INSTALL_DIR_RECIPE}/packages=
/ \;<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">Is this needed?<o:p></o:p></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">It has been removed=
 now as ti-pdk bbclass is being used</span><o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;}<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;FILES_${PN} &#43;=3D &quot;${PDK_INSTAL=
L_DIR_RECIPE}/packages&quot;<o:p></o:p></p>
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

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F48A7DFLE12entticom_--

--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F48A7DFLE12entticom_
Content-Type: message/rfc822
Content-Disposition: attachment;
	creation-date="Mon, 18 Sep 2017 20:57:30 GMT";
	modification-date="Mon, 18 Sep 2017 20:57:30 GMT"

Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE72.ent.ti.com
 (128.247.5.109) with Microsoft SMTP Server (TLS) id 14.3.294.0; Mon, 18 Sep
 2017 15:49:09 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34; Mon, 18
 Sep 2017 15:49:09 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend Transport;
 Mon, 18 Sep 2017 15:49:09 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
 v8IKn9xd016994;	Mon, 18 Sep 2017 15:49:09 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
CC: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
Subject: [PATCH v4] cmb-addon-rtos: Adding CMB rtos recipe
Thread-Topic: [PATCH v4] cmb-addon-rtos: Adding CMB rtos recipe
Thread-Index: AQHTML+TbYlyT3YzJ0iAvXazdOz6gg==
Date: Mon, 18 Sep 2017 20:49:08 +0000
Message-ID: <1505767748-7003-1-git-send-email-m-radhakrishnan2@ti.com>
Content-Language: en-US
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AuthSource: DFLE112.ent.ti.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0

Circular Microphone array board (CMB) RTOS software
Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---

 v4 - Modified the recipe to ti-pdk.bbclass
 v3 - Removed redundant code in do_compile & do_install
 v2 - Added summary

 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb | 41 +++++++++++++++++++++++++=
++++
 1 file changed, 41 insertions(+)
 create mode 100644 recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb

diff --git a/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb b/recipes-bsp/cmb-=
addon/cmb-addon-rtos_git.bb
new file mode 100644
index 0000000..4d69863
--- /dev/null
+++ b/recipes-bsp/cmb-addon/cmb-addon-rtos_git.bb
@@ -0,0 +1,41 @@
+SUMMARY =3D "TI RTOS software supporting circular microphone array board"
+require recipes-ti/includes/ti-paths.inc
+inherit ti-pdk
+
+LICENSE =3D "BSD-3-Clause"
+LIC_FILES_CHKSUM =3D "file://cmbaddonver.h;beginline=3D8;endline=3D47;md5=
=3Dd0cb159bf210cfafed63042da01c83e0"
+
+COMPATIBLE_MACHINE =3D "k2g|omapl137-evm"
+
+PACKAGE_ARCH =3D "${MACHINE_ARCH}"
+
+CMB_ADDON_GIT_URI =3D "git://git.ti.com/processor-sdk/circmicarray-addon.g=
it"
+CMB_ADDON_GIT_PROTOCOL =3D "git"
+CMB_ADDON_GIT_BRANCH =3D "master"
+CMB_ADDON_GIT_DESTSUFFIX =3D "git/ti/addon"
+
+# Below commit ID corresponds to "DEV.CMB.01.01.00.00"
+CMB_ADDON_SRCREV =3D "29c05572b82251bac73cd685afcffdb8549eaaaf"
+
+SRCREV =3D "${CMB_ADDON_SRCREV}"
+PV =3D "01.01.00.00"
+PR =3D "r0"
+
+BRANCH =3D "${CMB_ADDON_GIT_BRANCH}"
+SRC_URI =3D "${CMB_ADDON_GIT_URI};destsuffix=3D${CMB_ADDON_GIT_DESTSUFFIX}=
;protocol=3D${CMB_ADDON_GIT_PROTOCOL};branch=3D${BRANCH}"
+
+
+S =3D "${WORKDIR}/git/ti/addon/cmb"
+
+DEPENDS_append =3D " ti-sysbios \
+            gpio-lld-rtos \
+            i2c-lld-rtos \
+            mcasp-lld-rtos \
+            board-rtos \
+"
+
+export PDK_CMB_ROOT_PATH =3D "${WORKDIR}/build"
+export DEST_ROOT=3D"${S}"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE =3D "0"
--
1.9.1


--_004_5130E41A1BA9D145BA0F3B18D5CFB0A7437F48A7DFLE12entticom_--
