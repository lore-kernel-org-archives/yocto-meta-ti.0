Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49C7FC77B73
	for <webhook@archiver.kernel.org>; Tue, 11 Apr 2023 21:52:54 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.28683.1681249966931884502
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 11 Apr 2023 14:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UFTlYBV/;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33BLqjAO079034;
	Tue, 11 Apr 2023 16:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1681249965;
	bh=EjJHWANVHxIfm6Ay+g0ap8qxSKwEAar1/fvnMfS2RsI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UFTlYBV/8lqE5gTV7gUVy3YL3QMIImOkfLYQ9Rrbgo6VILcvNkrtm/HKWRnPlvJqQ
	 48JG7jyx1qDNqpgNa+FLamAAI6ENlzE31kX8JtwBtZPcRrgzdHxLtVJjTBOc8R5yUr
	 PTVu2WvwYrPacea+UsicSod26ZtXmSvuvfJJBxBU=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33BLqiZh125047
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 11 Apr 2023 16:52:45 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 11
 Apr 2023 16:52:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 11 Apr 2023 16:52:44 -0500
Received: from ula0226330.dal.design.ti.com (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33BLqhUf006598;
	Tue, 11 Apr 2023 16:52:44 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-ti][master/kirkstone][PATCH v3 2/6] linux-ti-mainline: Remove ti-upstream-tools
Date: Tue, 11 Apr 2023 16:52:39 -0500
Message-ID: <20230411215243.18230-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411215243.18230-1-afd@ti.com>
References: <20230411215243.18230-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 11 Apr 2023 21:52:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16364

Mainline should test the mainline kernel as it is, not with out-of-tree
changes like new DTB/DTBOs. Use only upstream DTB/DTBOs. As that was the
last thing provided by ti-upstream-tools, remove it here.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 .../linux/linux-ti-mainline_git.bb              | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
index 7d948a85..842864cd 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-mainline_git.bb
@@ -1,5 +1,5 @@
 SECTION = "kernel"
-SUMMARY = "Mainline Linux kernel for TI devices (with ti-upstream-tools)"
+SUMMARY = "Mainline Linux kernel for TI devices"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
@@ -15,9 +15,6 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
 
 S = "${WORKDIR}/git"
 
-BRANCH = "master"
-TOOLS_BRANCH = "master"
-
 # 5.15 Mainline version
 SRCREV = "8bb7eca972ad531c9b149c0a51ab43a417385813"
 PV = "5.15+git${SRCPV}"
@@ -28,24 +25,16 @@ PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
 KERNEL_GIT_PROTOCOL = "https"
+KERNEL_GIT_BRANCH = "master"
 SRC_URI += " \
-    ${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH};name=linux \
-    git://git.ti.com/git/ti-linux-kernel/ti-upstream-tools.git;branch=${TOOLS_BRANCH};protocol=${KERNEL_GIT_PROTOCOL};name=ti-upstream-tools;destsuffix=git/ti-upstream-tools \
+	${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${KERNEL_GIT_BRANCH} \
 "
 
-SRCREV_ti-upstream-tools = "0f60697843bba6f8d721b14da92b1652563ccb95"
-SRCREV_FORMAT = "linux"
-
 DEFCONFIG_NAME = "multi_v7_defconfig"
 DEFCONFIG_NAME:omapl138 = "davinci_all_defconfig"
 DEFCONFIG_NAME:k3 = "defconfig"
 KERNEL_CONFIG_COMMAND = "oe_runmake -C ${S} O=${B} ${DEFCONFIG_NAME}"
 
-kernel_do_compile:append() {
-	oe_runmake dtbs CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
-	oe_runmake -C ${S}/ti-upstream-tools LINUX=${S} DTC=${B}/scripts/dtc/dtc O=${B} CC="${KERNEL_CC} $cc_extra " LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS}
-}
-
 do_shared_workdir:prepend() {
 	cd ${B}
 	echo >> Module.symvers
-- 
2.39.2


