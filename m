Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6DE12E008BB; Mon, 18 Jan 2016 10:40:08 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 448D2E007F2
	for <meta-ti@yoctoproject.org>; Mon, 18 Jan 2016 10:40:04 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3DB51529B5; Mon, 18 Jan 2016 18:40:03 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160118184003.3DB51529B5@arago-project.org>
Date: Mon, 18 Jan 2016 18:40:03 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti-staging: update to 4.1.15 and latest merges
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
X-List-Received-Date: Mon, 18 Jan 2016 18:40:08 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: 5de5c6c99d0533c94a60f4fe373ef88bf48d396e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5de5c6c99d0533c94a60f4fe373ef88bf48d396e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Jan 18 23:23:40 2016 +0000

linux-ti-staging: update to 4.1.15 and latest merges

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-kernel/linux/linux-ti-staging-rt_4.1.bb |    2 +-
 recipes-kernel/linux/linux-ti-staging_4.1.bb    |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
index 7cd9779..ae958de 100644
--- a/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging-rt_4.1.bb
@@ -6,4 +6,4 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}-4.1:"
 
 BRANCH = "ti-rt-linux-4.1.y"
 
-SRCREV = "485229578c4a744ff066a739770ff22f4d5948d9"
+SRCREV = "e1438117e08a772a560d4f4226c889d5fe48e4fd"
diff --git a/recipes-kernel/linux/linux-ti-staging_4.1.bb b/recipes-kernel/linux/linux-ti-staging_4.1.bb
index 5adfb33..a6615aa 100644
--- a/recipes-kernel/linux/linux-ti-staging_4.1.bb
+++ b/recipes-kernel/linux/linux-ti-staging_4.1.bb
@@ -60,8 +60,8 @@ S = "${WORKDIR}/git"
 
 BRANCH = "ti-lsk-linux-4.1.y"
 
-SRCREV = "0f37ee50e2b263eb5941d91ef6da7d4ca51f7488"
-PV = "4.1.13+git${SRCPV}"
+SRCREV = "e1438117e08a772a560d4f4226c889d5fe48e4fd"
+PV = "4.1.15+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
 MACHINE_KERNEL_PR_append = "e"


