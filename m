Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CCF1C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 13:02:04 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.12458.1671195719960518389
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 16 Dec 2022 05:02:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=KLODT51u;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671195721; x=1702731721;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sMM11WPLpryqkrtIJsvXH3omXTGM5dPCR+1a/U7WuEg=;
  b=KLODT51uYyC0ppI3/XtILvKuPp84FAW0ZndTfm1SvIjju4SkHtqJdEhG
   rDy/5cbpjV3ASnFjF1FZY8E34/DyKMI6/fk0wobmIV4Yx/uWsxwr5Yf5Q
   d35t2fPYXmPYIsJaVWGGdY5J5xqGAh9IC8SX0aulCvH6r+AWa07id4tjM
   pH8KiSt8XGBkwaoDBlzZ6cuYG1P2Jei72M6LSCGuBnS9LjKU+49RI3H6V
   Ab8JuDlYtidrZuvsbtshzK451S6RYKe5mgextA4FejWhC5sRUcV6L1pWL
   ZtCQHtTJiUfJ38SlTMT/Kcwd02i7+/ZDQPHwpreLBK0vtpJel8B17Tpmo
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,249,1665439200"; 
   d="scan'208";a="28000879"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Dec 2022 14:01:57 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 16 Dec 2022 14:01:57 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Fri, 16 Dec 2022 14:01:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1671195717; x=1702731717;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sMM11WPLpryqkrtIJsvXH3omXTGM5dPCR+1a/U7WuEg=;
  b=Oa8zGjD+mK9QYoBfBbCJ2hDBP5IodIHHTm+VvMYDnceJF5zy/ztrSQiT
   pR/MtROxNNf6iHapqwkT6FRG0GzCT3LOyPkLaz1IEEx0CsH2Yhsn5K0s4
   UpiOrXJPBHSkhnmxM/saMaK0ph9IgJC2IJhvXNYzq8zQHs7eoNpvudRfp
   VmeOGztp2dhuI/lFcmerk/gRRJdFbesa5qvTKgAHQC/jiJuYbi9R9KXJo
   HI0TbDrHCA2N8VfTlfqZl/cYGkMeTSMms18FWLrTd0EAiKYw/BHlDkpJc
   dgkZsK9hlHBtyi29ZCSz7Z4dC7c8HhypKTGXeqE3wTqceD4l9tiBncLc9
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,249,1665439200"; 
   d="scan'208";a="28000877"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Dec 2022 14:01:57 +0100
Received: from localhost.localdomain (SCHIFFERM-M2.tq-net.de [10.121.49.14])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id AC6E0280072;
	Fri, 16 Dec 2022 14:01:57 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: meta-ti@lists.yoctoproject.org
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [master/kirkstone][PATCH 2/2] ti-sgx-ddk-um: use udev for userspace initialization
Date: Fri, 16 Dec 2022 14:01:39 +0100
Message-Id: <20221216130139.20841-2-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221216130139.20841-1-matthias.schiffer@ew.tq-group.com>
References: <20221216130139.20841-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 16 Dec 2022 13:02:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15487

The ti-sgx-ddk driver requires an additional userspace initialization
step after the kernel module has probed the device. Without this
initialization, no EGL context can be created and Weston etc. will fail to
start.

The driver package contains an init script, but this does not work on
systemd-based systems. Introduce an enabled-by-default PACKAGECONFIG that
installs a udev rule instead to run the init command automatically when
the driver is loaded, solving the issue without depending on a specific
init system.

udev reports several events when the pvrsrvkm module is loaded:

- add event for the kernel module
- add events for two DRM devices
- bind event for the GPU platform device

The DRM devices aren't nice to match on, and the kernel module add is
too early to run `pvrsrvctl --start`, so we trigger on the platform
device bind.

Tested with Weston 9.0.0 on the AM65x-based TQ-Systems MBa65xx.

Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
---
 .../libgles/ti-sgx-ddk-um/pvrsrvkm.rules      |  1 +
 .../libgles/ti-sgx-ddk-um_1.17.4948957.bb     | 23 ++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules

diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
new file mode 100644
index 00000000..e49fd9b8
--- /dev/null
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um/pvrsrvkm.rules
@@ -0,0 +1 @@
+SUBSYSTEM=="platform", ACTION=="bind", ENV{DRIVER}=="pvrsrvkm", RUN+="/usr/bin/pvrsrvctl --start --no-module"
diff --git a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
index bd88d14d..2a8a0466 100644
--- a/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
+++ b/meta-ti-bsp/recipes-graphics/libgles/ti-sgx-ddk-um_1.17.4948957.bb
@@ -14,7 +14,10 @@ PR = "r37"
 
 BRANCH = "ti-img-sgx/dunfell/${PV}"
 
-SRC_URI = "git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH}"
+SRC_URI = " \
+    git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;protocol=https;branch=${BRANCH} \
+    file://pvrsrvkm.rules \
+"
 SRCREV = "742cf38aba13e1ba1a910cf1f036a1a212c263b6"
 
 TARGET_PRODUCT:omap-a15 = "jacinto6evm"
@@ -27,6 +30,9 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
+PACKAGECONFIG ??= "udev"
+PACKAGECONFIG[udev] = ",,,udev"
+
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 virtual/libgbm"
 
 DEPENDS += "libdrm udev wayland wayland-protocols libffi expat"
@@ -56,6 +62,20 @@ do_install () {
     oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
     ln -sf libGLESv2.so.2 ${D}${libdir}/libGLESv2.so.1
 
+    local without_sysvinit=${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}
+    local with_udev=${@bb.utils.contains('PACKAGECONFIG', 'udev', 'true', 'false', d)}
+
+    # Delete initscript if it is not needed or would conflict with the udev rules
+    if $without_sysvinit || $with_udev; then
+        rm -rf ${D}${sysconfdir}/init.d
+        rmdir --ignore-fail-on-non-empty ${D}${sysconfdir}
+    fi
+
+    if $with_udev; then
+        install -m644 -D ${WORKDIR}/pvrsrvkm.rules \
+            ${D}${nonarch_base_libdir}/udev/rules.d/80-pvrsrvkm.rules
+    fi
+
     chown -R root:root ${D}
 }
 
@@ -63,6 +83,7 @@ FILES:${PN} =  "${bindir}/*"
 FILES:${PN} += " ${libdir}/*"
 FILES:${PN} +=  "${includedir}/*"
 FILES:${PN} +=  "${sysconfdir}/*"
+FILES:${PN} += "${nonarch_base_libdir}/udev/rules.d"
 
 INSANE_SKIP:${PN} += "dev-so ldflags useless-rpaths"
 INSANE_SKIP:${PN} += "already-stripped dev-deps"
-- 
2.34.1


