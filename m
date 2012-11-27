Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21677E011AF
	for <meta-ti@yoctoproject.org>; Tue, 27 Nov 2012 08:42:37 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id E415752A7B; Tue, 27 Nov 2012 16:42:36 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121127164236.E415752A7B@arago-project.org>
Date: Tue, 27 Nov 2012 16:42:36 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : keystone-evm.conf: enable cpio images by default
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
X-List-Received-Date: Tue, 27 Nov 2012 16:42:37 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: b9276bfe02a6b26858110b73ffb174453676aa4e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=b9276bfe02a6b26858110b73ffb174453676aa4e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Nov 27 11:40:06 2012 -0500

keystone-evm.conf: enable cpio images by default

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/keystone-evm.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/machine/keystone-evm.conf b/conf/machine/keystone-evm.conf
index 0b6d7ab..5e264a8 100644
--- a/conf/machine/keystone-evm.conf
+++ b/conf/machine/keystone-evm.conf
@@ -14,7 +14,7 @@ require conf/machine/include/keystone.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-keystone"
 
-IMAGE_FSTYPES += "tar.bz2"
+IMAGE_FSTYPES += "tar.bz2 cpio"
 
 SERIAL_CONSOLE = "115200 ttyO0"
 


