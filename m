Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-bk0-f48.google.com (mail-bk0-f48.google.com
	[209.85.214.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED99FE01402
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 02:07:56 -0700 (PDT)
Received: by bkcjf20 with SMTP id jf20so822103bkc.35
	for <meta-ti@yoctoproject.org>; Fri, 25 May 2012 02:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=H1GhzdhdHwJb44ccDzo/S2oRw7074lhJjDndKCqHYWI=;
	b=gwp8lmBVjZdXM1o44cgrjaZtTmIZvx1THjz1HyWMz5aiJzVMC2ZF6PUzywa6JvqeoD
	7W1lUfoNtk1RcZPsdRcOau8t6tky5cyzLfbpUEdKocDwcK2G22/QL72aefgXhfKDMWVO
	aALqNg4KuRpzKCk13zBNXXp2LMeUNREE9kVPzTwjOE2wQes6LOXhK3vb+iPrw1CSkRCF
	N0YDMXnvTIGv9jQ1hkHH+vAI6vIciejvIMZ/XB/li/J599FDqJD1JrEFLFjZMxTGcrBy
	vkBovyByPXF7SF5bm5ngsuNxUOMdrR297a/RgpfbabbRSNENkHBhthr45bTloAP8O2Ck
	wR0w==
Received: by 10.204.152.6 with SMTP id e6mr1098894bkw.18.1337936875423;
	Fri, 25 May 2012 02:07:55 -0700 (PDT)
Received: from localhost.localdomain (p4FDF163D.dip.t-dialin.net.
	[79.223.22.61])
	by mx.google.com with ESMTPS id x23sm5550692bkw.12.2012.05.25.02.07.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 25 May 2012 02:07:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Fri, 25 May 2012 11:11:55 +0200
Message-Id: <1337937117-3991-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [V2 0/2] linux-mainline-3.2 updates
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
X-List-Received-Date: Fri, 25 May 2012 09:07:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

V1->V2
* 0001 new: bump to 3.2.18 to synchronize to [1]
* 0002: removed unused 0006-simple_open-automatically-convert-to-simple_open.patch

The libertas patches were sent to
beagleboard@googlegroups.com
koen@dominion.thruhere.net

[1] https://github.com/beagleboard/kernel/tree/beagleboard-3.2

Andreas Müller (1):
  linux-mainline: Add patches to enable libertas firmware loading
    asynchronously

Koen Kooi (1):
  linux-mainline: update to 3.2.18

 conf/machine/include/omap3.inc                     |    2 +-
 ...vert-drivers-net-to-use-module_usb_driver.patch |   80 +++
 ...t-fix-assignment-of-0-1-to-bool-variables.patch |   55 ++
 .../libertas/0003-switch-debugfs-to-umode_t.patch  |   26 +
 ...-Remove-unnecessary-k.alloc-v.alloc-OOM-m.patch |   54 ++
 ...ibertas-remove-dump_survey-implementation.patch |   80 +++
 ...bertas-remove-redundant-NULL-tests-before.patch |   95 +++
 ...ix-signedness-bug-in-lbs_auth_to_authtype.patch |   48 ++
 ...-wireless-libertas-if_usb.c-add-missing-d.patch |   35 ++
 ...libertas-Firmware-loading-simplifications.patch |  618 ++++++++++++++++++++
 .../0011-libertas-harden-up-exit-paths.patch       |   46 ++
 ...d-asynchronous-firmware-loading-capabilit.patch |  269 +++++++++
 ...IO-convert-to-asynchronous-firmware-loadi.patch |  320 ++++++++++
 ...B-convert-to-asynchronous-firmware-loadin.patch |  201 +++++++
 ...-convert-to-asynchronous-firmware-loading.patch |  154 +++++
 .../0016-libertas-add-missing-include.patch        |   30 +
 ...ve-debug-msgs-due-to-missing-in_interrupt.patch |   36 ++
 recipes-kernel/linux/linux-mainline_3.2.bb         |   26 +-
 18 files changed, 2169 insertions(+), 6 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0001-USB-convert-drivers-net-to-use-module_usb_driver.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0002-net-fix-assignment-of-0-1-to-bool-variables.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0003-switch-debugfs-to-umode_t.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0004-drivers-net-Remove-unnecessary-k.alloc-v.alloc-OOM-m.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0005-libertas-remove-dump_survey-implementation.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0007-wireless-libertas-remove-redundant-NULL-tests-before.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0008-libertas-fix-signedness-bug-in-lbs_auth_to_authtype.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0009-drivers-net-wireless-libertas-if_usb.c-add-missing-d.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0010-libertas-Firmware-loading-simplifications.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0011-libertas-harden-up-exit-paths.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0012-libertas-add-asynchronous-firmware-loading-capabilit.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0013-libertas-SDIO-convert-to-asynchronous-firmware-loadi.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0014-libertas-USB-convert-to-asynchronous-firmware-loadin.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0015-libertas-CS-convert-to-asynchronous-firmware-loading.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0016-libertas-add-missing-include.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0017-remove-debug-msgs-due-to-missing-in_interrupt.patch

-- 
1.7.4.4


