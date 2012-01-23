Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f51.google.com (mail-ww0-f51.google.com [74.125.82.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 03181E01373
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 23 Jan 2012 06:18:40 -0800 (PST)
Received: by wgbdy1 with SMTP id dy1so2539157wgb.8
	for <meta-ti@lists.yoctoproject.org>;
	Mon, 23 Jan 2012 06:18:39 -0800 (PST)
Received: by 10.180.104.5 with SMTP id ga5mr14463636wib.21.1327328319308;
	Mon, 23 Jan 2012 06:18:39 -0800 (PST)
Received: from localhost (ip545070eb.adsl-surfen.hetnet.nl. [84.80.112.235])
	by mx.google.com with ESMTPS id bj10sm13174013wib.9.2012.01.23.06.18.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 23 Jan 2012 06:18:38 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: meta-ti@lists.yoctoproject.org
Date: Mon, 23 Jan 2012 15:18:22 +0100
Message-Id: <1327328309-15956-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH 0/7] SGX recipe rework
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
X-List-Received-Date: Mon, 23 Jan 2012 14:18:41 -0000

This series reworks the packaging of the sgx recipes in the following ways:

1) all the es 'versions' are now subpackaged in to PN-foo-es<version and PN-foo RRECOMMENDS all of them
2) the DRI WS is now packaged as well
3) For recent SDKs the X11 WS is packaged, but nothing is done to shuffle the base libraries around
4) all the PN-foo subpackages remove /etc/powervr-esrev to trigger the relocation code
5) the initscript doesn't depend in the the 'initscripts' package anymore making use work in a systemd world as well as a sysvinit world. 

The most noticable effect is that user can now deinstall (e.g. using BAD_RECOMMENDATIONS) all the es 'versions' they don't need saving a few megabytes of space.

Koen Kooi (7):
  libgles-omap3: split support for ES revisions into subpackages where
    possible
  libgles-omap3: merge in updates from arago
  libgles-omap3: package DRI windowing system as well
  libgles-omap3: install X11 windowing system for newer SDK releases as
    well
  libgles-omap3: adjust packaging for all windowing systems to remove
    the magic esrev file
  omap3-sgx-modules: add 4.05.00.03
  libgles-omap3: add 4.05.00.03

 ....16.3977.bb => omap3-sgx-modules_4.05.00.03.bb} |   12 +-
 recipes-graphics/libgles/libgles-omap3.inc         |  119 +++++++++++++++++---
 recipes-graphics/libgles/libgles-omap3/cputype     |   10 ++-
 recipes-graphics/libgles/libgles-omap3/rc.pvr      |   29 ++++-
 ...3_4.03.00.02.bb => libgles-omap3_4.05.00.03.bb} |   14 +--
 5 files changed, 145 insertions(+), 39 deletions(-)
 copy recipes-bsp/powervr-drivers/{omap3-sgx-modules_1.6.16.3977.bb => omap3-sgx-modules_4.05.00.03.bb} (81%)
 copy recipes-graphics/libgles/{libgles-omap3_4.03.00.02.bb => libgles-omap3_4.05.00.03.bb} (68%)

-- 
1.7.2.5


