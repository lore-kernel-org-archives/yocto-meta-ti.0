Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.8038.1608211950797689663
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 17 Dec 2020 05:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=SAtcu3fS;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 4310438C127B
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 13:32:30 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWTo5032994
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 07:32:29 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608211949;
	bh=+IApAPJuwbmd1EVePlPsW39VNYG+zfNvtE7reZ80E54=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SAtcu3fS/Ra1h3P52Tq5qn3ac/uc0YoakgrOV2WZT2HlAjJ750CK+/IHQwKdoL1Mr
	 Ratm2ssR+DXuPly7AbwXWhVPCqBJ51o7dJeIIT3FmEev/lFMbRbRTbkhzRbRycGhF9
	 i89xoiruhBlz3UsJZENWa2vv5hbD2bShIsY79HlU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHDWTUS124603
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 17 Dec 2020 07:32:29 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 17
 Dec 2020 07:32:29 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 17 Dec 2020 07:32:29 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHDWTH6091448;
	Thu, 17 Dec 2020 07:32:29 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: Dan Murphy <dmurphy@ti.com>
Subject: [dunfell/master] [PATCH v2 01/10] linux-ti-staging: Update kernel to latest commit sha
Date: Thu, 17 Dec 2020 07:32:19 -0600
Message-ID: <20201217133228.22886-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201217133228.22886-1-dmurphy@ti.com>
References: <20201217133228.22886-1-dmurphy@ti.com>
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
index 2f8fe2bfec9d..faa7f6d8226e 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
=20
 BRANCH =3D "ti-rt-linux-5.4.y"
=20
-SRCREV =3D "a59ca20fbcdc436be90ca38c199f9b640671fdb7"
-PV =3D "5.4.78+git${SRCPV}"
+SRCREV =3D "058c8ee4e4ae3ae72ca01b5b4b2aea8213561ab9"
+PV =3D "5.4.82+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kerne=
l/linux/linux-ti-staging_5.4.bb
index 8275988bb1a7..cd13d6e33e13 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -21,8 +21,8 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH =3D "ti-linux-5.4.y"
=20
-SRCREV =3D "7a5e2e57a39a097b4dde09bad8f72a2d31dc09c4"
-PV =3D "5.4.78+git${SRCPV}"
+SRCREV =3D "73039d258adb0cac813342cc7e746e22295765fe"
+PV =3D "5.4.82+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
 MACHINE_KERNEL_PR_append =3D "a"
--=20
2.29.2

