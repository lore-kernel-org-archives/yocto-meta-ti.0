Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.1536.1578600458699951897
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Jan 2020 12:07:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=zJJaV6x3;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: dmurphy@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 37700E014DE; Thu,  9 Jan 2020 12:07:38 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/,
	*      medium trust
	*      [198.47.19.141 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9CCB9E01426
	for <meta-ti@yoctoproject.org>; Thu,  9 Jan 2020 12:07:36 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 009K7aEX090503
	for <meta-ti@yoctoproject.org>; Thu, 9 Jan 2020 14:07:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578600456;
	bh=tk0z8NPuSJccT5PIsPnB3qDQ2CPfRmLS8U/yb1NFJCE=;
	h=From:To:CC:Subject:Date;
	b=zJJaV6x3QecXSznJAsoYFio/q0tLfB++0bDoX7fb9al/pO6lTgovgf6nQaZcR05Pu
	 jSllytCZ4u2Bz3kQbQF2EGuTZ8PRrSMz7rdWJh5laobgQdExirC7WE0kI4YkJ5GTDO
	 ixSOrig1B4h6TsL3jpj0kPapPuLC5TTaKvQ7sEp8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 009K7aDs041891
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 9 Jan 2020 14:07:36 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 9 Jan
 2020 14:07:36 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 9 Jan 2020 14:07:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 009K7ZUt018260;
	Thu, 9 Jan 2020 14:07:36 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] linux-ti-staging: update to ti2019.06-rc3
Date: Thu, 9 Jan 2020 14:04:44 -0600
Message-ID: <20200109200444.30531-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.19.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_4.19.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb b/recipes-k=
ernel/linux/linux-ti-staging-rt_4.19.bb
index 91fe00b8..e6c4d9d6 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-4.19:"
=20
 BRANCH =3D "ti-rt-linux-4.19.y"
=20
-SRCREV =3D "4a1d8698636cf4c7b4bcac5ff2e13ff0df8b74e0"
-PV =3D "4.19.82+git${SRCPV}"
+SRCREV =3D "20817c0fe0125f641fa4529f0f6d12178d07fa09"
+PV =3D "4.19.90+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kern=
el/linux/linux-ti-staging_4.19.bb
index 2491365f..fffe91a2 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
@@ -60,8 +60,8 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH =3D "ti-linux-4.19.y"
=20
-SRCREV =3D "3f7e6b12d9a8dc3eebd65254a478501938fdf93e"
-PV =3D "4.19.82+git${SRCPV}"
+SRCREV =3D "ced3bea42c328cfc1ac0c0fc6e6a317e16263bcf"
+PV =3D "4.19.90+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
 MACHINE_KERNEL_PR_append =3D "a"
--=20
2.23.0

