Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5173FE00C19; Thu, 28 Jan 2016 10:43:56 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D28F9E00AAF
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 10:43:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 9B74952AB3; Thu, 28 Jan 2016 18:43:50 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160128184350.9B74952AB3@arago-project.org>
Date: Thu, 28 Jan 2016 18:43:50 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : hplib-mod: Add to KERNEL_MODULE_AUTOLOAD
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
X-List-Received-Date: Thu, 28 Jan 2016 18:43:56 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 989bd95a9aefb484dcc725e00ee1b5b9824d4bfe
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=989bd95a9aefb484dcc725e00ee1b5b9824d4bfe

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Jan 28 20:46:48 2016 +0000

hplib-mod: Add to KERNEL_MODULE_AUTOLOAD

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/hplib/hplib-mod_git.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/hplib/hplib-mod_git.bb b/recipes-bsp/hplib/hplib-mod_git.bb
index 6603a2e..c7217d7 100644
--- a/recipes-bsp/hplib/hplib-mod_git.bb
+++ b/recipes-bsp/hplib/hplib-mod_git.bb
@@ -7,7 +7,7 @@ DEPENDS = "hplib"
 include hplib.inc
 
 # This package builds a kernel module, use kernel PR as base and append a local
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 S ="${WORKDIR}/git/ti/runtime/hplib/module"
@@ -18,3 +18,5 @@ inherit module
 do_install () {
 	oe_runmake install INSTALL_MOD_PATH="${D}"
 }
+
+KERNEL_MODULE_AUTOLOAD += "hplibmod"


