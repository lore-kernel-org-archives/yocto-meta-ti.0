Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.4831.1618353018239332040
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 15:30:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=HY1QAz9L;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: g-tammana@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13DMUENO020737;
	Tue, 13 Apr 2021 17:30:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618353014;
	bh=ZPDvcn2R1RPtRLM1i7WYGsUMtf6YjabRGyaWWeUQXm0=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=HY1QAz9LdB7LYsvz1NRB+fivS2Su6X73FUIsCBYPH58q/Czp5jo1uWiBCJKz2FuG8
	 KZFrWHzz4UXLY5oqbl3Q8yOZygw08Cz4Ji7TLbFQma4j70Ex9d0DDJlGESKshrNXBX
	 tLRImX60r3nM75RIL4PDOO9luOTdozPks7tlkARA=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13DMUESm120240
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 13 Apr 2021 17:30:14 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Tue, 13
 Apr 2021 17:30:14 -0500
Received: from DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11]) by
 DLEE111.ent.ti.com ([fe80::a4a2:21d4:3321:ad11%17]) with mapi id
 15.01.2176.009; Tue, 13 Apr 2021 17:30:14 -0500
From: "Gowtham Tammana" <g-tammana@ti.com>
To: Zan Dobersek <zan@falconsigh.net>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly handle arm-poky-linux-gnueabi compiler prefix
Thread-Topic: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly handle
 arm-poky-linux-gnueabi compiler prefix
Thread-Index: AQHXCoai2I6F1ufEfkG0ISNF1M0l96pnqD4AgAB9A4CASnmjxoAAtDDw
Date: Tue, 13 Apr 2021 22:30:14 +0000
Message-ID: <290f014d90634c91953745ca4e4ff995@ti.com>
References: <20210224082509.14163-1-zan@falconsigh.net>
 <3c3a7b165e474569a0ce474f2c5e7635@ti.com> <20210224202307.GB4892@denix.org>
 <16673A9B03286F37.14505@lists.yoctoproject.org>
 <f6c786e1-363f-499d-b19e-9e1647161644@www.fastmail.com>
In-Reply-To: <f6c786e1-363f-499d-b19e-9e1647161644@www.fastmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.43.171]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_290f014d90634c91953745ca4e4ff995ticom_"

--_000_290f014d90634c91953745ca4e4ff995ticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> On Be=
half Of Zan Dobersek
Sent: Tuesday, April 13, 2021 6:41 AM
To: meta-ti@lists.yoctoproject.org
Subject: Re: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly handle ar=
m-poky-linux-gnueabi compiler prefix

Hi,

this patch is still valid and needed for Poky-based builds. Did it just go =
unattended or is there some action still expected on my part?

No further action, this will be picked up.

Thanks,
Gowtham

Regards,
Zan

On Fri, Feb 26, 2021, at 8:10 AM, Zan Dobersek wrote:
On Wed, Feb 24, 2021, at 9:23 PM, Denys Dmytriyenko wrote:
> On Wed, Feb 24, 2021 at 06:57:57PM +0000, Gowtham Tammana via
> lists.yoctoproject.org wrote:
> >
> >
> > >-----Original Message-----
> > >From: meta-ti@lists.yoctoproject.org<mailto:meta-ti%40lists.yoctoproje=
ct.org> <meta-ti@lists.yoctoproject.org<mailto:meta-ti%40lists.yoctoproject=
.org>> On
> > >Behalf Of Zan Dobersek
> > >Sent: Wednesday, February 24, 2021 2:25 AM
> > >To: meta-ti@lists.yoctoproject.org<mailto:meta-ti%40lists.yoctoproject=
.org>
> > >Subject: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly handle a=
rm-
> > >poky-linux-gnueabi compiler prefix
> > >
> > >The additional patch for ti-sgx-ddk-km remaps the arm-oe-linux-gnueabi
> > >prefix
> > >to the arm-linux-gnueabihf preferred target. Same should be done for t=
he
> > >arm-poky-linux-gnueabi prefix.
> >
> > This looks ok. Btw what layer is being used when using this toolchain.
>
> Gowtham,
>
> This toolchain is built by Poky, which is the reference distribution of t=
he
> Yocto Project.
>

Reviewed-by: Gowtham Tammana g-tammana@ti.com<mailto:g-tammana@ti.com>

That's right.

FWIW the patch should be applicable to both dunfell and master branches.

Regards,
Zan

