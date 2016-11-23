Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 138B3E00CCC; Wed, 23 Nov 2016 10:08:36 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ADC09E00CAE
	for <meta-ti@yoctoproject.org>; Wed, 23 Nov 2016 10:08:33 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id DBD2152AD2; Wed, 23 Nov 2016 18:08:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20161123180832.DBD2152AD2@arago-project.org>
Date: Wed, 23 Nov 2016 18:08:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : rwmem: fix build with any toolchain and use default CC var
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
X-List-Received-Date: Wed, 23 Nov 2016 18:08:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: b5524234769e8f3b24ce82f0843db82680eaedf9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b5524234769e8f3b24ce82f0843db82680eaedf9

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Nov 19 03:51:24 2016 +0000

rwmem: fix build with any toolchain and use default CC var

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/rwmem/rwmem_1.1.bb |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/rwmem/rwmem_1.1.bb b/recipes-bsp/rwmem/rwmem_1.1.bb
index 1825e18..2848e1c 100644
--- a/recipes-bsp/rwmem/rwmem_1.1.bb
+++ b/recipes-bsp/rwmem/rwmem_1.1.bb
@@ -7,8 +7,6 @@ SRC_URI = "git://github.com/tomba/rwmem.git"
 
 S = "${WORKDIR}/git"
 
-EXTRA_OEMAKE = "CC=${TARGET_PREFIX}gcc"
-
 do_install() {
 	install -d ${D}${bindir}
 	install -m 0755 rwmem ${D}${bindir}


