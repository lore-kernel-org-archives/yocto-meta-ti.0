Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF46BE00A38; Wed, 15 Feb 2017 11:41:44 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F7BFE009C3
	for <meta-ti@yoctoproject.org>; Wed, 15 Feb 2017 11:41:33 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4DC9852975; Wed, 15 Feb 2017 19:41:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20170215194132.4DC9852975@arago-project.org>
Date: Wed, 15 Feb 2017 19:41:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Dan Murphy : linux-ti-staging: update to 4.9.10
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
X-List-Received-Date: Wed, 15 Feb 2017 19:41:45 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: morty
Commit: b1c37b45870a0771f74acf019d1c6f8f16701cc5
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b1c37b45870a0771f74acf019d1c6f8f16701cc5

Author: Dan Murphy <dmurphy@ti.com>
Date:   Wed Feb 15 19:35:51 2017 +0000

linux-ti-staging: update to 4.9.10

Signed-off-by: Dan Murphy <dmurphy@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-rt_4.9.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_4.9.bb    |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
index 1355558..c6c0695 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.9.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.9:"
 
 BRANCH = "ti-rt-linux-4.9.y"
 
-SRCREV = "fca7cc6d34a3d18cbe5f54b77c0f5db12081acf8"
+SRCREV = "68704903155296c0b09ce0ea0de8909e7592de65"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.9.bb b/recipes-kernel/linux/linux-ti-staging_4.9.bb
index 0c15c76..416420c 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.9.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.9.bb
@@ -53,8 +53,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.9.y"
 
-SRCREV = "b4aa954ead9260eaf7138755fc9d062a9f4630eb"
-PV = "4.9.9+git${SRCPV}"
+SRCREV = "1c74e8801cf58a30394ae92236895599f2c77253"
+PV = "4.9.10+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "a"


