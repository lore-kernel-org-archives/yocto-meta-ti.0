Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web08.30971.1613967581418854822
 for <meta-ti@lists.yoctoproject.org>;
 Sun, 21 Feb 2021 20:19:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vMXETeeE;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11M4JePg006211
	for <meta-ti@lists.yoctoproject.org>; Sun, 21 Feb 2021 22:19:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613967580;
	bh=Q0mH3Qp0z0wOlX9SeuUuGF/qWWURq/OYE+Vcs4ZrUkU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=vMXETeeEMrweXZ9I5PJht+j1ldeH84PNncn+0lEdzJPYvqG9YQy4hN/u09VPKV3se
	 C4ozUJTuUWXDfcqbcMh9mdNhaWEJFbfv/RXZGbak5NStTei1G+3AQnj7Oz6l/e04eW
	 vfKti2swP5mS9S6MbYZsdIDMiqPQ72S4+YkCfQYA=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11M4JenZ023376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Sun, 21 Feb 2021 22:19:40 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Sun, 21
 Feb 2021 22:19:40 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Sun, 21 Feb 2021 22:19:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11M4JeV7070399;
	Sun, 21 Feb 2021 22:19:40 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 3/3] linux-ti-staging: Update 5.4 kernel to the latest commit SHA
Date: Sun, 21 Feb 2021 22:19:39 -0600
Message-ID: <20210222041939.14903-3-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210222041939.14903-1-praneeth@ti.com>
References: <20210222041939.14903-1-praneeth@ti.com>
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
index 475a3cd3..b6831c34 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "21f8134c92d1f11ecca74291df672905612337ef"
+SRCREV = "f88a6c0071660458ed8985500ed5c4b5c8a7f372"
 PV = "5.4.93+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index f5e1ba5e..052c8971 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "cabf941a8cd60a205353cb775e450ec225a5cc3b"
+SRCREV = "d36781593d111abb7c56bbc7094ab6b5673d6a01"
 PV = "5.4.93+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

