Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f181.google.com (mail-we0-f181.google.com
	[74.125.82.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4ADE2E0030B
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 23 Dec 2011 05:07:40 -0800 (PST)
Received: by werm12 with SMTP id m12so4878403wer.26
	for <meta-ti@lists.yoctoproject.org>;
	Fri, 23 Dec 2011 05:07:39 -0800 (PST)
Received: by 10.216.132.81 with SMTP id n59mr8040280wei.28.1324645658989;
	Fri, 23 Dec 2011 05:07:38 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id
	en20sm31497813wid.10.2011.12.23.05.07.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Dec 2011 05:07:38 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Fri, 23 Dec 2011 14:07:32 +0100
Message-Id: <1324645652-2386-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] ti-dsplink: fix build with make 3.85 (e.g. fedora)
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
X-List-Received-Date: Fri, 23 Dec 2011 13:07:42 -0000

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 recipes-ti/dsplink/ti-dsplink.inc                  |    2 +-
 ...ve-check-for-make-version-3.85-works-fine.patch |   28 ++++++++++++++++++++
 recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb        |    4 ++-
 3 files changed, 32 insertions(+), 2 deletions(-)
 create mode 100644 recipes-ti/dsplink/ti-dsplink/0001-remove-check-for-make-version-3.85-works-fine.patch

diff --git a/recipes-ti/dsplink/ti-dsplink.inc b/recipes-ti/dsplink/ti-dsplink.inc
index 82fa5b2..9b23e5b 100644
--- a/recipes-ti/dsplink/ti-dsplink.inc
+++ b/recipes-ti/dsplink/ti-dsplink.inc
@@ -21,7 +21,7 @@ PROVIDES += "ti-dsplink-examples"
 
 # This package builds a kernel module, use kernel PR as base and append a local version
 PR = "${MACHINE_KERNEL_PR}"
-PR_append = "i"
+PR_append = "j"
 
 S = "${WORKDIR}/dsplink_linux_${PV}"
 
diff --git a/recipes-ti/dsplink/ti-dsplink/0001-remove-check-for-make-version-3.85-works-fine.patch b/recipes-ti/dsplink/ti-dsplink/0001-remove-check-for-make-version-3.85-works-fine.patch
new file mode 100644
index 0000000..70596c5
--- /dev/null
+++ b/recipes-ti/dsplink/ti-dsplink/0001-remove-check-for-make-version-3.85-works-fine.patch
@@ -0,0 +1,28 @@
+From a96aa25518f306138c71b3fc074381f102092a13 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Fri, 23 Dec 2011 10:58:47 +0100
+Subject: [PATCH] remove check for make version, 3.85 works fine
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+---
+ dsplink/make/start.mk |    4 ----
+ 1 files changed, 0 insertions(+), 4 deletions(-)
+
+diff --git a/dsplink/make/start.mk b/dsplink/make/start.mk
+index 0589f3c..a8f5740 100644
+--- a/dsplink/make/start.mk
++++ b/dsplink/make/start.mk
+@@ -39,10 +39,6 @@
+ #   EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+ #   ============================================================================
+ 
+-
+-# Check for MAKE version
+-$(if $(filter $(MAKE_VERSION), 3.81 3.81beta1 3.90 3.92),,\
+-$(error This makefile requires one of GNU make version 3.81 3.81beta1 3.90 3.92))
+ #   ============================================================================
+ #   Export the directory separator
+ #   ============================================================================
+-- 
+1.7.7.4
+
diff --git a/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb b/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb
index c2ca5d9..a124b21 100644
--- a/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb
+++ b/recipes-ti/dsplink/ti-dsplink_1.65.00.03.bb
@@ -7,7 +7,9 @@ PV_major = "1_65"
 
 PV_DL_PATH = "DSPLink/${PV_major}/${PV}/${PV_dot}"
 
-SRC_URI += "file://dsplink-BKL-fix.patch"
+SRC_URI += "file://dsplink-BKL-fix.patch \
+            file://0001-remove-check-for-make-version-3.85-works-fine.patch \
+           "
 
 SRC_URI[dsplinktarball.md5sum] = "1bda596b631bd2f517edc70f6be4f2ca"
 SRC_URI[dsplinktarball.sha256sum] = "4b1bda89bd8465b887f5bcdf7b95018bc1d1f8968c0c44f8cbad2a9e1c52bcb7"
-- 
1.7.2.5


