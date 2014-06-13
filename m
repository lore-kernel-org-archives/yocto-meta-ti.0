Return-Path: <ashcharles@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3BA83E00BEC; Fri, 13 Jun 2014 15:34:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (ashcharles[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.220.42 listed in list.dnswl.org]
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A153EE00BB1
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 15:34:42 -0700 (PDT)
Received: by mail-pa0-f42.google.com with SMTP id lj1so2595831pab.1
	for <meta-ti@yoctoproject.org>; Fri, 13 Jun 2014 15:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=bqXkr9USZ9be1fVfe0CHiNtFccAaO1nhUHTI6ZQ+zek=;
	b=QbCTcZyqumH2Qevb7W4uQHNJbRK/9/te1eGJUzo9XZVgoTm2w0jfT5T2Mz7sRoiVt8
	Z7BK1yCA6VNUfa5UJ1FvjW18TG2dw+LwM2OFotQOzeV+NVMLLrWo54+gxwlfAlYo+L2c
	yG60cxEWBqQyhavBPaensXtOuiH5mgPl11hkJ/AMS/1qOFZU6aF2WXAQfs08IpV0zq0B
	ZapYLSDvXd8nR7Cyn1yep6bwsjYcgZGGwMsWyJ/lMAc/b6d0irY0rjmEn7sjY87oGbfS
	TwiXJlGXA8i7YlQjcg8zNXfyjjh+Nd/ncF4OjH6LTe9+ONFIK5t/UcHFB0fJ77s18sRZ
	R1og==
X-Received: by 10.68.222.196 with SMTP id qo4mr6814407pbc.14.1402698882330;
	Fri, 13 Jun 2014 15:34:42 -0700 (PDT)
Received: from gumstux.bchsia.telus.net (s206-116-3-18.bc.hsia.telus.net.
	[206.116.3.18]) by mx.google.com with ESMTPSA id
	xk1sm27397061pac.21.2014.06.13.15.34.41 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Jun 2014 15:34:41 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 13 Jun 2014 15:34:03 -0700
Message-Id: <1402698848-13759-1-git-send-email-ashcharles@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Cc: Scott Ellis <scott@jumpnowtek.com>
Subject: [PATCH 1/6] Remove deprecated update-modules from recipes
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
X-List-Received-Date: Fri, 13 Jun 2014 22:34:49 -0000

From: Scott Ellis <scott@jumpnowtek.com>

---
 recipes-ti/dsplink/ti-dsplink.inc                        | 16 ----------------
 .../local-power-manager/ti-local-power-manager.inc       | 13 -------------
 recipes-ti/syslink/ti-syslink.inc                        | 16 ----------------
 3 files changed, 45 deletions(-)

diff --git a/recipes-ti/dsplink/ti-dsplink.inc b/recipes-ti/dsplink/ti-dsplink.inc
index ce7cbf9..fa1c9dd 100644
--- a/recipes-ti/dsplink/ti-dsplink.inc
+++ b/recipes-ti/dsplink/ti-dsplink.inc
@@ -187,22 +187,6 @@ do_install () {
 
 PACKAGES =+ "ti-dsplink-module"
 FILES_ti-dsplink-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/dsplinkk.ko" 
-RDEPENDS_ti-dsplink-module += "update-modules"
-
-pkg_postinst_ti-dsplink-module () {
-#!/bin/sh
-if [ -n "$D" ]; then
-	exit 1
-fi
-
-depmod -a
-update-modules || true
-}
-
-pkg_postrm_ti-dsplink-module () {
-#!/bin/sh
-update-modules || true
-}
 
 PACKAGES += "ti-dsplink-examples"
 RDEPENDS_ti-dsplink-examples_append = " ti-dsplink-module"
diff --git a/recipes-ti/local-power-manager/ti-local-power-manager.inc b/recipes-ti/local-power-manager/ti-local-power-manager.inc
index 9155c76..2f2b525 100644
--- a/recipes-ti/local-power-manager/ti-local-power-manager.inc
+++ b/recipes-ti/local-power-manager/ti-local-power-manager.inc
@@ -113,19 +113,6 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 PACKAGES += "ti-lpm-module"
 FILES_ti-lpm-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/*lpm*ko"
 RDEPENDS_ti-lpm-module += "ti-dsplink-module"
-RDEPENDS_ti-lpm-module += "update-modules"
-
-pkg_postinst_ti-lpm-module_append () {
-        if [ -n "$D" ]; then
-                exit 1
-        fi
-        depmod -a
-        update-modules || true
-}
-
-pkg_postrm_ti-lpm-module_append () {
-        update-modules || true
-}
 
 PACKAGES += "ti-lpm-utils"
 RDEPENDS_ti-lpm-utils += "ti-lpm-module"
diff --git a/recipes-ti/syslink/ti-syslink.inc b/recipes-ti/syslink/ti-syslink.inc
index 70289d4..af5f896 100644
--- a/recipes-ti/syslink/ti-syslink.inc
+++ b/recipes-ti/syslink/ti-syslink.inc
@@ -216,22 +216,6 @@ do_install () {
 
 PACKAGES =+ "ti-syslink-module"
 FILES_ti-syslink-module = "/lib/modules/${KERNEL_VERSION}/kernel/drivers/dsp/syslink.ko" 
-RDEPENDS_ti-syslink-module += "update-modules"
-
-pkg_postinst_ti-syslink-module () {
-#!/bin/sh
-if [ -n "$D" ]; then
-	exit 1
-fi
-
-depmod -a
-update-modules || true
-}
-
-pkg_postrm_ti-syslink-module () {
-#!/bin/sh
-update-modules || true
-}
 
 PACKAGES =+ "ti-syslink-examples"
 RRECOMMENDS_ti-syslink-examples_append = " ti-syslink-module"
-- 
1.8.3.2


