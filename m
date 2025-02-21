Return-Path: <jweyer@aecontrols.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A893C021B3
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 23:47:59 +0000 (UTC)
Received: from cloud-out-d.spamtitan.com (cloud-out-d.spamtitan.com [18.205.228.94])
 by mx.groups.io with SMTP id smtpd.web10.37054.1740181671741137055
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 15:47:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@aecontrols.com header.s=mail header.b=YTTSXCfQ;
 spf=pass (domain: aecontrols.com, ip: 18.205.228.94, mailfrom: jweyer@aecontrols.com)
Received: from cloud-out-d.spamtitan.com (localhost [127.0.0.1])
	by cloud-out-d.spamtitan.com (Postfix) with ESMTP id 0E5C326055C
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Feb 2025 23:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aecontrols.com;
	s=mail; t=1740181671;
	bh=OpXxw1zFnRkRWOg6MgZFSFRRzjlEjc5RGcSZ+3Kk474=;
	h=From:To:Subject:Date;
	b=YTTSXCfQuUn/ozddbJOah7NntBjD1VD3bTJ89JrrOIWJT1fbZub858RU5USCpn7fL
	 ubC4+vJ0H6vCtcFDuu+oZJ2BUiGxLQr7enxNwisW4xDdZl93a99IhFh2cILElAUlQu
	 A6ylVO2Nx7u/rfM6H0b+OJ7tjQesTe9HFMr8PQVwa3pvgn79dMNsVpXbO9dYuuMOfW
	 /LB2pnq1MoJsSugfBHYi1KFsuEOLsruKJ/OssSez8QygZZEahwgD/LLzCPdMdMmcI8
	 sx3THOaV3fDgcUi8z3snWvbKEr/cRl5JWlUEvXU2YhWTgFmcZ6QUUFzcmFut9TBMSt
	 /R7G7Id/J//Cw==
Received: from localhost (localhost [127.0.0.1])
	by cloud-out-d.spamtitan.com (Postfix) with ESMTP id 09663260409
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Feb 2025 23:47:51 +0000 (UTC)
X-Virus-Scanned: by SpamTitan at ec2.internal
Received: from cloud-out-d.spamtitan.com (localhost [127.0.0.1])
	by cloud-out-d.spamtitan.com (Postfix) with ESMTP id ABD4C26028D
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Feb 2025 23:47:49 +0000 (UTC)
Authentication-Results: cloud-out-d.spamtitan.com;
        x-trusted-ip=pass
Received: from mail.aecontrols.com (mail.aecontrols.com [50.248.202.241])
	by cloud-out-d.spamtitan.com (Postfix) with ESMTPS id 7D65C260204
	for <meta-ti@lists.yoctoproject.org>; Fri, 21 Feb 2025 23:47:49 +0000 (UTC)
Received: from AEC-Exchange.AEC.local (192.168.0.46) by AEC-Exchange.AEC.local
 (192.168.0.46) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 21 Feb
 2025 15:47:48 -0800
Received: from AEC-Exchange.AEC.local ([fe80::a53c:dc10:161f:ae5c]) by
 AEC-Exchange.AEC.local ([fe80::a53c:dc10:161f:ae5c%13]) with mapi id
 15.00.1497.048; Fri, 21 Feb 2025 15:47:48 -0800
From: Jared Weyer <jweyer@aecontrols.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Jailhouse invalid SRC_REV
Thread-Topic: Jailhouse invalid SRC_REV
Thread-Index: AduEuaUepcJtc8Q1SqKZZfaoGjFnpQ==
Date: Fri, 21 Feb 2025 23:47:47 +0000
Message-ID: <04a9fd4d741d4ca99d52a75677ab8114@AEC-Exchange.AEC.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
Content-Type: multipart/mixed;
	boundary="_006_04a9fd4d741d4ca99d52a75677ab8114AECExchangeAEClocal_"
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 21 Feb 2025 23:47:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18333

--_006_04a9fd4d741d4ca99d52a75677ab8114AECExchangeAEClocal_
Content-Type: multipart/related;
	boundary="_005_04a9fd4d741d4ca99d52a75677ab8114AECExchangeAEClocal_";
	type="multipart/alternative"

--_005_04a9fd4d741d4ca99d52a75677ab8114AECExchangeAEClocal_
Content-Type: multipart/alternative;
	boundary="_000_04a9fd4d741d4ca99d52a75677ab8114AECExchangeAEClocal_"

--_000_04a9fd4d741d4ca99d52a75677ab8114AECExchangeAEClocal_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



Jared Weyer | Engineer
[cid:image001.png@01DB8477.F3A0FBF0] Anderson Electric Controls, Inc.
8639 S. 212th Street Kent, WA USA 98031
Office Phone: 253-395-3003 ext. 110
Cell Phone: 253-886-2503
Website: https://www.aecontrols.com


--_000_04a9fd4d741d4ca99d52a75677ab8114AECExchangeAEClocal_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:11.0pt;}
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
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">Jared Weyer | Engin=
eer<br>
<img width=3D"16" height=3D"13" style=3D"width:.1666in;height:.1333in" id=
=3D"Picture_x0020_1" src=3D"cid:image001.png@01DB8477.F3A0FBF0">&nbsp;<b>An=
derson Electric Controls,&nbsp;Inc.</b><o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt">8639 S. 212th Stree=
t Kent, WA&nbsp;USA 98031<br>
Office Phone: 253-395-3003 ext.&nbsp;110<br>
Cell Phone: 253-886-2503<br>
Website:&nbsp;<a href=3D"https://www.aecontrols.com"><span style=3D"color:#=
0563C1">https://www.aecontrols.com</span></a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_04a9fd4d741d4ca99d52a75677ab8114AECExchangeAEClocal_--

