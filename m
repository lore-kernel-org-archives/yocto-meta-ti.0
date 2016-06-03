Return-Path: <git@arago-project.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B88F4E00D77; Thu,  2 Jun 2016 17:12:32 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73E17E00D8B
	for <meta-ti@yoctoproject.org>; Thu,  2 Jun 2016 17:12:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 97DA452996; Fri,  3 Jun 2016 00:12:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20160603001229.97DA452996@arago-project.org>
Date: Fri,  3 Jun 2016 00:12:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update to ti2016.01-rc4 tag
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
X-List-Received-Date: Fri, 03 Jun 2016 00:12:32 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 6ba3a1880e4862606292b14496788ac00d5ac148
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=6ba3a1880e4862606292b14496788ac00d5ac148

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Thu Jun  2 23:07:07 2016 +0000

u-boot-ti-staging: update to ti2016.01-rc4 tag

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
index ddd5f4b..057b5f0 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2016.05.bb
@@ -7,14 +7,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=a2c678cfd4a4d97135585cad908541c6"
 
-PR = "r4"
+PR = "r5"
 PV_append = "+git${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2016.05"
 
-SRCREV = "c165945d193be510337de656f6564ad0f6ab35a4"
+SRCREV = "b4e185a8c3732f33d519453841f70236b8d29954"
 
 # Support for secure devices - detailed info is in doc/README.ti-secure
 TI_SECURE_DEV_PKG ?= ""


