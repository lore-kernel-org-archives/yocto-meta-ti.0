Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AE3CAE01471
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 81E5352AB0; Tue, 26 Mar 2013 00:42:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004224.81E5352AB0@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : am3517-evm: switch default u-boot preference to machine-specific tree
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
X-List-Received-Date: Tue, 26 Mar 2013 00:42:25 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: e8da1f689352c821d835d40bdea67791540f9ebd
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e8da1f689352c821d835d40bdea67791540f9ebd

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 19:17:20 2013 -0400

am3517-evm: switch default u-boot preference to machine-specific tree

SDKs or other users of meta-ti can still use one of the other recipes for
stability or featureset, by setting PREFERRED_PROVIDER in their config.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am3517-evm.conf |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/conf/machine/am3517-evm.conf b/conf/machine/am3517-evm.conf
index 0151fe9..097e797 100644
--- a/conf/machine/am3517-evm.conf
+++ b/conf/machine/am3517-evm.conf
@@ -17,6 +17,10 @@ USE_VT = "2"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-omap-psp"
 
+# Support for am3517 is in the same tree as am33x
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-am33x"
+PREFERRED_PROVIDER_u-boot = "u-boot-am33x"
+
 UBOOT_MACHINE = "am3517_evm_config"
 XLOAD_MACHINE = "am3517evm_config"
 