--_005_04a9fd4d741d4ca99d52a75677ab8114AECExchangeAEClocal_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=474;
	creation-date="Fri, 21 Feb 2025 23:47:47 GMT";
	modification-date="Fri, 21 Feb 2025 23:47:47 GMT"
Content-ID: <image001.png@01DB8477.F3A0FBF0>
Content-Transfer-Encoding: base64

iVBORw0KGgoAAAANSUhEUgAAABAAAAANCAYAAACgu+4kAAAAAXNSR0IArs4c6QAAAAlwSFlzAAAO
xAAADsQBlSsOGwAAABl0RVh0U29mdHdhcmUATWljcm9zb2Z0IE9mZmljZX/tNXEAAAFaSURBVDhP
fZO/K4ZRFMevPHj93FgMFkIWExslEvXOMil/gbJ7epTVZFS216ZMBgn1DspkMMjgx8ImBvLb56tz
H6envKe+nXPvOed7v+c+90myLAvR0nQlIV4GfeAzT4RQR/wN1rNs9cLtBzV4G2SRgubCflzeEqzV
Ipip0ay+OVRuoOIxkuQKSNSzOQu+TG6sOSPYBqp9M+Qi/Ahd7F6DFyvS3MIhqFisQ1qs5pfEE0i+
7kBNUhFtnmDBFo34c9QuMsZTTsBGE4syGHGN/4W9JCbBjlfQz2LYdXxYrFPeLW4w+SX8eJFAJ/dY
4S5en6odTIM2G+sKfwBewXM8LLHbH7MizV5hvlMVkFvCTQE9ohug9/EAOshVqTvWJXaCCWO8w1cj
O/4I6G5kA+Dv2YawD8mJCEZBtxWp4d4R7FmTxiiaVA+JQF9g07JbyPKf8NIIdMn+31C5+lp/AIqY
ULdAHoW7AAAAAElFTkSuQmCC

--_005_04a9fd4d741d4ca99d52a75677ab8114AECExchangeAEClocal_--

--_006_04a9fd4d741d4ca99d52a75677ab8114AECExchangeAEClocal_
Content-Type: application/octet-stream;
	name="0001-fix-invalid-jailhouse-src-rev.patch"
Content-Description: 0001-fix-invalid-jailhouse-src-rev.patch
Content-Disposition: attachment;
	filename="0001-fix-invalid-jailhouse-src-rev.patch"; size=1000;
	creation-date="Fri, 21 Feb 2025 23:46:43 GMT";
	modification-date="Fri, 21 Feb 2025 22:32:52 GMT"
Content-Transfer-Encoding: base64

RnJvbSA3MjgwNWI4NTJhYjNlZjE0MzY5YmRiNjJlNzRiNTc2NjZhNmFhZGEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBqd2V5ZXIgPGp3ZXllckBhZWNvbnRyb2xzLmNvbT4KRGF0ZTog
RnJpLCAyMSBGZWIgMjAyNSAxNDozMjozNSAtMDgwMApTdWJqZWN0OiBbUEFUQ0hdIGZpeCBpbnZh
bGlkIGphaWxob3VzZSBzcmMgcmV2CgpTaWduZWQtb2ZmLWJ5OiBqd2V5ZXIgPGp3ZXllckBhZWNv
bnRyb2xzLmNvbT4KLS0tCiBtZXRhLXRpLWV4dHJhcy9yZWNpcGVzLXRpL2phaWxob3VzZS90aS1q
YWlsaG91c2UuaW5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbWV0YS10aS1leHRyYXMvcmVjaXBlcy10aS9qYWlsaG91
c2UvdGktamFpbGhvdXNlLmluYyBiL21ldGEtdGktZXh0cmFzL3JlY2lwZXMtdGkvamFpbGhvdXNl
L3RpLWphaWxob3VzZS5pbmMKaW5kZXggNjJhOTdkZjYuLmZkNDBkNzRkIDEwMDY0NAotLS0gYS9t
ZXRhLXRpLWV4dHJhcy9yZWNpcGVzLXRpL2phaWxob3VzZS90aS1qYWlsaG91c2UuaW5jCisrKyBi
L21ldGEtdGktZXh0cmFzL3JlY2lwZXMtdGkvamFpbGhvdXNlL3RpLWphaWxob3VzZS5pbmMKQEAg
LTE0LDcgKzE0LDcgQEAgTElDX0ZJTEVTX0NIS1NVTSA9ICIgXAogQ09NUEFUSUJMRV9NQUNISU5F
ID0gImFtNjJ4eHxhbTYycHh4fGFtNjJseHgiCiBUQVJHRVRfQ0NfQVJDSCArPSAiJHtMREZMQUdT
fSIKIFBWID0gIjAuMTIrZ2l0IgotU1JDUkVWID0gImRjNzdjMDU0NjBiYzNkZjhmMmRkYzljYzNh
OTk5MGNhMzFjYjlmOWQiCitTUkNSRVYgPSAiZWY1MTJmOTU5MWZlYmVkODU0ZDhmMDdhZDhjMWZh
NzMxYzJkM2M2OSIKIEJSQU5DSCA9ICJtYXN0ZXIiCiBTUkNfVVJJID0gIiBcCiAgICAgZ2l0Oi8v
Z2l0LnRpLmNvbS9naXQvamFpbGhvdXNlL3RpLWphaWxob3VzZS5naXQ7cHJvdG9jb2w9aHR0cHM7
YnJhbmNoPSR7QlJBTkNIfSBcCi0tIAoyLjI1LjEKCg==

--_006_04a9fd4d741d4ca99d52a75677ab8114AECExchangeAEClocal_--

