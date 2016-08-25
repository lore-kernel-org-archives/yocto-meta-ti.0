Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0239E00E05; Thu, 25 Aug 2016 11:13:47 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A81CAE010A4
	for <meta-ti@yoctoproject.org>; Thu, 25 Aug 2016 11:13:44 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id D05E752A3C; Thu, 25 Aug 2016 18:13:42 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160825181342.D05E752A3C@arago-project.org>
Date: Thu, 25 Aug 2016 18:13:42 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti-linux-staging: update to 4.4.19 and ti2016. 03-rc4 tag
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
X-List-Received-Date: Thu, 25 Aug 2016 18:13:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 011b283c8b5ba14bd4ef89ca922553fa565bf224
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=011b283c8b5ba14bd4ef89ca922553fa565bf224

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Aug 25 23:09:07 2016 +0000

ti-linux-staging: update to 4.4.19 and ti2016.03-rc4 tag

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_4.4.bb    |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
index 6784f3a..a78c758 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
 
 BRANCH = "ti-rt-linux-4.4.y"
 
-SRCREV = "28ae654afc1f0b33867e744e11e8342ab279b0ec"
+SRCREV = "64796e7f597d7f17bbcfa18242dbf1a3da839131"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index fad136b..4dc7d37 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -73,8 +73,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.4.y"
 
-SRCREV = "5985053fdb1dc8b0348049e2151e5a5dc6c111be"
-PV = "4.4.18+git${SRCPV}"
+SRCREV = "e581bb1caca54c56c773e0ce5e616b91b0b7b00e"
+PV = "4.4.19+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"


