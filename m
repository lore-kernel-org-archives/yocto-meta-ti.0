Return-Path: <e-ruei1@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 94898E0091A; Wed, 14 Mar 2018 17:58:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	URI_HEX autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [198.47.27.80 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CDE49E0073D
	for <meta-ti@yoctoproject.org>; Wed, 14 Mar 2018 17:58:13 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2F0wDJR030959
	for <meta-ti@yoctoproject.org>; Wed, 14 Mar 2018 19:58:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521075493;
	bh=1fBjWICYAnca5f6QOvzyTOXrkzJdr6+eEPeJIz6eP+U=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=dQJdRQQ04XNnBu97jMDi7/XTHYTndg3bDNQ0L8G5murVWuFHdzg+ALE75r8Pc9dQl
	E+elW4327yU8MLirVu268KHcogmW+AsNDg19G/T4NIw+31Xy9PfrV8IQpujyTzuit7
	ai3C0+dSGAcNWwUn7jGQWbogLIvP1zBeHVNFkYH8=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2F0wCnT020602
	for <meta-ti@yoctoproject.org>; Wed, 14 Mar 2018 19:58:12 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 14 Mar 2018 19:58:12 -0500
Received: from DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455]) by
	DLEE113.ent.ti.com ([fe80::a10b:711a:6ba7:e455%17]) with mapi id
	15.01.1261.035; Wed, 14 Mar 2018 19:58:12 -0500
From: "Ruei, Eric" <e-ruei1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-ti] [rocko/master][PATCH v3] ti-sgx-ddk-km: update SGX
	kernel	driver for k4.14
Thread-Index: AQHTu/fB2rca4+EAP0+Wwt4ZZOVgFKPQeRfg
Date: Thu, 15 Mar 2018 00:58:11 +0000
Message-ID: <b04f4f1375bb454fbbee4d113e31a0ce@ti.com>
References: <1521074745-42435-1-git-send-email-e-ruei1@ti.com>
	<4ece286e-ecc2-4ff9-8239-13183b53f1de@email.android.com>
In-Reply-To: <4ece286e-ecc2-4ff9-8239-13183b53f1de@email.android.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.103.39]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [rocko/master][PATCH v3] ti-sgx-ddk-km: update SGX kernel	driver for k4.14
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
X-List-Received-Date: Thu, 15 Mar 2018 00:58:14 -0000
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_b04f4f1375bb454fbbee4d113e31a0ceticom_"

--_000_b04f4f1375bb454fbbee4d113e31a0ceticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, Denys:

I see that the v2 is in.
Should I submit this one on top of v2 as a new patch?

Best regards,

Eric


From: Dmytriyenko, Denys
Sent: Wednesday, March 14, 2018 8:51 PM
To: Ruei, Eric
Cc: meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [rocko/master][PATCH v3] ti-sgx-ddk-km: update SGX k=
ernel driver for k4.14

It's already in rocko/master - no rebases



On Mar 14, 2018 17:46, "Ruei, Eric" <e-ruei1@ti.com<mailto:e-ruei1@ti.com>>=
 wrote:
From: Anand Balagopalakrishnan <anandb@ti.com<mailto:anandb@ti.com>>

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com<mailto:anandb@ti.com=
>>
Signed-off-by: Eric Ruei <e-ruei1@ti.com<mailto:e-ruei1@ti.com>>
---
 recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/re=
cipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
index 0303797..55f6b9b 100644
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb
@@ -20,7 +20,7 @@ RPROVIDES_${PN} =3D "omapdrm-pvr"
 RREPLACES_${PN} =3D "omapdrm-pvr"
 RCONFLICTS_${PN} =3D "omapdrm-pvr"

-BRANCH =3D "ti-img-sgx/${PV}/k4.9"
+BRANCH =3D "ti-img-sgx/${PV}/k4.14"

 SRC_URI =3D "git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;protocol=3D=
git;branch=3D${BRANCH} \
 file://0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch<fil=
e:///\\0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch> \
@@ -28,7 +28,7 @@ file://0001-srvkm-common-devicemem.c-suppress-implicit-fa=
llthrou.patch<file:///\\0001-srvkm-common-devicemem.c-suppress-implicit-fal=
lthrou.patch> \

 S =3D "${WORKDIR}/git"

-SRCREV =3D "0086977380d3320d70a3abc78b95fa0641427073"
+SRCREV =3D "b144fa4b97cb69e54cabaad62daffcd4b5497c29"

 TARGET_PRODUCT_omap-a15 =3D "jacinto6evm"
 TARGET_PRODUCT_ti33x =3D "ti335x"
--
1.9.1

--
_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org<mailto:meta-ti@yoctoproject.org>
https://lists.yoctoproject.org/listinfo/meta-ti

