Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9E729E0059A
	for <meta-ti@yoctoproject.org>; Tue, 10 Apr 2012 13:00:50 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id B9F5152A7B; Tue, 10 Apr 2012 20:00:49 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120410200049.B9F5152A7B@arago-project.org>
Date: Tue, 10 Apr 2012 20:00:49 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : u-boot 2011.10rc: fix loading from /boot by adding ext4 support
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
X-List-Received-Date: Tue, 10 Apr 2012 20:00:50 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: d686d9d676f638ac9cbf31086d7933bc8107e541
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=d686d9d676f638ac9cbf31086d7933bc8107e541

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon Apr  9 18:06:41 2012 +0200

u-boot 2011.10rc: fix loading from /boot by adding ext4 support

This patchset was pulled from u-boot patchwork and aren't final, but testing
on beaglebone shows it to work.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Acked-by: Tom Rini <trini@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 .../0011-ext2load-increase-read-speed.patch        |   74 +
 ...fix-ext2load-and-specify-partition-for-bo.patch |   28 +
 ...evm-load-uImage-from-boot-instead-of-VFAT.patch |   35 +
 .../2011.09git/0014-ext4fs-ls-load-support.patch   | 2362 ++++++++++++++++++++
 .../0015-am335x-switch-to-ext4-mode.patch          |   51 +
 recipes-bsp/u-boot/u-boot_2011.10rc.bb             |    7 +-
 6 files changed, 2556 insertions(+), 1 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=d686d9d676f638ac9cbf31086d7933bc8107e541

