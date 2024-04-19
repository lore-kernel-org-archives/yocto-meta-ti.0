Return-Path: <sabeeh-khan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10771C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 22:53:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.1506.1713567226027019431
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 19 Apr 2024 15:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=GknnxnXD;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: sabeeh-khan@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43JMriBr014292;
	Fri, 19 Apr 2024 17:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1713567224;
	bh=3Yl4Tefoie4GwhRNMNxutpFgMB2WJbju2jYJZgg2GHE=;
	h=From:To:CC:Subject:Date;
	b=GknnxnXD3HTixgXkE8WKAXLlP68aAUxV75g/aBS+sU/CXkxLB6pGH/hmnSkArGsOp
	 arJrKfI4FNjh9n8RX4FRjusGBK8bSbvimD2l0ycZjH7d8MyZ+F0Rv8/vHmm5XfdFBA
	 8GTGPatxl8QnMJbucQDQ+QXkYkikEPM3oTavAhko=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43JMrihv034376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 Apr 2024 17:53:44 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 19
 Apr 2024 17:53:44 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 19 Apr 2024 17:53:44 -0500
Received: from thinkstationp3.dhcp.ti.com (thinkstationp3.dhcp.ti.com [128.247.83.36])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43JMrio6035412;
	Fri, 19 Apr 2024 17:53:44 -0500
From: Sabeeh Khan <sabeeh-khan@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>
CC: Sabeeh Khan <sabeeh-khan@ti.com>
Subject: [meta-ti][kirkstone/scarthgap][PATCH] wl18xx-target-scripts: upgrade to R8.8.1
Date: Fri, 19 Apr 2024 17:52:36 -0500
Message-ID: <20240419225234.491185-1-sabeeh-khan@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 19 Apr 2024 22:53:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17593

This upgrade contains the following changes:
* updated hostapd path in ap_start.sh
* ap_stop.sh removes wlan1 interface
* hostapd.conf updated to work seamlessly with hostapd 2.10

Signed-off-by: Sabeeh Khan <sabeeh-khan@ti.com>
---
 ...target-scripts_8.7.3.bb => wl18xx-target-scripts_8.8.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/{wl18xx-target-scripts_8.7.3.bb => wl18xx-target-scripts_8.8.1.bb} (89%)

diff --git a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.8.1.bb
similarity index 89%
rename from meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
rename to meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.8.1.bb
index 84e8764f..87890a31 100644
--- a/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.7.3.bb
+++ b/meta-ti-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_8.8.1.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Scripts and configuration files for TI wireless drivers"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c0d175d1f4a705"
 
-# Tag: R8.7_SP3 (8.7.3)
-SRCREV = "a07b6e711d2a70608101d3d6cdc5749c4d8a96d5"
+# Tag: R8.8.1
+SRCREV = "8bcee075061527d61f26d6d506aebdfd496037d9"
 BRANCH = "sitara-scripts"
 SRC_URI = "git://git.ti.com/git/wilink8-wlan/wl18xx-target-scripts.git;protocol=https;branch=${BRANCH} \
 file://0001-print_stat.sh-replace-system-bin-sh-with-bin-sh.patch \
-- 
2.34.1


