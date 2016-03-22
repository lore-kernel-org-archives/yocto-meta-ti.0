Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AAA44E00920; Tue, 22 Mar 2016 12:14:47 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96675E0090E
	for <meta-ti@yoctoproject.org>; Tue, 22 Mar 2016 12:14:40 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 9F55D52AEB; Tue, 22 Mar 2016 19:14:37 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160322191437.9F55D52AEB@arago-project.org>
Date: Tue, 22 Mar 2016 19:14:37 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update with UART1_RTSN pinmux fix
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
X-List-Received-Date: Tue, 22 Mar 2016 19:14:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: bfa182cd1400ac5e48b4adf7cbc1b19b5d95595e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bfa182cd1400ac5e48b4adf7cbc1b19b5d95595e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Mar 22 14:52:08 2016 -0400

u-boot-ti-staging: update with UART1_RTSN pinmux fix

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
index bac0acc..0634a16 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2015.07.bb
@@ -7,14 +7,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=0507cd7da8e7ad6d6701926ec9b84c95"
 
-PR = "r24"
+PR = "r25"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2015.07"
 
-SRCREV = "d013f6ec602485f6fd543b0ef712abc8d77ebf07"
+SRCREV = "46c915c96358c426bb1f4dd1e25a9a805d93a24e"
 
 # Support for secure devices - detailed info is in doc/README.ti-secure
 TI_SECURE_DEV_PKG ?= ""


