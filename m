Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D1C6E00C31; Thu, 12 Nov 2015 05:15:41 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4FFA0E00C25
	for <meta-ti@yoctoproject.org>; Thu, 12 Nov 2015 05:15:36 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id DC50452A6D; Thu, 12 Nov 2015 13:15:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20151112131535.DC50452A6D@arago-project.org>
Date: Thu, 12 Nov 2015 13:15:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : kselftests: make machine-specific due to kernel-specific conditionals
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
X-List-Received-Date: Thu, 12 Nov 2015 13:15:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 24f3bd7059201b884b00308fc00becb576344f62
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=24f3bd7059201b884b00308fc00becb576344f62

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Nov 12 08:04:38 2015 +0000

kselftests: make machine-specific due to kernel-specific conditionals

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/kselftests/kselftests_4.1.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes-kernel/kselftests/kselftests_4.1.bb b/recipes-kernel/kselftests/kselftests_4.1.bb
index 38cb76b..2dced11 100644
--- a/recipes-kernel/kselftests/kselftests_4.1.bb
+++ b/recipes-kernel/kselftests/kselftests_4.1.bb
@@ -9,6 +9,8 @@ SRC_URI[sha256sum] = "caf51f085aac1e1cea4d00dbbf3093ead07b551fc07b31b2a989c05f8e
 
 S = "${WORKDIR}/linux-${PV}"
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 DEPENDS = "virtual/kernel popt"
 
 inherit kernel-arch


