Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.781.1614986727706546626
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 05 Mar 2021 15:25:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cxReKi8s;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 125NPQZs086735
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Mar 2021 17:25:26 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1614986726;
	bh=7HuwFnKWXawC+Fdiw1f2Rm92BywiPnJU/HjzwFWO0QQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cxReKi8sKz+fXaGIbFTNFzBtAey9IJSf8ajwZ9boAqQIEO9fwjmx9WrEHCc4smOIo
	 Oo12ElPx2jPITk0LDBZtZBoUWmoxdrYfIXkrwHoOp1lfcJpBaO21yMzYj8jKH7mBeY
	 onHZ4y+VGD0vFi9jTWKEVRys4AbrUJNv6lDSNQss=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 125NPQ2G094285
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Fri, 5 Mar 2021 17:25:26 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 5 Mar
 2021 17:25:25 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 5 Mar 2021 17:25:25 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 125NPPG6045825;
	Fri, 5 Mar 2021 17:25:25 -0600
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH 2/2] linux-ti-staging: Update 5.4 kernel to the latest commit SHA
Date: Fri, 5 Mar 2021 17:25:25 -0600
Message-ID: <20210305232525.5790-2-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210305232525.5790-1-praneeth@ti.com>
References: <20210305232525.5790-1-praneeth@ti.com>
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
index b6831c34..a9dac5af 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.4.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.4:"
 
 BRANCH = "ti-rt-linux-5.4.y"
 
-SRCREV = "f88a6c0071660458ed8985500ed5c4b5c8a7f372"
+SRCREV = "6cd92cf89235d5ddb3c0104d02c0f3db48efdba4"
 PV = "5.4.93+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index 052c8971..37f387c3 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -21,7 +21,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.4.y"
 
-SRCREV = "d36781593d111abb7c56bbc7094ab6b5673d6a01"
+SRCREV = "87c0425824b4169e4d697c4f6219243249a8c08b"
 PV = "5.4.93+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-- 
2.17.1

