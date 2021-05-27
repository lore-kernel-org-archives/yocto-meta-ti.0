Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.710.1622075279278274740
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 26 May 2021 17:27:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=T+bnX4jz;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 14R0Rvd7079156;
	Wed, 26 May 2021 19:27:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1622075277;
	bh=5zBZ4SfueJrKwzkETRvJoJIdp0d9c4Rqomcqfon/NUc=;
	h=From:To:CC:Subject:Date;
	b=T+bnX4jzMjoBuHjywS1YKakdjJjQZMv76kYWb5LTN8a/ZvX/6EA+9IV4KVaCm5ZM1
	 BGgMpzhJ7BAqf1cHLxCSJ7ca9jlKeiBxRY5vNPIp9Q9HDZ1QLCEwBCjk4AE3oSPzl1
	 P0TnF+J/h5DKf7nNkM6sbjVjukkVHWVaWJptox0I=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 14R0Rvee047204
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 26 May 2021 19:27:57 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 26
 May 2021 19:27:57 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 26 May 2021 19:27:57 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 14R0RvYx116818;
	Wed, 26 May 2021 19:27:57 -0500
From: "praneeth" <praneeth@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Yogesh Siraswar <yogeshs@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [dunfell/master PATCH] linux-ti-staging: Update 5.10 kernel to 5.10.35
Date: Wed, 26 May 2021 19:27:56 -0500
Message-ID: <20210527002757.9900-1-praneeth@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Praneeth Bajjuri <praneeth@ti.com>

Update linux 5.10 to 5.10.35 stable

Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
---
 recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 4 ++--
 recipes-kernel/linux/linux-ti-staging_5.10.bb    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index 95b17570..4654d92d 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "8fbd16658d1105671e67182c290235a99a7af02b"
-PV = "5.10.30+git${SRCPV}"
+SRCREV = "afe9ba17bb94cd226f9e5dc3685e4fe32be28c5c"
+PV = "5.10.35+git${SRCPV}"
diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 4ec19af7..f3803cc5 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -21,8 +21,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "d85aee3e19aa7403bd157d2ae30917e736096a7f"
-PV = "5.10.30+git${SRCPV}"
+SRCREV = "72d727fe733f2610e937a063bcebedce329948ec"
+PV = "5.10.35+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"
-- 
2.17.1

