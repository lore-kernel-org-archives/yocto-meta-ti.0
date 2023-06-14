Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B725EB64D9
	for <webhook@archiver.kernel.org>; Wed, 14 Jun 2023 17:37:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.19261.1686764276029685054
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 14 Jun 2023 10:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=uxNP8pm1;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 35EHbsvF063037;
	Wed, 14 Jun 2023 12:37:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1686764274;
	bh=sHSOSG39p+jBiY79ebQZSfr285yGQsxbgWHoy1VAUnk=;
	h=From:To:Subject:Date;
	b=uxNP8pm1S5gX1PnqArMlYGt9MxR/Thj5tUfqAuGQp6QDvJ3af3x3lHTwQN3gqG3Fr
	 jaWy2/Kk+pBeo1pyceiWckpqzmmYooj013P/JwjFIiESDUFsKCE7eJp/WEVh1BM52c
	 jh6zd1gO+0oO0FghvNs6Siosk/+uiaC2AUWcs8JU=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 35EHbs8j128986
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Jun 2023 12:37:54 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Jun 2023 12:37:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Jun 2023 12:37:54 -0500
Received: from uda0214219 (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 35EHbsSD112325;
	Wed, 14 Jun 2023 12:37:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1q9URO-00014p-6V; Wed, 14 Jun 2023 12:37:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/kirkstone][PATCH] ti-extras: Add support for extra kernel/u-boot features
Date: Wed, 14 Jun 2023 12:37:54 -0500
Message-ID: <20230614173754.4100-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 14 Jun 2023 17:37:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16726

From: Paresh Bhagat <p-bhagat@ti.com>

There are some features that will either never be accepted into the
upstream kernel, or are not ready to be accepted.  ti-extras allows for
controlling the kernel and u-boot repos, breanches, and srcrevs to gain
access to those features via the TI_EXTRAS variable in the local.conf
file.

