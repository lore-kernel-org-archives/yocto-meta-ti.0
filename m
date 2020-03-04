Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.16472.1583349011249467533
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Mar 2020 11:10:11 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=UTbCCwic;
 spf=fail (domain: ti.com, ip: 140.211.169.56, mailfrom: dmurphy@ti.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B81CE017C3; Wed,  4 Mar 2020 11:10:10 -0800 (PST)
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
	*      [198.47.23.248 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 939E9E017C2
	for <meta-ti@yoctoproject.org>; Wed,  4 Mar 2020 11:10:07 -0800 (PST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 024JA7TV098187
	for <meta-ti@yoctoproject.org>; Wed, 4 Mar 2020 13:10:07 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583349007;
	bh=gHtomnrfsNlEjhOrlmXb5B2H5qYWw1vakQI4kXWi9KA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UTbCCwicGTszQqYzvFNyv8qo/IH5bp7eoB84LSGLvo8bopbscsGTGP5IZvBzyIPfX
	 roDJVwj4HFtSlQ03JLa2bl2AgNZvhjbc85pI1T/ZgnBYHVJo2VGW8kvrt3YSSxtQnE
	 V4LdjaesGEg0fpes22xlEq2LsxTP9uMvuzFd+BIY=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 024JA7Pl116018
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 4 Mar 2020 13:10:07 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 4 Mar
 2020 13:10:06 -0600
Received: from localhost.localdomain (10.64.41.19) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 4 Mar 2020 13:10:07 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by localhost.localdomain (8.15.2/8.15.2) with ESMTP id 024JA675013659;
	Wed, 4 Mar 2020 13:10:06 -0600
From: "Dan Murphy" <dmurphy@ti.com>
To: <meta-ti@yoctoproject.org>
CC: <denys@ti.com>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH 2/2] linux-ti-staging: update to the ti2020.00-rc3 tag
Date: Wed, 4 Mar 2020 13:04:45 -0600
Message-ID: <20200304190445.30789-2-dmurphy@ti.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200304190445.30789-1-dmurphy@ti.com>
References: <20200304190445.30789-1-dmurphy@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-ke=
rnel/linux/linux-ti-staging-rt_5.4.bb
index 1e34eb51..33c6508b 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}-5.4:"
=20
 BRANCH =3D "ti-rt-linux-5.4.y"
=20
-SRCREV =3D "25311d036e11470cccc6e513fc85732e51c9cabf"
+SRCREV =3D "a7f0924ffeb3e8dfaefece66aea3ef3d20f6b571"
 PV =3D "5.4.20+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kerne=
l/linux/linux-ti-staging_5.4.bb
index 1a602c84..efa1ebe8 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -60,7 +60,7 @@ S =3D "${WORKDIR}/git"
=20
 BRANCH =3D "ti-linux-5.4.y"
=20
-SRCREV =3D "d21b5b6f621ab1c1177dca48f78fe2d3633a9eab"
+SRCREV =3D "738552d0b0292e148b35d60ec47ca3c8dd6007b4"
 PV =3D "5.4.20+git${SRCPV}"
=20
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebu=
ild
--=20
2.25.1

