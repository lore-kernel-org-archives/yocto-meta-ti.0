Return-Path: <ebutera@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EDD7E013A5
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:28 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id e49so869394eek.35
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:27 -0800 (PST)
Received-SPF: pass (google.com: domain of ebutera@gmail.com designates
	10.213.19.133 as permitted sender) client-ip=10.213.19.133; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of ebutera@gmail.com
	designates 10.213.19.133 as permitted sender)
	smtp.mail=ebutera@gmail.com;
	dkim=pass header.i=ebutera@gmail.com
Received: from mr.google.com ([10.213.19.133])
	by 10.213.19.133 with SMTP id a5mr3052897ebb.72.1330285167925 (num_hops
	= 1); Sun, 26 Feb 2012 11:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=b6qTTVu54Hbj1O09T5DTbqeZFRr1lwzzSDEcIEndvos=;
	b=Uuzsg5q723e4AFOyMI3BV7y/PXwiOKqkF99DsGFi37/eDIV+MTg96OkVqdB4EmBcXC
	RZf4hdw6PuYj8FLtoUWJalqEYfxbkv9l+Dy0NNMJJPOzQuoD0X38vYrop3eQPBskZtsR
	r8Zi+ctMfzRMKcRBLcJ0QKKG1L9RK9wvFrpQg=
Received: by 10.213.19.133 with SMTP id a5mr2304528ebb.72.1330285167838;
	Sun, 26 Feb 2012 11:39:27 -0800 (PST)
Received: from localhost.localdomain ([188.11.55.70])
	by mx.google.com with ESMTPS id v51sm48713599eef.2.2012.02.26.11.39.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 11:39:27 -0800 (PST)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Sun, 26 Feb 2012 20:39:07 +0100
Message-Id: <1330285154-14853-3-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
References: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
Subject: [RFC PATCH 2/9] libtimemmgr: add latest git version
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Feb 2012 19:39:28 -0000

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 recipes-ti/tiler/libtimemmgr.inc    |   15 +++++++++++++++
 recipes-ti/tiler/libtimemmgr_git.bb |   14 ++++++++++++++
 2 files changed, 29 insertions(+), 0 deletions(-)
 create mode 100644 recipes-ti/tiler/libtimemmgr.inc
 create mode 100644 recipes-ti/tiler/libtimemmgr_git.bb

diff --git a/recipes-ti/tiler/libtimemmgr.inc b/recipes-ti/tiler/libtimemmgr.inc
new file mode 100644
index 0000000..dba4b9e
--- /dev/null
+++ b/recipes-ti/tiler/libtimemmgr.inc
@@ -0,0 +1,15 @@
+DESCRIPTION = "TI Tiler memory manager"
+HOMEPAGE = "http://git.omapzoom.org/?p=platform/hardware/ti/tiler.git;a=summary"
+SECTION = "multimedia"
+LICENSE = "TI"
+
+COMPATIBLE_MACHINE = "(omap4430-panda|pandaboard)"
+
+require ../includes/ti-paths.inc
+require ../includes/ti-staging.inc
+
+inherit autotools
+
+#DEPENDS = "ti-bios-syslink ti-syslink"
+#RDEPENDS = "ti-bios-syslink ti-syslink"
+
diff --git a/recipes-ti/tiler/libtimemmgr_git.bb b/recipes-ti/tiler/libtimemmgr_git.bb
new file mode 100644
index 0000000..a01713f
--- /dev/null
+++ b/recipes-ti/tiler/libtimemmgr_git.bb
@@ -0,0 +1,14 @@
+require libtimemmgr.inc
+
+LIC_FILES_CHKSUM = "file://tiler.h;beginline=1;endline=34;md5=fbf05e708efe0b38ce01e0fd3ece63c4"
+
+# 2011/06/26: MEMMGR: Fix compile errors with new toolchain
+SRCREV = "a6dda467f9689cb8c4e2c252f53524afd07c2392"
+
+SRC_URI = "git://git.omapzoom.org/platform/hardware/ti/tiler.git;protocol=git;branch=memmgr_2.0"
+
+PR = "r1"
+PV = "2.0+gitr${SRCPV}"
+
+S = "${WORKDIR}/git"
+
-- 
1.7.5.4


