Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C7FFAE00B20; Mon, 19 May 2014 12:20:00 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=5.0 tests=RCVD_IN_DNSWL_HI,RDNS_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from comal.ext.ti.com (unknown [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CDC9E00342
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 12:19:54 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JJJrZK028342
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 14:19:54 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JJJrdv020029
	for <meta-ti@yoctoproject.org>; Mon, 19 May 2014 14:19:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 14:19:53 -0500
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s4JJJog2019914;	Mon, 19 May 2014 14:19:52 -0500
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Mon, 19 May 2014 14:19:39 -0500
Message-ID: <1400527188-16951-1-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/9] Add GLSDK components for omap-a15 devices
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
X-List-Received-Date: Mon, 19 May 2014 19:20:00 -0000
Content-Type: text/plain

This patch set migrates the GLSDK components used for omap-a15
devices from meta-ti-glsdk to meta-ti.  Authorship has been
preserved and the recipes have been cleaned up for meta-ti
mainline.  These patches are a dependency of the patch set
submitted to meta-arago list.

Chase Maupin (3):
  ti-ipc: Consolidate include file and old recipe
  ti-ipc: Consolidate IPC recipes with include file
  dra7xx-evm: Add sgx to MACHINE_FEATURES

Karthik Ramanan (1):
  vis: Add radio application firmware

Mrinmayee Hingolikar (5):
  ti-ipc: Add version 3.21.00.07
  ipumm-fw: Add MM accelerator firmware recipe
  dspdce-fw: Add DSP firmware recipe
  bltsville: Add TI BLTsville library
  omap5-sgx-ddk-um-linux: Add version 1.9.0.12

 conf/machine/dra7xx-evm.conf                       |    2 +-
 recipes-graphics/bltsville/bltsville_git.bb        |   22 +++++++
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |   30 +++++++++
 recipes-ti/dspdce-fw/dspdce-fw_1.00.00.02.bb       |   24 +++++++
 recipes-ti/ipc/ti-ipc.inc                          |   68 +++++++++++++-------
 ...nstallation-prefix-feature-to-products.ma.patch |   38 +++++++++++
 .../ipc/{files => ti-ipc}/tiipclad-daemon.sh       |    2 +-
 recipes-ti/ipc/ti-ipc_1.24.00.16.bb                |   37 ++++++++++-
 recipes-ti/ipc/ti-ipc_3.00.00.bb                   |   51 +--------------
 recipes-ti/ipc/ti-ipc_3.21.00.07.bb                |    4 ++
 recipes-ti/ipumm-fw/ipumm-fw_3.00.04.02.bb         |   30 +++++++++
 recipes-ti/vis-fw/vis_01.50.07.15.bb               |   31 +++++++++
 12 files changed, 264 insertions(+), 75 deletions(-)
 create mode 100644 recipes-graphics/bltsville/bltsville_git.bb
 create mode 100644 recipes-graphics/libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb
 create mode 100644 recipes-ti/dspdce-fw/dspdce-fw_1.00.00.02.bb
 create mode 100644 recipes-ti/ipc/ti-ipc/0002-ipc-Added-installation-prefix-feature-to-products.ma.patch
 rename recipes-ti/ipc/{files => ti-ipc}/tiipclad-daemon.sh (92%)
 mode change 100755 => 100644
 create mode 100644 recipes-ti/ipc/ti-ipc_3.21.00.07.bb
 create mode 100644 recipes-ti/ipumm-fw/ipumm-fw_3.00.04.02.bb
 create mode 100644 recipes-ti/vis-fw/vis_01.50.07.15.bb

-- 
1.7.9.5


