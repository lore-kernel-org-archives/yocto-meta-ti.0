Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E611FE0052B; Mon, 27 Feb 2017 15:15:15 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1241CE004D2
	for <meta-ti@yoctoproject.org>; Mon, 27 Feb 2017 15:15:14 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 53738529D2; Mon, 27 Feb 2017 23:15:13 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170227231513.53738529D2@arago-project.org>
Date: Mon, 27 Feb 2017 23:15:13 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Dan Murphy : linux-ti-staging: update to ti2017.00-rc2 tag
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
X-List-Received-Date: Mon, 27 Feb 2017 23:15:15 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: f9fe9be6d468be5bc53fe918cb17479c1e08e480
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=f9fe9be6d468be5bc53fe918cb17479c1e08e480

Author: Dan Murphy <dmurphy@ti.com>
Date:   Tue Feb 28 01:19:12 2017 +0000

linux-ti-staging: update to ti2017.00-rc2 tag

Update to ti2017.00-rc2 tag as well as 4.9.13 kernel
revision

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-rt_4.9.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_4.9.bb    |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
index 76592a0..fb051da 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
 
 BRANCH = "ti-rt-linux-4.9.y"
 
-SRCREV = "940177b0bc855cb2d5d2c9d536885b629dc5a4a3"
+SRCREV = "0707ba4199e2925a57077fc24bb382f1ea1ac1d7"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
index acdbff4..c9ed163 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
@@ -53,8 +53,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.9.y"
 
-SRCREV = "6c1ef0e5e0ace660dcb56552914ba2f42457fc51"
-PV = "4.9.10+git${SRCPV}"
+SRCREV = "818ee96bb29bebc1aa1b26b4402a16eaa0621924"
+PV = "4.9.13+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "c"


