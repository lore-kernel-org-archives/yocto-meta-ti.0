Return-Path: <pabigot@gmail.com>
Received: from mail-gy0-f176.google.com (mail-gy0-f176.google.com
	[209.85.160.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 184CBE013A2
	for <meta-ti@yoctoproject.org>; Tue, 31 Jan 2012 04:41:20 -0800 (PST)
Received: by mail-gy0-f176.google.com with SMTP id z2so607146ghb.35
	for <meta-ti@yoctoproject.org>; Tue, 31 Jan 2012 04:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=iQs63ZMsBQTIRnaaEZs7jN90RnW8uN9yPV675GeLdoY=;
	b=shvmzwtYKT6WXT0ntl79MmSLioMNoyq6F9DE/tUuDuEKpuwWZHVaTjivC/G+XFQnLg
	kG0sj04yDOL/8JiVZtazD7Hpv5nQPA1q5jBvLmjQm7J604qifZIwcj4WCkIhIKHcTOGq
	vB8EP/GPE+VlpAYOWbm78l/586zAOFI7EFkaM=
Received: by 10.236.154.137 with SMTP id h9mr34057734yhk.91.1328013679926;
	Tue, 31 Jan 2012 04:41:19 -0800 (PST)
Received: from localhost.localdomain (c-66-41-60-82.hsd1.mn.comcast.net.
	[66.41.60.82])
	by mx.google.com with ESMTPS id t13sm55432563anh.2.2012.01.31.04.41.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 31 Jan 2012 04:41:19 -0800 (PST)
Sender: Peter Bigot <pabigot@gmail.com>
From: "Peter A. Bigot" <bigotp@acm.org>
To: meta-ti@yoctoproject.org
Date: Tue, 31 Jan 2012 06:40:57 -0600
Message-Id: <1328013657-2069-5-git-send-email-bigotp@acm.org>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <1328013657-2069-1-git-send-email-bigotp@acm.org>
References: <1328013657-2069-1-git-send-email-bigotp@acm.org>
Subject: [PATCH 4/4] ti-dmai_svn: correct path within svn checkout
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
X-List-Received-Date: Tue, 31 Jan 2012 12:41:20 -0000

From: "Peter A. Bigot" <bigotp@acm.org>

At r642 as currently retrieved, the contents of ${S} are subdirectories dmai
and patches, so the subsequent attempt to run "make clean" in ${S} fails
because there is no Makefile there.  Append /dmai to the default ${S},
remove the now incorrect /dmai from LIC_FILES_CHKSUM, and correct the
strippath for the patches to reflect the new starting location.

Signed-off-by: Peter A. Bigot <bigotp@acm.org>
---
 recipes-ti/dmai/ti-dmai_svn.bb |    9 ++++++---
 1 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/recipes-ti/dmai/ti-dmai_svn.bb b/recipes-ti/dmai/ti-dmai_svn.bb
index 3c5595d..3ac7a81 100644
--- a/recipes-ti/dmai/ti-dmai_svn.bb
+++ b/recipes-ti/dmai/ti-dmai_svn.bb
@@ -1,11 +1,14 @@
 require ti-dmai.inc
 
+# Need to descend one level more to find source
+S = "${WORKDIR}/${DMAIBRANCH}/davinci_multimedia_application_interface/dmai_${PV}/dmai"
+
 # Hack to be able to use recent kernel headers from userspace
 TARGET_CC_ARCH += " -D__EXPORTED_HEADERS__"
 
 PV = "2_10_00_01+svnr${SRCPV}"
 
-LIC_FILES_CHKSUM = "file://dmai/dmai_${PV}_License.html;md5=3302f728a5a42f97cabc26a54d7fa607"
+LIC_FILES_CHKSUM = "file://dmai_${PV}_License.html;md5=3302f728a5a42f97cabc26a54d7fa607"
 
 # This package has high dependence on kernel, use kernel PR as base and append a local version
 PR = "${MACHINE_KERNEL_PR}"
@@ -29,7 +32,7 @@ SRCREV_omapl137       = "482"
 SRCREV_omapl138       = "570"
 SRCREV               ?= "UNDEFINED_SRCREV"
 
-SRC_URI_append = " file://omap3530-r642-remove-include-videodev.diff;striplevel=2 \
-                   file://r642-fix-config-bld.diff;striplevel=2 \
+SRC_URI_append = " file://omap3530-r642-remove-include-videodev.diff;striplevel=3 \
+                   file://r642-fix-config-bld.diff;striplevel=3 \
                  "
 
-- 
1.7.6.4


