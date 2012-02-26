Return-Path: <ebutera@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD2C2E0074A
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:24 -0800 (PST)
Received: by eeke49 with SMTP id e49so869394eek.35
	for <meta-ti@yoctoproject.org>; Sun, 26 Feb 2012 11:39:23 -0800 (PST)
Received-SPF: pass (google.com: domain of ebutera@gmail.com designates
	10.213.10.82 as permitted sender) client-ip=10.213.10.82; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of ebutera@gmail.com
	designates 10.213.10.82 as permitted sender)
	smtp.mail=ebutera@gmail.com;
	dkim=pass header.i=ebutera@gmail.com
Received: from mr.google.com ([10.213.10.82])
	by 10.213.10.82 with SMTP id o18mr3142489ebo.142.1330285163599
	(num_hops = 1); Sun, 26 Feb 2012 11:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=xy42YST9/ocIyeEKHoNdRtMkwPCEb3j9b7KDRswei4E=;
	b=OvBnxJF0+/UOQqMzhZgM3LU/g6RnL/1j1dWmVTc4JvyQGdG93AfvEIKZ7rKVw8OVnq
	2bnWSS84d7ce0nK3qmpuCfEJk/nG4JYXl26HfSKZ+poltZYjk3OleGW4wA97151SpXbK
	8nMWFxNGbbp80h61qetjulLVySZVJblnbUxz4=
Received: by 10.213.10.82 with SMTP id o18mr2374807ebo.142.1330285163509;
	Sun, 26 Feb 2012 11:39:23 -0800 (PST)
Received: from localhost.localdomain ([188.11.55.70])
	by mx.google.com with ESMTPS id v51sm48713599eef.2.2012.02.26.11.39.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 11:39:22 -0800 (PST)
Sender: Enrico Butera <ebutera@gmail.com>
From: Enrico Butera <ebutera@users.berlios.de>
To: meta-ti@yoctoproject.org
Date: Sun, 26 Feb 2012 20:39:05 +0100
Message-Id: <1330285154-14853-1-git-send-email-ebutera@users.berlios.de>
X-Mailer: git-send-email 1.7.5.4
Subject: [RFC PATCH 0/9] gst-ducati and its dependencies
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 26 Feb 2012 19:39:25 -0000

This patch series add support for the ducati gstreamer plugin for omap4
(tested on pandaboard ES).

Before you get excited: this is still NOT working. I'm posting it hoping that
with some broader testing and help we can make it work, and to stop pestering
Koen and Rob with hundred of questions :D

What you get: the gst-ducati plugin and the "Notify..reroute..xem3" firmware,
you will need a prebuilt dce app xem3 firmware because the hdvicp2 files needed
to build it disappeared from TI site. I used the one from linaro ubuntu 11.04
for my tests.
This is probably the root cause of this not working: it seems that syslink is
picky about kernel differences in userspace and xem3 builds.
Or maybe i'm just using some wrong kernel boot param (mem...).

Instead of copying here tons of error logs just test it and you will see, you can
try a simple "videotestsrc ! ducati... ! fakesink" pipeline.

I also added the kernel version i used in my tests, not because i think it should be
the default kernel but just as a reference (no X tested, just a console-image
with some additional packages).

Read the ti-cgt470 recipe because you will have to manually download a required file.

I made also some recipes for newer codec-engine and friends but they are useless
without the hdvicp2 files and there are some problems there too, so i'll just
keep them on hold.

If TI will not make the hdvicp2 files public in some time then someone who has
access to those files could build a dce app xem3 firmware verified to work with
gst-ducati built with OE.

Enrico Butera (9):
  devtools cgt470: add version 4.9.1
  libtimemmgr: add latest git version
  syslink-omap4: add syslink for omap4 platform
  bios-syslink: add omap4 bios syslink
  libdce: add latest git version
  gstreamer: add bbappends to use patched versions needed by gst-ducati
  gst-ducati: add latest git version
  xdais: add version 7.20.00.07
  linux-omap4: add version 3.1 (omapzoom integration kernel-ubuntu)

 .../linux/linux-omap4-3.1.0/pandaboard/defconfig   | 4387 ++++++++++++++++++++
 recipes-kernel/linux/linux-omap4_3.1.0.bb          |   23 +
 .../gstreamer/gst-plugins-bad_0.10.22.bbappend     |   21 +
 .../gstreamer/gst-plugins-base_0.10.35.bbappend    |   18 +
 .../gstreamer/gstreamer_0.10.35.bbappend           |   22 +
 recipes-ti/devtools/ti-cgt470_4.9.1.bb             |   13 +
 recipes-ti/gstreamer-ti/gst-ducati_git.bb          |   28 +
 recipes-ti/includes/ti-paths.inc                   |    2 +
 recipes-ti/libdce/libdce.inc                       |   15 +
 recipes-ti/libdce/libdce_git.bb                    |   11 +
 recipes-ti/syslink/ti-bios-syslink_git.bb          |   75 +
 recipes-ti/syslink/ti-syslink-omap4.inc            |   21 +
 recipes-ti/syslink/ti-syslink-omap4_git.bb         |   14 +
 recipes-ti/tiler/libtimemmgr.inc                   |   15 +
 recipes-ti/tiler/libtimemmgr_git.bb                |   14 +
 recipes-ti/xdais/ti-xdais_7.20.00.07.bb            |   12 +
 16 files changed, 4691 insertions(+), 0 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-omap4-3.1.0/pandaboard/defconfig
 create mode 100644 recipes-kernel/linux/linux-omap4_3.1.0.bb
 create mode 100644 recipes-multimedia/gstreamer/gst-plugins-bad_0.10.22.bbappend
 create mode 100644 recipes-multimedia/gstreamer/gst-plugins-base_0.10.35.bbappend
 create mode 100644 recipes-multimedia/gstreamer/gstreamer_0.10.35.bbappend
 create mode 100644 recipes-ti/devtools/ti-cgt470_4.9.1.bb
 create mode 100644 recipes-ti/gstreamer-ti/gst-ducati_git.bb
 create mode 100644 recipes-ti/libdce/libdce.inc
 create mode 100644 recipes-ti/libdce/libdce_git.bb
 create mode 100644 recipes-ti/syslink/ti-bios-syslink_git.bb
 create mode 100644 recipes-ti/syslink/ti-syslink-omap4.inc
 create mode 100644 recipes-ti/syslink/ti-syslink-omap4_git.bb
 create mode 100644 recipes-ti/tiler/libtimemmgr.inc
 create mode 100644 recipes-ti/tiler/libtimemmgr_git.bb
 create mode 100644 recipes-ti/xdais/ti-xdais_7.20.00.07.bb

-- 
1.7.5.4


