Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9EDF8E00738
	for <meta-ti@yoctoproject.org>; Mon, 11 Mar 2013 13:49:06 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 2539452AA9; Mon, 11 Mar 2013 20:49:06 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130311204906.2539452AA9@arago-project.org>
Date: Mon, 11 Mar 2013 20:49:06 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Denys Dmytriyenko : ti81x: remove platform configs, kernel, u-boot, since ti81x is not supported
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
X-List-Received-Date: Mon, 11 Mar 2013 20:49:06 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: c586bd9a663c6b77478b7b38ff771f6b8360edea
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=c586bd9a663c6b77478b7b38ff771f6b8360edea

Author: Denys Dmytriyenko <denys@ti.com>
Date:   Tue Mar  5 16:06:05 2013 -0500

ti81x: remove platform configs, kernel, u-boot, since ti81x is not supported

* There is no support for these platforms from meta-ti.
* If someone is willing to maintain them, please let us know or feel free to
  take it to a separate layer.
* Therefore, remove SoC and machine configs, kernel, u-boot and X11 configs

Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/am387x-evm.conf                       |    9 -
 conf/machine/am389x-evm.conf                       |    9 -
 conf/machine/c6a814x-evm.conf                      |    7 -
 conf/machine/c6a816x-evm.conf                      |    7 -
 conf/machine/dm814x-evm.conf                       |    7 -
 conf/machine/include/ti814x.inc                    |   26 -
 conf/machine/include/ti816x.inc                    |   26 -
 recipes-bsp/u-boot/u-boot_2010.06-psp.bb           |   17 -
 .../xserver-xf86-config/ti814x/xorg.conf           |   29 -
 .../xserver-xf86-config/ti816x/xorg.conf           |   29 -
 ...d-code-for-disabling-the-least-significan.patch |   45 -
 .../linux/linux-ti81xx-psp-2.6.37/am387x-evm       |    1 -
 .../linux/linux-ti81xx-psp-2.6.37/am389x-evm       |    1 -
 .../linux/linux-ti81xx-psp-2.6.37/c6a814x-evm      |    1 -
 .../linux/linux-ti81xx-psp-2.6.37/c6a816x-evm      |    1 -
 .../linux-ti81xx-psp-2.6.37/dm814x-evm/configs/psp | 1937 -----------------
 .../linux-ti81xx-psp-2.6.37/dm814x-evm/defconfig   | 1970 -----------------
 .../linux-ti81xx-psp-2.6.37/dm816x-evm/configs/psp | 2142 -------------------
 .../linux-ti81xx-psp-2.6.37/dm816x-evm/defconfig   | 2202 --------------------
 recipes-kernel/linux/linux-ti81xx-psp_2.6.37.bb    |   28 -
 20 files changed, 0 insertions(+), 8494 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=c586bd9a663c6b77478b7b38ff771f6b8360edea

