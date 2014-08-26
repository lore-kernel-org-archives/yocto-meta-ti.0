Return-Path: <Yasir_Khan@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F808E007F6; Tue, 26 Aug 2014 07:28:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DB57BE007CE
	for <meta-ti@yoctoproject.org>; Tue, 26 Aug 2014 07:28:00 -0700 (PDT)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XMHj6-000662-Nb from Yasir_Khan@mentor.com ;
	Tue, 26 Aug 2014 07:28:00 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 26 Aug 2014 07:28:00 -0700
From: Yasir-Khan <yasir_khan@mentor.com>
To: meta-ti@yoctoproject.org
Message-Id: <1409063251-47852-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 26 Aug 2014 14:28:00.0613 (UTC)
	FILETIME=[F0506150:01CFC139]
X-Mailman-Approved-At: Fri, 23 Dec 2016 15:51:53 -0800
Subject: [PATCH 3/5] linux-omap4: work around parallel firmware install bug
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
Date: Tue, 26 Aug 2014 14:28:01 -0000
X-Original-Date: Tue, 26 Aug 2014 19:27:31 +0500
X-List-Received-Date: Tue, 26 Aug 2014 14:28:01 -0000

See https://bugzilla.kernel.org/show_bug.cgi?id=39192.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 .../pandaboard/parallel-firmware-install.patch     |   13 +++++++++++++
 recipes-kernel/linux/linux-omap4_3.4.bb            |    1 +
 2 files changed, 14 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-omap4-3.4/pandaboard/parallel-firmware-install.patch

diff --git a/recipes-kernel/linux/linux-omap4-3.4/pandaboard/parallel-firmware-install.patch b/recipes-kernel/linux/linux-omap4-3.4/pandaboard/parallel-firmware-install.patch
new file mode 100644
index 0000000..6106768
--- /dev/null
+++ b/recipes-kernel/linux/linux-omap4-3.4/pandaboard/parallel-firmware-install.patch
@@ -0,0 +1,13 @@
+Upstream-Status: Pending
+
+--- git.orig/scripts/Makefile.fwinst
++++ git/scripts/Makefile.fwinst
+@@ -27,7 +27,7 @@ endif
+ installed-mod-fw := $(addprefix $(INSTALL_FW_PATH)/,$(mod-fw))
+ 
+ installed-fw := $(addprefix $(INSTALL_FW_PATH)/,$(fw-shipped-all))
+-installed-fw-dirs := $(sort $(dir $(installed-fw))) $(INSTALL_FW_PATH)/.
++installed-fw-dirs := $(sort $(dir $(installed-fw))) $(INSTALL_FW_PATH)/./
+ 
+ # Workaround for make < 3.81, where .SECONDEXPANSION doesn't work.
+ PHONY += $(INSTALL_FW_PATH)/$$(%) install-all-dirs
diff --git a/recipes-kernel/linux/linux-omap4_3.4.bb b/recipes-kernel/linux/linux-omap4_3.4.bb
index 52629de..d1613ee 100644
--- a/recipes-kernel/linux/linux-omap4_3.4.bb
+++ b/recipes-kernel/linux/linux-omap4_3.4.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://dev.omapzoom.org/pub/scm/integration/kernel-ubuntu.git;protocol
            file://defconfig \
            file://0003-ARM-7668-1-fix-memset-related-crashes-caused-by-rece.patch \
            file://0004-ARM-7670-1-fix-the-memset-fix.patch \
+           file://parallel-firmware-install.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
1.7.9.5


