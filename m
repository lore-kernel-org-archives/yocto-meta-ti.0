Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A535E00D9C; Tue,  2 Aug 2016 19:59:41 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4078DE00D87
	for <meta-ti@yoctoproject.org>; Tue,  2 Aug 2016 19:59:35 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 3C95B52A27; Wed,  3 Aug 2016 02:59:34 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160803025934.3C95B52A27@arago-project.org>
Date: Wed,  3 Aug 2016 02:59:34 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to ti2016.03-rc1 tag
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
X-List-Received-Date: Wed, 03 Aug 2016 02:59:41 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 4ece0325d2dd6ba4727a9c7644ae791ec6a40a2f
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=4ece0325d2dd6ba4727a9c7644ae791ec6a40a2f

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Aug  3 07:50:05 2016 +0000

linux-ti-staging: update to ti2016.03-rc1 tag

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_4.4.bb    |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
index f1bbca1..4768666 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
 
 BRANCH = "ti-rt-linux-4.4.y"
 
-SRCREV = "6c3d70c75d9c8e7e66f5daa13a3b8073ba8e629d"
+SRCREV = "3ad9429aa90ec7e1d351d1cd228d83b4d622e479"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index 0294af2..0200715 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -73,11 +73,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.4.y"
 
-SRCREV = "cbe129432c2af06741be9e4d1f9d50c32b0d4699"
+SRCREV = "d30cce5c3821d28006e32d9cbe3ceb70b5c34d99"
 PV = "4.4.16+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"


