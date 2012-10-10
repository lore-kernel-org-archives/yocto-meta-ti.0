Return-Path: <ebutera@gmail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B5DBE013DB
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 16:41:00 -0700 (PDT)
Received: by mail-wg0-f54.google.com with SMTP id dt10so698739wgb.11
	for <meta-ti@yoctoproject.org>; Wed, 10 Oct 2012 16:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Fbn+pa0GnS87gFDcHPcBWH9CaZmgE8/g2AOARHmAu/U=;
	b=aV02qz7RtQvSZkk5deVNSVdYeB75Aibj4RUHCjD9MBvVDQmcK2Hg9XBRYmW4MnFXEP
	am5N5eZpne6FPMSUZ8vJkeFvotKzozHfZ7yDXPZelajAMqprIQU1iJT3VTu54aiDkBC6
	2WuaovUED+FmKEBr+hE9CIYEBhxj5Y96YEoP+8C5F/ffJ1evfbjeAmw4664JHn03pPzZ
	7PC8c3HquXMApvaIzazsSNN3CWOvFxNWKyiaVOB09hpEaiqrHPomC9XJhzyiMTGMzT8g
	veoZ4WaJui9vUVCQ542CzF4uRgh2Xsyou29mnHL9S8Nwmf44h/5i5zhCnrEWHdx7CiX7
	bpfA==
Received: by 10.216.193.158 with SMTP id k30mr15521203wen.89.1349912460168;
	Wed, 10 Oct 2012 16:41:00 -0700 (PDT)
Received: from localhost.localdomain ([188.11.142.65])
	by mx.google.com with ESMTPS id v3sm5459401wiy.5.2012.10.10.16.40.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 10 Oct 2012 16:40:59 -0700 (PDT)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Thu, 11 Oct 2012 01:40:31 +0200
Message-Id: <1349912433-21880-4-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
Subject: [PATCH 4/6] libdce: add version 1.6.5.3
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
X-List-Received-Date: Wed, 10 Oct 2012 23:41:00 -0000

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 recipes-ti/dce/libdce.inc        |   14 ++++++++++++++
 recipes-ti/dce/libdce_1.6.5.3.bb |   12 ++++++++++++
 2 files changed, 26 insertions(+)
 create mode 100644 recipes-ti/dce/libdce.inc
 create mode 100644 recipes-ti/dce/libdce_1.6.5.3.bb

diff --git a/recipes-ti/dce/libdce.inc b/recipes-ti/dce/libdce.inc
new file mode 100644
index 0000000..1caa337
--- /dev/null
+++ b/recipes-ti/dce/libdce.inc
@@ -0,0 +1,14 @@
+DESCRIPTION = "TI Ducati IVA-HD hardware codec acceleration API"
+HOMEPAGE = "http://gitorious.org/ubuntu-omap/dce"
+SECTION = "multimedia"
+LICENSE = "TI"
+
+COMPATIBLE_MACHINE = "pandaboard"
+
+require ../includes/ti-paths.inc
+require ../includes/ti-staging.inc
+
+inherit autotools
+
+DEPENDS = "libdrm"
+RDEPENDS = "libdrm ti-firmware-ipu-dce"
diff --git a/recipes-ti/dce/libdce_1.6.5.3.bb b/recipes-ti/dce/libdce_1.6.5.3.bb
new file mode 100644
index 0000000..ab721ca
--- /dev/null
+++ b/recipes-ti/dce/libdce_1.6.5.3.bb
@@ -0,0 +1,12 @@
+require libdce.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=483f94bdaf5d31cd94aa2317f9ad2684"
+
+PV = "1.6.5.3+gitr${SRCPV}"
+
+# 2012/09/19: Merge remote-tracking branch 'remotes/ti/master' into upstream
+SRCREV = "c0cf50d4dece4b8d3606f7a1e065958941b4a672"
+
+SRC_URI = "git://gitorious.org/ubuntu-omap/dce.git;protocol=git"
+
+S = "${WORKDIR}/git"
-- 
1.7.9.5