--_000_b04f4f1375bb454fbbee4d113e31a0ceticom_
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
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
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
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
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
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Hi, Denys:<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">I see that the v2 is in.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Should I submit this one =
on top of v2 as a new patch?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Best regards,<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D">Eric<o:p></o:p></span></p=
>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ca=
libri&quot;,&quot;sans-serif&quot;;color:#1F497D"><o:p>&nbsp;</o:p></span><=
/p>
<div>
<div style=3D"border:none;border-top:solid #B5C4DF 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.0pt;font-family:&quot=
;Tahoma&quot;,&quot;sans-serif&quot;">From:</span></b><span style=3D"font-s=
ize:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;"> Dmytriye=
nko, Denys
<br>
<b>Sent:</b> Wednesday, March 14, 2018 8:51 PM<br>
<b>To:</b> Ruei, Eric<br>
<b>Cc:</b> meta-ti@yoctoproject.org<br>
<b>Subject:</b> Re: [meta-ti] [rocko/master][PATCH v3] ti-sgx-ddk-km: updat=
e SGX kernel driver for k4.14<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal">It's already in rocko/master - no rebases<o:p></o:p>=
</p>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal">On Mar 14, 2018 17:46, &quot;Ruei, Eric&quot; &lt;<a=
 href=3D"mailto:e-ruei1@ti.com">e-ruei1@ti.com</a>&gt; wrote:<o:p></o:p></p=
>
</div>
</div>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt">From: Anand Balagop=
alakrishnan &lt;<a href=3D"mailto:anandb@ti.com">anandb@ti.com</a>&gt;<br>
<br>
Signed-off-by: Anand Balagopalakrishnan &lt;<a href=3D"mailto:anandb@ti.com=
">anandb@ti.com</a>&gt;<br>
Signed-off-by: Eric Ruei &lt;<a href=3D"mailto:e-ruei1@ti.com">e-ruei1@ti.c=
om</a>&gt;<br>
---<br>
&nbsp;recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb | 4 &#43;&#=
43;--<br>
&nbsp;1 file changed, 2 insertions(&#43;), 2 deletions(-)<br>
<br>
diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb b/re=
cipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb<br>
index 0303797..55f6b9b 100644<br>
--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb<br>
&#43;&#43;&#43; b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km_1.14.3699939.bb=
<br>
@@ -20,7 &#43;20,7 @@ RPROVIDES_${PN} =3D &quot;omapdrm-pvr&quot;<br>
&nbsp;RREPLACES_${PN} =3D &quot;omapdrm-pvr&quot;<br>
&nbsp;RCONFLICTS_${PN} =3D &quot;omapdrm-pvr&quot;<br>
&nbsp;<br>
-BRANCH =3D &quot;ti-img-sgx/${PV}/k4.9&quot;<br>
&#43;BRANCH =3D &quot;ti-img-sgx/${PV}/k4.14&quot;<br>
&nbsp;<br>
&nbsp;SRC_URI =3D &quot;git://git.ti.com/graphics/omap5-sgx-ddk-linux.git;p=
rotocol=3Dgit;branch=3D${BRANCH} \<br>
&nbsp;<a href=3D"file:///\\0001-srvkm-common-devicemem.c-suppress-implicit-=
fallthrou.patch">file://0001-srvkm-common-devicemem.c-suppress-implicit-fal=
lthrou.patch</a> \<br>
@@ -28,7 &#43;28,7 @@ <a href=3D"file:///\\0001-srvkm-common-devicemem.c-su=
ppress-implicit-fallthrou.patch">
file://0001-srvkm-common-devicemem.c-suppress-implicit-fallthrou.patch</a> =
\<br>
&nbsp;<br>
&nbsp;S =3D &quot;${WORKDIR}/git&quot;<br>
&nbsp;<br>
-SRCREV =3D &quot;0086977380d3320d70a3abc78b95fa0641427073&quot;<br>
&#43;SRCREV =3D &quot;b144fa4b97cb69e54cabaad62daffcd4b5497c29&quot;<br>
&nbsp;<br>
&nbsp;TARGET_PRODUCT_omap-a15 =3D &quot;jacinto6evm&quot;<br>
&nbsp;TARGET_PRODUCT_ti33x =3D &quot;ti335x&quot;<br>
-- <br>
1.9.1<br>
<br>
-- <br>
_______________________________________________<br>
meta-ti mailing list<br>
<a href=3D"mailto:meta-ti@yoctoproject.org">meta-ti@yoctoproject.org</a><br=
>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-ti">https://lists.y=
octoproject.org/listinfo/meta-ti</a><o:p></o:p></span></p>
</div>
</div>
</body>
</html>

--_000_b04f4f1375bb454fbbee4d113e31a0ceticom_--
