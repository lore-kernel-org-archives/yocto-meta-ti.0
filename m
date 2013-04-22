Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACAA1E013C3
	for <meta-ti@yoctoproject.org>; Mon, 22 Apr 2013 13:24:39 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 960A452A44; Mon, 22 Apr 2013 20:24:39 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130422202439.960A452A44@arago-project.org>
Date: Mon, 22 Apr 2013 20:24:39 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : linux-am335x: Update to latest 3.2 kernel release
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
X-List-Received-Date: Mon, 22 Apr 2013 20:24:44 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: danny
Commit: 8a6d2d49dd31c237da4189756973bd0b05f97f48
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=8a6d2d49dd31c237da4189756973bd0b05f97f48

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Mon Apr 22 11:21:41 2013 -0500

linux-am335x: Update to latest 3.2 kernel release

* Update to the latest PSP release (version 04.06.00.10) of the 3.2 kernel.
* Rename recipe to match meta-ti kernel recipe naming convention.
* Use in tree defconfig instead of providing a separate defconfig. These
  defconfigs were the same anyway.
* Add additional crypto patches that were needed to fix suspend and resume
  issues.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../linux-am335x-3.2.0-psp04.06.00.08/defconfig    | 2656 --------------------
 ...0-psp04.06.00.08.bb => linux-am335x-psp-3.2.bb} |   31 +-
 ...hwmod-Convert-SHA0-crypto-device-data-to-.patch |  168 ++
 ...-ARM-OMAP2-AM335x-Update-SPI-flash-layout.patch |   40 +
 ...odified-WLAN-enable-and-irq-to-match-boar.patch |    0
 ...x-Add-crypto-driver-settings-to-defconfig.patch |   36 +-
 ...m335x-Add-pm_runtime-API-to-crypto-driver.patch |    0
 ...x-enable-pullup-on-the-WLAN-enable-pin-fo.patch |    0
 ...01-am335x_evm_defconfig-turn-off-MUSB-DMA.patch |    0
 ...-using-edge-triggered-interrupts-for-WLAN.patch |    0
 ...x-Add-memory-addresses-for-crypto-modules.patch |    0
 .../0001-am33xx-Add-SmartReflex-support.patch      |    0
 .../0001-mach-omap2-pm33xx-Disable-VT-switch.patch |    0
 ...date-PIO-mode-help-information-in-Kconfig.patch |    0
 ...1-omap-serial-add-delay-before-suspending.patch |    0
 ...emove-check-for-GP-only-device-type-in-RN.patch |   29 +
 .../0002-AM335x-OCF-Driver-for-Linux-3.patch       |    0
 .../0002-Smartreflex-limited-to-ES-1.0.patch       |   35 +
 ...-suspend-resume-routines-to-crypto-driver.patch |    0
 ...Add-crypto-device-and-resource-structures.patch |    0
 ...2-am33xx-Enable-CONFIG_AM33XX_SMARTREFLEX.patch |    0
 ...map4-sham-Use-finer-grained-PM-management.patch |   98 +
 ...rypto-device-and-resource-structure-for-T.patch |    0
 ...-omap4-sham-Add-suspend-resume-PM-support.patch |   56 +
 ...d-crypto-drivers-to-Kconfig-and-Makefiles.patch |    0
 ...ap4-sham-Don-t-use-hardcoded-base-address.patch |   45 +
 ...hwmod-Convert-AES0-crypto-device-data-to-.patch |  165 ++
 ...eate-header-file-for-OMAP4-crypto-modules.patch |    0
 ...m33x-Create-driver-for-TRNG-crypto-module.patch |    0
 ...map4-aes-User-finer-grained-PM-management.patch |  127 +
 ...am33x-Create-driver-for-AES-crypto-module.patch |    0
 ...o-omap4-aes-Add-suspend-resume-PM-support.patch |   56 +
 ...x-Create-driver-for-SHA-MD5-crypto-module.patch |    0
 ...map4-aes-Don-t-use-hardcoded-base-address.patch |   45 +
 ...xx-hwmod-Convert-RNG-device-data-to-hwmod.patch |  176 ++
 ...g-omap4-rng-Convert-to-use-pm_runtime-API.patch |   91 +
 .../linux/linux-am335x-psp-3.2/defconfig           |    1 +
 37 files changed, 1174 insertions(+), 2681 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=8a6d2d49dd31c237da4189756973bd0b05f97f48

