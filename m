Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02AEEE007EE; Mon, 20 Mar 2017 11:38:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2ED0E00726
	for <meta-ti@yoctoproject.org>; Mon, 20 Mar 2017 11:38:22 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D6C9C20B7B;
	Mon, 20 Mar 2017 18:38:20 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id cgx6ze85yFka; Mon, 20 Mar 2017 18:38:20 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A688D20999;
	Mon, 20 Mar 2017 18:38:19 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 2EEE5162414;
	Mon, 20 Mar 2017 14:38:19 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Mon, 20 Mar 2017 14:38:04 -0400
Message-Id: <1490035085-42076-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1490035085-42076-1-git-send-email-denys@ti.com>
References: <1490035085-42076-1-git-send-email-denys@ti.com>
Subject: [morty/master][PATCH 3/4] omapl138: rename old am180x platform into new generic omapl138-lcdk
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Mar 2017 18:38:26 -0000

Updated all corresponding defconfigs as well.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 conf/machine/{am180x-evm.conf => omapl138-lcdk.conf}                | 6 +++---
 recipes-kernel/linux/linux-ti-staging-4.9/omapl138/defconfig        | 1 +
 .../linux/linux-ti-staging-systest-4.9/omapl138/defconfig           | 1 +
 3 files changed, 5 insertions(+), 3 deletions(-)
 rename conf/machine/{am180x-evm.conf => omapl138-lcdk.conf} (66%)
 create mode 100644 recipes-kernel/linux/linux-ti-staging-4.9/omapl138/defconfig
 create mode 100644 recipes-kernel/linux/linux-ti-staging-systest-4.9/omapl138/defconfig

diff --git a/conf/machine/am180x-evm.conf b/conf/machine/omapl138-lcdk.conf
similarity index 66%
rename from conf/machine/am180x-evm.conf
rename to conf/machine/omapl138-lcdk.conf
index ef248a3..84e71d0 100644
--- a/conf/machine/am180x-evm.conf
+++ b/conf/machine/omapl138-lcdk.conf
@@ -1,11 +1,11 @@
 #@TYPE: Machine
-#@NAME: AM180x CPUs on an AM180x EVM board
-#@DESCRIPTION: Machine configuration for the TI AM180x EVM board
+#@NAME: OMAP-L138 LCDK
+#@DESCRIPTION: Machine configuration for the TI OMAP-L138 LCDK board
 
 require conf/machine/include/davinci.inc
 require conf/machine/include/omapl138.inc
 
-UBOOT_MACHINE = "da850_am18xxevm_config"
+UBOOT_MACHINE = "omapl138_lcdk_config"
 UBOOT_SUFFIX = "ais"
 
 UBOOT_ENTRYPOINT = "0xc0008000"
diff --git a/recipes-kernel/linux/linux-ti-staging-4.9/omapl138/defconfig b/recipes-kernel/linux/linux-ti-staging-4.9/omapl138/defconfig
new file mode 100644
index 0000000..b346785
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-4.9/omapl138/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_omapl138_release
diff --git a/recipes-kernel/linux/linux-ti-staging-systest-4.9/omapl138/defconfig b/recipes-kernel/linux/linux-ti-staging-systest-4.9/omapl138/defconfig
new file mode 100644
index 0000000..95b6116
--- /dev/null
+++ b/recipes-kernel/linux/linux-ti-staging-systest-4.9/omapl138/defconfig
@@ -0,0 +1 @@
+use-tisdk-config=ti_sdk_omapl138_debug
-- 
2.7.4


