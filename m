Return-Path: <nsaulnier@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9B1EB64DA
	for <webhook@archiver.kernel.org>; Wed,  5 Jul 2023 21:09:15 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.6731.1688591347768834481
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 05 Jul 2023 14:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uYDd8KsC;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nsaulnier@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 365L96I4103664
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Jul 2023 16:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1688591346;
	bh=P3dMXygIJz7SDvX027KQH70FzOeo66CDckMuuQgFzPw=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=uYDd8KsC1/h1nQzhi+sok9NdEPk24C9DTbWDzIFwYyQ4Xx1Gquq8WjHUfPzwcYKYn
	 nVlkLG3+9whGlyrXlFUfvzMsjBt5v6EsueDB6BsAne7IAxSBMTNySMy9x3mq22WZcx
	 syBMXg1qOZ6HYXC2TxT07Q5VtAJ0eOn84ZsWkEzY=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 365L96D1083920
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Wed, 5 Jul 2023 16:09:06 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Jul 2023 16:09:06 -0500
Received: from DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4]) by
 DFLE115.ent.ti.com ([fe80::4af:9649:4629:5ff4%18]) with mapi id
 15.01.2507.023; Wed, 5 Jul 2023 16:09:06 -0500
From: "Saulnier, Nick" <nsaulnier@ti.com>
To: "Bajjuri, Praneeth" <praneeth@ti.com>, "Eatmon, Ryan" <reatmon@ti.com>,
        "Nagalla, Hari" <hnagalla@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: RE: [kirkstone PATCH v2] pru-icss_git.bb: update to PSSP v6.2.0
Thread-Topic: [kirkstone PATCH v2] pru-icss_git.bb: update to PSSP v6.2.0
Thread-Index: AQHZr4SnUeQO4bR8eU2wabpPa4VzKK+rqp5A
Date: Wed, 5 Jul 2023 21:09:06 +0000
Message-ID: <fff7298dd43a43b4b7f9959952cf8474@ti.com>
References: <20230705210705.15757-1-praneeth@ti.com>
In-Reply-To: <20230705210705.15757-1-praneeth@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.247.22.53]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Jul 2023 21:09:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16816

No top-level build errors observed with the updated PSSP commits. Thanks Pr=
aneeth!
-Nick

-----Original Message-----
From: Bajjuri, Praneeth=20
Sent: Wednesday, July 05, 2023 4:07 PM
To: Bajjuri, Praneeth <praneeth@ti.com>; Eatmon, Ryan <reatmon@ti.com>; Sau=
lnier, Nick <nsaulnier@ti.com>; Nagalla, Hari <hnagalla@ti.com>
Cc: meta-ti@lists.yoctoproject.org
Subject: [kirkstone PATCH v2] pru-icss_git.bb: update to PSSP v6.2.0

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
v2: fixes build issue reported on 32b platforms

 meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb b/meta-ti-extra=
s/recipes-bsp/pru/pru-icss_git.bb
index 3b0805d9..e73e0e7e 100644
--- a/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
+++ b/meta-ti-extras/recipes-bsp/pru/pru-icss_git.bb
@@ -8,10 +8,10 @@ inherit update-alternatives
=20
 BRANCH =3D "master"
 SRC_URI =3D "git://git.ti.com/git/pru-software-support-package/pru-softwar=
e-support-package.git;protocol=3Dhttps;branch=3D${BRANCH}"
-SRCREV =3D "ae1decf0b494b2904e6157e1379691ffc468f0cf"
+SRCREV =3D "3d0e311580d8967d0854ca789e9069e2810e9c1a"
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


