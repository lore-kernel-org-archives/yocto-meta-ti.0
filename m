Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B205DE01423
	for <meta-ti@yoctoproject.org>; Mon, 25 Mar 2013 17:42:24 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 6A64452A56; Tue, 26 Mar 2013 00:42:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130326004223.6A64452A56@arago-project.org>
Date: Tue, 26 Mar 2013 00:42:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : u-boot 2011.06: remove an older no longer used version
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
X-List-Received-Date: Tue, 26 Mar 2013 00:42:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 22a2fa4b97c7ce6dfcd1420d1cadb034c309047e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=22a2fa4b97c7ce6dfcd1420d1cadb034c309047e

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 17:39:10 2013 -0400

u-boot 2011.06: remove an older no longer used version

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...-Beagle-Pin-Mux-initialization-glitch-fix.patch |   46 -
 ...-omapfb.debug-y-from-Beagle-and-Overo-env.patch |   56 --
 ...agle-pass-expansionboard-name-in-bootargs.patch |   57 --
 ...beagleboard-add-support-for-xM-revision-C.patch |   47 -
 ...-for-SMSC95XX-USB-2.0-10-100MBit-Ethernet.patch |  989 --------------------
 ...t-hardware-MAC-address-framework-to-usbne.patch |  245 -----
 ...Add-documentation-for-USB-Host-Networking.patch |  188 ----
 .../u-boot/2011.06/0008-dm3730-enable-dpll5.patch  |   31 -
 ...beagleboard-enable-HUB-power-on-XM-boards.patch |   40 -
 ...-beagleboard-turn-off-clocks-in-ehci_stop.patch |   32 -
 .../0011-beagleboard-enable-networking.patch       |   45 -
 ...12-beagleboard-switch-to-ttyO2-as-console.patch |   26 -
 ...gleboard-load-kernel-from-MMC-ext-not-FAT.patch |   27 -
 ...4-beagleboard-enable-asix-driver-and-dhcp.patch |   34 -
 ...-hardcode-MAC-for-onboard-SMSC-and-use-uI.patch |   26 -
 ...agleboard-decrease-bootdelay-to-2-seconds.patch |   26 -
 ...__attribute__-packed-for-struct-ehci_hccr.patch |   58 --
 ...sb-Some-EHCI-chipsets-are-slow-to-respond.patch |   29 -
 .../0019-OMAP3-Add-DSS-driver-for-OMAP3.patch      |  349 -------
 .../2011.06/0020-video-DSS-makefile-update.patch   |   30 -
 .../0021-BeagleBoard-Configure-DVI-S-video.patch   |  170 ----
 .../0022-BeagleBoard-config-enable-DSS.patch       |   25 -
 ...0023-BeagleBoard-Added-userbutton-command.patch |  107 ---
 ...ED-name-match-finding-avoiding-extraneous.patch |   44 -
 .../0025-BeagleBoard-fix-LED-0-1-in-driver.patch   |   31 -
 .../0026-led-added-cmd_led-to-Makefile.patch       |   29 -
 ...led-correct-off-on-locations-in-structure.patch |   36 -
 .../0028-BeagleBoard-config-make-mtest-run.patch   |   36 -
 ...-config-increase-command-line-functionali.patch |   42 -
 ...agleBoard-config-add-optargs-buddy-camera.patch |   51 -
 .../2011.06/0031-omap4-add-support-for-gpios.patch |  306 ------
 .../2011.06/0032-omap4-add-support-for-EHCI.patch  |  322 -------
 .../0033-omap4_panda-add-support-for-EHCI.patch    |   97 --
 ...nda-adding-support-for-smsc-and-tftp-boot.patch |   66 --
 ...035-omap4_panda-use-uImage.panda-for-tftp.patch |   26 -
 .../u-boot/u-boot/omap3-touchbook/fw_env.config    |    6 -
 recipes-bsp/u-boot/u-boot/touchbook-config.patch   |   25 -
 recipes-bsp/u-boot/u-boot_2011.06.bb               |   51 -
 38 files changed, 0 insertions(+), 3851 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=22a2fa4b97c7ce6dfcd1420d1cadb034c309047e

