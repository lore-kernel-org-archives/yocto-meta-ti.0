Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0380E0097F; Tue, 10 Feb 2015 12:41:11 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1C7E4E008CC
	for <meta-ti@yoctoproject.org>; Tue, 10 Feb 2015 12:40:57 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 6665452A59; Tue, 10 Feb 2015 20:40:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150210204056.6665452A59@arago-project.org>
Date: Tue, 10 Feb 2015 20:40:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Karthik Ramanan : vpe-tests: Add DEPENDS for the recipe
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
X-List-Received-Date: Tue, 10 Feb 2015 20:41:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 592fe0c75152329762a5c3541599d72a9b87c3fb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=592fe0c75152329762a5c3541599d72a9b87c3fb

Author: Karthik Ramanan <a0393906@ti.com>
Date:   Thu Feb  5 16:10:50 2015 +0000

vpe-tests: Add DEPENDS for the recipe

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/vpe-tests/vpe-tests_git.bb |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/recipes-bsp/vpe-tests/vpe-tests_git.bb b/recipes-bsp/vpe-tests/vpe-tests_git.bb
index a8ee7f8..ee91dea 100644
--- a/recipes-bsp/vpe-tests/vpe-tests_git.bb
+++ b/recipes-bsp/vpe-tests/vpe-tests_git.bb
@@ -3,6 +3,10 @@ DESCRIPTION = "VPE test program"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=74d2f71d8898c54e3d1c9d0058c484aa"
 
+DEPENDS = "virtual/kernel"
+
+PR="r1"
+
 COMPATIBLE_MACHINE = "dra7xx"
 
 SRCREV = "e3d8db1aa935775f9d196ad7428e0cd9864a36ca"


