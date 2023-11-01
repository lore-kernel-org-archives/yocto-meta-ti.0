Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AEBC4332F
	for <webhook@archiver.kernel.org>; Wed,  1 Nov 2023 18:11:32 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.1379.1698862286895465058
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Nov 2023 11:11:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=cGzTyV9v;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 3A1IBPVO011736;
	Wed, 1 Nov 2023 13:11:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1698862285;
	bh=km4kWsXemRDoZ+kLQFvdLODSRs8O8BG5vhlU62RmdD4=;
	h=From:To:Subject:Date;
	b=cGzTyV9vfqVcZfmr7tPXijL90gncf4NGs/jERKKTJNKf6qDbdOPUmCyJ7B1VqgjIc
	 LFUck3To7EXnl4OCnqZ2+cdyOefSu2B+7umey/gelN0S2bkdysH7r/67Z6hXNhIaQL
	 bpmd8t1WTrhFsMvAz4lHjh6Ud9Fz3lgae9zP0dp4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 3A1IBPF7026679
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 1 Nov 2023 13:11:25 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 1
 Nov 2023 13:11:25 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 1 Nov 2023 13:11:25 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 3A1IBPjN070442;
	Wed, 1 Nov 2023 13:11:25 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qyFga-00069w-S1; Wed, 01 Nov 2023 13:11:24 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] ti-img-rogue-driver: Fix build error due to .SECONDARY/.NOTINTERMEDIATE
Date: Wed, 1 Nov 2023 13:11:24 -0500
Message-ID: <20231101181124.23636-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 Nov 2023 18:11:32 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17220

There is a build error under master that is not present in kirkstone
related to .SECONDARY/.NOTINTERMEDIATE being set differently between the
ti-img-rogue-driver repo and the kernel.  The long term solution to
allow this code to be built on both kirkstone/master is being
investigated.  In the meantime, this patch gets things building on
master.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...uild-Makefile.template-use-SECONDARY.patch | 35 +++++++++++++++++++
 .../ti-img-rogue-driver_23.2.6460340.bb       |  2 ++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-build-kbuild-Makefile.template-use-SECONDARY.patch

diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-build-kbuild-Makefile.template-use-SECONDARY.patch b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-build-kbuild-Makefile.template-use-SECONDARY.patch
new file mode 100644
index 00000000..0989116e
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver/0001-build-kbuild-Makefile.template-use-SECONDARY.patch
@@ -0,0 +1,35 @@
+From 738dfc1b33a83e9995ed7f65ec41ebe2fc6a90ed Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Wed, 1 Nov 2023 10:04:29 -0500
+Subject: [PATCH] build: kbuild: Makefile.template: use SECONDARY
+
+For some reason on master we are seeing an error:
+
+| make[5]: *** .NOTINTERMEDIATE and .SECONDARY are mutually exclusive.  Stop.
+
+Flip this back to .SECONDARY to fix this build issue.
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+
+Upstream-Status: Pending
+
+---
+ build/linux/kbuild/Makefile.template | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/linux/kbuild/Makefile.template b/build/linux/kbuild/Makefile.template
+index aa19d66..31e37fb 100644
+--- a/build/linux/kbuild/Makefile.template
++++ b/build/linux/kbuild/Makefile.template
+@@ -54,7 +54,7 @@
+ 
+ include $(OUT)/config_kernel.mk
+ 
+-.NOTINTERMEDIATE:
++.SECONDARY:
+ 
+ define symlink-source-file
+ @if [ ! -e $(dir $@) ]; then mkdir -p $(dir $@); fi
+-- 
+2.17.1
+
diff --git a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
index a74cc7b8..e47a1175 100644
--- a/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
+++ b/meta-ti-bsp/recipes-bsp/powervr-drivers/ti-img-rogue-driver_23.2.6460340.bb
@@ -20,6 +20,8 @@ BRANCH = "linuxws/kirkstone/k6.1/${PV}"
 
 SRC_URI = "git://git.ti.com/git/graphics/ti-img-rogue-driver.git;protocol=https;branch=${BRANCH}"
 
+SRC_URI:append = " file://0001-build-kbuild-Makefile.template-use-SECONDARY.patch"
+
 S = "${WORKDIR}/git"
 
 SRCREV = "778aa5d1e104f36c7f7c1f50e99f8499cbbdadbb"
-- 
2.17.1


