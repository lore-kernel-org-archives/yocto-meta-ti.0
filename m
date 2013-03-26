Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95AC0E013A7
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:25 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 275A452AAC; Tue, 26 Mar 2013 00:42:24 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004224.275A452AAC@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:24 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti33x: switch default u-boot preference to ti-staging tree
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
Commit: b87ac0eafb564cb9af1f306c0272477a8606a8f8
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b87ac0eafb564cb9af1f306c0272477a8606a8f8

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 18:09:07 2013 -0400

ti33x: switch default u-boot preference to ti-staging tree

SDKs or other users of meta-ti can still use one of the other recipes for
stability or featureset, by setting PREFERRED_PROVIDER in their config.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/ti33x.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/ti33x.inc b/conf/machine/include/ti33x.inc
index 62afe16..12b80c6 100644
--- a/conf/machine/include/ti33x.inc
+++ b/conf/machine/include/ti33x.inc
@@ -16,11 +16,12 @@ XSERVER = "xserver-xorg \
 GUI_MACHINE_CLASS = "bigscreen"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r18"
+MACHINE_KERNEL_PR = "r19"
 
 # Default providers, may need to override for specific machines
 PREFERRED_PROVIDER_virtual/kernel = "linux-ti-staging"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-ti-staging"
+PREFERRED_PROVIDER_u-boot = "u-boot-ti-staging"
 
 KERNEL_IMAGETYPE = "uImage"
 


