Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0D713E007FF
	for <meta-ti@yoctoproject.org>; Fri, 13 Dec 2013 23:36:34 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E19B452A94; Sat, 14 Dec 2013 07:36:33 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20131214073633.E19B452A94@arago-project.org>
Date: Sat, 14 Dec 2013 07:36:33 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot-ti-staging: update with omap5 clock fix
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
X-List-Received-Date: Sat, 14 Dec 2013 07:36:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 05bbc5ff52b97835fd4862d15663f8559d6eefd8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=05bbc5ff52b97835fd4862d15663f8559d6eefd8

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Dec 14 02:31:15 2013 -0500

u-boot-ti-staging: update with omap5 clock fix

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
index 80688f4..e0623fd 100644
--- a/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
+++ b/recipes-bsp/u-boot/u-boot-ti-staging_2013.10.bb
@@ -5,14 +5,14 @@ DESCRIPTION = "u-boot bootloader for TI devices"
 LIC_FILES_CHKSUM = "file://Licenses/README;md5=025bf9f768cbcb1a165dbe1a110babfb"
 
 PV = "2013.10"
-PR = "r1+gitr${SRCPV}"
+PR = "r2+gitr${SRCPV}"
 
 SRC_URI = "git://git.ti.com/ti-u-boot/ti-u-boot.git;protocol=git;branch=${BRANCH}"
 
 BRANCH ?= "ti-u-boot-2013.10"
 
 # Corresponds to ti2013.12.00 release
-SRCREV = "4c677486ec4897c90272aac77f8156c15ca27ce2"
+SRCREV = "310aa487aa540609dc5e6a27dfa6c36067babf8c"
 
 SPL_BINARY = "MLO"
 SPL_UART_BINARY = "u-boot-spl.bin"


