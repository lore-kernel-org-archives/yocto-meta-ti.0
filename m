Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CBDDC54756
	for <webhook@archiver.kernel.org>; Mon, 19 May 2025 17:01:35 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.391.1747674085111375763
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 19 May 2025 10:01:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=rC/HJ2Ue;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 54JH1N5M955443
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 May 2025 12:01:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1747674083;
	bh=n3qwLtc7Rdw4ps08+WIg0u62Ylv/7Uiqsn94l+JEfSs=;
	h=From:To:Subject:Date;
	b=rC/HJ2UegHLZyc1FY5cpzHaH82dwdk7uyaXbxsWsIc6JfA5Jp6t7kC31NsV4VlTft
	 b3b4mh1FidLXygrExvHOH22nzIOaQrONHJ1RmywbCKamDpw4Vfw7BJ1ycmQZBIAvVp
	 ZxrKLxOwWaiB2vlzbBNdNXy+yJ+Hb61z6jGG3TGE=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 54JH1NOc085522
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 May 2025 12:01:23 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 19
 May 2025 12:01:23 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 19 May 2025 12:01:23 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54JH1N5K111540;
	Mon, 19 May 2025 12:01:23 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1uH3rf-0005ts-1G; Mon, 19 May 2025 12:01:23 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 0/3] Cleanup for auto checking
Date: Mon, 19 May 2025 12:01:20 -0500
Message-ID: <20250519170123.22638-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 19 May 2025 17:01:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18579

We are going to be turning on an automated patch checker for the
meta-ti mailing list soon.  This is a series of small cleanups to
address issues that the checker is looking for so that everything is
clean at the start.

Ryan Eatmon (3):
  CLEANUP: Add missing SUMMARY
  CLEANUP: :append needs a space
  check_yocto_rules: Add new config file

 check_yocto_rules.json                        | 31 +++++++++++++++++++
 .../cm3-pm-firmware/amx3-cm3_git.bb           |  2 +-
 .../ti-gc320-driver_5.0.11.p7.bb              |  2 +-
 .../recipes-bsp/goodix-fw/goodix-fw_git.bb    |  2 +-
 .../ti-img-rogue-driver_23.3.6512818.bb       |  2 +-
 .../ti-img-rogue-driver_24.2.6643903.bb       |  2 +-
 .../ti-sgx-ddk-km_1.17.4948957.bb             |  2 +-
 .../recipes-bsp/vis-fw/vis_01.50.07.15.bb     |  2 +-
 .../recipes-bsp/vpdma-fw/vpdma-fw_03-2012.bb  |  2 +-
 .../recipes-bsp/vpe-tests/vpe-tests_git.bb    |  2 +-
 .../libgal/ti-gc320-libs_5.0.11.p7.bb         |  2 +-
 .../recipes-graphics/mesa/mesa-pvr_22.3.5.bb  |  2 +-
 .../recipes-graphics/mesa/mesa-pvr_24.0.1.bb  |  2 +-
 .../ti-img-rogue-umlibs_23.3.6512818.bb       |  2 +-
 .../ti-img-rogue-umlibs_24.2.6643903.bb       |  2 +-
 .../ti-sgx-ddk-um_1.17.4948957.bb             |  2 +-
 .../optee/optee-os-ti-overrides.inc           |  2 +-
 meta-ti-bsp/recipes-ti/ipc/ti-ipc.inc         |  1 +
 meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb      |  1 +
 .../recipes-ti/secdev/ti-k3-secdev_git.bb     |  2 +-
 meta-ti-extras/recipes-bsp/bt-fw/bt-fw_git.bb |  2 +-
 .../dsptop/debugss-module-drv_git.bb          |  2 +-
 .../recipes-bsp/dsptop/dsptop_git.bb          |  2 +-
 .../recipes-bsp/pru/pru-icss_git.bb           |  2 +-
 .../wl18xx-fw/wl18xx-fw_8.9.0.0.86.bb         |  2 +-
 .../recipes-connectivity/uim/uim-sysfs_8.5.bb |  2 +-
 .../wl18xx-calibrator_8.7.3.bb                |  2 +-
 .../wl18xx-target-scripts_8.8.1.bb            |  2 +-
 .../wlconf/wlconf_8.7.3.bb                    |  2 +-
 .../recipes-devtools/cuia/cuia_1.0.0.13.bb    |  2 +-
 .../recipes-devtools/gdbc6x/gdbc6x_git.bb     |  2 +-
 .../gdbc6x/gdbserver-c6x_git.bb               |  2 +-
 .../gdbc6x/gdbserverproxy-module-drv_git.bb   |  2 +-
 .../beagleboard/beaglebone-capes.bb           |  2 +-
 meta-ti-extras/recipes-ti/bios/ti-sysbios.inc |  2 +-
 .../ti-codec-engine_3.24.00.08.bb             |  2 +-
 .../gcc-arm-baremetal_7-2018-q2-update.bb     |  2 +-
 .../recipes-ti/devtools/ti-cg-xml_2.61.00.bb  |  2 +-
 .../recipes-ti/devtools/ti-cgt-pru_2.3.3.bb   |  2 +-
 .../recipes-ti/devtools/ti-cgt470.inc         |  2 +-
 .../recipes-ti/devtools/ti-cgt6x_8.3.2.bb     |  2 +-
 .../devtools/ti-xdctools_3.55.02.22.bb        |  1 +
 .../ti-framework-components.inc               |  2 +-
 .../recipes-ti/imglib/imglib-c66x.inc         |  1 +
 meta-ti-extras/recipes-ti/vlib/vlib-c66x.inc  |  2 +-
 meta-ti-extras/recipes-ti/xdais/ti-xdais.inc  |  2 +-
 46 files changed, 76 insertions(+), 41 deletions(-)
 create mode 100644 check_yocto_rules.json

-- 
2.17.1


