Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FD55E01527
	for <meta-ti@yoctoproject.org>; Fri,  8 Mar 2013 13:18:19 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7A0D752AB5; Fri,  8 Mar 2013 21:18:18 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130308211818.7A0D752AB5@arago-project.org>
Date: Fri,  8 Mar 2013 21:18:18 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am180x: cleanup machine config, remove common SoC settings
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
X-List-Received-Date: Fri, 08 Mar 2013 21:18:19 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 3cb6c8fb6e05de3bc7f2ef7ddd1d5886ff69eae8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=3cb6c8fb6e05de3bc7f2ef7ddd1d5886ff69eae8

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Mar  5 16:29:56 2013 -0500

am180x: cleanup machine config, remove common SoC settings

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am180x-evm.conf |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/conf/machine/am180x-evm.conf b/conf/machine/am180x-evm.conf
index 827885b..7ea25cf 100644
--- a/conf/machine/am180x-evm.conf
+++ b/conf/machine/am180x-evm.conf
@@ -11,9 +11,6 @@ UBOOT_LOADADDRESS = "0xc0008000"
 
 IMAGE_FSTYPES += "tar.gz ubi"
 
-MACHINE_FEATURES = "kernel26 serial ethernet"
-
 SERIAL_CONSOLE = "115200 ttyS2"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omapl138-psp"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot"


