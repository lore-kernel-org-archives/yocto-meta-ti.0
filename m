Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.4215.1578060352733386889
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Jan 2020 06:05:53 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=wEtEA5i7;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: dmurphy@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96990E013EF; Fri,  3 Jan 2020 06:05:52 -0800 (PST)
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
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 134DFE012A1
	for <meta-ti@yoctoproject.org>; Fri,  3 Jan 2020 06:05:52 -0800 (PST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 003E5p2o017569
	for <meta-ti@yoctoproject.org>; Fri, 3 Jan 2020 08:05:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1578060351;
	bh=t0WPFMSUkbntqFsvAljBRCjmmRwbTagvYrx1GS3XjOE=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=wEtEA5i7HfrG8kUmZuXlk74D9Esl2Nh9NwJkjT+RlvMraPE78xqDeT1ccLs+fFXU7
	 SI5zg8BP865SlSuYhD+mzj16w31rt8+Bhbh8dPEPr/6kLHvc0RY96fg65+QrK4bWBl
	 OeKDbZ6l9lKRZS3cCx+Mm54wFVYKusdFp7QYXigg=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 003E5pJj069598
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 3 Jan 2020 08:05:51 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Fri, 3 Jan
 2020 08:05:51 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Fri, 3 Jan 2020 08:05:51 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 003E5pC3027580;
	Fri, 3 Jan 2020 08:05:51 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] linux-ti-staging: update to ti2019.06-rc2
Date: Fri, 3 Jan 2020 08:03:06 -0600
Message-ID: <20200103140306.24818-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200103140306.24818-1-dmurphy@ti.com>
References: <20200103140306.24818-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_4.19.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_4.19.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb b/recipes-k=
ernel/linux/linux-ti-staging-rt_4.19.bb
index 201e7f5c..91fe00b8 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-4.19:"
=20
 BRANCH =3D "ti-rt-linux-4.19.y"
=20
-SRCREV =3D "f9b2abe6fa91456aa50a3ee0410db928455f98e0"
+SRCREV =3D "4a1d8698636cf4c7b4bcac5ff2e13ff0df8b74e0"
 PV =3D "4.19.82+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kern=
el/linux/linux-ti-staging_4.19.bb
index 9bc91b4e..2491365f 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
@@ -60,7 +60,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH =3D "ti-linux-4.19.y"
=20
-SRCREV =3D "463f203402da06d989567cf6c2b44bf796dfe57f"
+SRCREV =3D "3f7e6b12d9a8dc3eebd65254a478501938fdf93e"
 PV =3D "4.19.82+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
--=20
2.23.0

