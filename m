Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EED7CE01374
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2012 09:04:57 -0800 (PST)
Received: by arago-project.org (Postfix, from userid 107)
	id 4A10E52A61; Mon,  5 Mar 2012 17:04:57 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120305170457.4A10E52A61@arago-project.org>
Date: Mon,  5 Mar 2012 17:04:57 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: Koen Kooi : pandaboard: remove all traces of old 'omap4430-panda' machine
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
X-List-Received-Date: Mon, 05 Mar 2012 17:04:58 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 43956e56dba61709a4b01bb4ed6c4a28cef19d30
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=43956e56dba61709a4b01bb4ed6c4a28cef19d30

Author: Koen Kooi <koen@dominion.thruhere.net>
Date:   Mon Mar  5 08:31:21 2012 +0100

pandaboard: remove all traces of old 'omap4430-panda' machine

It has been completely replaced with the 'pandaboard' machine config.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

 conf/machine/omap4430-panda.conf                   |   34 -
 recipes-bsp/u-boot/u-boot-sakoman_git.bb           |   20 -
 recipes-bsp/u-boot/u-boot_2011.06.bb               |    2 +-
 ...001-ARM-6329-1-wire-up-sys_accept4-on-ARM.patch |   51 -
 ...create-sys-fs-cgroup-to-mount-cgroupfs-on.patch |   58 -
 .../linux-omap4-2.6.35.7/omap4430-panda/defconfig  | 2785 --------------------
 .../linux/linux-omap4-3.1.0/omap4430-panda         |    1 -
 recipes-kernel/linux/linux-omap4_2.6.35.7.bb       |   19 -
 recipes-kernel/linux/linux-omap4_3.1.0.bb          |    2 +-
 9 files changed, 2 insertions(+), 2970 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=43956e56dba61709a4b01bb4ed6c4a28cef19d30

