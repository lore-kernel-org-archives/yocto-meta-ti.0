Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9391E00CAF; Sat, 19 Mar 2016 12:47:41 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A71D2E00C9B
	for <meta-ti@yoctoproject.org>; Sat, 19 Mar 2016 12:47:39 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2A67A52A1D; Sat, 19 Mar 2016 19:47:38 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160319194738.2A67A52A1D@arago-project.org>
Date: Sat, 19 Mar 2016 19:47:38 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : srio-lld-test: Add explicit dependency on uio-module-drv
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
X-List-Received-Date: Sat, 19 Mar 2016 19:47:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 9bcc14376306bc36d5c71d8e9fee3e7750cfaf13
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=9bcc14376306bc36d5c71d8e9fee3e7750cfaf13

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Fri Mar 18 18:49:30 2016 +0000

srio-lld-test: Add explicit dependency on uio-module-drv

Test code uses uio driver for mapping peripheral registers and hence the
addition of dependency.

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/srio-lld/srio-lld-test_git.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/srio-lld/srio-lld-test_git.bb b/recipes-bsp/srio-lld/srio-lld-test_git.bb
index 6495a12..d2a0068 100644
--- a/recipes-bsp/srio-lld/srio-lld-test_git.bb
+++ b/recipes-bsp/srio-lld/srio-lld-test_git.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "TI SRIO peripheral low level driver unit test and example binaries"
-DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld srio-lld cmem"
+DEPENDS="common-csl-ip rm-lld cppi-lld qmss-lld srio-lld cmem uio-module-drv"
 
 include srio-lld.inc
 


