Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24069E00EBA; Tue, 12 Apr 2016 16:10:09 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DABB5E00522
	for <meta-ti@yoctoproject.org>; Tue, 12 Apr 2016 16:10:03 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CC23252A19; Tue, 12 Apr 2016 23:10:02 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160412231002.CC23252A19@arago-project.org>
Date: Tue, 12 Apr 2016 23:10:02 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : iqn2-lld: fix -march gcc flag, as cortex-a15 belongs to armv7ve
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
X-List-Received-Date: Tue, 12 Apr 2016 23:10:09 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 032995ed34a2632ad8cff15871870a74058c9eed
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=032995ed34a2632ad8cff15871870a74058c9eed

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Apr 13 05:08:49 2016 +0000

iqn2-lld: fix -march gcc flag, as cortex-a15 belongs to armv7ve

https://gcc.gnu.org/ml/gcc-cvs/2014-01/msg00982.html

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/iqn2-lld/iqn2-lld_git.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
index 4e68116..40a8ea7 100644
--- a/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
+++ b/recipes-bsp/iqn2-lld/iqn2-lld_git.bb
@@ -8,6 +8,10 @@ PR = "${INC_PR}.0"
 
 EXTRA_OEMAKE = "-f makefile_armv7 PDK_INSTALL_PATH=${STAGING_INCDIR}"
 
+do_configure () {
+	sed -i -e 's/march=armv7-a/march=armv7ve/' build/armv7/libiqn2_aearmv7.mk
+}
+
 do_compile () {
 	oe_runmake clean
 	oe_runmake lib


