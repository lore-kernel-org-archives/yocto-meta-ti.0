Return-Path: <m-radhakrishnan2@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 42712E00CCD; Mon, 18 Sep 2017 14:08:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED0FBE00970
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 14:08:13 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8IL8DFL017010
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 16:08:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505768893;
	bh=RCoa2MMr8hwkgjQnyOWq80LXG+qA2p/oZSFvmPuhsnE=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Gja4gAJqOFtzJNa7EG00z+IrbGh2674UoYHzWZ7wn/JpnmE4ccMTNf6EH2+lJaCIH
	WvLerX1jqYILfaHNY8lfDDQxPP+xqA13vGMFPM+Wj47RUWv8ul7hx1Ha0HKgZQxfEb
	0Pyla85iIZviOZy5ROr9nOJU7VgQ6GRNqzeUbv0Y=
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8IL8DDt027551
	for <meta-ti@yoctoproject.org>; Mon, 18 Sep 2017 16:08:13 -0500
Received: from DFLE12.ent.ti.com ([fe80::e9a3:bf19:af96:227b]) by
	DFLE73.ent.ti.com ([fe80::c9be:a3a9:7cd8:c8b3%28]) with mapi id
	14.03.0294.000; Mon, 18 Sep 2017 16:08:12 -0500
From: "Radhakrishnan, Mahesh" <m-radhakrishnan2@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [PATCH v2 30/37] icss-emac-lld-rtos: Added rtos
	recipe for icss-emac-lld
Thread-Index: AQHTABpD1lBDMgwGuEi4pr0HEdcRAqKUmaEAgCbqTkA=
Date: Mon, 18 Sep 2017 21:08:12 +0000
Message-ID: <5130E41A1BA9D145BA0F3B18D5CFB0A7437F4960@DFLE12.ent.ti.com>
References: <1500419028-3361-1-git-send-email-m-radhakrishnan2@ti.com>
	<1500419028-3361-30-git-send-email-m-radhakrishnan2@ti.com>
	<20170824215031.GW28233@edge>
In-Reply-To: <20170824215031.GW28233@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.172.224.222]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH v2 30/37] icss-emac-lld-rtos: Added rtos recipe for icss-emac-lld
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
X-List-Received-Date: Mon, 18 Sep 2017 21:08:17 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4960DFLE12entticom_"

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4960DFLE12entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

I see that icss-emac-lld was pushed to morty-next-rel a couple of weeks ago=
.

https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=3Dmorty-next-r=
el&id=3Dd959ca1fb0060c330701634352bd88b8ba53c31d



Hope this will suffice for this rtos recipe.



Regards

Mahesh



-----Original Message-----
From: Dmytriyenko, Denys
Sent: Thursday, August 24, 2017 5:51 PM
To: Radhakrishnan, Mahesh
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH v2 30/37] icss-emac-lld-rtos: Added rtos reci=
pe for icss-emac-lld



This one is out too, since dependent icss-emac-lld isn't in yet.





On Tue, Jul 18, 2017 at 07:03:41PM -0400, Mahesh Radhakrishnan wrote:

> Upstreaming RTOS low level driver for ICSS-EMAC

> Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com<mailto:m-rad=
hakrishnan2@ti.com>>

> ---

>

> v2 - Added summary

>

>  .../icss-emac-lld/icss-emac-lld-rtos_git.bb        | 25 ++++++++++++++++=
++++++

>  1 file changed, 25 insertions(+)

>  create mode 100644

> recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb

>

> diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb

> b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb

> new file mode 100644

> index 0000000..882ce99

> --- /dev/null

> +++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bb

> @@ -0,0 +1,25 @@

> +SUMMARY =3D "TI RTOS low level driver for ICSS-EMAC"

> +

> +inherit ti-pdk

> +require icss-emac-lld.inc

> +

> +PR =3D "${INC_PR}.0"

> +

> +DEPENDS_append =3D " osal-rtos \

> +                   pruss-lld-rtos \

> +"

> +DEPENDS_append_ti33x =3D " starterware-rtos \ "

> +DEPENDS_append_ti43x =3D " starterware-rtos \ "

> +

> +# Build with make instead of XDC

> +TI_PDK_XDCMAKE =3D "0"

> +

> +export PDK_ICSS_EMAC_ROOT_PATH =3D"${WORKDIR}/build"

