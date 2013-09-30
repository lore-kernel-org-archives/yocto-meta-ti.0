Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74EA0E0168F
	for <meta-ti@yoctoproject.org>; Mon, 30 Sep 2013 13:37:35 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 8C15752A6C; Mon, 30 Sep 2013 20:37:35 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130930203735.8C15752A6C@arago-project.org>
Date: Mon, 30 Sep 2013 20:37:35 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : linux-davinci 2.6.32: remove old hawkboard-specific kernel
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
X-List-Received-Date: Mon, 30 Sep 2013 20:37:36 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: dylan
Commit: e8455c323f0985f99e650c75a562e3457b4ff85d
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=e8455c323f0985f99e650c75a562e3457b4ff85d

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Sat Sep 28 16:31:19 2013 -0400

linux-davinci 2.6.32: remove old hawkboard-specific kernel

* Hawkboard platform is not supported in meta-ti.
* Since there no new revs of the kernel, the old recipe can be picked up from
  Danny or Denzil.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Acked-by: Franklin Cooper Jr. <fcooper@ti.com>

---

 ...001-ARM-6329-1-wire-up-sys_accept4-on-ARM.patch |   51 -
 ...i-Fix-currently-harmless-typo-in-SATA-PHY.patch |   26 -
 ...create-sys-fs-cgroup-to-mount-cgroupfs-on.patch |   58 -
 ...ci-ti-Update-SATA-PHY-configuration-RXCDR.patch |   29 -
 ...001-board-da850-hawk-Disable-NAND-SUBPAGE.patch |   27 -
 .../linux/linux-davinci/hawkboard/configs/stock    | 2630 -
 .../linux/linux-davinci/hawkboard/defconfig        | 2659 -
 .../linux-davinci/hawkboard/logo_linux_clut224.ppm |51363 --------------------
 .../patch-2.6.33rc4-psp-to-hawkboard.patch         | 2775 --
 ...0001-board-da850-evm-Disable-NAND-SUBPAGE.patch |   29 -
 .../0001-uio_pruss1-Core-driver-addition.patch     |  334 -
 .../0002-uio_pruss2-Platform-changes.patch         |  243 -
 ...uio_pruss3-Workarounds-put-into-core-code.patch |   45 -
 .../omapl138/configs/da850_omapl138_defconfig      | 1876 -
 .../configs/da850_omapl138_defconfig_mmcpm_stats   | 1917 -
 .../configs/da850_omapl138_defconfig_nandnommc     | 1886 -
 .../configs/da850_omapl138_defconfig_uivideocap    | 1874 -
 .../configs/da850_omapl138_defconfig_uivideocapdis | 1874 -
 .../linux/linux-davinci/omapl138/defconfig         | 1951 -
 .../linux-davinci/omapl138/logo_linux_clut224.ppm  |21763 ---------
 .../linux/linux-davinci/update-mach-types.patch    |  160 -
 recipes-kernel/linux/linux-davinci_git.bb          |   56 -
 22 files changed, 0 insertions(+), 93626 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=e8455c323f0985f99e650c75a562e3457b4ff85d

