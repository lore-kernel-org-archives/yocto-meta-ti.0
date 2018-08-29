Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B630E00942; Tue, 28 Aug 2018 17:12:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48232E00848
	for <meta-ti@yoctoproject.org>; Tue, 28 Aug 2018 17:12:47 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BA727207AB;
	Wed, 29 Aug 2018 00:12:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id qpOBmzOypbK1; Wed, 29 Aug 2018 00:12:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 93C9220C5A;
	Wed, 29 Aug 2018 00:12:45 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 16A821635DF;
	Tue, 28 Aug 2018 20:12:45 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org
Date: Tue, 28 Aug 2018 20:12:42 -0400
Message-Id: <1535501562-9315-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535501562-9315-1-git-send-email-denys@ti.com>
References: <1535501562-9315-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 2/2] libgbm: fix undefined minor/major symbols with new glibc
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
X-List-Received-Date: Wed, 29 Aug 2018 00:12:48 -0000

glibc 2.28+ now requires this.
https://sourceware.org/bugzilla/show_bug.cgi?id=19239

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...de-sys-sysmacros.h-for-minor-major-in-new.patch | 28 ++++++++++++++++++++++
 recipes-graphics/gbm/libgbm_10.0.0.bb              |  3 ++-
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 recipes-graphics/gbm/libgbm/0001-gbm.c-include-sys-sysmacros.h-for-minor-major-in-new.patch

diff --git a/recipes-graphics/gbm/libgbm/0001-gbm.c-include-sys-sysmacros.h-for-minor-major-in-new.patch b/recipes-graphics/gbm/libgbm/0001-gbm.c-include-sys-sysmacros.h-for-minor-major-in-new.patch
new file mode 100644
index 0000000..31134ab
--- /dev/null
+++ b/recipes-graphics/gbm/libgbm/0001-gbm.c-include-sys-sysmacros.h-for-minor-major-in-new.patch
@@ -0,0 +1,28 @@
+From ea5fc8da36886490d0ee40d475733cd98e38c2ec Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 28 Aug 2018 18:35:55 -0400
+Subject: [PATCH] gbm.c: include <sys/sysmacros.h> for minor/major in new glibc
+
+glibc 2.28+ now requires this.
+https://sourceware.org/bugzilla/show_bug.cgi?id=19239
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ gbm.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/gbm.c b/gbm.c
+index c046b1a..9356d7b 100644
+--- a/gbm.c
++++ b/gbm.c
+@@ -35,6 +35,7 @@
+ #include <stdint.h>
+ 
+ #include <sys/types.h>
++#include <sys/sysmacros.h>
+ #include <sys/stat.h>
+ #include <unistd.h>
+ #include <errno.h>
+-- 
+2.7.4
+
diff --git a/recipes-graphics/gbm/libgbm_10.0.0.bb b/recipes-graphics/gbm/libgbm_10.0.0.bb
index 848a5f6..38715cc 100644
--- a/recipes-graphics/gbm/libgbm_10.0.0.bb
+++ b/recipes-graphics/gbm/libgbm_10.0.0.bb
@@ -12,6 +12,7 @@ BRANCH = "next"
 
 SRCREV = "96f37555c7e82a417b02051661377b10e6b3966e"
 
-SRC_URI = "git://git.ti.com/glsdk/libgbm.git;protocol=git;branch=${BRANCH}"
+SRC_URI = "git://git.ti.com/glsdk/libgbm.git;protocol=git;branch=${BRANCH} \
+            file://0001-gbm.c-include-sys-sysmacros.h-for-minor-major-in-new.patch"
 
 S = "${WORKDIR}/git"
-- 
2.7.4


