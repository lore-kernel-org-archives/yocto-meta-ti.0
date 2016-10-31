Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 11133E00A84; Mon, 31 Oct 2016 14:22:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE0E8E00A84
	for <meta-ti@yoctoproject.org>; Mon, 31 Oct 2016 14:22:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8457252A47; Mon, 31 Oct 2016 21:22:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161031212224.8457252A47@arago-project.org>
Date: Mon, 31 Oct 2016 21:22:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : libulm: pass CC to work with internal toolchains that depend on sysroot flag
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
X-List-Received-Date: Mon, 31 Oct 2016 21:22:28 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 26e28b2409c392719bdebf2fae19ce0bc0db3db5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=26e28b2409c392719bdebf2fae19ce0bc0db3db5

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Oct 28 06:32:38 2016 +0000

libulm: pass CC to work with internal toolchains that depend on sysroot flag

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/dsptop/libulm_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/dsptop/libulm_git.bb b/recipes-bsp/dsptop/libulm_git.bb
index 306d86f..7bf7f09 100644
--- a/recipes-bsp/dsptop/libulm_git.bb
+++ b/recipes-bsp/dsptop/libulm_git.bb
@@ -14,7 +14,7 @@ DEVICE_keystone = "C66AK2Hxx"
 EXTRA_OEMAKE = "release DEVICE=${DEVICE} CROSS_COMPILE=${TARGET_PREFIX}"
 
 do_compile() {
-    oe_runmake arm XPORT_ONLY
+    oe_runmake arm XPORT_ONLY CC="${CC}"
     oe_runmake dsp C6X_C_DIR=${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x/include
 }
 


