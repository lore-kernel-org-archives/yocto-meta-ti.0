Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A8A0E00CC3; Tue,  9 Feb 2016 13:36:48 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 04EF5E00CB8
	for <meta-ti@yoctoproject.org>; Tue,  9 Feb 2016 13:36:45 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id C74EE52AA7; Tue,  9 Feb 2016 21:36:44 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160209213644.C74EE52AA7@arago-project.org>
Date: Tue,  9 Feb 2016 21:36:44 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update with latest fixes
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
X-List-Received-Date: Tue, 09 Feb 2016 21:36:48 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 5796320233802d8a097a4aa4a0eae707dc70fda5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5796320233802d8a097a4aa4a0eae707dc70fda5

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Feb 10 03:02:10 2016 +0000

linux-ti-staging: update with latest fixes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-rt_4.1.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_4.1.bb    |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
index aeb6ead..2747c93 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"
 
 BRANCH = "ti-rt-linux-4.1.y"
 
-SRCREV = "ff766c27f1e5e73e550949db58521bbbfd2afd44"
+SRCREV = "beeed3c47260849f4fb465684c906f95a9ecd350"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index 689a086..14a141f 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -65,11 +65,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "e4346cf990da13eb936de5e130d8a4baab5c5688"
+SRCREV = "016823748902fcafca15b6ea166c126e5afe1176"
 PV = "4.1.17+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "c"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_CONFIG_DIR = "${S}/ti_config_fragments"


