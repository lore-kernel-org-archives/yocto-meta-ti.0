Return-Path: <git@arago-project.org>
Received: from arago-project.org (ec2-184-73-161-183.compute-1.amazonaws.com
	[184.73.161.183])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75F1CE0044A
	for <meta-ti@yoctoproject.org>; Tue, 29 May 2012 15:21:16 -0700 (PDT)
Received: by arago-project.org (Postfix, from userid 107)
	id 016AF529CE; Tue, 29 May 2012 22:21:15 +0000 (UTC)
To: meta-ti@yoctoproject.org
Message-Id: <20120529222116.016AF529CE@arago-project.org>
Date: Tue, 29 May 2012 22:21:15 +0000 (UTC)
From: git@arago-project.org (Arago Project git)
Subject: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVyIGxpbnV4LW1haW5saW5lOiBBZGQgcGF0Y2hlcyB0byBlbmFibGUgbGliZXJ0YXMgZmlybXdhcmUgbG9hZGluZyBhc3luY2hyb25vdXNseQ==?=
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
X-List-Received-Date: Tue, 29 May 2012 22:21:16 -0000
Content-Type: text/plain; charset=UTF-8

Module: meta-ti
Branch: master
Commit: 275240af94608bd4a2b4c2c7a6160a35c69031ed
URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=275240af94608bd4a2b4c2c7a6160a35c69031ed

Author: Andreas Müller <schnitzeltony@googlemail.com>
Date:   Fri May 25 11:11:57 2012 +0200

linux-mainline: Add patches to enable libertas firmware loading asynchronously

When using udev >=177 libertas driver does not load properly the firmware [1].
The patches 0001-0016 were taken from [2] and can be viewed at [3]. Patch 0017
I created to fix compiler complaining for missing symbol is_interrupt when
DEBUG set.
The patch series was tested with meta-gumstix on overo with udev-175 and
udev-182.

[1] http://www.spinics.net/lists/linux-wireless/msg85541.html
[2] git://git.kernel.org/pub/scm/linux/kernel/git/linville/wireless-next.git
[3] http://git.kernel.org/?p=linux/kernel/git/linville/wireless-next.git;a=history;f=drivers/net/wireless/libertas;hb=HEAD

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>

---

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
 recipes-kernel/linux/linux-mainline_3.2.bb         |   20 +-
 17 files changed, 2165 insertions(+), 2 deletions(-)

Diff:   http://arago-project.org/git/meta-ti.git?a=commitdiff;h=275240af94608bd4a2b4c2c7a6160a35c69031ed

