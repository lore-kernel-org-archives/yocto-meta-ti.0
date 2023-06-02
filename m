Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC753C77B7A
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 11:33:37 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.10149.1685705612600967194
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Jun 2023 04:33:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=OxyDFZpT;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: p-bhagat@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 352BXVhu064564
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Jun 2023 06:33:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1685705611;
	bh=bK7d9eAmmqzA4uhVoZk+yqF3TZCaU8giccWgTwoO3iI=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=OxyDFZpTQ9vR92ijtWUlz1IziclZ6icV7D6/E5/2zrWFILUAALRJUxjYi9eFtYdTg
	 TFf9GA2Y+ljaOTufeVDcClBFkE6G3ZkkbSEgkfiQA7tyIqgSWwUjnrZWOlUwd/qBnc
	 t7wiziER3yZNKRhGcxtQBBmMWQiyNSueBugG58jQ=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 352BXVRB002333
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 2 Jun 2023 06:33:31 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 2
 Jun 2023 06:33:31 -0500
Received: from DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9]) by
 DFLE110.ent.ti.com ([fe80::c545:bde0:ab70:bae9%19]) with mapi id
 15.01.2507.023; Fri, 2 Jun 2023 06:33:31 -0500
From: "Bhagat, Paresh" <p-bhagat@ti.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Eatmon, Ryan" <reatmon@ti.com>
CC: "Shilwant, Chirag" <c-shilwant@ti.com>,
        "Adivi, Sai Sree Kartheek"
	<s-adivi@ti.com>,
        "Khasim, Syed Mohammed" <khasim@ti.com>,
        "Gupta, Gyan"
	<g-gupta@ti.com>
Subject: RE: [EXTERNAL] [meta-ti] [kirkstone][PATCH] meta-ti-extras:
 recipes-ti: Update jailhouse SRC_URI to point to ti-jailhouse repo.
Thread-Topic: [EXTERNAL] [meta-ti] [kirkstone][PATCH] meta-ti-extras:
 recipes-ti: Update jailhouse SRC_URI to point to ti-jailhouse repo.
Thread-Index: AQHZlT9WTCRu7mt0eEiDnJw8kCcx4q93YELQ
Date: Fri, 2 Jun 2023 11:33:31 +0000
Message-ID: <8301749914b74d94a15ebd6391268839@ti.com>
References: <1764D1AE2D22CA7D.11185@lists.yoctoproject.org>
In-Reply-To: <1764D1AE2D22CA7D.11185@lists.yoctoproject.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.219.165]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 02 Jun 2023 11:33:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16656

This patch is not required for now and we can use upstream siemens/jailhous=
e repo and apply patches on top of that. don't merge please.=20

-----Original Message-----
From: meta-ti@lists.yoctoproject.org <meta-ti@lists.yoctoproject.org> On Be=
half Of Paresh Bhagat via lists.yoctoproject.org
Sent: Friday, June 2, 2023 4:15 PM
To: meta-ti@lists.yoctoproject.org; Bajjuri, Praneeth <praneeth@ti.com>; Ea=
tmon, Ryan <reatmon@ti.com>
Cc: Shilwant, Chirag <c-shilwant@ti.com>; Adivi, Sai Sree Kartheek <s-adivi=
@ti.com>; Khasim, Syed Mohammed <khasim@ti.com>; Gupta, Gyan <g-gupta@ti.co=
m>
Subject: [EXTERNAL] [meta-ti] [kirkstone][PATCH] meta-ti-extras: recipes-ti=
: Update jailhouse SRC_URI to point to ti-jailhouse repo.

The ti-jailhouse repo is synced with the Siemens/jailhouse at https://githu=
b.com/siemens/jailhouse. Use this for development and build for TI devices.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti=
-extras/recipes-ti/jailhouse/jailhouse_git.bb
index 05cc21b3..0b8b7802 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
@@ -17,7 +17,7 @@ SRCREV =3D "e57d1eff6d55aeed5f977fe4e2acfb6ccbdd7560"
 BRANCH =3D "master"
=20
 SRC_URI =3D " \
-    git://github.com/siemens/jailhouse.git;protocol=3Dhttps;branch=3D${BRA=
NCH} \
+   =20
+ git://git.ti.com/git/jailhouse/ti-jailhouse.git;protocol=3Dhttps;branch=
=3D
+ ${BRANCH} \
     file://0001-configs-arm64-k3-am625-sk-Add-crypto-memory-region.patch \
     file://0002-configs-arm64-k3-am625-sk-Switch-inmate-boot-console.patch=
 \
     file://0003-configs-arm64-k3-am625-sk-Add-VTM-memory-region.patch \
--
2.34.1


