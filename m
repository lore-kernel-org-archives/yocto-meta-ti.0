Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.6898.1580313006508255407
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 29 Jan 2020 07:50:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=HV5W0C33;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: dmurphy@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3657E01631; Wed, 29 Jan 2020 07:50:05 -0800 (PST)
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
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4A39EE01402
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2020 07:50:04 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 00TFo4bp106762
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2020 09:50:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580313004;
	bh=K882zdu0Q2CKl/JuaRcDsQAsQq8sXqQaos3GguWZBug=;
	h=From:To:CC:Subject:Date;
	b=HV5W0C33gej0oV6EH/93Z5yg2lf1BAsFecUzUc5psAaWpHUEDmv6jwziBvGofmzjN
	 /Rxx/2BZHQ/xUvUHVawUDJlI6yvCojwW3CljkZp8iJxM4HLpFjea4U7vsXv4GgO+rN
	 NcNynieIPo5dAywg3Qg9aKBun5PkjUrb28jS7hTo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 00TFo4Sv089754
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 29 Jan 2020 09:50:04 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 29
 Jan 2020 09:50:03 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 29 Jan 2020 09:50:04 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 00TFo3qV093746;
	Wed, 29 Jan 2020 09:50:04 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] linux-ti-staging: update to ti2019.06-rc5
Date: Wed, 29 Jan 2020 09:46:47 -0600
Message-ID: <20200129154647.25379-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.0
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
index 4fb788ce..5c56b286 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.19.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-4.19:"
=20
 BRANCH =3D "ti-rt-linux-4.19.y"
=20
-SRCREV =3D "58d6e18a2189d6e579835ece6ccf829e0193f139"
+SRCREV =3D "69c51d6d57c150155bea8dd032bd8ce7835cf234"
 PV =3D "4.19.94+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.19.bb b/recipes-kern=
el/linux/linux-ti-staging_4.19.bb
index e44b569b..ab9653e1 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.19.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.19.bb
@@ -60,7 +60,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH =3D "ti-linux-4.19.y"
=20
-SRCREV =3D "901fa13b903fe2399b66d3ea58f8d84cc9782ca7"
+SRCREV =3D "5a23bc00e08d26bb83952953d909c95b42fab70c"
 PV =3D "4.19.94+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
--=20
2.25.0

