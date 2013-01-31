Return-Path: <rpjday@crashcourse.ca>
Received: from astoria.ccjclearline.com (astoria.ccjclearline.com
	[64.235.106.9])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5154E011AB
	for <meta-ti@yoctoproject.org>; Thu, 31 Jan 2013 03:58:41 -0800 (PST)
Received: from cpec03f0ed08c7f-cm001ac318e826.cpe.net.cable.rogers.com
	([174.115.5.73]:58026 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1U0smv-00005Z-8r
	for meta-ti@yoctoproject.org; Thu, 31 Jan 2013 06:58:41 -0500
Date: Thu, 31 Jan 2013 06:58:37 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@oneiric
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Message-ID: <alpine.DEB.2.02.1301310653100.25130@oneiric>
User-Agent: Alpine 2.02 (DEB 1266 2009-07-14)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: objections to replacing git SRCREV tag names with actual hash IDs?
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
X-List-Received-Date: Thu, 31 Jan 2013 11:58:42 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  surely, some of you saw this discussion on the oe-core list last
night, but would there be any objection to replacing the small number
of git SRCREV settings of tag names with their actual hash IDs?  the
motivation should be obvious -- avoid network traffic to parse those
tag names, even when that recipe isn't even being used in the image
being built.

  here's the entire list of SRCREV assignments in all of meta-ti, so
you can see there are only four related to git tag names:

recipes-bsp/boot-monitor/boot-monitor_git.bb:SRCREV = "DEV.MCSDK-03.00.00.07"
recipes-bsp/u-boot/u-boot_2011.09.bb:SRCREV = "fdbe8b9a2d1858ba35dd6214315563ad44d4a0e3"
recipes-bsp/u-boot/u-boot_2011.10rc.bb:SRCREV = "dc52533ccff00a12761f793d66b39e4f6a4a3bba"
recipes-bsp/u-boot/u-boot_2011.09-psp04.06.00.08.bb:SRCREV = "1e4626f0d5f3bb04ec974e76a5d9029875269d31"
recipes-bsp/u-boot/u-boot_2011.06.bb:SRCREV = "b1af6f532e0d348b153d5c148369229d24af361a"
recipes-bsp/u-boot/u-boot_2011.12.bb:SRCREV = "cba9a894fdb1cb49b60fcd1d1d6919cbd7995dd5"
recipes-bsp/u-boot/u-boot_2013.01.bb:SRCREV = "DEV.MCSDK-03.00.00.07"
recipes-bsp/ti/am33x-cm3_git.bb:SRCREV = "cf07b841d6e8c5e026eecb259d143f3dff412c8e"
recipes-bsp/ti/am-sysinfo_svn.bb:SRCREV = "5"
recipes-connectivity/uim/uim_git.bb:SRCREV = "c73894456df5def97111cb33d2106b684b8b7959"
recipes-graphics/omapfbplay/omapfbplay.inc:SRCREV = "34293052c5a2ae328eac6903512e6b4ce19b5639"
recipes-kernel/linux/linux-omap_2.6.37.bb:SRCREV = "fa3b4e23ec20cfc944db7cc2b30b0d82c20e4472"
recipes-kernel/linux/linux-ti33x-psp_3.1.bb:SRCREV = "1d84d8853fa30cf3db2571a5aec572accca4e29d"
recipes-kernel/linux/linux-ti81xx-psp_2.6.37.bb:SRCREV = "745a06cb913ad7a9ab44855aa36d8c012cd5793b"
recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bb:SRCREV = "d7e124e8074cccf9958290e773c88a4b2b36412b"
recipes-kernel/linux/linux-omapl138-psp_2.6.37.bb:SRCREV = "v2.6.37_DAVINCIPSP_03.21.00.04"
recipes-kernel/linux/linux-keystone_3.6.6.bb:SRCREV = "DEV.MCSDK-03.06.06.07"
recipes-kernel/linux/linux-omap4_3.4.bb:SRCREV = "c34a43ec74168b892a948b45695486f1a3d700af"
recipes-kernel/linux/linux-omap-psp_2.6.32.bb:SRCREV = "5fc29e7b2a76a64a739f857858ef0b98294aa155"
recipes-kernel/linux/linux-ti33x-psp_3.2.bb:SRCREV = "720e07b4c1f687b61b147b31c698cb6816d72f01"
recipes-kernel/linux/linux-omap4_3.1.0.bb:SRCREV = "a5c60c099296fcfc0c8fa8085c40883971486512"
recipes-misc/payload/beaglebone-getting-started.bb:SRCREV = "6c548a307c948b28a99d48fd17d9790b56182196"
recipes-ti/beagleboard/beaglebone-tester.bb:SRCREV = "487a13e2e4faaafa40ba5430600e6aeecf9581a8"
recipes-ti/gstreamer-ti/gstreamer-ti_svn.bb:SRCREV = "962"
recipes-ti/codec-engine/ti-codecs-omap3530_4.00.00.00.bb:SRCREV = "8393c892b09e0ac42b19ff1531e232478c3b1a6c"

  i'm currently spending some time at a site that doesn't allow git
access so those tag names are fatal for doing any sort of OE building.
and only one of those appears to *prefer* to use the tag name --

recipes-kernel/linux/linux-keystone_3.6.6.bb:

# The tree tends to rebase, use literal stable tags
SRCREV = "DEV.MCSDK-03.06.06.07"

  but, really, you shouldn't be rebasing published commits, anyway.
so ... thoughts?

rday

-- 

========================================================================
Robert P. J. Day                                 Ottawa, Ontario, CANADA
                        http://crashcourse.ca

Twitter:                                       http://twitter.com/rpjday
LinkedIn:                               http://ca.linkedin.com/in/rpjday
========================================================================

