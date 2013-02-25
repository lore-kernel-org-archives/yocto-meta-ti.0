Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8A213E0027C
	for <meta-ti@yoctoproject.org>; Mon, 25 Feb 2013 14:54:32 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 3A19552A1B; Mon, 25 Feb 2013 22:54:32 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130225225432.3A19552A1B@arago-project.org>
Date: Mon, 25 Feb 2013 22:54:32 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : linux-omap3: Add supported kernel recipe for am37x-evm and am3517-evm
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
X-List-Received-Date: Mon, 25 Feb 2013 22:54:32 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 153b5ed063c0bc2b16b938409027794a8dad908e
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=153b5ed063c0bc2b16b938409027794a8dad908e

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Sun Feb 17 16:00:31 2013 -0600

linux-omap3: Add supported kernel recipe for am37x-evm and am3517-evm

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...date-PIO-mode-help-information-in-Kconfig.patch |   44 +
 .../am3517-evm/defconfig                           | 2358 +++++++
 .../omap3/0001-Fix-matrix-suspend.patch            |  111 +
 ...upport-remove-support-for-non-TI-hardware.patch |  130 +
 ...001-am37x-Adding-ABB-Support-for-1GHz-OPP.patch |  319 +
 ...ux-omap3-Add-OCF-support-to-2.6.37-kernel.patch | 7043 ++++++++++++++++++++
 ...nable-clock-pad-register-in-configuration.patch |   29 +
 .../0001-nlcp-sdio-fixes-for-wowlan-support.patch  |   96 +
 ...7evm-Allow-for-NAND-to-really-be-disabled.patch |   48 +
 ...vm-add-support-for-the-WL12xx-WLAN-module.patch |  147 +
 .../0001-omap3evm-add-wake-on-wlan-support.patch   |   49 +
 ...0001-omap_hsmmc-make-default-dto-value-14.patch |   34 +
 ...musb-am35x-set-default-VBUS-timeout-value.patch |   38 +
 ...ecting-WL12XX_PLATFROM_DATA-independently.patch |   37 +
 ...pport-suspend-resume-while-runtime-suspen.patch |   82 +
 ...map3-am3517evm-Update-NOR-partition-table.patch |   58 +
 ...map3_evm_defconfig-add-OCF-driver-support.patch | 2292 +++++++
 ...2-usb-musb-am35x-fix-role-switching-issue.patch |   67 +
 .../0003-AM3517-Add-am3517_evn_nor_defconfig.patch |  256 +
 ...detection-of-nonremovable-cards-on-rescan.patch |   43 +
 .../omap3/0003-mmc_card_keep_power-cleanups.patch  |   69 +
 ...ap3_evm_defconfig-add-WLAN-config-options.patch |  283 +
 ...-not-switch-to-1-bit-mode-if-not-required.patch |   43 +
 ...n-t-reinitialize-nonremovable-powered-res.patch |   77 +
 ...0005-mmc-fix-division-by-zero-in-MMC-core.patch |   41 +
 ...io-don-t-power-up-cards-on-system-suspend.patch |  112 +
 ...icate-insertion-of-mmc_card_keep_power-fu.patch |   30 +
 ...0006-wl12xx-Backport-wl12xx-platform-data.patch |   64 +
 .../omap3/0007-activate-wireless-extensions.patch  |   26 +
 .../omap3/defconfig                                | 2505 +++++++
 .../linux/linux-omap3_2.6.37-psp04.02.00.07.bb     |  101 +
 31 files changed, 16632 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=153b5ed063c0bc2b16b938409027794a8dad908e

