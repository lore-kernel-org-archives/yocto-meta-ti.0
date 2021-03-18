Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.2400.1616027521262448275
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Mar 2021 17:32:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=d+8zUAfk;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12I0W0AA126982;
	Wed, 17 Mar 2021 19:32:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1616027520;
	bh=LJvzazGkg+PoeUG1kecEuoeEjUJHJr0P7hW8ySBVer8=;
	h=From:To:CC:Subject:Date;
	b=d+8zUAfkjX966OphzX84m5g2m9kGWIxEYxplbwc+WJKD0g8+BHEOtuLX6GD6/JUpH
	 Hq/cHjnYTqOi3WCrMPfeNO9+bGpXST4RksIFRhMiwFD0hSsDRpdOfj0upoGec59cv1
	 yJI+c0R8opnPoKjUyQR0iJg7yI9DLqqrG7tnt5Zs=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12I0W0YW030037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 17 Mar 2021 19:32:00 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 17
 Mar 2021 19:31:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 17 Mar 2021 19:31:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12I0Vx7m004223;
	Wed, 17 Mar 2021 19:31:59 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
Subject: [dunfell/master PATCH] linux-ti-staging: Update 5.4 kernel to the latest commit SHA
Date: Wed, 17 Mar 2021 19:31:59 -0500
Message-ID: <20210318003159.1148-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update 5.4 kernel to the latest commit SHA

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.4.bb | 2 +-
 recipes-kernel/linux/linux-ti-staging_5.4.bb    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
index a9dac5af..fdf56b69 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "6cd92cf89235d5ddb3c0104d02c0f3db48efdba4"
+SRCREV = "e62cab8192f99b114a72867c0dc130849c2585f3"
 PV = "5.4.93+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 37f387c3..2c1ce3c2 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "87c0425824b4169e4d697c4f6219243249a8c08b"
+SRCREV = "b26f403d01870360392f2fe778304d3a8cba0bef"
 PV = "5.4.93+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