Initial support for TI_EXTRAS=tie-jailhouse is being added by this
patch.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
Acked-by: Paresh Bhagat <p-bhagat@ti.com>
Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf      |  1 +
 meta-ti-bsp/conf/machine/am62xx-evm.conf           |  1 +
 meta-ti-bsp/conf/machine/include/ti-extras.inc     |  5 +++++
 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc       | 12 ++++++++++++
 .../u-boot/u-boot-ti-staging_2023.04.bb            |  2 ++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc       |  2 +-
 .../recipes-kernel/linux/linux-ti-staging_6.1.bb   |  7 ++++---
 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc     | 14 ++++++++++++++
 .../recipes-ti/jailhouse/jailhouse_git.bb          |  2 ++
 9 files changed, 42 insertions(+), 4 deletions(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/ti-extras.inc
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/ti-extras.inc

diff --git a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
index 9889ae38..548369ca 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm-k3r5.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for the TI AM62xx EVM (R5F core)
 
 require conf/machine/include/k3r5.inc
+require conf/machine/include/ti-extras.inc
 
 SYSFW_SOC = "am62x"
 SYSFW_CONFIG = "evm"
diff --git a/meta-ti-bsp/conf/machine/am62xx-evm.conf b/meta-ti-bsp/conf/machine/am62xx-evm.conf
index c4357be3..082a1ae7 100644
--- a/meta-ti-bsp/conf/machine/am62xx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62xx-evm.conf
@@ -3,6 +3,7 @@
 #@DESCRIPTION: Machine configuration for the TI AM62XX EVM
 
 require conf/machine/include/am62xx.inc
+require conf/machine/include/ti-extras.inc
 
 KERNEL_DEVICETREE_PREFIX = "ti/k3-am625"
 
diff --git a/meta-ti-bsp/conf/machine/include/ti-extras.inc b/meta-ti-bsp/conf/machine/include/ti-extras.inc
new file mode 100644
index 00000000..db9d0826
--- /dev/null
+++ b/meta-ti-bsp/conf/machine/include/ti-extras.inc
@@ -0,0 +1,5 @@
+# Add TI_EXTRAS to machine overrides so we get access to e.g. 'jailhouse'
+
+TI_EXTRAS ??= ""
+MACHINEOVERRIDES =. "${@ '${TI_EXTRAS}:' if d.getVar('TI_EXTRAS').startswith('tie-') else ''}"
+
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
new file mode 100644
index 00000000..3a016c6c
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/ti-extras.inc
@@ -0,0 +1,12 @@
+
+# This will have priority over generic uboot path
+
+COMPATIBLE_MACHINE = "am62xx"
+
+BRANCH = "ti-u-boot-2023.04"
+BRANCH:tie-jailhouse = "ti-u-boot-2023.04-jailhouse"
+
+SRCREV = "010afc1fe7a1412f92363c8af69c848d76a53e42"
+SRCREV:tie-jailhouse = "79615e1c99b9aa73948f811f5f866cff2e34dc37"
+
+UBOOT_GIT_URI = "git://git.ti.com/git/processor-sdk/u-boot.git"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
index f4c5e88c..4bde0256 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2023.04.bb
@@ -1,5 +1,7 @@
 require u-boot-ti.inc
 
+include ${@ 'recipes-bsp/u-boot/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
+
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=2ca5f2c35c8cc335f0a19756634782f1"
 
 PR = "r0"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index f29b089e..f3285c23 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -16,7 +16,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=30503fd321432fc713238f582193b78e"
 
 BRANCH ?= "master"
-UBOOT_GIT_URI = "git://git.ti.com/git/ti-u-boot/ti-u-boot.git"
+UBOOT_GIT_URI ?= "git://git.ti.com/git/ti-u-boot/ti-u-boot.git"
 UBOOT_GIT_PROTOCOL = "https"
 SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};branch=${BRANCH}"
 
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
index 0b36575b..688b8690 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.1.bb
@@ -9,6 +9,7 @@ require recipes-kernel/linux/setup-defconfig.inc
 require recipes-kernel/linux/kernel-rdepends.inc
 require recipes-kernel/linux/ti-kernel.inc
 include ${@ 'recipes-kernel/linux/ti-kernel-devicetree-prefix.inc' if d.getVar('KERNEL_DEVICETREE_PREFIX') else ''}
+include ${@ 'recipes-kernel/linux/ti-extras.inc' if d.getVar('TI_EXTRAS') else ''}
 
 DEPENDS += "gmp-native libmpc-native"
 
@@ -20,16 +21,16 @@ KERNEL_EXTRA_ARGS += "LOADADDR=${UBOOT_ENTRYPOINT} \
 
 S = "${WORKDIR}/git"
 
-BRANCH = "ti-linux-6.1.y"
+BRANCH ?= "ti-linux-6.1.y"
 
-SRCREV = "7124dee9779a40c52c52331c3ba6ccc84f357380"
+SRCREV ?= "7124dee9779a40c52c52331c3ba6ccc84f357380"
 PV = "6.1.26+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR:append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
-KERNEL_GIT_URI = "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
+KERNEL_GIT_URI ?= "git://git.ti.com/git/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "https"
 SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
             file://defconfig"
diff --git a/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
new file mode 100644
index 00000000..2bb88b13
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/ti-extras.inc
@@ -0,0 +1,14 @@
+
+# Use different commit, repo and branch for TI extras build
+# This will have priority over generic rt path
+
+COMPATIBLE_MACHINE = "am62xx"
+
+BRANCH = "ti-linux-6.1.y"
+BRANCH:tie-jailhouse = "ti-linux-6.1.y-jailhouse"
+
+SRCREV = "30bcc25e7cb1b25667db88d61828728f0f0b5f4b"
+SRCREV:tie-jailhouse = "0ed0dec2462b805b0188fe080895adc437871549"
+
+KERNEL_GIT_URI = "git://git.ti.com/git/processor-sdk/linux.git"
+
diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
index 05cc21b3..1c63b400 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse_git.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=9fa7f895f96bde2d47fd5b7d95b6ba4d \
 "
 
+COMPATIBLE_MACHINE = "am62xx"
+
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 PV = "0.12+git${SRCPV}"
-- 
2.17.1


