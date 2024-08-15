Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E669C52D7C
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 12:48:49 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.122416.1723726128235798745
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 15 Aug 2024 05:48:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=NpYJYLaj;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: reatmon@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 47FCml8s009770;
	Thu, 15 Aug 2024 07:48:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1723726127;
	bh=ayUOZZRkzoGpqi7GvsgBqcQqe7XguwbDUkZeg64baJc=;
	h=From:To:Subject:Date;
	b=NpYJYLajmT+/JTWBn40tOuEmjV6IuaNnEJT+klMVyop2mlmTZlvkRRmpL/UbWKOtB
	 XRDDZzDZ74PmCnN/fC3gIF3ukUeMp7IAuzbAK6xhIDnYG5qGQwmRJ9Fpofn/is0OVX
	 aUTSIPPplBWAXVTrJj9vgzNMcdt+f5z1sZBO4mIk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 47FCmlR6120043
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Aug 2024 07:48:47 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Aug 2024 07:48:46 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Aug 2024 07:48:47 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 47FCmkdA062617;
	Thu, 15 Aug 2024 07:48:46 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1seZuI-0007hH-PR; Thu, 15 Aug 2024 07:48:46 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master/scarthgap][RFC 1/2] classes: Create uboot-fragments.bbclass
Date: Thu, 15 Aug 2024 07:48:45 -0500
Message-ID: <20240815124846.29535-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 15 Aug 2024 12:48:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17940

Update our custom config fragment handling code to work with the new
UBOOT_CONFIG changes.  To better align with naming, change the name of
UBOOT_CONFIG_FRAGMENTS to just UBOOT_FRAGMENTS.  Also create a
UBOOT_FRAGMENTS_CONFIG that goes hand in hand with UBOOT_CONFIG so that
you can specify different fragments for each of the config types.

For example:

  UBOOT_CONFIG = "a b"
  UBOOT_CONFIG[a] = "config_a"
  UBOOT_CONFIG[b] = "config_b"

  UBOOT_FRAGMENTS_CONFIG[a] = ""
  UBOOT_FRAGMENTS_CONFIG[b] = "fragment1"

The logic in the class will automatically populate UBOOT_FRAGMENTS from
UBDOOT_FRAGMENTS_CONFIG.

Additionally, change the value that UBOOT_FRAGMENTS can take to be a
comma separated list of fragments to apply.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/classes/uboot-fragments.bbclass   | 77 +++++++++++++++++++
 .../recipes-bsp/u-boot/u-boot-mergeconfig.inc |  7 --
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |  4 +-
 3 files changed, 80 insertions(+), 8 deletions(-)
 create mode 100644 meta-ti-bsp/classes/uboot-fragments.bbclass
 delete mode 100644 meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc

diff --git a/meta-ti-bsp/classes/uboot-fragments.bbclass b/meta-ti-bsp/classes/uboot-fragments.bbclass
new file mode 100644
index 00000000..8db052fa
--- /dev/null
+++ b/meta-ti-bsp/classes/uboot-fragments.bbclass
@@ -0,0 +1,77 @@
+# Handle U-Boot config fragments for a machine
+#
+# This interacts with the UBOOT_CONFIG flow
+#
+# The format to specify it, in the machine, is:
+#
+# UBOOT_FRAGMENTS_CONFIG[foo] = "fragment[,fragment...]"
+#
+# or
+#
+# UBOOT_FRAGMENTS = "fragment[,fragment...]"
+#
+# Copyright 2024 (C) Texas Instruments, Inc.
+#
+# SPDX-License-Identifier: MIT
+
+python () {
+    loUbootConfig = (d.getVar('UBOOT_CONFIG') or "").split()
+    loUbootFragments = d.getVar('UBOOT_FRAGMENTS')
+    loUbootFragmentsConfigFlags = d.getVarFlags('UBOOT_FRAGMENTS_CONFIG')
+        
+    if loUbootFragmentsConfigFlags and loUbootFragments:
+        raise bb.parse.SkipRecipe("You cannot use UBOOT_FRAGMENTS and UBOOT_FRAGMENTS_CONFIG at the same time.")
+
+    if loUbootFragmentsConfigFlags is not None and len(loUbootConfig) > 0:
+        for lpConfig in loUbootConfig:
+            loFound = False
+            for lpFlag, lpValue in loUbootFragmentsConfigFlags.items():
+                if lpConfig == lpFlag: 
+                    loFound = True
+                    if lpValue == "":
+                        d.appendVar('UBOOT_FRAGMENTS', ' none')
+                    else:
+                        d.appendVar('UBOOT_FRAGMENTS', ' ' + lpValue)
+
+            if not loFound:
+                raise bb.parse.SkipRecipe("The selected UBOOT_CONFIG key %s has no match in %s." % (loUbootConfig, loUbootFragmentsConfigFlags.keys()))
+}
+
+uboot_configure_config:append () {
+   if [ -n "${UBOOT_FRAGMENTS}" ]
+   then
+        unset loTypeIdx
+        for lpType in ${UBOOT_CONFIG}; do
+            loTypeIdx=$(expr $loTypeIdx + 1)
+
+            if [ "${lpType}" == "${type}" ]; then
+                break
+            fi
+        done
+        
+        loApplyFragments=""
+        
+        for lpFragment in ${UBOOT_FRAGMENTS}; do
+            lpFragmentIdx=$(expr $lpFragmentIdx + 1)
+            if [ $y -eq $x ]; then
+                if [ "${lpFragment}" != "none" ]; then
+                    loApplyFragments=`echo ${lpFragment} | tr "," " "`
+                fi
+                break
+            fi
+        done
+
+        if [ -n "${loApplyFragments}" ]; then
+            oe_runmake -C ${S} O=${B}/${config} ${config} ${loApplyFragments}
+            oe_runmake -C ${S} O=${B}/${config} oldconfig
+        fi
+    fi
+}
+
+uboot_configure:append () {
+   if [ -n "${UBOOT_FRAGMENTS}" ] && [ -n "${UBOOT_MACHINE}" ]
+   then
+       oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE} `echo ${UBOOT_FRAGMENTS} | tr "," " "`
+       oe_runmake -C ${S} O=${B} oldconfig
+   fi
+}
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
deleted file mode 100644
index c7ce5047..00000000
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-mergeconfig.inc
+++ /dev/null
@@ -1,7 +0,0 @@
-do_configure:append () {
-   if [ -n "${UBOOT_CONFIG_FRAGMENTS}" ] && [ -n "${UBOOT_MACHINE}" ]
-   then
-       oe_runmake -C ${S} O=${B} ${UBOOT_MACHINE} ${UBOOT_CONFIG_FRAGMENTS}
-       oe_runmake -C ${S} O=${B} olddefconfig
-   fi
-}
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index bb50e1e9..5521ecee 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -1,3 +1,4 @@
+
 do_compile:prepend () {
     scm_version=$(printf '%s%s' -ti-g $(git -C ${S} rev-parse --verify HEAD 2>/dev/null | cut -c1-12))
 
@@ -10,7 +11,8 @@ SPL_BINARY ?= "MLO"
 
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot-common.inc
 require ${COREBASE}/meta/recipes-bsp/u-boot/u-boot.inc
-require u-boot-mergeconfig.inc
+
+inherit uboot-fragments
 
 FILESEXTRAPATHS:prepend := "${THISDIR}/u-boot:"
 
-- 
2.17.1


