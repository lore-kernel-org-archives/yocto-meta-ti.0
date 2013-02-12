Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 98321E0072E
	for <meta-ti@yoctoproject.org>; Tue, 12 Feb 2013 15:26:47 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4AA6B52AC0; Tue, 12 Feb 2013 23:26:47 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20130212232647.4AA6B52AC0@arago-project.org>
Date: Tue, 12 Feb 2013 23:26:47 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Franklin S. Cooper Jr : u-boot_2012.04.01: Add latest u-boot recipe for am37x-evm
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
X-List-Received-Date: Tue, 12 Feb 2013 23:26:47 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: denzil
Commit: 7f9f383521681edbc1de361c2c128f9d27a22afb
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=7f9f383521681edbc1de361c2c128f9d27a22afb

Author: Franklin S. Cooper Jr <fcooper@ti.com>
Date:   Mon Feb 11 19:04:42 2013 -0600

u-boot_2012.04.01: Add latest u-boot recipe for am37x-evm

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 ...3-Set-SPL-stack-size-to-8KB-image-to-54KB.patch |  172 ++++++++++++++++++++
 .../0001-OMAP3-Beagle-Set-BOOTDELAY-to-3.patch     |   31 ++++
 ...e-add-usbethaddr-setting-to-enable-networ.patch |   40 +++++
 ...dded-function-calls-to-set-volts-speed-on.patch |  146 +++++++++++++++++
 ...17evm-beagleboard-am37x-Add-CONFIG_CMD_AS.patch |   73 +++++++++
 ...2-omap3evm-Make-the-board-start-at-800MHz.patch |   36 ++++
 ...gleboard-Load-uImage-from-VFAT-by-default.patch |   34 ++++
 ...03-beagleboard-Make-xM-rev-C-go-to-800MHz.patch |   34 ++++
 ...-Load-uImage-to-the-default-kernel-linux-.patch |   57 +++++++
 recipes-bsp/u-boot/u-boot_2012.04.01.bb            |   50 ++++++
 10 files changed, 673 insertions(+), 0 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=7f9f383521681edbc1de361c2c128f9d27a22afb

