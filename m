Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4C608E00927; Mon,  9 Nov 2015 11:34:11 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 57202E00957
	for <meta-ti@yoctoproject.org>; Mon,  9 Nov 2015 11:34:08 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 0C5AF52A5A; Mon,  9 Nov 2015 19:34:07 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151109193408.0C5AF52A5A@arago-project.org>
Date: Mon,  9 Nov 2015 19:34:07 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : multi-kernel: don' t fail removing symlinks when config or commit changes
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
X-List-Received-Date: Mon, 09 Nov 2015 19:34:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 48b7390d3b560a5492154b0379b945929bb0f1c8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=48b7390d3b560a5492154b0379b945929bb0f1c8

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Nov  9 23:19:03 2015 +0000

multi-kernel: don't fail removing symlinks when config or commit changes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/multi-kernel.inc |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/multi-kernel.inc b/recipes-kernel/linux/multi-kernel.inc
index 64701ed..0b7de91 100644
--- a/recipes-kernel/linux/multi-kernel.inc
+++ b/recipes-kernel/linux/multi-kernel.inc
@@ -84,8 +84,8 @@ do_compileconfigs () {
             do_install
 
             # Remove unused symlinks specific to configname
-            rm "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/build"
-            rm "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/source"
+            rm -f "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/build"
+            rm -f "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/source"
             # In case no modules were installed, remove empty dirs
             rmdir --ignore-fail-on-non-empty "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)/kernel"
             rmdir --ignore-fail-on-non-empty "${D}/lib/modules/$(cut -d\" -f2 ${B}/include/generated/utsrelease.h)"


