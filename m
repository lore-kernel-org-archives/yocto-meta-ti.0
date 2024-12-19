Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF349E7718B
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 21:54:06 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web10.139710.1734645244485315058
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Dec 2024 13:54:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=T6oKGVwb;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs380066081
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Dec 2024 15:54:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734645243;
	bh=vtQaEtTgVDMQbxKDuwJds6WbUhPxKYMp16AtmuG4qFk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=T6oKGVwbdL8Oq/vzQV7uJ5qhnrJfZTetC9BsJvehf89aYMSP40q3MGLalBf5h3FYX
	 VOQNGiMjRh7J/jc0YMXIjLQbPWSLukC6Cz+eVhfsc/FO/mmovF4PdoXaCAP5SdpMYy
	 BRp59KCHMtkFmNEQzERES/SvECQmT9iBt0//LVX4=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BJLs3GN130292
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 19
 Dec 2024 15:54:02 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 19 Dec 2024 15:54:03 -0600
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BJLs3Ra066795;
	Thu, 19 Dec 2024 15:54:03 -0600
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tOOT5-0007Y2-5M; Thu, 19 Dec 2024 15:54:03 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH 06/13] conf/machine: move remaining Beagle platforms to meta-beagle
Date: Thu, 19 Dec 2024 15:53:55 -0600
Message-ID: <20241219215402.28324-7-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241219215402.28324-1-reatmon@ti.com>
References: <20241219215402.28324-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Dec 2024 21:54:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18148

From: Denys Dmytriyenko <denys@konsulko.com>

Include beagle-bsp.inc to define "bb_org" BSP settings and select that
as a default.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 {meta-ti-bsp => meta-beagle}/conf/machine/beagle-x15.conf      | 3 +--
 .../conf/machine/beaglebone-ai64-k3r5.conf                     | 3 +--
 {meta-ti-bsp => meta-beagle}/conf/machine/beaglebone-ai64.conf | 3 +--
 {meta-ti-bsp => meta-beagle}/conf/machine/beaglebone.conf      | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)
 rename {meta-ti-bsp => meta-beagle}/conf/machine/beagle-x15.conf (94%)
 rename {meta-ti-bsp => meta-beagle}/conf/machine/beaglebone-ai64-k3r5.conf (94%)
 rename {meta-ti-bsp => meta-beagle}/conf/machine/beaglebone-ai64.conf (96%)
 rename {meta-ti-bsp => meta-beagle}/conf/machine/beaglebone.conf (95%)

diff --git a/meta-ti-bsp/conf/machine/beagle-x15.conf b/meta-beagle/conf/machine/beagle-x15.conf
similarity index 94%
rename from meta-ti-bsp/conf/machine/beagle-x15.conf
rename to meta-beagle/conf/machine/beagle-x15.conf
index 6f8c435b..e9ab5d40 100644
--- a/meta-ti-bsp/conf/machine/beagle-x15.conf
+++ b/meta-beagle/conf/machine/beagle-x15.conf
@@ -2,9 +2,8 @@
 #@NAME: BeagleBoard X15
 #@DESCRIPTION: Machine configuration for the BeagleBoard X15
 
-TI_PREFERRED_BSP ?= "bb_org"
-
 require conf/machine/include/am57xx.inc
+require conf/machine/include/beagle-bsp.inc
 
 DT_VENDOR_PREFIX = "ti/omap/"
 DT_VENDOR_PREFIX:bsp-ti-6_1 = ""
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf b/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
similarity index 94%
rename from meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
rename to meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
index d415a212..95d3abc0 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64-k3r5.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64-k3r5.conf
@@ -2,9 +2,8 @@
 #@NAME: BeagleBone AI-64 (R5F)
 #@DESCRIPTION: Machine configuration for the BeagleBone AI-64 (R5F core)
 
-TI_PREFERRED_BSP ?= "bb_org"
-
 require conf/machine/include/k3r5.inc
+require conf/machine/include/beagle-bsp.inc
 
 SYSFW_SOC = "j721e"
 SYSFW_CONFIG = "evm"
diff --git a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf b/meta-beagle/conf/machine/beaglebone-ai64.conf
similarity index 96%
rename from meta-ti-bsp/conf/machine/beaglebone-ai64.conf
rename to meta-beagle/conf/machine/beaglebone-ai64.conf
index 56e1ed4e..faffd0bb 100644
--- a/meta-ti-bsp/conf/machine/beaglebone-ai64.conf
+++ b/meta-beagle/conf/machine/beaglebone-ai64.conf
@@ -2,9 +2,8 @@
 #@NAME: BeagleBone AI-64 (A72)
 #@DESCRIPTION: Machine configuration for the BeagleBone AI-64 board (A72 core)
 
-TI_PREFERRED_BSP ?= "bb_org"
-
 require conf/machine/include/j721e.inc
+require conf/machine/include/beagle-bsp.inc
 
 IMAGE_SR1_1_HS_FS_FILES:bsp-bb_org = ""
 IMAGE_SR2_HS_SE_FILES:bsp-bb_org = ""
diff --git a/meta-ti-bsp/conf/machine/beaglebone.conf b/meta-beagle/conf/machine/beaglebone.conf
similarity index 95%
rename from meta-ti-bsp/conf/machine/beaglebone.conf
rename to meta-beagle/conf/machine/beaglebone.conf
index 0db4d304..6048383b 100644
--- a/meta-ti-bsp/conf/machine/beaglebone.conf
+++ b/meta-beagle/conf/machine/beaglebone.conf
@@ -2,9 +2,8 @@
 #@NAME: BeagleBone machine
 #@DESCRIPTION: Machine configuration for the http://beagleboard.org/bone board
 
-TI_PREFERRED_BSP ?= "bb_org"
-
 require conf/machine/include/ti33x.inc
+require conf/machine/include/beagle-bsp.inc
 
 DT_VENDOR_PREFIX = "ti/omap/"
 DT_VENDOR_PREFIX:bsp-ti-6_1 = ""
-- 
2.17.1


