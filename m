Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C16FBE008D4; Wed,  4 Mar 2015 10:30:41 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5DBD2E006EF
	for <meta-ti@yoctoproject.org>; Wed,  4 Mar 2015 10:30:36 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C599D52A29; Wed,  4 Mar 2015 18:30:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150304183035.C599D52A29@arago-project.org>
Date: Wed,  4 Mar 2015 18:30:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : sitara-linux-ti-staging: Update commit to fix touchscreen issues on AM335x SK
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
X-List-Received-Date: Wed, 04 Mar 2015 18:30:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 0d25bbfab6692cd6b78536b3a0de25dd453d885d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=0d25bbfab6692cd6b78536b3a0de25dd453d885d

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Wed Mar  4 17:55:20 2015 +0000

sitara-linux-ti-staging: Update commit to fix touchscreen issues on AM335x SK

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux/sitara-linux-ti-staging_3.14.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
index 8cd2c3f..31c1223 100644
--- a/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
+++ b/recipes-kernel/linux/sitara-linux-ti-staging_3.14.bb
@@ -35,11 +35,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "sitara-ti-linux-3.14.y"
 
-SRCREV = "99b50bfb0f3fb0e43de31a6735989d31660b0835"
+SRCREV = "2489c022b2932432606f897741a71b712e6dbe77"
 PV = "3.14.26"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "g+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "h+gitr${SRCPV}"
 PR = "${MACHINE_KERNEL_PR}"
 
 MULTI_CONFIG_BASE_SUFFIX = ""


