Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3DA06E013A8
	for <meta-ti@yoctoproject.org>; Wed, 18 Apr 2012 10:31:30 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B928D52A38; Wed, 18 Apr 2012 17:31:29 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120418173129.B928D52A38@arago-project.org>
Date: Wed, 18 Apr 2012 17:31:29 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : omap4.inc: change to require tune-cortexa9.inc
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2012 17:31:30 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: bb6f1bad7fce0e9217b1747138bc71de354b3a79
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=bb6f1bad7fce0e9217b1747138bc71de354b3a79

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Wed Apr 18 13:28:17 2012 -0400

omap4.inc: change to require tune-cortexa9.inc

As reported by Eric Bénard

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap4.inc |    3 +--
 1 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
index a295352..96eaae7 100644
--- a/conf/machine/include/omap4.inc
+++ b/conf/machine/include/omap4.inc
@@ -1,7 +1,7 @@
 SOC_FAMILY = "omap4"
 require conf/machine/include/soc-family.inc
 
-require conf/machine/include/tune-cortexa8.inc
+require conf/machine/include/tune-cortexa9.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap4"
 PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
@@ -23,4 +23,3 @@ UBOOT_ENTRYPOINT = "0x80008000"
 UBOOT_LOADADDRESS = "0x80008000"
 
 EXTRA_IMAGEDEPENDS += "u-boot"
-


