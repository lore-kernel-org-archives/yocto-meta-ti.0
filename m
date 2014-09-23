Return-Path: <karthik.ramanan@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B49A5E0086F; Tue, 23 Sep 2014 09:04:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	URI_HEX autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
	*  1.1 URI_HEX URI: URI hostname has long hexadecimal sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9594DE007DF
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 09:03:57 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8NG3uPf019585
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:03:56 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8NG3uRh010498
	for <meta-ti@yoctoproject.org>; Tue, 23 Sep 2014 11:03:56 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Sep 2014 11:03:55 -0500
Received: from zubuntu.apr.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s8NG3s7C031889;	Tue, 23 Sep 2014 11:03:55 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Tue, 23 Sep 2014 21:30:30 +0530
Message-ID: <1411488036-32089-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [for master 0/6] GFX/MM patches from meta-glsdk layer
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
X-List-Received-Date: Tue, 23 Sep 2014 16:04:04 -0000
Content-Type: text/plain

This patch set contains the first set of patches upstreamed to
meta-ti from meta-glsdk.

Each of these patches can be independently applied in any order.

Karthik Ramanan (6):
  omapdrm-pvr: recipe update for SGX KM compatible with Kernel 3.12
  dspdce-fw: Updated dspdce firmware for latest IPC version
  ipumm-fw: Updated ipumm firmware for latest IPC version
  bltsville: Updated SRCREV to the latest
  omap5-sgx-ddk-um-linux: Updated SRCREV to include bugfixes
  libdrm: do_install_append added for modetest

 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb      |   26 ++++++++++++++
 recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb        |   36 ++++++++++++++++++++
 .../powervr-drivers/omapdrm-pvr_1.9.2253347.bb     |    8 ++---
 recipes-graphics/bltsville/bltsville_git.bb        |    4 +--
 recipes-graphics/drm/libdrm_2.4.41.bb              |    8 ++++-
 .../libgles/omap5-sgx-ddk-um-linux_1.9.0.12.bb     |    4 +--
 6 files changed, 77 insertions(+), 9 deletions(-)
 create mode 100644 recipes-bsp/dspdce-fw/dspdce-fw_1.00.00.04.bb
 create mode 100644 recipes-bsp/ipumm-fw/ipumm-fw_3.00.06.00.bb

-- 
1.7.9.5


