Return-Path: <joelagnel@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0194E0137B
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 21:15:27 -0700 (PDT)
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id p9O4FP1f029571
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:15:25 -0500
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id p9O4FPTK028467
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:15:25 -0500 (CDT)
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id p9O4FP6U002913
	for <meta-ti@yoctoproject.org>; Sun, 23 Oct 2011 23:15:25 -0500 (CDT)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Sun, 23 Oct 2011 23:15:25 -0500
Received: from localhost.localdomain (chase-ubuntu.am.dhcp.ti.com
	[128.247.105.25])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	p9O4FLit023860;	Sun, 23 Oct 2011 23:15:25 -0500
From: Joel A Fernandes <joelagnel@ti.com>
To: <meta-ti@yoctoproject.org>
Date: Sun, 23 Oct 2011 22:59:20 -0500
Message-ID: <1319428763-9677-1-git-send-email-joelagnel@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: Joel A Fernandes <joelagnel@ti.com>, jdk@ti.com
Subject: [PATCH meta-ti 0/3] Update linux-ti33x-psp and beaglebone-tester to latest, add EEPROM patches.
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
X-List-Received-Date: Mon, 24 Oct 2011 04:15:27 -0000
Content-Type: text/plain

Please apply these 3 patches which apart from other things also fixes the kernel build and adds EEPROM support.

All changes have been build and runtime tested.

Thanks!

Joel A Fernandes (3):
  sdcard_image: Copy uEnv.txt once again as the new bonetester also
    checks for GPIO grounding
  linux-ti33x-psp 3.1rc8: Update to latest SRCREV, add EEPROM patches
  beaglebone-tester: Update to latest and bump PR

 classes/sdcard_image.bbclass                       |    3 +-
 ...heck-return-value-of-omap_mux_init_signal.patch |   34 ++++++++++
 ...ility-to-dynamically-reconfigure-chip-inf.patch |   57 +++++++++++++++++
 ...econfigure-EEPROM-with-new-eeprom_info-in.patch |   65 ++++++++++++++++++++
 recipes-kernel/linux/linux-ti33x-psp_3.0+3.1rc.bb  |    7 ++-
 recipes-ti/beagleboard/beaglebone-tester.bb        |    6 +-
 6 files changed, 165 insertions(+), 7 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0001-am335x-Check-return-value-of-omap_mux_init_signal.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0002-at24-Add-ability-to-dynamically-reconfigure-chip-inf.patch
 create mode 100644 recipes-kernel/linux/linux-ti33x-psp-3.0+3.1rc/0003-am335x-evm-Reconfigure-EEPROM-with-new-eeprom_info-in.patch


