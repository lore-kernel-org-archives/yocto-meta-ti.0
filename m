Return-Path: <Yasir_Khan@mentor.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC27AE007FE; Tue, 26 Aug 2014 07:28:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9BB61E00655
	for <meta-ti@yoctoproject.org>; Tue, 26 Aug 2014 07:28:47 -0700 (PDT)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1XMHjr-0006Ac-FH from Yasir_Khan@mentor.com 
	for meta-ti@yoctoproject.org; Tue, 26 Aug 2014 07:28:47 -0700
Received: from svr-pkl-eng-06.pkl.mentorg.com ([137.202.156.65]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Tue, 26 Aug 2014 07:28:46 -0700
From: Yasir-Khan <yasir_khan@mentor.com>
To: meta-ti@yoctoproject.org
Message-Id: <1409063294-47952-1-git-send-email-yasir_khan@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-OriginalArrivalTime: 26 Aug 2014 14:28:47.0334 (UTC)
	FILETIME=[0C297060:01CFC13A]
X-Mailman-Approved-At: Fri, 23 Dec 2016 15:51:53 -0800
Subject: [PATCH 5/5] linux-mainline_3.2: apply patch to fix perf tools build failure
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
Date: Tue, 26 Aug 2014 14:28:50 -0000
X-Original-Date: Tue, 26 Aug 2014 19:28:14 +0500
X-List-Received-Date: Tue, 26 Aug 2014 14:28:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

See http://marc.info/?l=linux-kernel&m=133352922831735.

Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
---
 .../fix_getrusage_for_perf.patch                   |   33 ++++++++++++++++++++
 recipes-kernel/linux/linux-mainline_3.2.bb         |    1 +
 2 files changed, 34 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/fix_getrusage_for_perf.patch

diff --git a/recipes-kernel/linux/linux-mainline-3.2/fix_getrusage_for_perf.patch b/recipes-kernel/linux/linux-mainline-3.2/fix_getrusage_for_perf.patch
new file mode 100644
index 0000000..fb6a024
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/fix_getrusage_for_perf.patch
@@ -0,0 +1,33 @@
+commit 7b78f13603c6fcb64e020a0bbe31a651ea2b657b
+Author: Markus Trippelsdorf <markus@trippelsdorf.de>
+Date:   Wed Apr 4 10:45:27 2012 +0200
+
+    perf tools: Fix getrusage() related build failure on glibc trunk
+    
+    On a system running glibc trunk perf doesn't build:
+    
+        CC builtin-sched.o
+    builtin-sched.c: In function ‘get_cpu_usage_nsec_parent’: builtin-sched.c:399:16: error: storage size of ‘ru’ isn’t known builtin-sched.c:403:2: error: implicit declaration of function ‘getrusage’ [-Werror=implicit-function-declaration]
+        [...]
+    
+    Fix it by including sys/resource.h.
+    
+    Signed-off-by: Markus Trippelsdorf <markus@trippelsdorf.de>
+    Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
+    Link: http://lkml.kernel.org/r/20120404084527.GA294@x4
+    Signed-off-by: Ingo Molnar <mingo@kernel.org>
+
+Upstream-Status: Backport [3.4]
+
+diff --git a/tools/perf/builtin-sched.c b/tools/perf/builtin-sched.c
+index fb8b5f8..1cad3af 100644
+--- a/tools/perf/builtin-sched.c
++++ b/tools/perf/builtin-sched.c
+@@ -17,6 +17,7 @@
+ #include "util/debug.h"
+ 
+ #include <sys/prctl.h>
++#include <sys/resource.h>
+ 
+ #include <semaphore.h>
+ #include <pthread.h>
diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-kernel/linux/linux-mainline_3.2.bb
index 0d14ac8..59ef6ff 100644
--- a/recipes-kernel/linux/linux-mainline_3.2.bb
+++ b/recipes-kernel/linux/linux-mainline_3.2.bb
@@ -94,6 +94,7 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi
             file://defconfig \
             file://0003-ARM-7668-1-fix-memset-related-crashes-caused-by-rece.patch \
             file://0004-ARM-7670-1-fix-the-memset-fix.patch \
+            file://fix_getrusage_for_perf.patch \
          "
 
 SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \
-- 
1.7.9.5


