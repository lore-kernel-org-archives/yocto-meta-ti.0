Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF50CE009B8; Thu, 16 Feb 2017 22:52:46 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E45D4E009A7
	for <meta-ti@yoctoproject.org>; Thu, 16 Feb 2017 22:52:44 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id CB0FC52A62; Fri, 17 Feb 2017 06:52:43 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170217065243.CB0FC52A62@arago-project.org>
Date: Fri, 17 Feb 2017 06:52:43 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update with latest rpmsg merge to unblock KS2 MPM
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
X-List-Received-Date: Fri, 17 Feb 2017 06:52:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: 31906c82606aa868be8435cc1a6341ffdfb61f27
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=31906c82606aa868be8435cc1a6341ffdfb61f27

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Feb 17 04:04:51 2017 +0000

linux-ti-staging: update with latest rpmsg merge to unblock KS2 MPM

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Cc: Dan Murphy <dmurphy@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-rt_4.9.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_4.9.bb    |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
index c6c0695..87fa60e 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
 
 BRANCH = "ti-rt-linux-4.9.y"
 
-SRCREV = "68704903155296c0b09ce0ea0de8909e7592de65"
+SRCREV = "3749c8001ac5f67bc56383f106c43cdcfa541d42"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
index 416420c..110f34b 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
@@ -53,11 +53,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.9.y"
 
-SRCREV = "1c74e8801cf58a30394ae92236895599f2c77253"
+SRCREV = "7a7b9948b82972a3181aa8c798b85af3bcb76a9a"
 PV = "4.9.10+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"


