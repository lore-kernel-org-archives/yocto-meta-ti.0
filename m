Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3BC4AE00A44; Wed, 22 Jun 2016 08:14:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10884E00A44
	for <meta-ti@yoctoproject.org>; Wed, 22 Jun 2016 08:13:57 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6597C52A35; Wed, 22 Jun 2016 15:13:56 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160622151356.6597C52A35@arago-project.org>
Date: Wed, 22 Jun 2016 15:13:56 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: add support for AM57xx HS platform
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
X-List-Received-Date: Wed, 22 Jun 2016 15:14:01 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: krogoth
Commit: 18437aed99cb08d52bb4b256bc8440383ce716b9
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=18437aed99cb08d52bb4b256bc8440383ce716b9

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Jun 22 20:49:09 2016 +0000

u-boot-ti-staging: add support for AM57xx HS platform

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
index 008cbdd..9318937 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 
-PR = "r6"
+PR = "r7"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
@@ -19,6 +19,7 @@ SRCREV = "64be2163d8a42b16de72e5ed43ac349178597eca"
 # Support for secure devices - detailed info is in doc/README.ti-secure
 TI_SECURE_DEV_PKG ?= ""
 TI_SECURE_DEV_PKG_dra7xx-hs-evm = "${TI_SECURE_DEV_PKG_DRA7}"
+TI_SECURE_DEV_PKG_am57xx-hs-evm = "${TI_SECURE_DEV_PKG_DRA7}"
 TI_SECURE_DEV_PKG_am437x-hs-evm = "${TI_SECURE_DEV_PKG_AM4}"
 export TI_SECURE_DEV_PKG
 


