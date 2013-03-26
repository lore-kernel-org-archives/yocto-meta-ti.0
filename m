Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C29FE014E2
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:28 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 073C552A55; Tue, 26 Mar 2013 00:42:27 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004228.073C552A55@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:28 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : keystone: switch default u-boot preference to machine-specific tree
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
X-List-Received-Date: Tue, 26 Mar 2013 00:42:28 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 8173631f172419bf2c78b45009df7e1508ee5d88
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8173631f172419bf2c78b45009df7e1508ee5d88

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 18:28:17 2013 -0400

keystone: switch default u-boot preference to machine-specific tree

SDKs or other users of meta-ti can still use one of the other recipes for
stability or featureset, by setting PREFERRED_PROVIDER in their config.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index 047cc18..72e71bf 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -4,10 +4,11 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa15.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
-PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
+PREFERRED_PROVIDER_virtual/bootloader = "u-boot-keystone"
+PREFERRED_PROVIDER_u-boot = "u-boot-keystone"
 
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r5"
+MACHINE_KERNEL_PR = "r6"
 
 KERNEL_IMAGETYPE = "uImage"
 


