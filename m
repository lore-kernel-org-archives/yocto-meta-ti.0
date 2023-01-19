Return-Path: <matthias.schiffer@ew.tq-group.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B962C004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 10:30:20 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by mx.groups.io with SMTP id smtpd.web11.42492.1674124208987276062
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 02:30:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@tq-group.com header.s=key1 header.b=MiJITYA6;
 spf=pass (domain: ew.tq-group.com, ip: 93.104.207.81, mailfrom: matthias.schiffer@ew.tq-group.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674124210; x=1705660210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wsoVayWnJm78fpcaTMGmQNyi/ncLu2FjKoVPXrmDsMA=;
  b=MiJITYA6QWfPGFBVQ0H5LWJkpehC2vjzNFd2yp1Di61PURDeYfpJvFzB
   +ZmM+FFvL5AeMlL3oSdl5y9BhvYw+IhFclpzoaptslxE8Q8GKN59T260w
   Job0CgzOXoTJ9mn4jJ5JN0GYUPmiCggQMU6ZdK5k/P5qwhschJSBAJhFQ
   +7biFTTETzwy5xOXigBYu3lHlatYvOniA2YMl590IX4bC+h5Ag5vPf0z0
   U85RL2ZaUXe6WxB+VecguLFxUeZqXulmiqclaqwZLt32IwlchnegnP3Ly
   glEmJxuBqhiO1kpofzaWPsIvv24SqnzMVpdNynFE72SV/sCp8MqfwNohJ
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,228,1669071600"; 
   d="scan'208";a="28529006"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 19 Jan 2023 11:30:05 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 19 Jan 2023 11:30:05 +0100
X-PGP-Universal: processed;
	by tq-pgp-pr1.tq-net.de on Thu, 19 Jan 2023 11:30:05 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1674124205; x=1705660205;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=wsoVayWnJm78fpcaTMGmQNyi/ncLu2FjKoVPXrmDsMA=;
  b=WFOr/rTqBhBpMtjiKxlK5zqZRcn5m6b/m9qKMMpouKICzadXc0sB4XPB
   8fmy7+W77ApEHTiJtm5COQWSpabykJnZThkoKrCkXAEMyUzp5d7lDrS3V
   ZKa7OgE5hB/8Uhw3/9n1d7yIFrsLteQK1+2xqhnVNfGcM3OPUa4RcBg+Q
   85Eyjg9y/WY324NYCfNo1igrW6TR1VnC7jXi9QeQWRLbivAYJ9KeHdIQ8
   fDd6JRV38+IMGhWQpcQ7+LYoSCzeMQ1hohMmkwQ89NXiKcFAr7Ia6q+ml
   QrE0MRzUZWgIkIlBvWfOTUWlbvGNYOD6ekr7EnnEUe8RKgDHcBIb3P/AX
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,228,1669071600"; 
   d="scan'208";a="28529004"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Jan 2023 11:30:05 +0100
Received: from localhost.localdomain (SCHIFFERM-M2.tq-net.de [10.121.49.14])
	by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 9FD9D280072;
	Thu, 19 Jan 2023 11:30:05 +0100 (CET)
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: meta-ti@lists.yoctoproject.org
Cc: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [master/kirkstone][PATCH v2 2/2] ti-sgx-ddk-um: use udev for userspace initialization
Date: Thu, 19 Jan 2023 11:29:52 +0100
Message-Id: <20230119102952.8161-2-matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230119102952.8161-1-matthias.schiffer@ew.tq-group.com>
References: <20230119102952.8161-1-matthias.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Jan 2023 10:30:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15592

The ti-sgx-ddk driver requires an additional userspace initialization
step after the kernel module has probed the device. Without this
initialization, no EGL context can be created and Weston etc. will fail to
start.

The driver package contains an init script, but this does not work on pure
systemd-based systems without sysvinit compat support (as provided by the
systemd-compat-units package). Introduce an enabled-by-default
PACKAGECONFIG that installs a udev rule instead to run the init command
automatically when the driver is loaded, solving the issue without
depending on a specific init system. On builds without udev, this
PACKAGECONFIG can be disabled, reverting to the old init script-based
solution.

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

v2: applied review suggestions:
- Removed 'local' shell directive from recipe
- Improved commit description

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
index bd88d14d..bc56e705 100644
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
 
+    without_sysvinit=${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'false', 'true', d)}
+    with_udev=${@bb.utils.contains('PACKAGECONFIG', 'udev', 'true', 'false', d)}
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


