Return-Path: <ebutera@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 23C9EE01490
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 12:26:26 -0700 (PDT)
Received: by mail-wg0-f54.google.com with SMTP id dt10so1969443wgb.11
	for <meta-ti@yoctoproject.org>; Fri, 12 Oct 2012 12:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=gJv2f6R+HV5UtihQrTWXdjJDs9BaJQDwUt+tfp5stdI=;
	b=lYr4xgPQuW+sKTQUX/kEv/5ZW5+PgSCPQsx1ZiN/TxbtuILpIkEUYIrxMzU0Y8CqHj
	3wP2eTIBiZsRTkZTitDE8kb2ychwLe/ieZZip+SEFo+JuWRJ+Wey8lxn8eRMHUd3xOfu
	iHUKvAAkVLBXyQb6iUmEKny9V0fTpoihdVUSnz6W/m9mCb8LEDav1PqpAWC4V6JIAynM
	F/umEv+f/t0/X9KrTqKzjjlONb5FZt9w4rqCCBpL/P6RyQr665coXgjcZZhek7uSphAE
	wjudd7F0SGZUKcBz6EGfWSsoYOlZwJ13KOlYC2awzsfPv0LQptx935MGRV3hsKz/DgQw
	RE8Q==
Received: by 10.180.94.226 with SMTP id df2mr8155358wib.11.1350069986215;
	Fri, 12 Oct 2012 12:26:26 -0700 (PDT)
Received: from localhost.localdomain ([188.11.142.65])
	by mx.google.com with ESMTPS id dm3sm5296065wib.3.2012.10.12.12.26.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 12 Oct 2012 12:26:25 -0700 (PDT)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Fri, 12 Oct 2012 21:26:10 +0200
Message-Id: <1350069972-21318-4-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
References: <1350069972-21318-1-git-send-email-ebutera@users.berlios.de>
Subject: [PATCH v2 4/6] libdce: add version 1.6.5.3
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
X-List-Received-Date: Fri, 12 Oct 2012 19:26:27 -0000

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 recipes-ti/dce/libdce.inc        |   11 +++++++++++
 recipes-ti/dce/libdce_1.6.5.3.bb |   12 ++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 recipes-ti/dce/libdce.inc
 create mode 100644 recipes-ti/dce/libdce_1.6.5.3.bb

diff --git a/recipes-ti/dce/libdce.inc b/recipes-ti/dce/libdce.inc
new file mode 100644
index 0000000..b135621
--- /dev/null
+++ b/recipes-ti/dce/libdce.inc
@@ -0,0 +1,11 @@
+DESCRIPTION = "TI Ducati IVA-HD hardware codec acceleration API"
+HOMEPAGE = "http://gitorious.org/ubuntu-omap/dce"
+SECTION = "multimedia"
+LICENSE = "TI"
+
+COMPATIBLE_MACHINE = "omap4"
+
+inherit autotools
+
+DEPENDS = "libdrm"
+RDEPENDS = "ti-firmware-ipu-dce"
diff --git a/recipes-ti/dce/libdce_1.6.5.3.bb b/recipes-ti/dce/libdce_1.6.5.3.bb
new file mode 100644
index 0000000..c1b4c65
--- /dev/null
+++ b/recipes-ti/dce/libdce_1.6.5.3.bb
@@ -0,0 +1,12 @@
+require libdce.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=483f94bdaf5d31cd94aa2317f9ad2684"
+
+PV = "1.6.5.3+gitr${SRCPV}"
+
+# 2012/09/19: add wayland support
+SRCREV = "f8ceaa494055a5a35753e721c4bc62182bd56dd3"
+
+SRC_URI = "git://gitorious.org/gstreamer-omap/libdce.git;protocol=git"
+
+S = "${WORKDIR}/git"
-- 
1.7.9.5


