Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A8FDC6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 16:50:58 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.17561.1678985451519829118
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 16 Mar 2023 09:50:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=urHieWAI;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 32GGolPE012519;
	Thu, 16 Mar 2023 11:50:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1678985447;
	bh=Z17bqP7R3QwkppPxKbO0NWY23bNaZoP5R4i4k47DtKw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=urHieWAIo4Jc5nPJhyg/hQNtdF9lH/SPXsS/+cvxpT/BY25BU7r0FJI15OZbSpIQ2
	 p6OJXkquQ4LJFWATAjFU7tuVS8ZGhFn8pQNdd/bLuuyma6EnJ4sgkEh3gA7T0AGT8W
	 24ZOu/VwAnds5uGnK1EXJR7GfBmc/mw+z5ud6n8s=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 32GGol3m004666
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Mar 2023 11:50:47 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Thu, 16
 Mar 2023 11:50:46 -0500
Received: from DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334]) by
 DLEE108.ent.ti.com ([fe80::922:4dc:27cc:b334%17]) with mapi id
 15.01.2507.016; Thu, 16 Mar 2023 11:50:46 -0500
From: "Sapp, Randolph" <rs@ti.com>
To: Danny <dadleyy@gmail.com>, Denys Dmytriyenko <denis@denix.org>
CC: "Eatmon, Ryan" <reatmon@ti.com>,
        "danny@sizethreestudios.com"
	<danny@sizethreestudios.com>,
        "meta-ti@lists.yoctoproject.org"
	<meta-ti@lists.yoctoproject.org>
Subject: Re: [EXTERNAL] Re: [meta-ti] [kirkstone] mesa compilation failures
 when setting PREFERRED_PROVIDER for virtual/gpudriver = "ti-sgx-ddk-km"
Thread-Topic: [EXTERNAL] Re: [meta-ti] [kirkstone] mesa compilation failures
 when setting PREFERRED_PROVIDER for virtual/gpudriver = "ti-sgx-ddk-km"
Thread-Index: AQHZWB7h9R9dMrikQFKZwgLrO+5FQ6797FeAgAABq4CAAAJegP//rHHc
Date: Thu, 16 Mar 2023 16:50:46 +0000
Message-ID: <566c9789f1884b42bb971ca3e32e1272@ti.com>
References: <mail.64133faf.3771.17352b0439bf0805@storage.wm.amazon.com>
 <01000186eb30c93b-a7c4db25-4de8-4324-a052-ad225c14fdc9-000000@email.amazonses.com>
 <c77d1089-21ee-7054-7a5f-ee9934828d39@ti.com>
 <20230316163445.GC18050@denix.org>,<CADEQF5H-7MLBBms9FR-=PtBqHKmMOhrVpzgXftPPR8OdJ9iB3A@mail.gmail.com>
In-Reply-To: <CADEQF5H-7MLBBms9FR-=PtBqHKmMOhrVpzgXftPPR8OdJ9iB3A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.248.242.15]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="_000_566c9789f1884b42bb971ca3e32e1272ticom_"
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 16 Mar 2023 16:50:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15992

--_000_566c9789f1884b42bb971ca3e32e1272ticom_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Yeah,


In hindsight we should have started with no graphics recipes (software rend=
ering) and slowly incorporated drivers as they are verified on this new bra=
nch. Would have been clearer what we were doing and prevent any suggestions=
 of feature regression in the utilities themselves, but unfortunately I onl=
y came into this situation after the decision to clone everything was made.


I'm still working on fixing SGX and hopefully with the way I'm integrating =
it, we can cut down on future maintenance delays in the future. Unfortunate=
ly that means a little more upfront delay with hints in the layers incorrec=
tly informing people that the driver is still operational. Sorry about that=
.


Regards,

Randolph Sapp

--_000_566c9789f1884b42bb971ca3e32e1272ticom_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p>Yeah,</p>
<p><br>
</p>
<p>In hindsight we should have started with no graphics recipes (software r=
endering) and slowly incorporated drivers as they are verified on this new =
branch. Would have been clearer what we were doing and prevent any suggesti=
ons of feature regression in the
 utilities themselves, but unfortunately I only came into this situation af=
ter the decision to clone everything was made.</p>
<p><br>
</p>
<p>I'm still working on fixing SGX and hopefully with the way I'm integrati=
ng it, we can cut down on future maintenance delays in the future. Unfortun=
ately that means a little more upfront delay with hints in the layers incor=
rectly informing people that the
 driver is still operational. Sorry about that.</p>
<p><br>
</p>
<p>Regards,</p>
<p>Randolph Sapp<br>
</p>
</div>
</body>
</html>

--_000_566c9789f1884b42bb971ca3e32e1272ticom_--

