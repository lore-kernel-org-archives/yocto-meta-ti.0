Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6676BE00E2C; Wed, 29 Jun 2016 19:24:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 177A7E00E2C
	for <meta-ti@yoctoproject.org>; Wed, 29 Jun 2016 19:24:19 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8787F52ACE; Thu, 30 Jun 2016 02:24:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160630022418.8787F52ACE@arago-project.org>
Date: Thu, 30 Jun 2016 02:24:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : uio-module-drv-test: correct COMPATIBLE_MACHINE
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
X-List-Received-Date: Thu, 30 Jun 2016 02:24:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 55b4ca5ecb8973c666c5c6d6f906b216a4cba86e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=55b4ca5ecb8973c666c5c6d6f906b216a4cba86e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Jun 29 22:23:22 2016 -0400

uio-module-drv-test: correct COMPATIBLE_MACHINE

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../uio-module-drv/uio-module-drv-test_git.bb      |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
index fd41b74..197b36f 100644
--- a/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
+++ b/recipes-bsp/uio-module-drv/uio-module-drv-test_git.bb
@@ -4,7 +4,7 @@ include uio-module-drv.inc
 
 PR = "r1"
 
-COMPATIBLE_MACHINE = "keystone|am57xx-evm"
+COMPATIBLE_MACHINE = "keystone|omap-a15"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 DEVICE_NAME_am57xx-evm = "am57xx"


