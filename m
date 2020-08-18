Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.73532.1597778245251853038
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2020 12:17:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=dcs4j/SE;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: dmurphy@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC81DE0203E; Tue, 18 Aug 2020 12:17:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3A500E0200A
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 12:17:23 -0700 (PDT)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07IJHNHE031401
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 14:17:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1597778243;
	bh=MOQC5/c7f63VgY3X7H9+Kn2qszGSMoDI7IBYpf64MIs=;
	h=From:To:CC:Subject:Date;
	b=dcs4j/SETeSsb7i42Gqu4Q7xs+kUoq69AB1xoLE+PnahhiEeX0OdXYDE7HQeUNQgO
	 r5MeRx4BJkFF5on16awJyZpI/BWPWBKwbVhK0Mo+D3gawqJeBRGtwteWzYoZpj3lg0
	 LPpuZfCnFZOsJ6+L7hg8utTblWclbCZBdddMeHbk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07IJHN3E094724
	for <meta-ti@yoctoproject.org>; Tue, 18 Aug 2020 14:17:23 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 18
 Aug 2020 14:17:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 18 Aug 2020 14:17:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07IJHMGk008554;
	Tue, 18 Aug 2020 14:17:22 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <nikhil.nd@ti.com>, <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] linux-ti-staging: Update to the latest 5.4.58 stable release
Date: Tue, 18 Aug 2020 14:17:16 -0500
Message-ID: <20200818191716.4949-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-ke=
rnel/linux/linux-ti-staging-rt_5.4.bb
index dd9a25314e3d..4a914864f493 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
=20
 BRANCH =3D "ti-rt-linux-5.4.y"
=20
-SRCREV =3D "d45c3cc47d88fe530821141e20b2683acf3cd5f1"
-PV =3D "5.4.54+git${SRCPV}"
+SRCREV =3D "880e291bb8727a258e8f86a43ebebbdf946fe0c3"
+PV =3D "5.4.58+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kerne=
l/linux/linux-ti-staging_5.4.bb
index cf1ecc6e423f..3a4fdd867f36 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -61,8 +61,8 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH =3D "ti-linux-5.4.y"
=20
-SRCREV =3D "a32d62437eb9f2acd64a124c221de98d6f728bcc"
-PV =3D "5.4.54+git${SRCPV}"
+SRCREV =3D "da26e63e96f403b7415fdf7e0b45eeaba63ddbe0"
+PV =3D "5.4.58+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
 MACHINE_KERNEL_PR_append =3D "a"
--=20
2.28.0