> --
> Denys
>
>
> > >Signed-off-by: Zan Dobersek <zan@falconsigh.net<mailto:zan%40falconsig=
h.net>>
> > >---
> > > ...1-km-support-OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch | 2 +=
-
> > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >diff --git a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support=
-
> > >OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch b/recipes-bsp/powervr-
> > >drivers/ti-sgx-ddk-km/0001-km-support-OpenEmbedded-hardfp-toolchain-w-=
o-
> > >gnueabi.patch
> > >index 071ce0ca..15105eac 100644
> > >--- a/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
> > >OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> > >+++ b/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-km-support-
> > >OpenEmbedded-hardfp-toolchain-w-o-gnueabi.patch
> > >@@ -17,7 +17,7 @@ index dead2f9..2ba3e5e 100644
> > >    ifneq ($$(filter aarch64-%,$$($(1)_compiler_preferred_target)),)
> > >     $(1)_compiler_preferred_target :=3D aarch64-linux-gnu
> > >    endif
> > >-+  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-
> > >gnueabi,$$($(1)_compiler_preferred_target)),)
> > >++  ifneq ($$(filter arm-%-gnueabihf arm-oe-linux-gnueabi arm-poky-lin=
ux-
> > >gnueabi,$$($(1)_compiler_preferred_target)),)
> > > +   $(1)_compiler_preferred_target :=3D arm-linux-gnueabihf
> > > +  endif
> > >    ifneq ($$(filter arm-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-
> > >redhat-linux-gnueabi,$$($(1)_compiler_preferred_target)),)
> > >--
> > >2.30.0
>







--_000_290f014d90634c91953745ca4e4ff995ticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
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
	font-size:10.5pt;
	font-family:Consolas;}
