Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.49688.1617588806213465467
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 04 Apr 2021 19:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=d4/grajb;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1352DMS4000601;
	Sun, 4 Apr 2021 21:13:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1617588802;
	bh=gx1KgtqU4dVwp20/em3l2ZwNRdMkalxL5Y1mpzYW60M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=d4/grajb2pobozjdx54VB3H1WKhC8z2XdorGO2f3jWHpCwj02Yj9fjfxXT3BmWJvO
	 e7pMVO/hFDAUaiK9gYTCGvU8J8u4wKw+ENE49EDCFZKvEoRFKbOyIBnDaerYL94s3B
	 lZdLCm2d+m5xc3zht2V9VFqd5c2n1pDQZZfplnTo=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1352DMVv096452
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 4 Apr 2021 21:13:22 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Sun, 4 Apr
 2021 21:13:22 -0500
Received: from DLEE110.ent.ti.com ([fe80::546b:3e96:e947:ccce]) by
 DLEE110.ent.ti.com ([fe80::546b:3e96:e947:ccce%20]) with mapi id
 15.01.2176.009; Sun, 4 Apr 2021 21:13:21 -0500
From: "praneeth" <praneeth@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] [dunfell/master][PATCH] common-csl-ip-rtos: drop unnecessary dependency on ti-sysbios
Thread-Topic: [meta-ti] [dunfell/master][PATCH] common-csl-ip-rtos: drop
 unnecessary dependency on ti-sysbios
Thread-Index: AQHXF8SxazBnB3CsK0OOmh39SWGaKKqig9yAgALPGzo=
Date: Mon, 5 Apr 2021 02:13:21 +0000
Message-ID: <94a8bc2c-ec4d-4c3b-a8a3-62d2472e1083@email.android.com>
References: <1615611147-28437-1-git-send-email-denis@denix.org>,<20210403021935.GZ23013@denix.org>
In-Reply-To: <20210403021935.GZ23013@denix.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_94a8bc2cec4d4c3ba8a362d2472e1083emailandroidcom_"

--_000_94a8bc2cec4d4c3ba8a362d2472e1083emailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Looks good to me. Will take care of integration tomorrow.

On Apr 2, 2021 9:19 PM, Denys Dmytriyenko <denis@denix.org> wrote:
I see this hasn't been merged, nor got any comments. W/o patchwork access I
won't be able to keep track of all the patches sent and applied...


On Fri, Mar 12, 2021 at 11:52:27PM -0500, Denys Dmytriyenko wrote:
> It appears common-csl-ip-rtos does not require ti-sysbios dependency to b=
uild,
> but ti-pdk.bbclass adds it by default. While most of PDK-based components=
 do
> require ti-sysbios to be built from sources, it is safe to remove it from=
 CSL,
> reducing the dependency tree for special cases like PRU FW based on CSL, =
but
> not needing ti-sysbios.
>
> This only affects firmwares built from sources against PDK and CSL, not w=
hen
> RTOS firmwares are delivered in binary form for newer K3 platforms.
>
> Build-tested on am335x, am57xx, k2g and am65xx.
>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/recipe=
s-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> index 98b2d13..6479d9f 100644
> --- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> +++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb
> @@ -7,6 +7,7 @@ COMPATIBLE_MACHINE_append =3D "|c66x|k3"
>  inherit ti-pdk
>
>  DEPENDS_remove =3D "${PN}"
> +DEPENDS_remove =3D "ti-sysbios"
>
>  # Build with make instead of XDC
>  TI_PDK_XDCMAKE =3D "0"
> --
> 2.7.4
>

--
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

--_000_94a8bc2cec4d4c3ba8a362d2472e1083emailandroidcom_
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
<div dir=3D"auto">Looks good to me. Will take care of integration tomorrow.=
&nbsp;</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">On Apr 2, 2021 9:19 PM, Denys Dmytriyenko &lt;=
denis@denix.org&gt; wrote:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">I see this hasn't been merged, nor got any comment=
s. W/o patchwork access I
<br>
won't be able to keep track of all the patches sent and applied...<br>
<br>
<br>
On Fri, Mar 12, 2021 at 11:52:27PM -0500, Denys Dmytriyenko wrote:<br>
&gt; It appears common-csl-ip-rtos does not require ti-sysbios dependency t=
o build,<br>
&gt; but ti-pdk.bbclass adds it by default. While most of PDK-based compone=
nts do<br>
&gt; require ti-sysbios to be built from sources, it is safe to remove it f=
rom CSL,<br>
&gt; reducing the dependency tree for special cases like PRU FW based on CS=
L, but<br>
&gt; not needing ti-sysbios.<br>
&gt; <br>
&gt; This only affects firmwares built from sources against PDK and CSL, no=
t when<br>
&gt; RTOS firmwares are delivered in binary form for newer K3 platforms.<br=
>
&gt; <br>
&gt; Build-tested on am335x, am57xx, k2g and am65xx.<br>
&gt; <br>
&gt; Signed-off-by: Denys Dmytriyenko &lt;denis@denix.org&gt;<br>
&gt; ---<br>
&gt;&nbsp; recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb | 1 &#43;<br=
>
&gt;&nbsp; 1 file changed, 1 insertion(&#43;)<br>
&gt; <br>
&gt; diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb b/rec=
ipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb<br>
&gt; index 98b2d13..6479d9f 100644<br>
&gt; --- a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb<br>
&gt; &#43;&#43;&#43; b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bb<=
br>
&gt; @@ -7,6 &#43;7,7 @@ COMPATIBLE_MACHINE_append =3D &quot;|c66x|k3&quot;=
<br>
&gt;&nbsp; inherit ti-pdk<br>
&gt;&nbsp; <br>
&gt;&nbsp; DEPENDS_remove =3D &quot;${PN}&quot;<br>
&gt; &#43;DEPENDS_remove =3D &quot;ti-sysbios&quot;<br>
&gt;&nbsp; <br>
&gt;&nbsp; # Build with make instead of XDC<br>
&gt;&nbsp; TI_PDK_XDCMAKE =3D &quot;0&quot;<br>
&gt; -- <br>
&gt; 2.7.4<br>
&gt; <br>
<br>
-- <br>
Regards,<br>
Denys Dmytriyenko &lt;denis@denix.org&gt;<br>
PGP: 0x420902729A92C964 - <a href=3D"https://denix.org/0x420902729A92C964">=
https://denix.org/0x420902729A92C964</a><br>
Fingerprint: 25FC E4A5 8A72 2F69 1186&nbsp; 6D76 4209 0272 9A92 C964<br>
</div>
</span></font>
</body>
</html>

--_000_94a8bc2cec4d4c3ba8a362d2472e1083emailandroidcom_--
