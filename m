Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.8297.1616733866505157707
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Mar 2021 21:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Zbaq12Fu;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12Q4iLe9032467;
	Thu, 25 Mar 2021 23:44:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616733861;
	bh=Gu/PbiYLALSx/Mt2Df1eu28UkzJAVbY3oyhMZZ+Sveg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=Zbaq12FuRh0OBuMY6Hg60Z2Mu5yAVH/TwM4c9xX/PYrZjraqMQOgXn/RjsDYz6xtq
	 YGUMso6Kk2W3MEhOERLM7tS67tKNZJEf52aPSQqhsNqc+DX5BfmTBPGeAjrFBJN5Kx
	 t+mNwWjq0h71RYoDv1+2CEr0GGU/M3CMcqYlPf14=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12Q4iL87063615
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Mar 2021 23:44:21 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 25
 Mar 2021 23:44:21 -0500
Received: from DLEE110.ent.ti.com ([fe80::546b:3e96:e947:ccce]) by
 DLEE110.ent.ti.com ([fe80::546b:3e96:e947:ccce%20]) with mapi id
 15.01.2176.009; Thu, 25 Mar 2021 23:44:21 -0500
From: "praneeth" <praneeth@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "Menon, Nishanth" <nm@ti.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>,
        "denys@konsulko.com" <denys@konsulko.com>
Subject: Re: [meta-ti] [dunfell/master PATCH v2] trusted-firmware-a: am64xx: fix target board name
Thread-Topic: [meta-ti] [dunfell/master PATCH v2] trusted-firmware-a: am64xx:
 fix target board name
Thread-Index: AQHXIfGq9nLo8eSGbk2Uly/weoWAtKqV+A2A//+5bwQ=
Date: Fri, 26 Mar 2021 04:44:21 +0000
Message-ID: <8b436673-31cb-4e88-bda8-acc7ff4c14bd@email.android.com>
References: <20210326033945.15324-1-praneeth@ti.com>,<20210326035655.GU18041@denix.org>
In-Reply-To: <20210326035655.GU18041@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_8b43667331cb4e88bda8acc7ff4c14bdemailandroidcom_"

--_000_8b43667331cb4e88bda8acc7ff4c14bdemailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks for quick review,

Didn't see the other location.

On Mar 25, 2021 10:57 PM, Denys Dmytriyenko <denis@denix.org> wrote:
NAK.

https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/machine/includ=
e/am64xx.inc#n13


On Thu, Mar 25, 2021 at 10:39:45PM -0500, praneeth via lists.yoctoproject.o=
rg wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
>
> am64xx is the first generation of k3 device that uses
> a updated board defintion as "lite" platform.[1]
>
> This patch fixes the TFA board to appropriate target as
> "lite" instead of "generic" for am64xx.
>
> [1]: https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?=
id=3D84af89563e1b17def844d3672bc601ae51f0257f
>
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>  conf/machine/include/k3.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc
> index c727d724..a96ebb76 100644
> --- a/conf/machine/include/k3.inc
> +++ b/conf/machine/include/k3.inc
> @@ -28,6 +28,7 @@ EXTRA_IMAGEDEPENDS +=3D "virtual/bootloader"
>
>  TFA_PLATFORM =3D "k3"
>  TFA_BOARD =3D "generic"
> +TFA_BOARD_am64xx =3D "lite"
>
>  MACHINE_GUI_CLASS =3D "smallscreen"
>
> --
> 2.17.1

--_000_8b43667331cb4e88bda8acc7ff4c14bdemailandroidcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto">Thanks for quick review,
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Didn't see the other location.</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">On Mar 25, 2021 10:57 PM, Denys Dmytriyenko &l=
t;denis@denix.org&gt; wrote:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">NAK.<br>
<br>
<a href=3D"https://git.yoctoproject.org/cgit/cgit.cgi/meta-ti/tree/conf/mac=
hine/include/am64xx.inc#n13">https://git.yoctoproject.org/cgit/cgit.cgi/met=
a-ti/tree/conf/machine/include/am64xx.inc#n13</a><br>
<br>
<br>
On Thu, Mar 25, 2021 at 10:39:45PM -0500, praneeth via lists.yoctoproject.o=
rg wrote:<br>
&gt; From: Praneeth Bajjuri &lt;praneeth@ti.com&gt;<br>
&gt; <br>
&gt; am64xx is the first generation of k3 device that uses<br>
&gt; a updated board defintion as &quot;lite&quot; platform.[1]<br>
&gt; <br>
&gt; This patch fixes the TFA board to appropriate target as<br>
&gt; &quot;lite&quot; instead of &quot;generic&quot; for am64xx.<br>
&gt; <br>
&gt; [1]: <a href=3D"https://git.trustedfirmware.org/TF-A/trusted-firmware-=
a.git/commit/?id=3D84af89563e1b17def844d3672bc601ae51f0257f">
https://git.trustedfirmware.org/TF-A/trusted-firmware-a.git/commit/?id=3D84=
af89563e1b17def844d3672bc601ae51f0257f</a><br>
&gt; <br>
&gt; Signed-off-by: Praneeth Bajjuri &lt;praneeth@ti.com&gt;<br>
&gt; ---<br>
&gt;&nbsp; conf/machine/include/k3.inc | 1 &#43;<br>
&gt;&nbsp; 1 file changed, 1 insertion(&#43;)<br>
&gt; <br>
&gt; diff --git a/conf/machine/include/k3.inc b/conf/machine/include/k3.inc=
<br>
&gt; index c727d724..a96ebb76 100644<br>
&gt; --- a/conf/machine/include/k3.inc<br>
&gt; &#43;&#43;&#43; b/conf/machine/include/k3.inc<br>
&gt; @@ -28,6 &#43;28,7 @@ EXTRA_IMAGEDEPENDS &#43;=3D &quot;virtual/bootlo=
ader&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; TFA_PLATFORM =3D &quot;k3&quot;<br>
&gt;&nbsp; TFA_BOARD =3D &quot;generic&quot;<br>
&gt; &#43;TFA_BOARD_am64xx =3D &quot;lite&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; MACHINE_GUI_CLASS =3D &quot;smallscreen&quot;<br>
&gt;&nbsp; <br>
&gt; -- <br>
&gt; 2.17.1<br>
</div>
</span></font>
</body>
</html>

--_000_8b43667331cb4e88bda8acc7ff4c14bdemailandroidcom_--
