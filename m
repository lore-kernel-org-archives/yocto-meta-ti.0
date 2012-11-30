Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86B32E013EB
	for <meta-ti@yoctoproject.org>; Fri, 30 Nov 2012 08:47:11 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 5B75F52AC2; Fri, 30 Nov 2012 16:47:11 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121130164711.5B75F52AC2@arago-project.org>
Date: Fri, 30 Nov 2012 16:47:11 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : keystone: bump MACHINE_KERNEL_PR for previous changes
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
X-List-Received-Date: Fri, 30 Nov 2012 16:47:11 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: ff74447a23ceb8acf5da5f1fdc83a0c9d7ea7073
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=ff74447a23ceb8acf5da5f1fdc83a0c9d7ea7073

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Fri Nov 30 11:44:24 2012 -0500

keystone: bump MACHINE_KERNEL_PR for previous changes

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/keystone.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/include/keystone.inc b/conf/machine/include/keystone.inc
index 1914128..60550d0 100644
--- a/conf/machine/include/keystone.inc
+++ b/conf/machine/include/keystone.inc
@@ -4,7 +4,7 @@ require conf/machine/include/soc-family.inc
 require conf/machine/include/tune-cortexa15.inc
 PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
 # Increase this everytime you change something in the kernel
-MACHINE_KERNEL_PR = "r1"
+MACHINE_KERNEL_PR = "r2"
 
 KERNEL_IMAGETYPE = "uImage"
 


