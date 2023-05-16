Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE1AC77B7F
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 14:32:32 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.23521.1684247551787507626
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 16 May 2023 07:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QG5NLDmX;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34GEWUmc022335;
	Tue, 16 May 2023 09:32:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684247550;
	bh=ZWGs7/2aNN8D1ltgFkkNd6pzWR2wd8CRUdPPDo8auFM=;
	h=From:To:Subject:Date;
	b=QG5NLDmXyzFmwUrB4LPFLa/rvyyYdnlVfUqETIqH5qsx5yb9FEAxfZ10U4je5YUCf
	 bkdyhuKYmw/WaxAqlyCgL7Di7cKER+30pXN+93cyrOVjWZ7HiGQoZg5J7FLrpTs0JK
	 c30qohXmpDhZEEcV5IEMCnl19L9gv/DR9QUJV9KM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34GEWU94020434
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 16 May 2023 09:32:30 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 16
 May 2023 09:32:30 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 16 May 2023 09:32:30 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34GEWUvX013376;
	Tue, 16 May 2023 09:32:30 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1pyvj4-0000Z5-CO; Tue, 16 May 2023 09:32:30 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH 1/2] various: Intial LTS migration version
Date: Tue, 16 May 2023 09:32:29 -0500
Message-ID: <20230516143230.2123-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 16 May 2023 14:32:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16535

From: LCPD Automation Script <lcpdbld@list.ti.com>

As part of the initial LTS migration, move to the latest commits for the
various repos.
- ti-linux-fw
- u-boot-ti-staging_2021.01
- u-boot-ti-staging_2023.04
- k3conf_git
- linux-ti-staging-rt_5.10
- linux-ti-staging-rt_6.1
- linux-ti-staging_5.10
- linux-ti-staging_6.1

Going forward all updates will come from the CICD flow.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc          | 4 ++--
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb  | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb            | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb  | 4 ++--
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb     | 4 ++--
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index 1a5ea534..5c4efb0e 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -16,12 +16,12 @@ IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.00"
 TIFS_LPM_STUB_FW_VERSION = "08.06.04"
 
-TI_LINUX_FW_SRCREV ?= "79c498ef6ab1558b699a2243a26c4a65a1c44d26"
+TI_LINUX_FW_SRCREV ?= "24f21d2ab6adbd018204bf4079e86b968277af56"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
 
-K3_IMAGE_GEN_SRCREV ?= "1319f46f3899e62d88e0a5cedad5b454d0432ddb"
+K3_IMAGE_GEN_SRCREV ?= "c8ff829bb470e1e5c6c7ff6abd71fd38974bc760"
 SRCREV_imggen = "${K3_IMAGE_GEN_SRCREV}"
 SRCREV_FORMAT = "imggen"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
index 7529ce6c..8984d859 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2021.01.bb
@@ -9,7 +9,7 @@ PR = "r34"
 
 BRANCH = "ti-u-boot-2021.01"
 
-SRCREV = "2ee8efd6543648c6b8a14d93d52a6038854035c8"
+SRCREV = "3a5205e9803809f18edc59a40fd9df470f98a00f"
 
 SRC_URI += "file://0001-configs-Update-to-support-oe-core-fitImage-naming.patch"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
index 6a46e812..b993a56f 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
@@ -6,6 +6,6 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2023.04"
 
-SRCREV = "41a88ad529b3943b1e465846eb24fe2c29203e35"
+SRCREV = "c22f1ee591f84ab28c025d7aed9ee10c7f0154c1"
 
 DEFAULT_PREFERENCE = "-1"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index c6d3773e..55532365 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -8,7 +8,7 @@ PV = "0.2+git${SRCPV}"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "982f5c2f02f732b5829861218812904cd776773d"
+SRCREV = "1dd468d551fd786c410e88dadc1114505d057ebe"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
index c950fc80..952af859 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_5.10.bb
@@ -6,5 +6,5 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-5.10:"
 
 BRANCH = "ti-rt-linux-5.10.y"
 
-SRCREV = "c1a12919117a6978f40e723d6e0c67c744e026b9"
+SRCREV = "101d44260b8dfbab27763581e4bbd534dd36ae33"
 PV = "5.10.168+git${SRCPV}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
index 8b978e09..8b05515b 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.1.bb
@@ -8,5 +8,5 @@ FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}-6.1:"
 
 BRANCH = "ti-rt-linux-6.1.y"
 
-SRCREV = "b7d4fb88264d2b094035871fa676592eb8e83b25"
-PV = "6.1+git${SRCPV}"
+SRCREV = "c9eb24939be548a72ddf19820805e48359be2ac5"
+PV = "6.1.26+git${SRCPV}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
index fb4607ee..7f3911e4 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -25,7 +25,7 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-5.10.y"
 
-SRCREV = "2c23e6c538c879e380401ae4b236f54020618eaa"
+SRCREV = "991c5ce91e43cb620f534dc9fe7b0ad21f4f4388"
 PV = "5.10.168+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 131dd1b3..62873491 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -24,8 +24,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-linux-6.1.y"
 
-SRCREV = "7b7231fbf048963b434d76a3cb866165365b14e0"
-PV = "6.1+git${SRCPV}"
+SRCREV = "3308599ae676663f446b61be398494fbe376fa9d"
+PV = "6.1.26+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR:append = "b"
-- 
2.17.1


