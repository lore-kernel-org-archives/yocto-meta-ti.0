Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6F2DE009CC; Tue,  2 Jun 2015 18:40:07 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,RDNS_DYNAMIC
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  1.0 RDNS_DYNAMIC Delivered to internal network by host with
	*      dynamic-looking rDNS
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5AC87E009E5
	for <meta-ti@yoctoproject.org>; Tue,  2 Jun 2015 18:40:06 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 11022529BA; Wed,  3 Jun 2015 01:40:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150603014006.11022529BA@arago-project.org>
Date: Wed,  3 Jun 2015 01:40:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : Revert "llvm-common: Extend to nativesdk class."
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
X-List-Received-Date: Wed, 03 Jun 2015 01:40:07 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: c6fb26ac141fcbf832e39922d6ed83c21a6a99da
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c6fb26ac141fcbf832e39922d6ed83c21a6a99da

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Jun  2 21:39:15 2015 -0400

Revert "llvm-common: Extend to nativesdk class."

This reverts commit 8b564e676b4418875f2e24002660ba92ecd4bbf0.

---

 recipes-core/llvm/llvm-common.bbappend |    5 -----
 1 files changed, 0 insertions(+), 5 deletions(-)

diff --git a/recipes-core/llvm/llvm-common.bbappend b/recipes-core/llvm/llvm-common.bbappend
deleted file mode 100644
index ffe4dcb..0000000
--- a/recipes-core/llvm/llvm-common.bbappend
+++ /dev/null
@@ -1,5 +0,0 @@
-PR_append = "-ti0"
-
-SYSROOT_PREPROCESS_FUNCS_append_class-nativesdk = " llvm_common_sysroot_preprocess"
-
-BBCLASSEXTEND += "nativesdk"


