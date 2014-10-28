Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1037BE008C6; Mon, 27 Oct 2014 19:04:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF1B2E00877
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 19:04:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 7BD37529DD; Tue, 28 Oct 2014 02:04:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20141028020412.7BD37529DD@arago-project.org>
Date: Tue, 28 Oct 2014 02:04:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Sam Nelson : u-boot-keystone: Update to latest tag 2013_01_14.09
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
X-List-Received-Date: Tue, 28 Oct 2014 02:04:21 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: daisy
Commit: 7915cfb4782eb306cd78bc4341c7e49db5c23e1e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7915cfb4782eb306cd78bc4341c7e49db5c23e1e

Author: Sam Nelson <sam.nelson@ti.com>
Date:   Tue Oct 28 01:47:08 2014 +0000

u-boot-keystone: Update to latest tag 2013_01_14.09

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-keystone_2013.01.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
index 37f7738..a464d14 100644
--- a/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
+++ b/recipes-bsp/u-boot/u-boot-keystone_2013.01.bb
@@ -6,8 +6,8 @@ COMPATIBLE_MACHINE = "keystone"
 
 PR = "r5+gitr${SRCPV}"
 
-# Tag "K2_UBOOT_2013_01_14.05_16"
-SRCREV = "fee500417b989fc9906d86e377b4d3d96033d54e"
+# Tag "K2_UBOOT_2013_01_14.09"
+SRCREV = "f9bc365551ff8c685bf6134d795576713fec0917"
 BRANCH = "master"
 
 SRC_URI = "git://git.ti.com/keystone-linux/u-boot.git;protocol=git;branch=${BRANCH}"


