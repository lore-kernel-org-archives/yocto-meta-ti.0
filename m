Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.13034.1576532921984865239
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Dec 2019 13:48:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=N4Cr/STi;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: dmurphy@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 900CEE01256; Mon, 16 Dec 2019 13:48:41 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D486E01156
	for <meta-ti@yoctoproject.org>; Mon, 16 Dec 2019 13:48:40 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBGLmdEE025990
	for <meta-ti@yoctoproject.org>; Mon, 16 Dec 2019 15:48:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576532919;
	bh=oD19o/S5Fu2hUyR4S6Cz9kxM1Jb1GYPuwnivL9OIaAg=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=N4Cr/STi1nkTvdn8OOBo6rYUXxQmnPIe5YkGcXFa1lzua8IR295kSnj+XqsLse6Xu
	 6vHavr1t8FN3uPhLUfvRJXeWcHwJqA937HFHFf5v2TuN9Kld6Kjnd4mw0m2UGHx8dr
	 CLNDkB1+QcJ9yrdGE7nJneOA/vqanjDgtdHZco7o=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBGLmdgM014696
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 16 Dec 2019 15:48:39 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 16
 Dec 2019 15:48:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 16 Dec 2019 15:48:39 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBGLmdh4077228;
	Mon, 16 Dec 2019 15:48:39 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] linux-ti-staging: update to ti2019.06-rc1
Date: Mon, 16 Dec 2019 15:46:13 -0600
Message-ID: <20191216214613.7286-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191216214613.7286-1-dmurphy@ti.com>
References: <20191216214613.7286-1-dmurphy@ti.com>
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
index 8b0c692a..201e7f5c 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-4.19:"
=20
 BRANCH =3D "ti-rt-linux-4.19.y"
=20
-SRCREV =3D "38ae13e6914beeeff5565d02d3ba1843fa647497"
-PV =3D "4.19.79+git${SRCPV}"
+SRCREV =3D "f9b2abe6fa91456aa50a3ee0410db928455f98e0"
+PV =3D "4.19.82+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kern=
el/linux/linux-ti-staging_4.19.bb
index 32d4b494..9bc91b4e 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
@@ -60,8 +60,8 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH =3D "ti-linux-4.19.y"
=20
-SRCREV =3D "fbf2b6dfdbcc821cd5f80fd32712515e4a6720d6"
-PV =3D "4.19.79+git${SRCPV}"
+SRCREV =3D "463f203402da06d989567cf6c2b44bf796dfe57f"
+PV =3D "4.19.82+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
 MACHINE_KERNEL_PR_append =3D "a"
--=20
2.23.0

