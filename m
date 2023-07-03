Return-Path: <nsaulnier@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35A0C001DD
	for <webhook@archiver.kernel.org>; Mon,  3 Jul 2023 19:53:53 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.42901.1688414029255736937
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 03 Jul 2023 12:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=bqWHg3jU;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nsaulnier@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 363Jrm1c122644
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Jul 2023 14:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688414028;
	bh=6vjJxjdiIUz/3892adxWpm85+ynPnm6utsOEiPEmXXc=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=bqWHg3jUrRXtMV/dgTTd1chvLX24CR9cTpg+SXWOeMFcnfwx9TO1wL9vQ/4S3xQAF
	 CfbnWup6b3ljHuN6K2fXI4rxvgsF/J2FYeywetWM4Ur9Cl2ORTigyb7N1Eww9SMOuu
	 JQHdczTzOOdxzq6DZbB26Nl53UT1mAoIsJobyqRQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 363JrmiA037470
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 3 Jul 2023 14:53:48 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 3
 Jul 2023 14:53:47 -0500
Received: from DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4]) by
 DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4%18]) with mapi id
 15.01.2507.023; Mon, 3 Jul 2023 14:53:47 -0500
From: "Saulnier, Nick" <nsaulnier@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>, "Eatmon, Ryan" <reatmon@ti.com>,
        "Nagalla, Hari" <hnagalla@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: RE: [kirkstone/master PATCH] pru-icss_git.bb: update to PSSP v6.2.0
Thread-Topic: [kirkstone/master PATCH] pru-icss_git.bb: update to PSSP v6.2.0
Thread-Index: AQHZrd5Y8tpUjIj8d06Lgl+YNeqkkq+odGAQ
Date: Mon, 3 Jul 2023 19:53:47 +0000
Message-ID: <3ba47486f2854243a0e7a5938658e278@ti.com>
References: <20230703184405.2603-1-praneeth@ti.com>
In-Reply-To: <20230703184405.2603-1-praneeth@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.30.165]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 03 Jul 2023 19:53:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16810

Looks good, thanks Praneeth!

-----Original Message-----
From: Bajjuri, Praneeth=20
Sent: Monday, July 03, 2023 1:44 PM
To: Bajjuri, Praneeth <praneeth@ti.com>; Eatmon, Ryan <reatmon@ti.com>; Sau=
lnier, Nick <nsaulnier@ti.com>; Nagalla, Hari <hnagalla@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: [kirkstone/master PATCH] pru-icss_git.bb: update to PSSP v6.2.0

From: Praneeth Bajjuri <praneeth@ti.com>

Upgrade to v6.2.0 version.
This release supports Linux kernel 6.1.
The RPMsg library in previous versions of the PSSP will not work with the P=
RU RPMsg drivers in Linux kernel 6.1.

Other changes in this version:
 * Bug fixes:
     - Getting Started Labs, fix "zero" command clearing too many bytes
     - Include files, add a missing parentheses to pru_cfg, pru_ctrl, pru_e=
cap
 * Update ReadMe files to point to the latest URLs

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extra=
s/recipes-bsp/pru/pru-icss_git.bb
index 3b0805d9..66fd8000 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -8,10 +8,10 @@ inherit update-alternatives
=20
 BRANCH =3D "master"
 SRC_URI =3D "git://git.ti.com/git/pru-software-support-package/pru-softwar=
e-support-package.git;protocol=3Dhttps;branch=3D${BRANCH}"
-SRCREV =3D "ae1decf0b494b2904e6157e1379691ffc468f0cf"
+SRCREV =3D "cde50f7d16f04ab8dc3510a3f22d3750b1037978"
=20
-PV =3D "6.1.0"
-PR =3D "r0"
+PV =3D "6.2.0"
+PR =3D "r1"
=20
 require recipes-ti/includes/ti-paths.inc
=20
--
2.17.1


