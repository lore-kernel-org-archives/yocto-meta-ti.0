Return-Path: <anandb@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754EEEEAA5B
	for <webhook@archiver.kernel.org>; Thu, 14 Sep 2023 17:10:51 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.258.1694711446787205220
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 14 Sep 2023 10:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=bjBkvYqK;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: anandb@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 38EHAkHa026750
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Sep 2023 12:10:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1694711446;
	bh=9olvn4GVRXc3ML6JDf5HG0Ha20gEKrX46A/zjHgtVNw=;
	h=From:To:CC:Subject:Date;
	b=bjBkvYqKBaC17SBs83PMmnlMDBLkMEoL0iOX/wdyD8xnyxl7ywlrFGgJPqVj4FbnD
	 RDwBStMz52nXuEiwsdA2TU/sbu1lfLtk+o61Uk3NIFaprz7BPCHRXOJ0ngYPVDRqYE
	 QpvVjigEPwXvSM+TibMmV2j7A7KgqtLvrpG10H/Q=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 38EHAkra094728
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Thu, 14 Sep 2023 12:10:46 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 14
 Sep 2023 12:10:44 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 14 Sep 2023 12:10:44 -0500
Received: from uda0876520.dhcp.ti.com (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 38EHAfsp027244;
	Thu, 14 Sep 2023 12:10:42 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <s-adivi@ti.com>, <g-gupta@ti.com>, <khasim@ti.com>,
        <vijayp@ti.com>, <praneeth@ti.com>,
        Anand Balagopalakrishnan <anandb@ti.com>
Subject: [RFC|kirkstone] linux-ti-staging: add config preempt for am335x and am437x
Date: Thu, 14 Sep 2023 22:40:26 +0530
Message-ID: <20230914171026.3014887-1-anandb@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 14 Sep 2023 17:10:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16968

SGX needs a preemptible kernel. CONFIG_PREEMPT has always been enabled
on TI Linux kernels upto K5.1.

This is enabled on AM65x by default but missed out AM335x and AM437x.
Add a kernel config fragment to enable config preempt.

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 .../linux/files/configs/config-preempt.cfg           | 12 ++++++++++++
 .../recipes-kernel/linux/linux-ti-staging_6.1.bb     |  1 +
 2 files changed, 13 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg

diff --git a/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg b/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
new file mode 100644
index 00000000..c1e5ad7d
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/files/configs/config-preempt.cfg
@@ -0,0 +1,12 @@
+CONFIG_PREEMPT_BUILD=y
+# CONFIG_PREEMPT_NONE is not set
+CONFIG_PREEMPT=y
+CONFIG_PREEMPT_COUNT=y
+CONFIG_PREEMPTION=y
+CONFIG_PREEMPT_RCU=y
+CONFIG_TASKS_RCU_GENERIC=y
+CONFIG_TASKS_RCU=y
+CONFIG_UNINLINE_SPIN_UNLOCK=y
+# CONFIG_CEC_GPIO is not set
+CONFIG_DEBUG_PREEMPT=y
+# CONFIG_PREEMPT_TRACER is not set
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 8a883878..0ee63358 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -33,6 +33,7 @@ PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "https"
+KERNEL_CONFIG_FRAGMENTS += "${WORKDIR}/config-preempt.cfg"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
             file://defconfig"
 
-- 
2.34.1


