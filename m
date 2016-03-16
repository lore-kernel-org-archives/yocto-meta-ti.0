Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 48B38E0086B; Wed, 16 Mar 2016 11:41:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C5E3BE00B46
	for <meta-ti@yoctoproject.org>; Wed, 16 Mar 2016 11:41:00 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CDCA552A9C; Wed, 16 Mar 2016 18:40:58 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160316184058.CDCA552A9C@arago-project.org>
Date: Wed, 16 Mar 2016 18:40:58 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : qmss-lld-test: Add explicit dependency on uio-module-drv
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
X-List-Received-Date: Wed, 16 Mar 2016 18:41:04 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 9ba41bd6cf4241ef544acf99c618a22f401165cb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9ba41bd6cf4241ef544acf99c618a22f401165cb

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Wed Mar 16 23:30:13 2016 +0000

qmss-lld-test: Add explicit dependency on uio-module-drv

Test code uses uio driver for mapping peripheral registers and hence
the addition of dependency.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/qmss-lld/qmss-lld-test_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
index 5b9ad4e..ed49b8e 100644
--- a/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
+++ b/recipes-bsp/qmss-lld/qmss-lld-test_git.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "TI QMSS low level driver unit test and example binaries"
 
-DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld cmem"
+DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld cmem uio-module-drv"
 
 include qmss-lld.inc
 


