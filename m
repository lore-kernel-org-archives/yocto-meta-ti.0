Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F30DDE01275
	for <meta-ti@yoctoproject.org>; Thu, 18 Oct 2012 08:36:23 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2613C52AB6; Thu, 18 Oct 2012 15:36:23 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20121018153623.2613C52AB6@arago-project.org>
Date: Thu, 18 Oct 2012 15:36:23 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : linux-am335x-3.2.0-psp04.06.00.08: Add PSP v04.06. 00.08 of the Linux kernel
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
X-List-Received-Date: Thu, 18 Oct 2012 15:36:24 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: e615e05e0f420d7e2411da8a101cb00a8bf78a68
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e615e05e0f420d7e2411da8a101cb00a8bf78a68

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Fri Oct 12 00:14:45 2012 -0500

linux-am335x-3.2.0-psp04.06.00.08: Add PSP v04.06.00.08 of the Linux kernel

* Add the PSP release version of the Linux kernel for the am335x-evm
* Include a variable called KERNEL_PATCHES which can be used to add
  patches on top of the PSP release of the Linux kernel. Currently used
  to apply various patches that add functionality or fixes bugs.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Denys Dmytriyenko <denis@denix.org>

---

 ...odified-WLAN-enable-and-irq-to-match-boar.patch |   62 +
 ...x-Add-crypto-driver-settings-to-defconfig.patch |  130 +
 ...m335x-Add-pm_runtime-API-to-crypto-driver.patch |  405 ++
 ...x-enable-pullup-on-the-WLAN-enable-pin-fo.patch |   57 +
 ...01-am335x_evm_defconfig-turn-off-MUSB-DMA.patch |   35 +
 ...-using-edge-triggered-interrupts-for-WLAN.patch |   35 +
 ...x-Add-memory-addresses-for-crypto-modules.patch |   41 +
 .../0001-am33xx-Add-SmartReflex-support.patch      | 2014 ++++++
 .../0001-mach-omap2-pm33xx-Disable-VT-switch.patch |   71 +
 ...date-PIO-mode-help-information-in-Kconfig.patch |   45 +
 ...1-omap-serial-add-delay-before-suspending.patch |   42 +
 .../0002-AM335x-OCF-Driver-for-Linux-3.patch       | 7228 ++++++++++++++++++++
 ...-suspend-resume-routines-to-crypto-driver.patch |  147 +
 ...Add-crypto-device-and-resource-structures.patch |  111 +
 ...2-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch |   26 +
 ...rypto-device-and-resource-structure-for-T.patch |   60 +
 ...d-crypto-drivers-to-Kconfig-and-Makefiles.patch |  124 +
 ...eate-header-file-for-OMAP4-crypto-modules.patch |  213 +
 ...m33x-Create-driver-for-TRNG-crypto-module.patch |  324 +
 ...am33x-Create-driver-for-AES-crypto-module.patch |  971 +++
 ...x-Create-driver-for-SHA-MD5-crypto-module.patch | 1444 ++++
 .../linux-am335x-3.2.0-psp04.06.00.08/defconfig    | 2656 +++++++
 .../linux/linux-am335x_3.2.0-psp04.06.00.08.bb     |   81 +
 23 files changed, 16322 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=e615e05e0f420d7e2411da8a101cb00a8bf78a68

