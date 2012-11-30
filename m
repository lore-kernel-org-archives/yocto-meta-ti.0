Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B945FE013EB
	for <meta-ti@yoctoproject.org>; Fri, 30 Nov 2012 08:46:35 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 8FD3E52AC0; Fri, 30 Nov 2012 16:46:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121130164635.8FD3E52AC0@arago-project.org>
Date: Fri, 30 Nov 2012 16:46:35 +0000 (UTC)
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
X-List-Received-Date: Fri, 30 Nov 2012 16:46:35 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: 870a521c6b32c8c476aabe4fc4b6fc7b665c1445
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=870a521c6b32c8c476aabe4fc4b6fc7b665c1445

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
 


