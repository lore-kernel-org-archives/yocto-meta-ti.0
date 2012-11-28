Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1F46E0032E
	for <meta-ti@yoctoproject.org>; Wed, 28 Nov 2012 09:30:23 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 7046952A92; Wed, 28 Nov 2012 17:30:22 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121128173022.7046952A92@arago-project.org>
Date: Wed, 28 Nov 2012 17:30:22 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Nicolas Dechesne : conf/machine: omap4: update configs after xorg upgrade
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
X-List-Received-Date: Wed, 28 Nov 2012 17:30:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 7bc112911d856962d2f477a6ba60e08907141433
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7bc112911d856962d2f477a6ba60e08907141433

Author: Nicolas Dechesne <n-dechesne@ti.com>
Date:   Thu Nov 22 15:35:59 2012 +0100

conf/machine: omap4: update configs after xorg upgrade

There were some changes in the xserver-xorg upstream project that need
to be reflected here too:
 * extmod module was removed completely as it became empty;
 * DRI1, DRI2, DBE (among others) were made built-in;

(see poky rev: 5cea09e3d010d4799eab296b2a0cb83a0af09c76)

Signed-off-by: Nicolas Dechesne <n-dechesne@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/include/omap4.inc |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/conf/machine/include/omap4.inc b/conf/machine/include/omap4.inc
index ecd23c4..5ee5f9d 100644
--- a/conf/machine/include/omap4.inc
+++ b/conf/machine/include/omap4.inc
@@ -8,9 +8,6 @@ PREFERRED_PROVIDER_virtual/bootloader = "u-boot"
 
 PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
 XSERVER = "xserver-xorg \
-           xserver-xorg-extension-dri \
-           xserver-xorg-extension-dri2 \
-           xserver-xorg-extension-glx \
            xserver-xorg-module-exa \
            xf86-input-evdev \
            xf86-video-omap"


