Return-Path: <ndec13@gmail.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79C1FE003D6
	for <meta-ti@yoctoproject.org>; Thu, 22 Nov 2012 06:36:18 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id qAMEaHNF019442
	for <meta-ti@yoctoproject.org>; Thu, 22 Nov 2012 08:36:17 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAMEaHrE029594
	for <meta-ti@yoctoproject.org>; Thu, 22 Nov 2012 08:36:17 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 22 Nov 2012 08:36:17 -0600
Received: from localhost.localdomain (lncpu06.tif.ti.com [137.167.138.194])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id qAMEaG1g000479;
	Thu, 22 Nov 2012 08:36:16 -0600
From: Nicolas Dechesne <ndec13@gmail.com>
To: <meta-ti@yoctoproject.org>
Date: Thu, 22 Nov 2012 15:35:56 +0100
Message-ID: <1353594959-18237-1-git-send-email-ndec13@gmail.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Nicolas Dechesne <n-dechesne@ti.com>
Subject: [PATCH 0/3] xf86-video-omap build failure with poky/master
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
X-List-Received-Date: Thu, 22 Nov 2012 14:36:18 -0000
Content-Type: text/plain

From: Nicolas Dechesne <n-dechesne@ti.com>

hi,

as discussed in a couple of threads recently, and now that 'danny' branch
was created, i am sending a couple of changes for xf86-video-omap:
 - xf86-video-omap was added in oe-core and poky, so let's remove our 
version and use it.
 - same for libdrm, where OMAP 'experimental' support was enabled
 - the appropriate Xorg related config changes (after new upstream) in 
this serie.

I have tested these patches with the following build config:

BB_VERSION        = "1.16.0"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "pandaboard"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3+snapshot-20121122"
TUNE_FEATURES     = "armv7a vfp neon cortexa9"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "master:14f7c9c9d87e1a9b0c20d78d528068fd9f1a27cf"

and patches applied on top of:
meta-ti           = "master:fe6972418ab6d2b39a0991ecbe29887b259170f6"


It is important to note that we really need this oe-core patch from Ross:

8043f45 xf86-video-omap: don't use AC_CHECK_FILE

As agreed on thread, this serie is for master only, for danny we will keep
what we have in metat-ti since danny doesn't know about xf86-video-omap.


Nicolas Dechesne (3):
  Revert "libdrm: enable omap experimental api support"
  Revert "xf86-video-omap: add new recipe for OMAP4/5 X11 video driver"
  conf/machine: omap4: update configs after xorg upgrade

 conf/machine/include/omap4.inc                     |    3 --
 recipes-graphics/drm/libdrm_2.4.39.bbappend        |    3 --
 .../xorg-driver/xf86-video-omap_git.bb             |   31 --------------------
 3 files changed, 0 insertions(+), 37 deletions(-)
 delete mode 100644 recipes-graphics/drm/libdrm_2.4.39.bbappend
 delete mode 100644 recipes-graphics/xorg-driver/xf86-video-omap_git.bb


