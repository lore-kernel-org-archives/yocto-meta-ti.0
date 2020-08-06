Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.8186.1596725606412207754
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2020 07:53:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=Dp6G+elR;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: dmurphy@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F0BF9E01F17; Thu,  6 Aug 2020 07:53:25 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0A30E01EF0
	for <meta-ti@yoctoproject.org>; Thu,  6 Aug 2020 07:53:24 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 076ErO1Z091035
	for <meta-ti@yoctoproject.org>; Thu, 6 Aug 2020 09:53:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1596725604;
	bh=0kZLrFk6v8RTzL/uX42z8OYqgsZ+EAkKrRD04fsE2qM=;
	h=From:To:CC:Subject:Date;
	b=Dp6G+elRryKSeRuiLRind6Xfn4/TByk9Ye2uOf9NdXsCGMqf19MvMxqrR8ZczCWQf
	 atnNvgMj2YfdjeD9mZ0v47j5IhyDjRqfi30Fe8AptIwc3SPyeVXpO4YfXaDY3Ta19H
	 OO1bj0AUSjQ7XTr5vgIl/oTJs50I+xUn5sOXP9Zs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 076ErN11029980
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Thu, 6 Aug 2020 09:53:23 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 6 Aug
 2020 09:53:23 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 6 Aug 2020 09:53:23 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 076ErN1D032498;
	Thu, 6 Aug 2020 09:53:23 -0500
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] linux-ti-staging: update to 5.4.54
Date: Thu, 6 Aug 2020 09:53:17 -0500
Message-ID: <20200806145317.10393-1-dmurphy@ti.com>
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
index 87c64c555cdb..f7c3ce53668b 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
=20
 BRANCH =3D "ti-rt-linux-5.4.y"
=20
-SRCREV =3D "92c1547f2d83a4a75a1181a88631ef2d64f1e0dd"
-PV =3D "5.4.52+git${SRCPV}"
+SRCREV =3D "93189093447068135d91f93aa75ee1c1239438f1"
+PV =3D "5.4.54+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kerne=
l/linux/linux-ti-staging_5.4.bb
index 28dedccc74f3..75ce5bad7fde 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -61,8 +61,8 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH =3D "ti-linux-5.4.y"
=20
-SRCREV =3D "41c32273d7f5666a5637a109ec004fd746d5efac"
-PV =3D "5.4.52+git${SRCPV}"
+SRCREV =3D "e5a461dfc65bd00558e0b40e97f678cc7fa480bd"
+PV =3D "5.4.54+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
 MACHINE_KERNEL_PR_append =3D "a"
--=20
2.28.0