p.MsoNoSpacing, li.MsoNoSpacing, div.MsoNoSpacing
	{mso-style-name:"No Spacing\,Code";
	mso-style-priority:1;
	margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.PlainTextChar
	{mso-style-name:"Plain Text Char";
	mso-style-priority:99;
	mso-style-link:"Plain Text";
	font-family:Consolas;}
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0in;
	mso-margin-bottom-alt:auto;
	margin-left:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle21
	{mso-style-type:personal-reply;
	font-family:Consolas;
	color:#1F497D;
	font-weight:normal;
	font-style:normal;
	text-decoration:none none;}
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
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:#1F497D"><=
o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:#1F497D"><=
o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> meta-ti@lists.yoctoproject.org &lt;meta=
-ti@lists.yoctoproject.org&gt;
<b>On Behalf Of </b>Zan Dobersek<br>
<b>Sent:</b> Tuesday, April 13, 2021 6:41 AM<br>
<b>To:</b> meta-ti@lists.yoctoproject.org<br>
<b>Subject:</b> Re: [EXTERNAL] [meta-ti] [PATCH] ti-sgx-ddk-km: properly ha=
ndle arm-poky-linux-gnueabi compiler prefix<o:p></o:p></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif">Hi,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif">this patch is still valid and needed for Poky-based builds. Did it jus=
t go unattended or is there some action still expected on my part?<o:p></o:=
p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:#1F497D">N=
o further action, this will be picked up.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:#1F497D"><=
o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:#1F497D">T=
hanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:#1F497D">G=
owtham<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-family:Consolas;color:#1F497D"><=
o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif">Regards,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif">Zan<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal">On Fri, Feb 26, 2021, at 8:10 AM, Zan Dobersek wrote=
:<o:p></o:p></p>
</div>
<blockquote style=3D"margin-top:5.0pt;margin-bottom:5.0pt" id=3D"qt">
<div>
<p class=3D"MsoNormal">On Wed, Feb 24, 2021, at 9:23 PM, Denys Dmytriyenko =
wrote:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; On Wed, Feb 24, 2021 at 06:57:57PM &#43;0000, G=
owtham Tammana via&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; lists.yoctoproject.org wrote:<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt;&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt;&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;-----Original Message-----<o:p></o:p><=
/p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;From:&nbsp;<a href=3D"mailto:meta-ti%4=
0lists.yoctoproject.org">meta-ti@lists.yoctoproject.org</a> &lt;<a href=3D"=
mailto:meta-ti%40lists.yoctoproject.org">meta-ti@lists.yoctoproject.org</a>=
&gt; On<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;Behalf Of Zan Dobersek<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;Sent: Wednesday, February 24, 2021 2:2=
5 AM<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;To:&nbsp;<a href=3D"mailto:meta-ti%40l=
ists.yoctoproject.org">meta-ti@lists.yoctoproject.org</a><o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;Subject: [EXTERNAL] [meta-ti] [PATCH] =
ti-sgx-ddk-km: properly handle arm-<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;poky-linux-gnueabi compiler prefix<o:p=
></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;The additional patch for ti-sgx-ddk-km=
 remaps the arm-oe-linux-gnueabi<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;prefix<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;to the arm-linux-gnueabihf preferred t=
arget. Same should be done for the<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;arm-poky-linux-gnueabi prefix.<o:p></o=
:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt;&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; This looks ok. Btw what layer is being use=
d when using this toolchain.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt;&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; Gowtham,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt;&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; This toolchain is built by Poky, which is the r=
eference distribution of the&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; Yocto Project.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt;<span style=3D"color:#1F497D"><o:p>&nbsp;</o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin-right:.5in"><span style=3D"font-fami=
ly:Consolas;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-right:1.0in"><span style=3D"font-fam=
ily:Consolas;color:#1F497D">Reviewed-by: Gowtham Tammana
<a href=3D"mailto:g-tammana@ti.com">g-tammana@ti.com</a><o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"margin-right:1.0in"><span style=3D"font-fam=
ily:Consolas;color:#1F497D"><o:p>&nbsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal">That's right.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">FWIW the patch should be applicable to both dunfell =
and master branches.<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Regards,<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">Zan<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; --&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; Denys<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt;&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt;&nbsp;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;Signed-off-by: Zan Dobersek &lt;<a hre=
f=3D"mailto:zan%40falconsigh.net">zan@falconsigh.net</a>&gt;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;---<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt; ...1-km-support-OpenEmbedded-hardfp-t=
oolchain-w-o-gnueabi.patch | 2 &#43;-<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt; 1 file changed, 1 insertion(&#43;), 1=
 deletion(-)<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;diff --git a/recipes-bsp/powervr-drive=
rs/ti-sgx-ddk-km/0001-km-support-<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;OpenEmbedded-hardfp-toolchain-w-o-gnue=
abi.patch b/recipes-bsp/powervr-<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;drivers/ti-sgx-ddk-km/0001-km-support-=
OpenEmbedded-hardfp-toolchain-w-o-<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;gnueabi.patch<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;index 071ce0ca..15105eac 100644<o:p></=
o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;--- a/recipes-bsp/powervr-drivers/ti-s=
gx-ddk-km/0001-km-support-<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;OpenEmbedded-hardfp-toolchain-w-o-gnue=
abi.patch<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;&#43;&#43;&#43; b/recipes-bsp/powervr-=
drivers/ti-sgx-ddk-km/0001-km-support-<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;OpenEmbedded-hardfp-toolchain-w-o-gnue=
abi.patch<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;@@ -17,7 &#43;17,7 @@ index dead2f9..2=
ba3e5e 100644<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; ifneq ($$(filter aa=
rch64-%,$$($(1)_compiler_preferred_target)),)<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; $(1)_compiler=
_preferred_target :=3D aarch64-linux-gnu<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; endif<o:p></o:p></p=
>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;-&#43;&nbsp; ifneq ($$(filter arm-%-gn=
ueabihf arm-oe-linux-<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;gnueabi,$$($(1)_compiler_preferred_tar=
get)),)<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;&#43;&#43;&nbsp; ifneq ($$(filter arm-=
%-gnueabihf arm-oe-linux-gnueabi arm-poky-linux-<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;gnueabi,$$($(1)_compiler_preferred_tar=
get)),)<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt; &#43;&nbsp;&nbsp; $(1)_compiler_prefe=
rred_target :=3D arm-linux-gnueabihf<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt; &#43;&nbsp; endif<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;&nbsp;&nbsp;&nbsp; ifneq ($$(filter ar=
m-%-gnueabi armv7a-cros-linux-gnueabi armv7hl-<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;redhat-linux-gnueabi,$$($(1)_compiler_=
preferred_target)),)<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;--<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt; &gt; &gt;2.30.0<o:p></o:p></p>
</div>
<div>
<p class=3D"MsoNormal">&gt;<o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
<div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</blockquote>
<div>
<p class=3D"MsoNormal"><span style=3D"font-family:&quot;Arial&quot;,sans-se=
rif"><o:p>&nbsp;</o:p></span></p>
</div>
</div>
</div>
</body>
</html>

--_000_290f014d90634c91953745ca4e4ff995ticom_--
