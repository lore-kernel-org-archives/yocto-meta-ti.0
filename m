Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62EACE01469
	for <meta-ti@yoctoproject.org>; Mon, 18 Mar 2013 16:25:13 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id CF01D52A47; Mon, 18 Mar 2013 23:25:12 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130318232512.CF01D52A47@arago-project.org>
Date: Mon, 18 Mar 2013 23:25:12 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-ti33x-psp 3.1: remove an older outdated 3. 1 kernel recipe for ti33x
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
X-List-Received-Date: Mon, 18 Mar 2013 23:25:13 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 261a5e98426f512ab77f8f45c8a90babdea7bfe4
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=261a5e98426f512ab77f8f45c8a90babdea7bfe4

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Mon Mar 18 14:39:09 2013 -0400

linux-ti33x-psp 3.1: remove an older outdated 3.1 kernel recipe for ti33x

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Chase Maupin <chase.maupin@ti.com>

---

 ...335x-BeagleBone-version-detection-and-sup.patch |  140 -
 ...1-f_rndis-HACK-around-undefined-variables.patch |   31 -
 ...core-kill-all-global-and-static-variables.patch |  263 -
 ...0002-ARM-OMAP2-beaglebone-add-LED-support.patch |  132 -
 ...02-arm-omap-am335x-correct-32KHz-clk-rate.patch |   28 -
 ...-beaglebone-add-DVI-support-needs-cleanup.patch |  165 -
 ...spi-correct-memory-range-when-requesting-.patch |   47 -
 ...spi-follow-proper-pm_runtime-enable-disab.patch |   44 -
 ...4-da8xx-fb-add-DVI-support-for-beaglebone.patch |   38 -
 ...ap-mcspi-follow-proper-probe-remove-steps.patch |  120 -
 ...pi41_dma-Check-if-scheduling-is-required-.patch |   86 -
 ...add-pdata-for-all-cape-EEPROM-permutation.patch |   63 -
 ...dd-support-for-7-LCD-cape-fix-DVI-entries.patch |  359 -
 ...033-beaglebone-update-DVI-cape-partnumber.patch |   26 -
 ...really-enable-i2c2-pullups-fixes-timeouts.patch |   29 -
 ...-beaglebone-add-structs-for-DVI-cape-LEDs.patch |  119 -
 ...036-beaglebone-update-LCD-cape-partnumber.patch |   26 -
 ...compare-complete-partnumber-not-the-first.patch |   45 -
 ...Set-dto-to-max-value-of-14-to-avoid-SD-Ca.patch |   34 -
 ...AM335x-Add-support-for-TSC-on-Beta-GP-EVM.patch |  219 -
 ...M-OMAP-AM335x-Add-support-for-Beta-GP-EVM.patch |  122 -
 ...d-support-for-pressure-measurement-on-TSC.patch |  219 -
 ...general-purpose-mode-untested-with-touchs.patch |  422 --
 ...dc-Add-board-file-mfd-support-fix-warning.patch |   86 -
 ...AM335X-init-tsc-bone-style-for-new-boards.patch |   26 -
 ...cadc-make-stepconfig-channel-configurable.patch |   46 -
 .../adc/0008-tscadc-Trigger-through-sysfs.patch    |  151 -
 ...meta-ti-Remove-debug-messages-for-meta-ti.patch |   34 -
 ...c-switch-to-polling-instead-of-interrupts.patch |   54 -
 .../linux/linux-ti33x-psp-3.1/am335x-evm/defconfig | 2300 -------
 .../linux/linux-ti33x-psp-3.1/beaglebone/defconfig | 3472 ----------
 .../beaglebone/logo_linux_clut224.ppm              | 7053 --------------------
 ...-Added-support-for-Bosch-D_CAN-controller.patch | 1839 -----
 ...can-Added-platform-data-for-am33xx-device.patch |  260 -
 ...DCAN-config-added-to-am335x_evm_defconfig.patch |   57 -
 ...0004-can-d_can-fix-for-cansend-loop-issue.patch |   49 -
 .../can/0005-can-d_can-fixes-the-rmmod-crash.patch |   60 -
 ...can-am335x-profile-modification-for-dcan0.patch |   47 -
 .../0001-arm-omap-mux33xx-Add-i2c2-pin-muix.patch  |   31 -
 ...-hwmod-33xx-Add-support-for-third-i2c-bus.patch |   89 -
 ...ard-Add-quick-hack-to-get-i2c2-bus-suppor.patch |   74 -
 ...P-framebuffer-driver-supporting-Adafruit-.patch |  667 --
 ...hack-in-support-for-the-WIP-st7735fb-driv.patch |   73 -
 .../tipspkernel/am335x-evm/defconfig               | 2300 -------
 recipes-kernel/linux/linux-ti33x-psp_3.1.bb        |   63 -
 45 files changed, 0 insertions(+), 21608 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=261a5e98426f512ab77f8f45c8a90babdea7bfe4

