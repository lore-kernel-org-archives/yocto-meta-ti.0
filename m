Return-Path: <ndec13@gmail.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F515E00348
	for <meta-ti@yoctoproject.org>; Fri, 19 Oct 2012 06:51:30 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q9JDpTbt019932
	for <meta-ti@yoctoproject.org>; Fri, 19 Oct 2012 08:51:29 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9JDpTFR005408
	for <meta-ti@yoctoproject.org>; Fri, 19 Oct 2012 08:51:29 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 19 Oct 2012 08:51:29 -0500
Received: from localhost.localdomain (lncpu06.tif.ti.com [137.167.138.194])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id q9JDpSv8000682;
	Fri, 19 Oct 2012 08:51:29 -0500
From: Nicolas Dechesne <ndec13@gmail.com>
To: <meta-ti@yoctoproject.org>
Date: Fri, 19 Oct 2012 15:51:23 +0200
Message-ID: <1350654686-22868-1-git-send-email-ndec13@gmail.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Nicolas Dechesne <n-dechesne@ti.com>
Subject: [PATCH 0/3] Adding xf86-video-omap support for Pandaboard
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
X-List-Received-Date: Fri, 19 Oct 2012 13:51:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

From: Nicolas Dechesne <n-dechesne@ti.com>

Hi there,

here is a refreshed series to add support for xf86-video-omap for
Pandaboard.

We've switched all our OMAP4 and OMAP5 support on this new X11 video
driver, which is hosted here:
http://cgit.freedesktop.org/xorg/driver/xf86-video-omap/

that drivers requires changes in libdrm which have all been merged
into upstream, we just need to enable the 'omap' support in libdrm
which is still experimental.

we try to restrict this to 'omap4|omap5' machines so that we don't
impact other TI devices.

this series is tested on PandaES, with:

BB_VERSION        = "1.16.0"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-gnueabi"
MACHINE           = "pandaboard"
DISTRO            = "poky"
DISTRO_VERSION    = "1.3+snapshot-20121018"
TUNE_FEATURES     = "armv7a vfp neon cortexa9"
TARGET_FPU        = "vfp-neon"
meta
meta-yocto        = "master:e6e2b9bd66100c078c029ca7e34829cf1dfb5490"
meta-ti           = "master:9d5f7904444febfaeaacce88f50c5ceb700552f1"

The pandaboard task list is:
DONE: refresh OMAP4 kernel
DONE: introduce new X11 video driver
TODO: introduce customized Gst/gst-ducati and libdce
TODO: add support for DRI2, SGX accelerated EXA, DRI2Video

Some of these patches could certainly make their way in oe-core at
some point.

This Xf86-video-omap driver has been tested with 1.11 Xserver, but
also locally with 1.12. With 1.12 xrandr rotation is working, as a few
rotation related bugs were fixed indeed in 1.12, that could be
backported in 1.11 if needed. xrandr mode setting has been tested with
1.11 and 1.12. Multi display support should work too.


Enrico Butera (1):
  libdrm: enable omap experimental api support

Nicolas Dechesne (2):
  xf86-video-omap: add new recipe for OMAP4/5 X11 video driver
  pandaboard: use xf86-video-omap by default in XSERVER config

 conf/machine/include/omap4.inc                     |    3 +-
 recipes-graphics/drm/libdrm_2.4.39.bbappend        |    3 +
 .../xorg-driver/xf86-video-omap_git.bb             |   31 ++++++++++++++
 .../xserver-xf86-config/omap4/xorg.conf            |   44 +++++++-------------
 4 files changed, 51 insertions(+), 30 deletions(-)
 create mode 100644 recipes-graphics/drm/libdrm_2.4.39.bbappend
 create mode 100644 recipes-graphics/xorg-driver/xf86-video-omap_git.bb


