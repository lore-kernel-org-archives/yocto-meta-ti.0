Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56A7ECF538C
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 13:55:42 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.9739.1729691734743389279
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 23 Oct 2024 06:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xTSSrAZ6;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49NDtWDt008378;
	Wed, 23 Oct 2024 08:55:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1729691733;
	bh=2jHRplD3SbRwSFEX/9lIsnp63fuUVgswSBWT1PLD6yk=;
	h=From:To:Subject:Date;
	b=xTSSrAZ6B1vClkBV1+Io/lOGLx87GIC5LG/eV8jP1Q9vuZs2VoWf2Ur0gHtD1ZqFk
	 r+ZvfFfyQUwuRE+fMRRmk5JldRJkirpg5pnqioWFsSRtDcT7bUkcqcpH2+5OzxLQjm
	 6bw1vp4HHeH4aJ0h7z48X9hCXINUJnOThWrGm+30=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49NDtWOS052868
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 23 Oct 2024 08:55:32 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 23
 Oct 2024 08:55:32 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 23 Oct 2024 08:55:32 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49NDtWLx100750;
	Wed, 23 Oct 2024 08:55:32 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1t3bpk-0007tv-DF; Wed, 23 Oct 2024 08:55:32 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] optee: Update to v4.4.0
Date: Wed, 23 Oct 2024 08:55:32 -0500
Message-ID: <20241023135532.30331-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 23 Oct 2024 13:55:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18029

Update all of the components to the upstream 4.4.0 version.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++--
 .../recipes-security/optee/optee-examples-ti-version.inc      | 2 +-
 meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++--
 meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
index 5f06fa03..2c8977dd 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.3.0+git"
-SRCREV = "a5b1ffcd26e328af0bbf18ab448a38ecd558e05c"
+PV = "4.4.0+git"
+SRCREV = "d221676a58b305bddbf97db00395205b3038de8e"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
index 4d9897a7..8c21bc75 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-examples-ti-version.inc
@@ -1,2 +1,2 @@
-PV = "4.3.0+git"
+PV = "4.4.0+git"
 SRCREV = "378dc0db2d5dd279f58a3b6cb3f78ffd6b165035"
diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
index 2fa4d8cc..0fab9c9a 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
@@ -1,5 +1,5 @@
-PV = "4.3.0+git"
-SRCREV = "1c0d52ace3c237ca6276cafb5c73f699a75c1d40"
+PV = "4.4.0+git"
+SRCREV = "8f645256efc0dc66bd5c118778b0b50c44469ae1"
 
 SRC_URI:remove = " \
     file://0001-checkconf.mk-do-not-use-full-path-to-generate-guard-.patch \
diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
index 2ae40bf1..f815cb8d 100644
--- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
+++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
@@ -1,7 +1,7 @@
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=a8fa504109e4cd7ea575bc49ea4be560"
 
-PV = "4.3.0+git"
-SRCREV = "9d4c4fb9638fb533211037016b6da12fbbcc4bb6"
+PV = "4.4.0+git"
+SRCREV = "695231ef8987866663a9ed5afd8f77d1bae3dc08"
 
 SRC_URI:remove = " \
     file://0001-xtest-stats-remove-unneeded-stat.h-include.patch \
-- 
2.17.1


