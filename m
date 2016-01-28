Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C465E00AB7; Thu, 28 Jan 2016 10:43:57 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EEED1E00B8B
	for <meta-ti@yoctoproject.org>; Thu, 28 Jan 2016 10:43:53 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 87F9852AB5; Thu, 28 Jan 2016 18:43:53 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160128184353.87F9852AB5@arago-project.org>
Date: Thu, 28 Jan 2016 18:43:53 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Jacob Stiffler : aif2-lld: Upgrade to version 1.2.0.1
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
X-List-Received-Date: Thu, 28 Jan 2016 18:43:57 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: fido
Commit: afbba2a8a25eb0d48965d23b511c3f25ea328daa
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=afbba2a8a25eb0d48965d23b511c3f25ea328daa

Author: Jacob Stiffler <j-stiffler@ti.com>
Date:   Thu Jan 28 20:41:01 2016 +0000

aif2-lld: Upgrade to version 1.2.0.1

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/aif2-lld/aif2-lld.inc |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/recipes-bsp/aif2-lld/aif2-lld.inc b/recipes-bsp/aif2-lld/aif2-lld.inc
index cd1e169..ef92705 100755
--- a/recipes-bsp/aif2-lld/aif2-lld.inc
+++ b/recipes-bsp/aif2-lld/aif2-lld.inc
@@ -7,15 +7,15 @@ AIF2_LLD_GIT_PROTOCOL = "git"
 AIF2_LLD_GIT_BRANCH = "master"
 AIF2_LLD_GIT_DESTSUFFIX = "git/ti/drv/aif2"
 
-# The following commit correspond to DEV.AIF2LLD.01.02.00.00A
-AIF2_LLD_SRCREV = "7f394ec9975cd4cef982b11763c882c4c763ddce"
+# The following commit correspond to DEV.AIF2LLD.01.02.00.01
+AIF2_LLD_SRCREV = "a701bbb5ed2976d5723c955c87a685f7517cffa3"
 
 BRANCH = "${AIF2_LLD_GIT_BRANCH}"
 SRC_URI = "${AIF2_LLD_GIT_URI};destsuffix=${AIF2_LLD_GIT_DESTSUFFIX};protocol=${AIF2_LLD_GIT_PROTOCOL};branch=${BRANCH}"
 SRCREV = "${AIF2_LLD_SRCREV}"
 
-PV = "1.2.0.0"
-INC_PR = "r1"
+PV = "1.2.0.1"
+INC_PR = "r0"
 
 COMPATIBLE_MACHINE = "k2hk-evm"
 


