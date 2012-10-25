Return-Path: <denis@denix.org>
Received: from vms173007pub.verizon.net (vms173007pub.verizon.net
	[206.46.173.7])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4603E0045D
	for <meta-ti@yoctoproject.org>; Wed, 24 Oct 2012 18:04:52 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MCF00KM4CBE7O21@vms173007.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Wed, 24 Oct 2012 20:04:41 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 08C152038D; Wed,
	24 Oct 2012 21:04:25 -0400 (EDT)
Date: Wed, 24 Oct 2012 21:04:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nicolas Dechesne <ndec13@gmail.com>
Message-id: <20121025010425.GD3465@denix.org>
References: <1350654686-22868-1-git-send-email-ndec13@gmail.com>
MIME-version: 1.0
In-reply-to: <1350654686-22868-1-git-send-email-ndec13@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org, Nicolas Dechesne <n-dechesne@ti.com>
Subject: Re: [PATCH 0/3] Adding xf86-video-omap support for Pandaboard
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
X-List-Received-Date: Thu, 25 Oct 2012 01:04:52 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 19, 2012 at 03:51:23PM +0200, Nicolas Dechesne wrote:
> From: Nicolas Dechesne <n-dechesne@ti.com>
> 
> Hi there,
> 
> here is a refreshed series to add support for xf86-video-omap for
> Pandaboard.

Thank you, applied.

-- 
Denys

> We've switched all our OMAP4 and OMAP5 support on this new X11 video
> driver, which is hosted here:
> http://cgit.freedesktop.org/xorg/driver/xf86-video-omap/
> 
> that drivers requires changes in libdrm which have all been merged
> into upstream, we just need to enable the 'omap' support in libdrm
> which is still experimental.
> 
> we try to restrict this to 'omap4|omap5' machines so that we don't
> impact other TI devices.
> 
> this series is tested on PandaES, with:
> 
> BB_VERSION        = "1.16.0"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "pandaboard"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.3+snapshot-20121018"
> TUNE_FEATURES     = "armv7a vfp neon cortexa9"
> TARGET_FPU        = "vfp-neon"
> meta
> meta-yocto        = "master:e6e2b9bd66100c078c029ca7e34829cf1dfb5490"
> meta-ti           = "master:9d5f7904444febfaeaacce88f50c5ceb700552f1"
> 
> The pandaboard task list is:
> DONE: refresh OMAP4 kernel
> DONE: introduce new X11 video driver
> TODO: introduce customized Gst/gst-ducati and libdce
> TODO: add support for DRI2, SGX accelerated EXA, DRI2Video
> 
> Some of these patches could certainly make their way in oe-core at
> some point.
> 
> This Xf86-video-omap driver has been tested with 1.11 Xserver, but
> also locally with 1.12. With 1.12 xrandr rotation is working, as a few
> rotation related bugs were fixed indeed in 1.12, that could be
> backported in 1.11 if needed. xrandr mode setting has been tested with
> 1.11 and 1.12. Multi display support should work too.
> 
> 
> Enrico Butera (1):
>   libdrm: enable omap experimental api support
> 
> Nicolas Dechesne (2):
>   xf86-video-omap: add new recipe for OMAP4/5 X11 video driver
>   pandaboard: use xf86-video-omap by default in XSERVER config
> 
>  conf/machine/include/omap4.inc                     |    3 +-
>  recipes-graphics/drm/libdrm_2.4.39.bbappend        |    3 +
>  .../xorg-driver/xf86-video-omap_git.bb             |   31 ++++++++++++++
>  .../xserver-xf86-config/omap4/xorg.conf            |   44 +++++++-------------
>  4 files changed, 51 insertions(+), 30 deletions(-)
>  create mode 100644 recipes-graphics/drm/libdrm_2.4.39.bbappend
>  create mode 100644 recipes-graphics/xorg-driver/xf86-video-omap_git.bb
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 