> +export DEST_ROOT=3D"${S}"

> +

> +# HTML doc link params

> +PDK_COMP_LINK_TEXT =3D "ICSS-EMAC LLD"

> +

> +INSANE_SKIP_${PN} =3D "arch"

> --

> 1.9.1

>

> --

> _______________________________________________

> meta-ti mailing list

> meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>

> https://lists.yoctoproject.org/listinfo/meta-ti

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4960DFLE12entticom_
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
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">I see that icss-ema=
c-lld was pushed to morty-next-rel a couple of weeks ago.
<o:p></o:p></span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%"><a href=3D"https://=
git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=3Dmorty-next-rel&amp;i=
d=3Dd959ca1fb0060c330701634352bd88b8ba53c31d"><span style=3D"color:#558ED5;=
mso-style-textfill-fill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%"=
>https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/commit/?h=3Dmorty-next-=
rel&amp;id=3Dd959ca1fb0060c330701634352bd88b8ba53c31d</span></a><o:p></o:p>=
</span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoPlainText"><span style=3D"color:#558ED5;mso-style-textfill-f=
ill-color:#558ED5;mso-style-textfill-fill-alpha:100.0%">Hope this will suff=
ice for this rtos recipe.<o:p></o:p></span></p>
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
Sent: Thursday, August 24, 2017 5:51 PM<br>
To: Radhakrishnan, Mahesh<br>
Cc: meta-ti@yoctoproject.org<br>
Subject: Re: [meta-ti] [PATCH v2 30/37] icss-emac-lld-rtos: Added rtos reci=
pe for icss-emac-lld</p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">This one is out too, since dependent icss-emac-ll=
d isn't in yet.<o:p></o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoPlainText">On Tue, Jul 18, 2017 at 07:03:41PM -0400, Mahesh =
Radhakrishnan wrote:<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Upstreaming RTOS low level driver for ICSS-E=
MAC<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; Signed-off-by: Mahesh Radhakrishnan &lt;<a h=
ref=3D"mailto:m-radhakrishnan2@ti.com"><span style=3D"color:windowtext;text=
-decoration:none">m-radhakrishnan2@ti.com</span></a>&gt;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; ---<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; v2 - Added summary<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; .../icss-emac-lld/icss-emac-lld-rtos_g=
it.bb&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; | 25 &#43;&#43;&#43;&#43;&#=
43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#=
43;&#43;&#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; 1 file changed, 25 insertions(&#43;)<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt;&nbsp; create mode 100644 <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; recipes-bsp/icss-emac-lld/icss-emac-lld-rtos=
_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; <o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; diff --git a/recipes-bsp/icss-emac-lld/icss-=
emac-lld-rtos_git.bb
<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; b/recipes-bsp/icss-emac-lld/icss-emac-lld-rt=
os_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; new file mode 100644<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; index 0000000..882ce99<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; --- /dev/null<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&#43;&#43; b/recipes-bsp/icss-emac-lld/=
icss-emac-lld-rtos_git.bb<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; @@ -0,0 &#43;1,25 @@<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;SUMMARY =3D &quot;TI RTOS low level dri=
ver for ICSS-EMAC&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;inherit ti-pdk<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;require icss-emac-lld.inc<o:p></o:p></p=
>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PR =3D &quot;${INC_PR}.0&quot;<o:p></o:=
p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append =3D &quot; osal-rtos \<o=
:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;pruss=
-lld-rtos \<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_ti33x =3D &quot; starter=
ware-rtos \ &quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;DEPENDS_append_ti43x =3D &quot; starter=
ware-rtos \ &quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# Build with make instead of XDC<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;TI_PDK_XDCMAKE =3D &quot;0&quot;<o:p></=
o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export PDK_ICSS_EMAC_ROOT_PATH =3D&quot=
;${WORKDIR}/build&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;export DEST_ROOT=3D&quot;${S}&quot;<o:p=
></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;# HTML doc link params<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;PDK_COMP_LINK_TEXT =3D &quot;ICSS-EMAC =
LLD&quot;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;<o:p></o:p></p>
<p class=3D"MsoPlainText">&gt; &#43;INSANE_SKIP_${PN} =3D &quot;arch&quot;<=
o:p></o:p></p>
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

--_000_5130E41A1BA9D145BA0F3B18D5CFB0A7437F4960DFLE12entticom_--
