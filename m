Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BCD12E00DA1; Wed,  9 Sep 2015 13:09:36 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99905E00DA0
	for <meta-ti@yoctoproject.org>; Wed,  9 Sep 2015 13:09:31 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2291252A94; Wed,  9 Sep 2015 20:09:30 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20150909200930.2291252A94@arago-project.org>
Date: Wed,  9 Sep 2015 20:09:30 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update with latest platform fixes
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
X-List-Received-Date: Wed, 09 Sep 2015 20:09:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 434570893e8a3a9a3bda28070aa2f7ba7a80b81e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=434570893e8a3a9a3bda28070aa2f7ba7a80b81e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Sep  9 23:22:20 2015 +0000

linux-ti-staging: update with latest platform fixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging_4.1.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index 16b30a7..1461e2e 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -53,11 +53,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "72c971cc113833c7a1f22a3c0ac3260f3a9a3378"
+SRCREV = "a7db74ef69c8a444b5b0c225d0bbb1f628481863"
 PV = "4.1.6+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "j"
+MACHINE_KERNEL_PR_append = "k"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


