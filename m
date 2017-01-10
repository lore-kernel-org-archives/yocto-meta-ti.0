Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A520E006C6; Mon,  9 Jan 2017 16:25:22 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36CE7E006C6
	for <meta-ti@yoctoproject.org>; Mon,  9 Jan 2017 16:25:19 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 530F352A2B; Tue, 10 Jan 2017 00:25:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170110002518.530F352A2B@arago-project.org>
Date: Tue, 10 Jan 2017 00:25:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 4.4.41 and ti2016. 06-rc4 tag
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
X-List-Received-Date: Tue, 10 Jan 2017 00:25:22 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: 8981c7719613f63ccfd4123acab0e90f80cd152b
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8981c7719613f63ccfd4123acab0e90f80cd152b

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Jan 10 05:44:19 2017 +0000

linux-ti-staging: update to 4.4.41 and ti2016.06-rc4 tag

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-rt_4.4.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_4.4.bb    |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
index b735c11..9e26001 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.4.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.4:"
 
 BRANCH = "ti-rt-linux-4.4.y"
 
-SRCREV = "9d470724441a1ec4f034d4f9441858679aeb241d"
+SRCREV = "15ae5cb78b00ab8989bcd85d36429c917c016237"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.4.bb b/recipes-kernel/linux/linux-ti-staging_4.4.bb
index e3ac868..ecf3f4c 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.4.bb
@@ -81,11 +81,11 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.4.y"
 
-SRCREV = "adc1122e1cb1d5534550f9594826c46914d31b93"
-PV = "4.4.39+git${SRCPV}"
+SRCREV = "7c580a51af521f320eb56717f291aa5b64c2f244"
+PV = "4.4.41+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "b"
+MACHINE_KERNEL_PR_append = "a"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"


