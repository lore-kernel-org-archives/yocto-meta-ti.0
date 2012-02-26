Return-Path: <ebutera@gmail.com>
Received: from mail-ey0-f176.google.com (mail-ey0-f176.google.com
	[209.85.215.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6A37E0074A
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:33 -0800 (PST)
Received: by mail-ey0-f176.google.com with SMTP id i1so236761eaa.35
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:33 -0800 (PST)
Received-SPF: pass (google.com: domain of ebutera@gmail.com designates
	10.14.204.70 as permitted sender) client-ip=10.14.204.70; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of ebutera@gmail.com
	designates 10.14.204.70 as permitted sender)
	smtp.mail=ebutera@gmail.com;
	dkim=pass header.i=ebutera@gmail.com
Received: from mr.google.com ([10.14.204.70])
	by 10.14.204.70 with SMTP id g46mr6197077eeo.117.1330285173688
	(num_hops = 1); Sun, 26 Feb 2012 11:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=rS2ghp1aQO2N3tgSc00bnBcN+LtH3Mv6cZTkkgm+Npc=;
	b=nFeTcVqbIQ8OxDjat+zggllRRUe436Y4my8b44RGqtABsTNb5wY72GwL/GzDdS3dbZ
	0vqq5BLNUM79NMdoew4vJo3vLSNUYI5AqySUU+yQYiEJZi6WyBPpqCr+geIxW6b9vE0W
	cRc42BOnx1KgaymX5IPM59W2/0XKIfmS9w2AI=
Received: by 10.14.204.70 with SMTP id g46mr4663048eeo.117.1330285173601;
	Sun, 26 Feb 2012 11:39:33 -0800 (PST)
Received: from localhost.localdomain ([188.11.55.70])
	by mx.google.com with ESMTPS id v51sm48713599eef.2.2012.02.26.11.39.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 11:39:32 -0800 (PST)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Sun, 26 Feb 2012 20:39:10 +0100
Message-Id: <1330285154-14853-6-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
References: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
Subject: [RFC PATCH 5/9] libdce: add latest git version
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
X-List-Received-Date: Sun, 26 Feb 2012 19:39:34 -0000

Signed-off-by: Enrico Butera <ebutera@users.berlios.de>
---
 recipes-ti/libdce/libdce.inc    |   15 +++++++++++++++
 recipes-ti/libdce/libdce_git.bb |   11 +++++++++++
 2 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 recipes-ti/libdce/libdce.inc
 create mode 100644 recipes-ti/libdce/libdce_git.bb

diff --git a/recipes-ti/libdce/libdce.inc b/recipes-ti/libdce/libdce.inc
new file mode 100644
index 0000000..ebc14f3
--- /dev/null
+++ b/recipes-ti/libdce/libdce.inc
@@ -0,0 +1,15 @@
+DESCRIPTION = "distributed codec-engine shim"
+HOMEPAGE = "http://gitorious.org/gstreamer-omap/libdce"
+SECTION = "devel"
+LICENSE = "TI"
+
+COMPATIBLE_MACHINE = "(omap4430-panda|pandaboard)"
+
+require ../includes/ti-paths.inc
+require ../includes/ti-staging.inc
+
+inherit autotools
+
+DEPENDS = "ti-bios-syslink ti-syslink-omap4 libtimemmgr"
+RDEPENDS = "ti-bios-syslink ti-syslink-omap4 libtimemmgr"
+
diff --git a/recipes-ti/libdce/libdce_git.bb b/recipes-ti/libdce/libdce_git.bb
new file mode 100644
index 0000000..2eebf9a
--- /dev/null
+++ b/recipes-ti/libdce/libdce_git.bb
@@ -0,0 +1,11 @@
+require libdce.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=483f94bdaf5d31cd94aa2317f9ad2684"
+
+# 2011/12/08
+SRCREV = "334edb64b819623f5971aedd1a34b1fd4d59e5bf"
+
+SRC_URI = "git://gitorious.org/gstreamer-omap/libdce.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
-- 
1.7.5.4


