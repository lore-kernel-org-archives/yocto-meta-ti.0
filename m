Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f54.google.com (mail-wg0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95BF2E0030B
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 17:08:37 -0700 (PDT)
Received: by wgbfg15 with SMTP id fg15so4486907wgb.11
	for <meta-ti@yoctoproject.org>; Mon, 21 May 2012 17:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:mime-version:content-type
	:content-transfer-encoding;
	bh=4mN9ObjDuLE41TeR7WuEzfnoDzDUlX0JkDHxUYHY3rA=;
	b=ezdlgiU3GUeRbr03E6bACfh4jIup5OptonnohRx9fYwGuASz7L6CVli91FNateHl6f
	d1J4rXg5iFoclix4i2alIUzcGCoNoMq/bE7y/NnigaYavv01jmv4gMKiB9KfmCKZ7gz6
	XZ8H3CAMIhLNCW3weZvyJzjs8KBVo4APDKV6s2Dcpvkre0paTCcYh646dmjXpwKRmGtl
	28YJdS94f96HhKrG2C6i2sYd2qvEW9tl58Y8jdViXG6qMbmLWHqRTNd/G5Cwh0g+Dbk3
	EK8P5YwTSuz+Zglmjg5QKg0iXCdlu5gYJoga0cCWrfUWgjahKGk+FYjoLPG9t0u8lyOa
	5RbA==
Received: by 10.180.109.229 with SMTP id hv5mr42885478wib.0.1337645315898;
	Mon, 21 May 2012 17:08:35 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2B2F.dip.t-dialin.net.
	[91.10.43.47])
	by mx.google.com with ESMTPS id ez4sm29090424wid.3.2012.05.21.17.08.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 21 May 2012 17:08:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: meta-ti@yoctoproject.org
Date: Tue, 22 May 2012 02:12:35 +0200
Message-Id: <1337645555-1805-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH] linux-mainline: Add patches to enable libertas firmware loading asynchronously
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
X-List-Received-Date: Tue, 22 May 2012 00:08:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

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
---
 ...vert-drivers-net-to-use-module_usb_driver.patch |   80 +++
 ...t-fix-assignment-of-0-1-to-bool-variables.patch |   55 ++
 .../libertas/0003-switch-debugfs-to-umode_t.patch  |   26 +
 ...-Remove-unnecessary-k.alloc-v.alloc-OOM-m.patch |   54 ++
 ...ibertas-remove-dump_survey-implementation.patch |   80 +++
 ...open-automatically-convert-to-simple_open.patch |   93 +++
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
 18 files changed, 2258 insertions(+), 2 deletions(-)
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0001-USB-convert-drivers-net-to-use-module_usb_driver.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0002-net-fix-assignment-of-0-1-to-bool-variables.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0003-switch-debugfs-to-umode_t.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0004-drivers-net-Remove-unnecessary-k.alloc-v.alloc-OOM-m.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0005-libertas-remove-dump_survey-implementation.patch
 create mode 100644 recipes-kernel/linux/linux-mainline-3.2/libertas/0006-simple_open-automatically-convert-to-simple_open.patch
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

diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0001-USB-convert-drivers-net-to-use-module_usb_driver.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0001-USB-convert-drivers-net-to-use-module_usb_driver.patch
new file mode 100644
index 0000000..92c7745
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0001-USB-convert-drivers-net-to-use-module_usb_driver.patch
@@ -0,0 +1,80 @@
+From d632eb1bf22e11def74e4e53cc47d790fbdba105 Mon Sep 17 00:00:00 2001
+From: Greg Kroah-Hartman <gregkh@suse.de>
+Date: Fri, 18 Nov 2011 09:44:20 -0800
+Subject: [PATCH 01/17] USB: convert drivers/net/* to use module_usb_driver()
+
+This converts the drivers in drivers/net/* to use the
+module_usb_driver() macro which makes the code smaller and a bit
+simpler.
+
+Added bonus is that it removes some unneeded kernel log messages about
+drivers loading and/or unloading.
+
+Cc: Wolfgang Grandegger <wg@grandegger.com>
+Cc: Samuel Ortiz <samuel@sortiz.org>
+Cc: Oliver Neukum <oliver@neukum.name>
+Cc: Peter Korsgaard <jacmet@sunsite.dk>
+Cc: Petko Manolov <petkan@users.sourceforge.net>
+Cc: Steve Glendinning <steve.glendinning@smsc.com>
+Cc: Christian Lamparter <chunkeey@googlemail.com>
+Cc: "John W. Linville" <linville@tuxdriver.com>
+Cc: Dan Williams <dcbw@redhat.com>
+Cc: Jussi Kivilinna <jussi.kivilinna@mbnet.fi>
+Cc: Ivo van Doorn <IvDoorn@gmail.com>
+Cc: Gertjan van Wingerde <gwingerde@gmail.com>
+Cc: Helmut Schaa <helmut.schaa@googlemail.com>
+Cc: Herton Ronaldo Krzesinski <herton@canonical.com>
+Cc: Hin-Tak Leung <htl10@users.sourceforge.net>
+Cc: Larry Finger <Larry.Finger@lwfinger.net>
+Cc: Chaoming Li <chaoming_li@realsil.com.cn>
+Cc: Lucas De Marchi <lucas.demarchi@profusion.mobi>
+Cc: "David S. Miller" <davem@davemloft.net>
+Cc: Roel Kluin <roel.kluin@gmail.com>
+Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
+Cc: Jiri Pirko <jpirko@redhat.com>
+Cc: Pavel Roskin <proski@gnu.org>
+Cc: Yoann DI-RUZZA <y.diruzza@lim.eu>
+Cc: George <george0505@realtek.com>
+Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
+---
+ drivers/net/wireless/libertas/if_usb.c |   24 +-----------------------
+ 1 files changed, 1 insertions(+), 23 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/if_usb.c b/drivers/net/wireless/libertas/if_usb.c
+index db879c3..b5fbbc7 100644
+--- a/drivers/net/wireless/libertas/if_usb.c
++++ b/drivers/net/wireless/libertas/if_usb.c
+@@ -1184,29 +1184,7 @@ static struct usb_driver if_usb_driver = {
+ 	.reset_resume = if_usb_resume,
+ };
+ 
+-static int __init if_usb_init_module(void)
+-{
+-	int ret = 0;
+-
+-	lbs_deb_enter(LBS_DEB_MAIN);
+-
+-	ret = usb_register(&if_usb_driver);
+-
+-	lbs_deb_leave_args(LBS_DEB_MAIN, "ret %d", ret);
+-	return ret;
+-}
+-
+-static void __exit if_usb_exit_module(void)
+-{
+-	lbs_deb_enter(LBS_DEB_MAIN);
+-
+-	usb_deregister(&if_usb_driver);
+-
+-	lbs_deb_leave(LBS_DEB_MAIN);
+-}
+-
+-module_init(if_usb_init_module);
+-module_exit(if_usb_exit_module);
++module_usb_driver(if_usb_driver);
+ 
+ MODULE_DESCRIPTION("8388 USB WLAN Driver");
+ MODULE_AUTHOR("Marvell International Ltd. and Red Hat, Inc.");
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0002-net-fix-assignment-of-0-1-to-bool-variables.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0002-net-fix-assignment-of-0-1-to-bool-variables.patch
new file mode 100644
index 0000000..34ba936
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0002-net-fix-assignment-of-0-1-to-bool-variables.patch
@@ -0,0 +1,55 @@
+From 3db1cd5c05f35fb43eb134df6f321de4e63141f2 Mon Sep 17 00:00:00 2001
+From: Rusty Russell <rusty@rustcorp.com.au>
+Date: Mon, 19 Dec 2011 13:56:45 +0000
+Subject: [PATCH 02/17] net: fix assignment of 0/1 to bool variables.
+
+DaveM said:
+   Please, this kind of stuff rots forever and not using bool properly
+   drives me crazy.
+
+Joe Perches <joe@perches.com> gave me the spatch script:
+
+	@@
+	bool b;
+	@@
+	-b = 0
+	+b = false
+	@@
+	bool b;
+	@@
+	-b = 1
+	+b = true
+
+I merely installed coccinelle, read the documentation and took credit.
+
+Signed-off-by: Rusty Russell <rusty@rustcorp.com.au>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+---
+ drivers/net/wireless/libertas/if_cs.c |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/if_cs.c b/drivers/net/wireless/libertas/if_cs.c
+index e269351..3f7bf4d 100644
+--- a/drivers/net/wireless/libertas/if_cs.c
++++ b/drivers/net/wireless/libertas/if_cs.c
+@@ -859,7 +859,7 @@ static int if_cs_probe(struct pcmcia_device *p_dev)
+ 	 * Most of the libertas cards can do unaligned register access, but some
+ 	 * weird ones cannot. That's especially true for the CF8305 card.
+ 	 */
+-	card->align_regs = 0;
++	card->align_regs = false;
+ 
+ 	card->model = get_model(p_dev->manf_id, p_dev->card_id);
+ 	if (card->model == MODEL_UNKNOWN) {
+@@ -871,7 +871,7 @@ static int if_cs_probe(struct pcmcia_device *p_dev)
+ 	/* Check if we have a current silicon */
+ 	prod_id = if_cs_read8(card, IF_CS_PRODUCT_ID);
+ 	if (card->model == MODEL_8305) {
+-		card->align_regs = 1;
++		card->align_regs = true;
+ 		if (prod_id < IF_CS_CF8305_B1_REV) {
+ 			pr_err("8305 rev B0 and older are not supported\n");
+ 			ret = -ENODEV;
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0003-switch-debugfs-to-umode_t.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0003-switch-debugfs-to-umode_t.patch
new file mode 100644
index 0000000..896c7b6
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0003-switch-debugfs-to-umode_t.patch
@@ -0,0 +1,26 @@
+From f4ae40a6a50a98ac23d4b285f739455e926a473e Mon Sep 17 00:00:00 2001
+From: Al Viro <viro@zeniv.linux.org.uk>
+Date: Sun, 24 Jul 2011 04:33:43 -0400
+Subject: [PATCH 03/17] switch debugfs to umode_t
+
+Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
+---
+ drivers/net/wireless/libertas/debugfs.c |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/debugfs.c b/drivers/net/wireless/libertas/debugfs.c
+index d8d8f0d..c192671 100644
+--- a/drivers/net/wireless/libertas/debugfs.c
++++ b/drivers/net/wireless/libertas/debugfs.c
+@@ -704,7 +704,7 @@ out_unlock:
+ 
+ struct lbs_debugfs_files {
+ 	const char *name;
+-	int perm;
++	umode_t perm;
+ 	struct file_operations fops;
+ };
+ 
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0004-drivers-net-Remove-unnecessary-k.alloc-v.alloc-OOM-m.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0004-drivers-net-Remove-unnecessary-k.alloc-v.alloc-OOM-m.patch
new file mode 100644
index 0000000..7979f1c
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0004-drivers-net-Remove-unnecessary-k.alloc-v.alloc-OOM-m.patch
@@ -0,0 +1,54 @@
+From e404decb0fb017be80552adee894b35307b6c7b4 Mon Sep 17 00:00:00 2001
+From: Joe Perches <joe@perches.com>
+Date: Sun, 29 Jan 2012 12:56:23 +0000
+Subject: [PATCH 04/17] drivers/net: Remove unnecessary k.alloc/v.alloc OOM
+ messages
+
+alloc failures use dump_stack so emitting an additional
+out-of-memory message is an unnecessary duplication.
+
+Remove the allocation failure messages.
+
+Signed-off-by: Joe Perches <joe@perches.com>
+Signed-off-by: David S. Miller <davem@davemloft.net>
+---
+ drivers/net/wireless/libertas/if_cs.c  |    5 ++---
+ drivers/net/wireless/libertas/if_usb.c |    4 +---
+ 2 files changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/if_cs.c b/drivers/net/wireless/libertas/if_cs.c
+index 3f7bf4d..234ee88 100644
+--- a/drivers/net/wireless/libertas/if_cs.c
++++ b/drivers/net/wireless/libertas/if_cs.c
+@@ -815,10 +815,9 @@ static int if_cs_probe(struct pcmcia_device *p_dev)
+ 	lbs_deb_enter(LBS_DEB_CS);
+ 
+ 	card = kzalloc(sizeof(struct if_cs_card), GFP_KERNEL);
+-	if (!card) {
+-		pr_err("error in kzalloc\n");
++	if (!card)
+ 		goto out;
+-	}
++
+ 	card->p_dev = p_dev;
+ 	p_dev->priv = card;
+ 
+diff --git a/drivers/net/wireless/libertas/if_usb.c b/drivers/net/wireless/libertas/if_usb.c
+index b5fbbc7..74da5f1 100644
+--- a/drivers/net/wireless/libertas/if_usb.c
++++ b/drivers/net/wireless/libertas/if_usb.c
+@@ -261,10 +261,8 @@ static int if_usb_probe(struct usb_interface *intf,
+ 	udev = interface_to_usbdev(intf);
+ 
+ 	cardp = kzalloc(sizeof(struct if_usb_card), GFP_KERNEL);
+-	if (!cardp) {
+-		pr_err("Out of memory allocating private data\n");
++	if (!cardp)
+ 		goto error;
+-	}
+ 
+ 	setup_timer(&cardp->fw_timeout, if_usb_fw_timeo, (unsigned long)cardp);
+ 	init_waitqueue_head(&cardp->fw_wq);
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0005-libertas-remove-dump_survey-implementation.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0005-libertas-remove-dump_survey-implementation.patch
new file mode 100644
index 0000000..10e9c55
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0005-libertas-remove-dump_survey-implementation.patch
@@ -0,0 +1,80 @@
+From 377526578f2c343ea281a918b18ece1fca65005c Mon Sep 17 00:00:00 2001
+From: Daniel Drake <dsd@laptop.org>
+Date: Wed, 14 Mar 2012 22:34:33 +0000
+Subject: [PATCH 05/17] libertas: remove dump_survey implementation
+
+libertas provides a dump_survey implementation based on reading of
+a RSSI value. However, this RSSI value is calculated based on the
+last received beacon from the associated AP - it is not a good
+way of surveying a channel in general, and even causes an error
+if the card is not associated to a network.
+
+As this is not appropriate as a survey, remove it. This fixes an
+issue where something in userspace is repeatedly calling site-survey
+during boot, resulting in many repeated errors as the RSSI value cannot
+be read before associating.
+
+Signed-off-by: Daniel Drake <dsd@laptop.org>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+---
+ drivers/net/wireless/libertas/cfg.c |   37 -----------------------------------
+ 1 files changed, 0 insertions(+), 37 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/cfg.c b/drivers/net/wireless/libertas/cfg.c
+index a7cd311..3fa1ece 100644
+--- a/drivers/net/wireless/libertas/cfg.c
++++ b/drivers/net/wireless/libertas/cfg.c
+@@ -1631,42 +1631,6 @@ static int lbs_cfg_get_station(struct wiphy *wiphy, struct net_device *dev,
+ 
+ 
+ /*
+- * "Site survey", here just current channel and noise level
+- */
+-
+-static int lbs_get_survey(struct wiphy *wiphy, struct net_device *dev,
+-	int idx, struct survey_info *survey)
+-{
+-	struct lbs_private *priv = wiphy_priv(wiphy);
+-	s8 signal, noise;
+-	int ret;
+-
+-	if (dev == priv->mesh_dev)
+-		return -EOPNOTSUPP;
+-
+-	if (idx != 0)
+-		ret = -ENOENT;
+-
+-	lbs_deb_enter(LBS_DEB_CFG80211);
+-
+-	survey->channel = ieee80211_get_channel(wiphy,
+-		ieee80211_channel_to_frequency(priv->channel,
+-					       IEEE80211_BAND_2GHZ));
+-
+-	ret = lbs_get_rssi(priv, &signal, &noise);
+-	if (ret == 0) {
+-		survey->filled = SURVEY_INFO_NOISE_DBM;
+-		survey->noise = noise;
+-	}
+-
+-	lbs_deb_leave_args(LBS_DEB_CFG80211, "ret %d", ret);
+-	return ret;
+-}
+-
+-
+-
+-
+-/*
+  * Change interface
+  */
+ 
+@@ -2068,7 +2032,6 @@ static struct cfg80211_ops lbs_cfg80211_ops = {
+ 	.del_key = lbs_cfg_del_key,
+ 	.set_default_key = lbs_cfg_set_default_key,
+ 	.get_station = lbs_cfg_get_station,
+-	.dump_survey = lbs_get_survey,
+ 	.change_virtual_intf = lbs_change_intf,
+ 	.join_ibss = lbs_join_ibss,
+ 	.leave_ibss = lbs_leave_ibss,
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0006-simple_open-automatically-convert-to-simple_open.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0006-simple_open-automatically-convert-to-simple_open.patch
new file mode 100644
index 0000000..452b312
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0006-simple_open-automatically-convert-to-simple_open.patch
@@ -0,0 +1,93 @@
+From 234e340582901211f40d8c732afc49f0630ecf05 Mon Sep 17 00:00:00 2001
+From: Stephen Boyd <sboyd@codeaurora.org>
+Date: Thu, 5 Apr 2012 14:25:11 -0700
+Subject: [PATCH 06/17] simple_open: automatically convert to simple_open()
+
+Many users of debugfs copy the implementation of default_open() when
+they want to support a custom read/write function op.  This leads to a
+proliferation of the default_open() implementation across the entire
+tree.
+
+Now that the common implementation has been consolidated into libfs we
+can replace all the users of this function with simple_open().
+
+This replacement was done with the following semantic patch:
+
+<smpl>
+@ open @
+identifier open_f != simple_open;
+identifier i, f;
+@@
+-int open_f(struct inode *i, struct file *f)
+-{
+(
+-if (i->i_private)
+-f->private_data = i->i_private;
+|
+-f->private_data = i->i_private;
+)
+-return 0;
+-}
+
+@ has_open depends on open @
+identifier fops;
+identifier open.open_f;
+@@
+struct file_operations fops = {
+...
+-.open = open_f,
++.open = simple_open,
+...
+};
+</smpl>
+
+[akpm@linux-foundation.org: checkpatch fixes]
+Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
+Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
+Cc: Al Viro <viro@zeniv.linux.org.uk>
+Cc: Julia Lawall <Julia.Lawall@lip6.fr>
+Acked-by: Ingo Molnar <mingo@elte.hu>
+Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
+Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
+---
+ drivers/net/wireless/libertas/debugfs.c |   10 ++--------
+ 1 files changed, 2 insertions(+), 8 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/debugfs.c b/drivers/net/wireless/libertas/debugfs.c
+index c192671..a06cc28 100644
+--- a/drivers/net/wireless/libertas/debugfs.c
++++ b/drivers/net/wireless/libertas/debugfs.c
+@@ -21,12 +21,6 @@ static char *szStates[] = {
+ static void lbs_debug_init(struct lbs_private *priv);
+ #endif
+ 
+-static int open_file_generic(struct inode *inode, struct file *file)
+-{
+-	file->private_data = inode->i_private;
+-	return 0;
+-}
+-
+ static ssize_t write_file_dummy(struct file *file, const char __user *buf,
+                                 size_t count, loff_t *ppos)
+ {
+@@ -696,7 +690,7 @@ out_unlock:
+ 
+ #define FOPS(fread, fwrite) { \
+ 	.owner = THIS_MODULE, \
+-	.open = open_file_generic, \
++	.open = simple_open, \
+ 	.read = (fread), \
+ 	.write = (fwrite), \
+ 	.llseek = generic_file_llseek, \
+@@ -962,7 +956,7 @@ static ssize_t lbs_debugfs_write(struct file *f, const char __user *buf,
+ 
+ static const struct file_operations lbs_debug_fops = {
+ 	.owner = THIS_MODULE,
+-	.open = open_file_generic,
++	.open = simple_open,
+ 	.write = lbs_debugfs_write,
+ 	.read = lbs_debugfs_read,
+ 	.llseek = default_llseek,
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0007-wireless-libertas-remove-redundant-NULL-tests-before.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0007-wireless-libertas-remove-redundant-NULL-tests-before.patch
new file mode 100644
index 0000000..d86b6e4
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0007-wireless-libertas-remove-redundant-NULL-tests-before.patch
@@ -0,0 +1,95 @@
+From a7b957a277215da1830596c0791307a999fe5153 Mon Sep 17 00:00:00 2001
+From: Jesper Juhl <jj@chaosbits.net>
+Date: Mon, 9 Apr 2012 22:51:07 +0200
+Subject: [PATCH 07/17] wireless, libertas: remove redundant NULL tests before
+ calling release_firmware()
+
+release_firmware() tests for, and deals gracefully with, NULL
+pointers. Remove redundant explicit tests before calling the function.
+
+Signed-off-by: Jesper Juhl <jj@chaosbits.net>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+---
+ drivers/net/wireless/libertas/if_cs.c   |    6 ++----
+ drivers/net/wireless/libertas/if_sdio.c |    6 ++----
+ drivers/net/wireless/libertas/if_spi.c  |    6 ++----
+ drivers/net/wireless/libertas/main.c    |   12 ++++--------
+ 4 files changed, 10 insertions(+), 20 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/if_cs.c b/drivers/net/wireless/libertas/if_cs.c
+index 234ee88..171a06b 100644
+--- a/drivers/net/wireless/libertas/if_cs.c
++++ b/drivers/net/wireless/libertas/if_cs.c
+@@ -951,10 +951,8 @@ out2:
+ out1:
+ 	pcmcia_disable_device(p_dev);
+ out:
+-	if (helper)
+-		release_firmware(helper);
+-	if (mainfw)
+-		release_firmware(mainfw);
++	release_firmware(helper);
++	release_firmware(mainfw);
+ 
+ 	lbs_deb_leave_args(LBS_DEB_CS, "ret %d", ret);
+ 	return ret;
+diff --git a/drivers/net/wireless/libertas/if_sdio.c b/drivers/net/wireless/libertas/if_sdio.c
+index 9804ebc..15bfe2f 100644
+--- a/drivers/net/wireless/libertas/if_sdio.c
++++ b/drivers/net/wireless/libertas/if_sdio.c
+@@ -751,10 +751,8 @@ success:
+ 	ret = 0;
+ 
+ out:
+-	if (helper)
+-		release_firmware(helper);
+-	if (mainfw)
+-		release_firmware(mainfw);
++	release_firmware(helper);
++	release_firmware(mainfw);
+ 
+ 	lbs_deb_leave_args(LBS_DEB_SDIO, "ret %d", ret);
+ 	return ret;
+diff --git a/drivers/net/wireless/libertas/if_spi.c b/drivers/net/wireless/libertas/if_spi.c
+index 50b1ee7..7a5df4f 100644
+--- a/drivers/net/wireless/libertas/if_spi.c
++++ b/drivers/net/wireless/libertas/if_spi.c
+@@ -1095,10 +1095,8 @@ static int if_spi_init_card(struct if_spi_card *card)
+ 		goto out;
+ 
+ out:
+-	if (helper)
+-		release_firmware(helper);
+-	if (mainfw)
+-		release_firmware(mainfw);
++	release_firmware(helper);
++	release_firmware(mainfw);
+ 
+ 	lbs_deb_leave_args(LBS_DEB_SPI, "err %d\n", err);
+ 
+diff --git a/drivers/net/wireless/libertas/main.c b/drivers/net/wireless/libertas/main.c
+index 957681d..3b81b70 100644
+--- a/drivers/net/wireless/libertas/main.c
++++ b/drivers/net/wireless/libertas/main.c
+@@ -1269,14 +1269,10 @@ int lbs_get_firmware(struct device *dev, const char *user_helper,
+ 
+   fail:
+ 	/* Failed */
+-	if (*helper) {
+-		release_firmware(*helper);
+-		*helper = NULL;
+-	}
+-	if (*mainfw) {
+-		release_firmware(*mainfw);
+-		*mainfw = NULL;
+-	}
++	release_firmware(*helper);
++	*helper = NULL;
++	release_firmware(*mainfw);
++	*mainfw = NULL;
+ 
+ 	return -ENOENT;
+ }
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0008-libertas-fix-signedness-bug-in-lbs_auth_to_authtype.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0008-libertas-fix-signedness-bug-in-lbs_auth_to_authtype.patch
new file mode 100644
index 0000000..0bacbca
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0008-libertas-fix-signedness-bug-in-lbs_auth_to_authtype.patch
@@ -0,0 +1,48 @@
+From effcc625eb4ab3b10b4744237fd37e8f7dcd6511 Mon Sep 17 00:00:00 2001
+From: Amitkumar Karwar <akarwar@marvell.com>
+Date: Wed, 28 Mar 2012 11:38:01 -0700
+Subject: [PATCH 08/17] libertas: fix signedness bug in lbs_auth_to_authtype()
+
+Return type for lbs_auth_to_authtype() is changed from "u8" to
+"int" to return negative error code correctly.
+Also an error check is added in connect handler for invalid auth
+type.
+
+Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
+Signed-off-by: Amitkumar Karwar <akarwar@marvell.com>
+Signed-off-by: Kiran Divekar <dkiran@marvell.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+---
+ drivers/net/wireless/libertas/cfg.c |    9 +++++++--
+ 1 files changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/cfg.c b/drivers/net/wireless/libertas/cfg.c
+index 3fa1ece..2fa879b 100644
+--- a/drivers/net/wireless/libertas/cfg.c
++++ b/drivers/net/wireless/libertas/cfg.c
+@@ -103,7 +103,7 @@ static const u32 cipher_suites[] = {
+  * Convert NL80211's auth_type to the one from Libertas, see chapter 5.9.1
+  * in the firmware spec
+  */
+-static u8 lbs_auth_to_authtype(enum nl80211_auth_type auth_type)
++static int lbs_auth_to_authtype(enum nl80211_auth_type auth_type)
+ {
+ 	int ret = -ENOTSUPP;
+ 
+@@ -1411,7 +1411,12 @@ static int lbs_cfg_connect(struct wiphy *wiphy, struct net_device *dev,
+ 		goto done;
+ 	}
+ 
+-	lbs_set_authtype(priv, sme);
++	ret = lbs_set_authtype(priv, sme);
++	if (ret == -ENOTSUPP) {
++		wiphy_err(wiphy, "unsupported authtype 0x%x\n", sme->auth_type);
++		goto done;
++	}
++
+ 	lbs_set_radio(priv, preamble, 1);
+ 
+ 	/* Do the actual association */
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0009-drivers-net-wireless-libertas-if_usb.c-add-missing-d.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0009-drivers-net-wireless-libertas-if_usb.c-add-missing-d.patch
new file mode 100644
index 0000000..3477814
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0009-drivers-net-wireless-libertas-if_usb.c-add-missing-d.patch
@@ -0,0 +1,35 @@
+From 1e66eda1d40c9ce3ff38782da066a14e1b88ac50 Mon Sep 17 00:00:00 2001
+From: Julia Lawall <Julia.Lawall@lip6.fr>
+Date: Mon, 16 Apr 2012 17:44:00 +0200
+Subject: [PATCH 09/17] drivers/net/wireless/libertas/if_usb.c: add missing
+ debugging code
+
+Add a corresponding leave call on error failure.
+
+Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>
+Acked-by: Dan Williams <dcbw@redhat.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+---
+ drivers/net/wireless/libertas/if_usb.c |    6 ++++--
+ 1 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/if_usb.c b/drivers/net/wireless/libertas/if_usb.c
+index 74da5f1..ce4938d 100644
+--- a/drivers/net/wireless/libertas/if_usb.c
++++ b/drivers/net/wireless/libertas/if_usb.c
+@@ -1128,8 +1128,10 @@ static int if_usb_suspend(struct usb_interface *intf, pm_message_t message)
+ 
+ 	lbs_deb_enter(LBS_DEB_USB);
+ 
+-	if (priv->psstate != PS_STATE_FULL_POWER)
+-		return -1;
++	if (priv->psstate != PS_STATE_FULL_POWER) {
++		ret = -1;
++		goto out;
++	}
+ 
+ #ifdef CONFIG_OLPC
+ 	if (machine_is_olpc()) {
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0010-libertas-Firmware-loading-simplifications.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0010-libertas-Firmware-loading-simplifications.patch
new file mode 100644
index 0000000..06d8218
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0010-libertas-Firmware-loading-simplifications.patch
@@ -0,0 +1,618 @@
+From 370803c25dd77332ee4ca97884c3a5e1e1eafbca Mon Sep 17 00:00:00 2001
+From: Daniel Drake <dsd@laptop.org>
+Date: Mon, 16 Apr 2012 23:52:42 +0100
+Subject: [PATCH 10/17] libertas: Firmware loading simplifications
+
+Remove the ability to pass module parameters with firmware filenames
+for USB and SDIO interfaces.
+
+Remove the ability to pass custom "user" filenames to lbs_get_firmware().
+
+Remove the ability to reprogram internal device memory with a different
+firmware from the USB driver (we don't know of any users), and simplify
+the OLPC firmware loading quirk to simply placing the OLPC firmware
+at the top of the list (we don't know of any users other than OLPC).
+
+Move lbs_get_firmware() into its own file.
+
+These simplifications should have no real-life effect but make the
+upcoming transition to asynchronous firmware loading considerably less
+painful.
+
+Signed-off-by: Daniel Drake <dsd@laptop.org>
+Acked-by: Dan Williams <dcbw@redhat.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+---
+ drivers/net/wireless/libertas/Makefile   |    1 +
+ drivers/net/wireless/libertas/decl.h     |    3 +-
+ drivers/net/wireless/libertas/firmware.c |   79 ++++++++++++++
+ drivers/net/wireless/libertas/if_cs.c    |    4 +-
+ drivers/net/wireless/libertas/if_sdio.c  |   25 +----
+ drivers/net/wireless/libertas/if_spi.c   |    5 +-
+ drivers/net/wireless/libertas/if_usb.c   |  169 ++----------------------------
+ drivers/net/wireless/libertas/main.c     |  101 ------------------
+ 8 files changed, 94 insertions(+), 293 deletions(-)
+ create mode 100644 drivers/net/wireless/libertas/firmware.c
+
+diff --git a/drivers/net/wireless/libertas/Makefile b/drivers/net/wireless/libertas/Makefile
+index f7d01bf..eac72f7 100644
+--- a/drivers/net/wireless/libertas/Makefile
++++ b/drivers/net/wireless/libertas/Makefile
+@@ -6,6 +6,7 @@ libertas-y += ethtool.o
+ libertas-y += main.o
+ libertas-y += rx.o
+ libertas-y += tx.o
++libertas-y += firmware.o
+ libertas-$(CONFIG_LIBERTAS_MESH) += mesh.o
+ 
+ usb8xxx-objs += if_usb.o
+diff --git a/drivers/net/wireless/libertas/decl.h b/drivers/net/wireless/libertas/decl.h
+index bc951ab..2fb2e31 100644
+--- a/drivers/net/wireless/libertas/decl.h
++++ b/drivers/net/wireless/libertas/decl.h
+@@ -66,8 +66,7 @@ int lbs_exit_auto_deep_sleep(struct lbs_private *priv);
+ u32 lbs_fw_index_to_data_rate(u8 index);
+ u8 lbs_data_rate_to_fw_index(u32 rate);
+ 
+-int lbs_get_firmware(struct device *dev, const char *user_helper,
+-			const char *user_mainfw, u32 card_model,
++int lbs_get_firmware(struct device *dev, u32 card_model,
+ 			const struct lbs_fw_table *fw_table,
+ 			const struct firmware **helper,
+ 			const struct firmware **mainfw);
+diff --git a/drivers/net/wireless/libertas/firmware.c b/drivers/net/wireless/libertas/firmware.c
+new file mode 100644
+index 0000000..0c8c845
+--- /dev/null
++++ b/drivers/net/wireless/libertas/firmware.c
+@@ -0,0 +1,79 @@
++/*
++ * Firmware loading and handling functions.
++ */
++
++#include <linux/firmware.h>
++#include <linux/module.h>
++
++#include "decl.h"
++
++/**
++ *  lbs_get_firmware - Retrieves two-stage firmware
++ *
++ *  @dev:     	A pointer to &device structure
++ *  @card_model: Bus-specific card model ID used to filter firmware table
++ *		elements
++ *  @fw_table:	Table of firmware file names and device model numbers
++ *		terminated by an entry with a NULL helper name
++ *  @helper:	On success, the helper firmware; caller must free
++ *  @mainfw:	On success, the main firmware; caller must free
++ *
++ *  returns:		0 on success, non-zero on failure
++ */
++int lbs_get_firmware(struct device *dev, u32 card_model,
++			const struct lbs_fw_table *fw_table,
++			const struct firmware **helper,
++			const struct firmware **mainfw)
++{
++	const struct lbs_fw_table *iter;
++	int ret;
++
++	BUG_ON(helper == NULL);
++	BUG_ON(mainfw == NULL);
++
++	/* Search for firmware to use from the table. */
++	iter = fw_table;
++	while (iter && iter->helper) {
++		if (iter->model != card_model)
++			goto next;
++
++		if (*helper == NULL) {
++			ret = request_firmware(helper, iter->helper, dev);
++			if (ret)
++				goto next;
++
++			/* If the device has one-stage firmware (ie cf8305) and
++			 * we've got it then we don't need to bother with the
++			 * main firmware.
++			 */
++			if (iter->fwname == NULL)
++				return 0;
++		}
++
++		if (*mainfw == NULL) {
++			ret = request_firmware(mainfw, iter->fwname, dev);
++			if (ret) {
++				/* Clear the helper to ensure we don't have
++				 * mismatched firmware pairs.
++				 */
++				release_firmware(*helper);
++				*helper = NULL;
++			}
++		}
++
++		if (*helper && *mainfw)
++			return 0;
++
++  next:
++		iter++;
++	}
++
++	/* Failed */
++	release_firmware(*helper);
++	*helper = NULL;
++	release_firmware(*mainfw);
++	*mainfw = NULL;
++
++	return -ENOENT;
++}
++EXPORT_SYMBOL_GPL(lbs_get_firmware);
+diff --git a/drivers/net/wireless/libertas/if_cs.c b/drivers/net/wireless/libertas/if_cs.c
+index 171a06b..cee5052 100644
+--- a/drivers/net/wireless/libertas/if_cs.c
++++ b/drivers/net/wireless/libertas/if_cs.c
+@@ -890,8 +890,8 @@ static int if_cs_probe(struct pcmcia_device *p_dev)
+ 		goto out2;
+ 	}
+ 
+-	ret = lbs_get_firmware(&p_dev->dev, NULL, NULL, card->model,
+-				&fw_table[0], &helper, &mainfw);
++	ret = lbs_get_firmware(&p_dev->dev, card->model, &fw_table[0],
++				&helper, &mainfw);
+ 	if (ret) {
+ 		pr_err("failed to find firmware (%d)\n", ret);
+ 		goto out2;
+diff --git a/drivers/net/wireless/libertas/if_sdio.c b/drivers/net/wireless/libertas/if_sdio.c
+index 15bfe2f..6590feb 100644
+--- a/drivers/net/wireless/libertas/if_sdio.c
++++ b/drivers/net/wireless/libertas/if_sdio.c
+@@ -65,12 +65,6 @@ static void if_sdio_interrupt(struct sdio_func *func);
+  */
+ static u8 user_rmmod;
+ 
+-static char *lbs_helper_name = NULL;
+-module_param_named(helper_name, lbs_helper_name, charp, 0644);
+-
+-static char *lbs_fw_name = NULL;
+-module_param_named(fw_name, lbs_fw_name, charp, 0644);
+-
+ static const struct sdio_device_id if_sdio_ids[] = {
+ 	{ SDIO_DEVICE(SDIO_VENDOR_ID_MARVELL,
+ 			SDIO_DEVICE_ID_MARVELL_LIBERTAS) },
+@@ -124,11 +118,6 @@ struct if_sdio_card {
+ 	unsigned long		ioport;
+ 	unsigned int		scratch_reg;
+ 
+-	const char		*helper;
+-	const char		*firmware;
+-	bool			helper_allocated;
+-	bool			firmware_allocated;
+-
+ 	u8			buffer[65536] __attribute__((aligned(4)));
+ 
+ 	spinlock_t		lock;
+@@ -725,8 +714,8 @@ static int if_sdio_prog_firmware(struct if_sdio_card *card)
+ 		goto success;
+ 	}
+ 
+-	ret = lbs_get_firmware(&card->func->dev, lbs_helper_name, lbs_fw_name,
+-				card->model, &fw_table[0], &helper, &mainfw);
++	ret = lbs_get_firmware(&card->func->dev, card->model, &fw_table[0],
++				&helper, &mainfw);
+ 	if (ret) {
+ 		pr_err("failed to find firmware (%d)\n", ret);
+ 		goto out;
+@@ -1242,10 +1231,6 @@ free:
+ 		kfree(packet);
+ 	}
+ 
+-	if (card->helper_allocated)
+-		kfree(card->helper);
+-	if (card->firmware_allocated)
+-		kfree(card->firmware);
+ 	kfree(card);
+ 
+ 	goto out;
+@@ -1293,12 +1278,6 @@ static void if_sdio_remove(struct sdio_func *func)
+ 		kfree(packet);
+ 	}
+ 
+-	if (card->helper_allocated)
+-		kfree(card->helper);
+-	if (card->firmware_allocated)
+-		kfree(card->firmware);
+-	kfree(card);
+-
+ 	lbs_deb_leave(LBS_DEB_SDIO);
+ }
+ 
+diff --git a/drivers/net/wireless/libertas/if_spi.c b/drivers/net/wireless/libertas/if_spi.c
+index 7a5df4f..9604a1c 100644
+--- a/drivers/net/wireless/libertas/if_spi.c
++++ b/drivers/net/wireless/libertas/if_spi.c
+@@ -1064,9 +1064,8 @@ static int if_spi_init_card(struct if_spi_card *card)
+ 			goto out;
+ 		}
+ 
+-		err = lbs_get_firmware(&card->spi->dev, NULL, NULL,
+-					card->card_id, &fw_table[0], &helper,
+-					&mainfw);
++		err = lbs_get_firmware(&card->spi->dev, card->card_id,
++					&fw_table[0], &helper, &mainfw);
+ 		if (err) {
+ 			netdev_err(priv->dev, "failed to find firmware (%d)\n",
+ 				   err);
+diff --git a/drivers/net/wireless/libertas/if_usb.c b/drivers/net/wireless/libertas/if_usb.c
+index ce4938d..f29471b 100644
+--- a/drivers/net/wireless/libertas/if_usb.c
++++ b/drivers/net/wireless/libertas/if_usb.c
+@@ -29,9 +29,6 @@
+ 
+ #define MESSAGE_HEADER_LEN	4
+ 
+-static char *lbs_fw_name = NULL;
+-module_param_named(fw_name, lbs_fw_name, charp, 0644);
+-
+ MODULE_FIRMWARE("libertas/usb8388_v9.bin");
+ MODULE_FIRMWARE("libertas/usb8388_v5.bin");
+ MODULE_FIRMWARE("libertas/usb8388.bin");
+@@ -55,10 +52,7 @@ MODULE_DEVICE_TABLE(usb, if_usb_table);
+ 
+ static void if_usb_receive(struct urb *urb);
+ static void if_usb_receive_fwload(struct urb *urb);
+-static int __if_usb_prog_firmware(struct if_usb_card *cardp,
+-					const char *fwname, int cmd);
+-static int if_usb_prog_firmware(struct if_usb_card *cardp,
+-					const char *fwname, int cmd);
++static int if_usb_prog_firmware(struct if_usb_card *cardp);
+ static int if_usb_host_to_card(struct lbs_private *priv, uint8_t type,
+ 			       uint8_t *payload, uint16_t nb);
+ static int usb_tx_block(struct if_usb_card *cardp, uint8_t *payload,
+@@ -67,69 +61,6 @@ static void if_usb_free(struct if_usb_card *cardp);
+ static int if_usb_submit_rx_urb(struct if_usb_card *cardp);
+ static int if_usb_reset_device(struct if_usb_card *cardp);
+ 
+-/* sysfs hooks */
+-
+-/*
+- *  Set function to write firmware to device's persistent memory
+- */
+-static ssize_t if_usb_firmware_set(struct device *dev,
+-		struct device_attribute *attr, const char *buf, size_t count)
+-{
+-	struct lbs_private *priv = to_net_dev(dev)->ml_priv;
+-	struct if_usb_card *cardp = priv->card;
+-	int ret;
+-
+-	BUG_ON(buf == NULL);
+-
+-	ret = if_usb_prog_firmware(cardp, buf, BOOT_CMD_UPDATE_FW);
+-	if (ret == 0)
+-		return count;
+-
+-	return ret;
+-}
+-
+-/*
+- * lbs_flash_fw attribute to be exported per ethX interface through sysfs
+- * (/sys/class/net/ethX/lbs_flash_fw).  Use this like so to write firmware to
+- * the device's persistent memory:
+- * echo usb8388-5.126.0.p5.bin > /sys/class/net/ethX/lbs_flash_fw
+- */
+-static DEVICE_ATTR(lbs_flash_fw, 0200, NULL, if_usb_firmware_set);
+-
+-/**
+- * if_usb_boot2_set - write firmware to device's persistent memory
+- *
+- * @dev: target device
+- * @attr: device attributes
+- * @buf: firmware buffer to write
+- * @count: number of bytes to write
+- *
+- * returns: number of bytes written or negative error code
+- */
+-static ssize_t if_usb_boot2_set(struct device *dev,
+-		struct device_attribute *attr, const char *buf, size_t count)
+-{
+-	struct lbs_private *priv = to_net_dev(dev)->ml_priv;
+-	struct if_usb_card *cardp = priv->card;
+-	int ret;
+-
+-	BUG_ON(buf == NULL);
+-
+-	ret = if_usb_prog_firmware(cardp, buf, BOOT_CMD_UPDATE_BOOT2);
+-	if (ret == 0)
+-		return count;
+-
+-	return ret;
+-}
+-
+-/*
+- * lbs_flash_boot2 attribute to be exported per ethX interface through sysfs
+- * (/sys/class/net/ethX/lbs_flash_boot2).  Use this like so to write firmware
+- * to the device's persistent memory:
+- * echo usb8388-5.126.0.p5.bin > /sys/class/net/ethX/lbs_flash_boot2
+- */
+-static DEVICE_ATTR(lbs_flash_boot2, 0200, NULL, if_usb_boot2_set);
+-
+ /**
+  * if_usb_write_bulk_callback - callback function to handle the status
+  * of the URB
+@@ -314,13 +245,10 @@ static int if_usb_probe(struct usb_interface *intf,
+ 	}
+ 
+ 	/* Upload firmware */
+-	kparam_block_sysfs_write(fw_name);
+-	if (__if_usb_prog_firmware(cardp, lbs_fw_name, BOOT_CMD_FW_BY_USB)) {
+-		kparam_unblock_sysfs_write(fw_name);
++	if (if_usb_prog_firmware(cardp)) {
+ 		lbs_deb_usbd(&udev->dev, "FW upload failed\n");
+ 		goto err_prog_firmware;
+ 	}
+-	kparam_unblock_sysfs_write(fw_name);
+ 
+ 	if (!(priv = lbs_add_card(cardp, &intf->dev)))
+ 		goto err_prog_firmware;
+@@ -349,14 +277,6 @@ static int if_usb_probe(struct usb_interface *intf,
+ 	usb_get_dev(udev);
+ 	usb_set_intfdata(intf, cardp);
+ 
+-	if (device_create_file(&priv->dev->dev, &dev_attr_lbs_flash_fw))
+-		netdev_err(priv->dev,
+-			   "cannot register lbs_flash_fw attribute\n");
+-
+-	if (device_create_file(&priv->dev->dev, &dev_attr_lbs_flash_boot2))
+-		netdev_err(priv->dev,
+-			   "cannot register lbs_flash_boot2 attribute\n");
+-
+ 	/*
+ 	 * EHS_REMOVE_WAKEUP is not supported on all versions of the firmware.
+ 	 */
+@@ -389,9 +309,6 @@ static void if_usb_disconnect(struct usb_interface *intf)
+ 
+ 	lbs_deb_enter(LBS_DEB_MAIN);
+ 
+-	device_remove_file(&priv->dev->dev, &dev_attr_lbs_flash_boot2);
+-	device_remove_file(&priv->dev->dev, &dev_attr_lbs_flash_fw);
+-
+ 	cardp->surprise_removed = 1;
+ 
+ 	if (priv) {
+@@ -912,58 +829,12 @@ static int check_fwfile_format(const uint8_t *data, uint32_t totlen)
+ 	return ret;
+ }
+ 
+-
+-/**
+-*  if_usb_prog_firmware - programs the firmware subject to cmd
+-*
+-*  @cardp:	the if_usb_card descriptor
+-*  @fwname:	firmware or boot2 image file name
+-*  @cmd:	either BOOT_CMD_FW_BY_USB, BOOT_CMD_UPDATE_FW,
+-*		or BOOT_CMD_UPDATE_BOOT2.
+-*  returns:	0 or error code
+-*/
+-static int if_usb_prog_firmware(struct if_usb_card *cardp,
+-				const char *fwname, int cmd)
+-{
+-	struct lbs_private *priv = cardp->priv;
+-	unsigned long flags, caps;
+-	int ret;
+-
+-	caps = priv->fwcapinfo;
+-	if (((cmd == BOOT_CMD_UPDATE_FW) && !(caps & FW_CAPINFO_FIRMWARE_UPGRADE)) ||
+-	    ((cmd == BOOT_CMD_UPDATE_BOOT2) && !(caps & FW_CAPINFO_BOOT2_UPGRADE)))
+-		return -EOPNOTSUPP;
+-
+-	/* Ensure main thread is idle. */
+-	spin_lock_irqsave(&priv->driver_lock, flags);
+-	while (priv->cur_cmd != NULL || priv->dnld_sent != DNLD_RES_RECEIVED) {
+-		spin_unlock_irqrestore(&priv->driver_lock, flags);
+-		if (wait_event_interruptible(priv->waitq,
+-				(priv->cur_cmd == NULL &&
+-				priv->dnld_sent == DNLD_RES_RECEIVED))) {
+-			return -ERESTARTSYS;
+-		}
+-		spin_lock_irqsave(&priv->driver_lock, flags);
+-	}
+-	priv->dnld_sent = DNLD_BOOTCMD_SENT;
+-	spin_unlock_irqrestore(&priv->driver_lock, flags);
+-
+-	ret = __if_usb_prog_firmware(cardp, fwname, cmd);
+-
+-	spin_lock_irqsave(&priv->driver_lock, flags);
+-	priv->dnld_sent = DNLD_RES_RECEIVED;
+-	spin_unlock_irqrestore(&priv->driver_lock, flags);
+-
+-	wake_up(&priv->waitq);
+-
+-	return ret;
+-}
+-
+ /* table of firmware file names */
+ static const struct {
+ 	u32 model;
+ 	const char *fwname;
+ } fw_table[] = {
++	{ MODEL_8388, "libertas/usb8388_olpc.bin" },
+ 	{ MODEL_8388, "libertas/usb8388_v9.bin" },
+ 	{ MODEL_8388, "libertas/usb8388_v5.bin" },
+ 	{ MODEL_8388, "libertas/usb8388.bin" },
+@@ -971,35 +842,10 @@ static const struct {
+ 	{ MODEL_8682, "libertas/usb8682.bin" }
+ };
+ 
+-#ifdef CONFIG_OLPC
+-
+-static int try_olpc_fw(struct if_usb_card *cardp)
+-{
+-	int retval = -ENOENT;
+-
+-	/* try the OLPC firmware first; fall back to fw_table list */
+-	if (machine_is_olpc() && cardp->model == MODEL_8388)
+-		retval = request_firmware(&cardp->fw,
+-				"libertas/usb8388_olpc.bin", &cardp->udev->dev);
+-	return retval;
+-}
+-
+-#else
+-static int try_olpc_fw(struct if_usb_card *cardp) { return -ENOENT; }
+-#endif /* !CONFIG_OLPC */
+-
+-static int get_fw(struct if_usb_card *cardp, const char *fwname)
++static int get_fw(struct if_usb_card *cardp)
+ {
+ 	int i;
+ 
+-	/* Try user-specified firmware first */
+-	if (fwname)
+-		return request_firmware(&cardp->fw, fwname, &cardp->udev->dev);
+-
+-	/* Handle OLPC firmware */
+-	if (try_olpc_fw(cardp) == 0)
+-		return 0;
+-
+ 	/* Otherwise search for firmware to use */
+ 	for (i = 0; i < ARRAY_SIZE(fw_table); i++) {
+ 		if (fw_table[i].model != cardp->model)
+@@ -1012,8 +858,7 @@ static int get_fw(struct if_usb_card *cardp, const char *fwname)
+ 	return -ENOENT;
+ }
+ 
+-static int __if_usb_prog_firmware(struct if_usb_card *cardp,
+-					const char *fwname, int cmd)
++static int if_usb_prog_firmware(struct if_usb_card *cardp)
+ {
+ 	int i = 0;
+ 	static int reset_count = 10;
+@@ -1021,7 +866,7 @@ static int __if_usb_prog_firmware(struct if_usb_card *cardp,
+ 
+ 	lbs_deb_enter(LBS_DEB_USB);
+ 
+-	ret = get_fw(cardp, fwname);
++	ret = get_fw(cardp);
+ 	if (ret) {
+ 		pr_err("failed to find firmware (%d)\n", ret);
+ 		goto done;
+@@ -1053,7 +898,7 @@ restart:
+ 	do {
+ 		int j = 0;
+ 		i++;
+-		if_usb_issue_boot_command(cardp, cmd);
++		if_usb_issue_boot_command(cardp, BOOT_CMD_FW_BY_USB);
+ 		/* wait for command response */
+ 		do {
+ 			j++;
+diff --git a/drivers/net/wireless/libertas/main.c b/drivers/net/wireless/libertas/main.c
+index 3b81b70..fa09585 100644
+--- a/drivers/net/wireless/libertas/main.c
++++ b/drivers/net/wireless/libertas/main.c
+@@ -1177,107 +1177,6 @@ void lbs_notify_command_response(struct lbs_private *priv, u8 resp_idx)
+ }
+ EXPORT_SYMBOL_GPL(lbs_notify_command_response);
+ 
+-/**
+- *  lbs_get_firmware - Retrieves two-stage firmware
+- *
+- *  @dev:     	A pointer to &device structure
+- *  @user_helper: User-defined helper firmware file
+- *  @user_mainfw: User-defined main firmware file
+- *  @card_model: Bus-specific card model ID used to filter firmware table
+- *		elements
+- *  @fw_table:	Table of firmware file names and device model numbers
+- *		terminated by an entry with a NULL helper name
+- *  @helper:	On success, the helper firmware; caller must free
+- *  @mainfw:	On success, the main firmware; caller must free
+- *
+- *  returns:		0 on success, non-zero on failure
+- */
+-int lbs_get_firmware(struct device *dev, const char *user_helper,
+-			const char *user_mainfw, u32 card_model,
+-			const struct lbs_fw_table *fw_table,
+-			const struct firmware **helper,
+-			const struct firmware **mainfw)
+-{
+-	const struct lbs_fw_table *iter;
+-	int ret;
+-
+-	BUG_ON(helper == NULL);
+-	BUG_ON(mainfw == NULL);
+-
+-	/* Try user-specified firmware first */
+-	if (user_helper) {
+-		ret = request_firmware(helper, user_helper, dev);
+-		if (ret) {
+-			dev_err(dev, "couldn't find helper firmware %s\n",
+-				user_helper);
+-			goto fail;
+-		}
+-	}
+-	if (user_mainfw) {
+-		ret = request_firmware(mainfw, user_mainfw, dev);
+-		if (ret) {
+-			dev_err(dev, "couldn't find main firmware %s\n",
+-				user_mainfw);
+-			goto fail;
+-		}
+-	}
+-
+-	if (*helper && *mainfw)
+-		return 0;
+-
+-	/* Otherwise search for firmware to use.  If neither the helper or
+-	 * the main firmware were specified by the user, then we need to
+-	 * make sure that found helper & main are from the same entry in
+-	 * fw_table.
+-	 */
+-	iter = fw_table;
+-	while (iter && iter->helper) {
+-		if (iter->model != card_model)
+-			goto next;
+-
+-		if (*helper == NULL) {
+-			ret = request_firmware(helper, iter->helper, dev);
+-			if (ret)
+-				goto next;
+-
+-			/* If the device has one-stage firmware (ie cf8305) and
+-			 * we've got it then we don't need to bother with the
+-			 * main firmware.
+-			 */
+-			if (iter->fwname == NULL)
+-				return 0;
+-		}
+-
+-		if (*mainfw == NULL) {
+-			ret = request_firmware(mainfw, iter->fwname, dev);
+-			if (ret && !user_helper) {
+-				/* Clear the helper if it wasn't user-specified
+-				 * and the main firmware load failed, to ensure
+-				 * we don't have mismatched firmware pairs.
+-				 */
+-				release_firmware(*helper);
+-				*helper = NULL;
+-			}
+-		}
+-
+-		if (*helper && *mainfw)
+-			return 0;
+-
+-  next:
+-		iter++;
+-	}
+-
+-  fail:
+-	/* Failed */
+-	release_firmware(*helper);
+-	*helper = NULL;
+-	release_firmware(*mainfw);
+-	*mainfw = NULL;
+-
+-	return -ENOENT;
+-}
+-EXPORT_SYMBOL_GPL(lbs_get_firmware);
+-
+ static int __init lbs_init_module(void)
+ {
+ 	lbs_deb_enter(LBS_DEB_MAIN);
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0011-libertas-harden-up-exit-paths.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0011-libertas-harden-up-exit-paths.patch
new file mode 100644
index 0000000..4891dea
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0011-libertas-harden-up-exit-paths.patch
@@ -0,0 +1,46 @@
+From 0beecac8abb3af890d470df541142d55343382d6 Mon Sep 17 00:00:00 2001
+From: Daniel Drake <dsd@laptop.org>
+Date: Mon, 16 Apr 2012 23:53:02 +0100
+Subject: [PATCH 11/17] libertas: harden-up exit paths
+
+These simple sanity check avoids extra complexity in error paths when
+moving to asynchronous firmware loading (which means the device may fail to
+init some time after its creation).
+
+Signed-off-by: Daniel Drake <dsd@laptop.org>
+Acked-by: Dan Williams <dcbw@redhat.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+---
+ drivers/net/wireless/libertas/main.c |    9 ++++++++-
+ 1 files changed, 8 insertions(+), 1 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/main.c b/drivers/net/wireless/libertas/main.c
+index fa09585..7eaf992 100644
+--- a/drivers/net/wireless/libertas/main.c
++++ b/drivers/net/wireless/libertas/main.c
+@@ -1033,7 +1033,9 @@ void lbs_remove_card(struct lbs_private *priv)
+ 	lbs_deb_enter(LBS_DEB_MAIN);
+ 
+ 	lbs_remove_mesh(priv);
+-	lbs_scan_deinit(priv);
++
++	if (priv->wiphy_registered)
++		lbs_scan_deinit(priv);
+ 
+ 	/* worker thread destruction blocks on the in-flight command which
+ 	 * should have been cleared already in lbs_stop_card().
+@@ -1128,6 +1130,11 @@ void lbs_stop_card(struct lbs_private *priv)
+ 		goto out;
+ 	dev = priv->dev;
+ 
++	/* If the netdev isn't registered, it means that lbs_start_card() was
++	 * never called so we have nothing to do here. */
++	if (dev->reg_state != NETREG_REGISTERED)
++		goto out;
++
+ 	netif_stop_queue(dev);
+ 	netif_carrier_off(dev);
+ 
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0012-libertas-add-asynchronous-firmware-loading-capabilit.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0012-libertas-add-asynchronous-firmware-loading-capabilit.patch
new file mode 100644
index 0000000..58963b3
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0012-libertas-add-asynchronous-firmware-loading-capabilit.patch
@@ -0,0 +1,269 @@
+From 534111c78c59a8db89c570fd07489243dc366a05 Mon Sep 17 00:00:00 2001
+From: Daniel Drake <dsd@laptop.org>
+Date: Mon, 16 Apr 2012 23:53:26 +0100
+Subject: [PATCH 12/17] libertas: add asynchronous firmware loading capability
+
+As described at
+http://article.gmane.org/gmane.linux.kernel.wireless.general/86084
+libertas is taking a long time to load because it loads firmware
+during module loading.
+
+Add a new API for interface drivers to load their firmware
+asynchronously. The same semantics of the firmware table are followed
+like before.
+
+Interface drivers will be converted in follow-up patches, then we can
+remove the old, synchronous firmware loading function.
+
+Signed-off-by: Daniel Drake <dsd@laptop.org>
+Acked-by: Dan Williams <dcbw@redhat.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+---
+ drivers/net/wireless/libertas/decl.h     |    8 ++
+ drivers/net/wireless/libertas/dev.h      |   10 ++
+ drivers/net/wireless/libertas/firmware.c |  143 ++++++++++++++++++++++++++++++
+ drivers/net/wireless/libertas/main.c     |    3 +
+ 4 files changed, 164 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/decl.h b/drivers/net/wireless/libertas/decl.h
+index 2fb2e31..84a3aa7 100644
+--- a/drivers/net/wireless/libertas/decl.h
++++ b/drivers/net/wireless/libertas/decl.h
+@@ -19,6 +19,10 @@ struct lbs_fw_table {
+ };
+ 
+ struct lbs_private;
++typedef void (*lbs_fw_cb)(struct lbs_private *priv, int ret,
++		const struct firmware *helper, const struct firmware *mainfw);
++
++struct lbs_private;
+ struct sk_buff;
+ struct net_device;
+ struct cmd_ds_command;
+@@ -70,5 +74,9 @@ int lbs_get_firmware(struct device *dev, u32 card_model,
+ 			const struct lbs_fw_table *fw_table,
+ 			const struct firmware **helper,
+ 			const struct firmware **mainfw);
++int lbs_get_firmware_async(struct lbs_private *priv, struct device *device,
++			   u32 card_model, const struct lbs_fw_table *fw_table,
++			   lbs_fw_cb callback);
++void lbs_wait_for_firmware_load(struct lbs_private *priv);
+ 
+ #endif
+diff --git a/drivers/net/wireless/libertas/dev.h b/drivers/net/wireless/libertas/dev.h
+index f3fd447..6720054 100644
+--- a/drivers/net/wireless/libertas/dev.h
++++ b/drivers/net/wireless/libertas/dev.h
+@@ -7,6 +7,7 @@
+ #define _LBS_DEV_H_
+ 
+ #include "defs.h"
++#include "decl.h"
+ #include "host.h"
+ 
+ #include <linux/kfifo.h>
+@@ -180,6 +181,15 @@ struct lbs_private {
+ 	wait_queue_head_t scan_q;
+ 	/* Whether the scan was initiated internally and not by cfg80211 */
+ 	bool internal_scan;
++
++	/* Firmware load */
++	u32 fw_model;
++	wait_queue_head_t fw_waitq;
++	struct device *fw_device;
++	const struct firmware *helper_fw;
++	const struct lbs_fw_table *fw_table;
++	const struct lbs_fw_table *fw_iter;
++	lbs_fw_cb fw_callback;
+ };
+ 
+ extern struct cmd_confirm_sleep confirm_sleep;
+diff --git a/drivers/net/wireless/libertas/firmware.c b/drivers/net/wireless/libertas/firmware.c
+index 0c8c845..cd23f1a 100644
+--- a/drivers/net/wireless/libertas/firmware.c
++++ b/drivers/net/wireless/libertas/firmware.c
+@@ -3,10 +3,151 @@
+  */
+ 
+ #include <linux/firmware.h>
++#include <linux/firmware.h>
+ #include <linux/module.h>
+ 
++#include "dev.h"
+ #include "decl.h"
+ 
++static void load_next_firmware_from_table(struct lbs_private *private);
++
++static void lbs_fw_loaded(struct lbs_private *priv, int ret,
++	const struct firmware *helper, const struct firmware *mainfw)
++{
++	unsigned long flags;
++
++	lbs_deb_fw("firmware load complete, code %d\n", ret);
++
++	/* User must free helper/mainfw */
++	priv->fw_callback(priv, ret, helper, mainfw);
++
++	spin_lock_irqsave(&priv->driver_lock, flags);
++	priv->fw_callback = NULL;
++	wake_up(&priv->fw_waitq);
++	spin_unlock_irqrestore(&priv->driver_lock, flags);
++}
++
++static void do_load_firmware(struct lbs_private *priv, const char *name,
++	void (*cb)(const struct firmware *fw, void *context))
++{
++	int ret;
++
++	lbs_deb_fw("Requesting %s\n", name);
++	ret = request_firmware_nowait(THIS_MODULE, true, name,
++			priv->fw_device, GFP_KERNEL, priv, cb);
++	if (ret) {
++		lbs_deb_fw("request_firmware_nowait error %d\n", ret);
++		lbs_fw_loaded(priv, ret, NULL, NULL);
++	}
++}
++
++static void main_firmware_cb(const struct firmware *firmware, void *context)
++{
++	struct lbs_private *priv = context;
++
++	if (!firmware) {
++		/* Failed to find firmware: try next table entry */
++		load_next_firmware_from_table(priv);
++		return;
++	}
++
++	/* Firmware found! */
++	lbs_fw_loaded(priv, 0, priv->helper_fw, firmware);
++}
++
++static void helper_firmware_cb(const struct firmware *firmware, void *context)
++{
++	struct lbs_private *priv = context;
++
++	if (!firmware) {
++		/* Failed to find firmware: try next table entry */
++		load_next_firmware_from_table(priv);
++		return;
++	}
++
++	/* Firmware found! */
++	if (priv->fw_iter->fwname) {
++		priv->helper_fw = firmware;
++		do_load_firmware(priv, priv->fw_iter->fwname, main_firmware_cb);
++	} else {
++		/* No main firmware needed for this helper --> success! */
++		lbs_fw_loaded(priv, 0, firmware, NULL);
++	}
++}
++
++static void load_next_firmware_from_table(struct lbs_private *priv)
++{
++	const struct lbs_fw_table *iter;
++
++	if (!priv->fw_iter)
++		iter = priv->fw_table;
++	else
++		iter = ++priv->fw_iter;
++
++	if (priv->helper_fw) {
++		release_firmware(priv->helper_fw);
++		priv->helper_fw = NULL;
++	}
++
++next:
++	if (!iter->helper) {
++		/* End of table hit. */
++		lbs_fw_loaded(priv, -ENOENT, NULL, NULL);
++		return;
++	}
++
++	if (iter->model != priv->fw_model) {
++		iter++;
++		goto next;
++	}
++
++	priv->fw_iter = iter;
++	do_load_firmware(priv, iter->helper, helper_firmware_cb);
++}
++
++void lbs_wait_for_firmware_load(struct lbs_private *priv)
++{
++	wait_event(priv->fw_waitq, priv->fw_callback == NULL);
++}
++
++/**
++ *  lbs_get_firmware_async - Retrieves firmware asynchronously. Can load
++ *  either a helper firmware and a main firmware (2-stage), or just the helper.
++ *
++ *  @priv:      Pointer to lbs_private instance
++ *  @dev:     	A pointer to &device structure
++ *  @card_model: Bus-specific card model ID used to filter firmware table
++ *		elements
++ *  @fw_table:	Table of firmware file names and device model numbers
++ *		terminated by an entry with a NULL helper name
++ *	@callback: User callback to invoke when firmware load succeeds or fails.
++ */
++int lbs_get_firmware_async(struct lbs_private *priv, struct device *device,
++			    u32 card_model, const struct lbs_fw_table *fw_table,
++			    lbs_fw_cb callback)
++{
++	unsigned long flags;
++
++	spin_lock_irqsave(&priv->driver_lock, flags);
++	if (priv->fw_callback) {
++		lbs_deb_fw("firmware load already in progress\n");
++		spin_unlock_irqrestore(&priv->driver_lock, flags);
++		return -EBUSY;
++	}
++
++	priv->fw_device = device;
++	priv->fw_callback = callback;
++	priv->fw_table = fw_table;
++	priv->fw_iter = NULL;
++	priv->fw_model = card_model;
++	spin_unlock_irqrestore(&priv->driver_lock, flags);
++
++	lbs_deb_fw("Starting async firmware load\n");
++	load_next_firmware_from_table(priv);
++	return 0;
++}
++EXPORT_SYMBOL_GPL(lbs_get_firmware_async);
++
+ /**
+  *  lbs_get_firmware - Retrieves two-stage firmware
+  *
+@@ -18,6 +159,8 @@
+  *  @helper:	On success, the helper firmware; caller must free
+  *  @mainfw:	On success, the main firmware; caller must free
+  *
++ * Deprecated: use lbs_get_firmware_async() instead.
++ *
+  *  returns:		0 on success, non-zero on failure
+  */
+ int lbs_get_firmware(struct device *dev, u32 card_model,
+diff --git a/drivers/net/wireless/libertas/main.c b/drivers/net/wireless/libertas/main.c
+index 7eaf992..e96ee0a 100644
+--- a/drivers/net/wireless/libertas/main.c
++++ b/drivers/net/wireless/libertas/main.c
+@@ -878,6 +878,7 @@ static int lbs_init_adapter(struct lbs_private *priv)
+ 	priv->is_host_sleep_configured = 0;
+ 	priv->is_host_sleep_activated = 0;
+ 	init_waitqueue_head(&priv->host_sleep_q);
++	init_waitqueue_head(&priv->fw_waitq);
+ 	mutex_init(&priv->lock);
+ 
+ 	setup_timer(&priv->command_timer, lbs_cmd_timeout_handler,
+@@ -1037,6 +1038,8 @@ void lbs_remove_card(struct lbs_private *priv)
+ 	if (priv->wiphy_registered)
+ 		lbs_scan_deinit(priv);
+ 
++	lbs_wait_for_firmware_load(priv);
++
+ 	/* worker thread destruction blocks on the in-flight command which
+ 	 * should have been cleared already in lbs_stop_card().
+ 	 */
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0013-libertas-SDIO-convert-to-asynchronous-firmware-loadi.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0013-libertas-SDIO-convert-to-asynchronous-firmware-loadi.patch
new file mode 100644
index 0000000..545ea88
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0013-libertas-SDIO-convert-to-asynchronous-firmware-loadi.patch
@@ -0,0 +1,320 @@
+From 66d647efe5e845c77f745478480c5e96218b7f3d Mon Sep 17 00:00:00 2001
+From: Daniel Drake <dsd@laptop.org>
+Date: Mon, 16 Apr 2012 23:53:43 +0100
+Subject: [PATCH 13/17] libertas SDIO: convert to asynchronous firmware
+ loading
+
+Signed-off-by: Daniel Drake <dsd@laptop.org>
+Acked-by: Dan Williams <dcbw@redhat.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+---
+ drivers/net/wireless/libertas/if_sdio.c |  206 ++++++++++++++++++-------------
+ 1 files changed, 121 insertions(+), 85 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/if_sdio.c b/drivers/net/wireless/libertas/if_sdio.c
+index 6590feb..76caeba 100644
+--- a/drivers/net/wireless/libertas/if_sdio.c
++++ b/drivers/net/wireless/libertas/if_sdio.c
+@@ -117,6 +117,8 @@ struct if_sdio_card {
+ 	int			model;
+ 	unsigned long		ioport;
+ 	unsigned int		scratch_reg;
++	bool			started;
++	wait_queue_head_t	pwron_waitq;
+ 
+ 	u8			buffer[65536] __attribute__((aligned(4)));
+ 
+@@ -129,6 +131,9 @@ struct if_sdio_card {
+ 	u8			rx_unit;
+ };
+ 
++static void if_sdio_finish_power_on(struct if_sdio_card *card);
++static int if_sdio_power_off(struct if_sdio_card *card);
++
+ /********************************************************************/
+ /* I/O                                                              */
+ /********************************************************************/
+@@ -669,12 +674,39 @@ out:
+ 	return ret;
+ }
+ 
++static void if_sdio_do_prog_firmware(struct lbs_private *priv, int ret,
++				     const struct firmware *helper,
++				     const struct firmware *mainfw)
++{
++	struct if_sdio_card *card = priv->card;
++
++	if (ret) {
++		pr_err("failed to find firmware (%d)\n", ret);
++		return;
++	}
++
++	ret = if_sdio_prog_helper(card, helper);
++	if (ret)
++		goto out;
++
++	lbs_deb_sdio("Helper firmware loaded\n");
++
++	ret = if_sdio_prog_real(card, mainfw);
++	if (ret)
++		goto out;
++
++	lbs_deb_sdio("Firmware loaded\n");
++	if_sdio_finish_power_on(card);
++
++out:
++	release_firmware(helper);
++	release_firmware(mainfw);
++}
++
+ static int if_sdio_prog_firmware(struct if_sdio_card *card)
+ {
+ 	int ret;
+ 	u16 scratch;
+-	const struct firmware *helper = NULL;
+-	const struct firmware *mainfw = NULL;
+ 
+ 	lbs_deb_enter(LBS_DEB_SDIO);
+ 
+@@ -708,41 +740,18 @@ static int if_sdio_prog_firmware(struct if_sdio_card *card)
+ 	 */
+ 	if (scratch == IF_SDIO_FIRMWARE_OK) {
+ 		lbs_deb_sdio("firmware already loaded\n");
+-		goto success;
++		if_sdio_finish_power_on(card);
++		return 0;
+ 	} else if ((card->model == MODEL_8686) && (scratch & 0x7fff)) {
+ 		lbs_deb_sdio("firmware may be running\n");
+-		goto success;
+-	}
+-
+-	ret = lbs_get_firmware(&card->func->dev, card->model, &fw_table[0],
+-				&helper, &mainfw);
+-	if (ret) {
+-		pr_err("failed to find firmware (%d)\n", ret);
+-		goto out;
++		if_sdio_finish_power_on(card);
++		return 0;
+ 	}
+ 
+-	ret = if_sdio_prog_helper(card, helper);
+-	if (ret)
+-		goto out;
+-
+-	lbs_deb_sdio("Helper firmware loaded\n");
+-
+-	ret = if_sdio_prog_real(card, mainfw);
+-	if (ret)
+-		goto out;
+-
+-	lbs_deb_sdio("Firmware loaded\n");
+-
+-success:
+-	sdio_claim_host(card->func);
+-	sdio_set_block_size(card->func, IF_SDIO_BLOCK_SIZE);
+-	sdio_release_host(card->func);
+-	ret = 0;
++	ret = lbs_get_firmware_async(card->priv, &card->func->dev, card->model,
++				     fw_table, if_sdio_do_prog_firmware);
+ 
+ out:
+-	release_firmware(helper);
+-	release_firmware(mainfw);
+-
+ 	lbs_deb_leave_args(LBS_DEB_SDIO, "ret %d", ret);
+ 	return ret;
+ }
+@@ -751,55 +760,15 @@ out:
+ /* Power management                                                 */
+ /********************************************************************/
+ 
+-static int if_sdio_power_on(struct if_sdio_card *card)
++/* Finish power on sequence (after firmware is loaded) */
++static void if_sdio_finish_power_on(struct if_sdio_card *card)
+ {
+ 	struct sdio_func *func = card->func;
+ 	struct lbs_private *priv = card->priv;
+-	struct mmc_host *host = func->card->host;
+ 	int ret;
+ 
+ 	sdio_claim_host(func);
+-
+-	ret = sdio_enable_func(func);
+-	if (ret)
+-		goto release;
+-
+-	/* For 1-bit transfers to the 8686 model, we need to enable the
+-	 * interrupt flag in the CCCR register. Set the MMC_QUIRK_LENIENT_FN0
+-	 * bit to allow access to non-vendor registers. */
+-	if ((card->model == MODEL_8686) &&
+-	    (host->caps & MMC_CAP_SDIO_IRQ) &&
+-	    (host->ios.bus_width == MMC_BUS_WIDTH_1)) {
+-		u8 reg;
+-
+-		func->card->quirks |= MMC_QUIRK_LENIENT_FN0;
+-		reg = sdio_f0_readb(func, SDIO_CCCR_IF, &ret);
+-		if (ret)
+-			goto disable;
+-
+-		reg |= SDIO_BUS_ECSI;
+-		sdio_f0_writeb(func, reg, SDIO_CCCR_IF, &ret);
+-		if (ret)
+-			goto disable;
+-	}
+-
+-	card->ioport = sdio_readb(func, IF_SDIO_IOPORT, &ret);
+-	if (ret)
+-		goto disable;
+-
+-	card->ioport |= sdio_readb(func, IF_SDIO_IOPORT + 1, &ret) << 8;
+-	if (ret)
+-		goto disable;
+-
+-	card->ioport |= sdio_readb(func, IF_SDIO_IOPORT + 2, &ret) << 16;
+-	if (ret)
+-		goto disable;
+-
+-	sdio_release_host(func);
+-	ret = if_sdio_prog_firmware(card);
+-	sdio_claim_host(func);
+-	if (ret)
+-		goto disable;
++	sdio_set_block_size(card->func, IF_SDIO_BLOCK_SIZE);
+ 
+ 	/*
+ 	 * Get rx_unit if the chip is SD8688 or newer.
+@@ -824,7 +793,7 @@ static int if_sdio_power_on(struct if_sdio_card *card)
+ 	 */
+ 	ret = sdio_claim_irq(func, if_sdio_interrupt);
+ 	if (ret)
+-		goto disable;
++		goto release;
+ 
+ 	/*
+ 	 * Enable interrupts now that everything is set up
+@@ -850,11 +819,79 @@ static int if_sdio_power_on(struct if_sdio_card *card)
+ 	}
+ 
+ 	priv->fw_ready = 1;
++	wake_up(&card->pwron_waitq);
+ 
+-	return 0;
++	if (!card->started) {
++		ret = lbs_start_card(priv);
++		if_sdio_power_off(card);
++		if (ret == 0) {
++			card->started = true;
++			/* Tell PM core that we don't need the card to be
++			 * powered now */
++			pm_runtime_put_noidle(&func->dev);
++		}
++	}
++
++	return;
+ 
+ release_irq:
+ 	sdio_release_irq(func);
++release:
++	sdio_release_host(func);
++}
++
++static int if_sdio_power_on(struct if_sdio_card *card)
++{
++	struct sdio_func *func = card->func;
++	struct mmc_host *host = func->card->host;
++	int ret;
++
++	sdio_claim_host(func);
++
++	ret = sdio_enable_func(func);
++	if (ret)
++		goto release;
++
++	/* For 1-bit transfers to the 8686 model, we need to enable the
++	 * interrupt flag in the CCCR register. Set the MMC_QUIRK_LENIENT_FN0
++	 * bit to allow access to non-vendor registers. */
++	if ((card->model == MODEL_8686) &&
++	    (host->caps & MMC_CAP_SDIO_IRQ) &&
++	    (host->ios.bus_width == MMC_BUS_WIDTH_1)) {
++		u8 reg;
++
++		func->card->quirks |= MMC_QUIRK_LENIENT_FN0;
++		reg = sdio_f0_readb(func, SDIO_CCCR_IF, &ret);
++		if (ret)
++			goto disable;
++
++		reg |= SDIO_BUS_ECSI;
++		sdio_f0_writeb(func, reg, SDIO_CCCR_IF, &ret);
++		if (ret)
++			goto disable;
++	}
++
++	card->ioport = sdio_readb(func, IF_SDIO_IOPORT, &ret);
++	if (ret)
++		goto disable;
++
++	card->ioport |= sdio_readb(func, IF_SDIO_IOPORT + 1, &ret) << 8;
++	if (ret)
++		goto disable;
++
++	card->ioport |= sdio_readb(func, IF_SDIO_IOPORT + 2, &ret) << 16;
++	if (ret)
++		goto disable;
++
++	sdio_release_host(func);
++	ret = if_sdio_prog_firmware(card);
++	if (ret) {
++		sdio_disable_func(func);
++		return ret;
++	}
++
++	return 0;
++
+ disable:
+ 	sdio_disable_func(func);
+ release:
+@@ -1061,11 +1098,17 @@ static int if_sdio_power_save(struct lbs_private *priv)
+ static int if_sdio_power_restore(struct lbs_private *priv)
+ {
+ 	struct if_sdio_card *card = priv->card;
++	int r;
+ 
+ 	/* Make sure the card will not be powered off by runtime PM */
+ 	pm_runtime_get_sync(&card->func->dev);
+ 
+-	return if_sdio_power_on(card);
++	r = if_sdio_power_on(card);
++	if (r)
++		return r;
++
++	wait_event(card->pwron_waitq, priv->fw_ready);
++	return 0;
+ }
+ 
+ 
+@@ -1166,6 +1209,7 @@ static int if_sdio_probe(struct sdio_func *func,
+ 	spin_lock_init(&card->lock);
+ 	card->workqueue = create_workqueue("libertas_sdio");
+ 	INIT_WORK(&card->packet_worker, if_sdio_host_to_card_worker);
++	init_waitqueue_head(&card->pwron_waitq);
+ 
+ 	/* Check if we support this card */
+ 	for (i = 0; i < ARRAY_SIZE(fw_table); i++) {
+@@ -1207,14 +1251,6 @@ static int if_sdio_probe(struct sdio_func *func,
+ 	if (ret)
+ 		goto err_activate_card;
+ 
+-	ret = lbs_start_card(priv);
+-	if_sdio_power_off(card);
+-	if (ret)
+-		goto err_activate_card;
+-
+-	/* Tell PM core that we don't need the card to be powered now */
+-	pm_runtime_put_noidle(&func->dev);
+-
+ out:
+ 	lbs_deb_leave_args(LBS_DEB_SDIO, "ret %d", ret);
+ 
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0014-libertas-USB-convert-to-asynchronous-firmware-loadin.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0014-libertas-USB-convert-to-asynchronous-firmware-loadin.patch
new file mode 100644
index 0000000..9952cd3
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0014-libertas-USB-convert-to-asynchronous-firmware-loadin.patch
@@ -0,0 +1,201 @@
+From ce84bb69f50e6f6cfeabc9b965365290f4184417 Mon Sep 17 00:00:00 2001
+From: Daniel Drake <dsd@laptop.org>
+Date: Mon, 16 Apr 2012 23:53:55 +0100
+Subject: [PATCH 14/17] libertas USB: convert to asynchronous firmware loading
+
+Signed-off-by: Daniel Drake <dsd@laptop.org>
+Acked-by: Dan Williams <dcbw@redhat.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+---
+ drivers/net/wireless/libertas/if_usb.c |  102 +++++++++++++------------------
+ 1 files changed, 43 insertions(+), 59 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/if_usb.c b/drivers/net/wireless/libertas/if_usb.c
+index f29471b..75403e6 100644
+--- a/drivers/net/wireless/libertas/if_usb.c
++++ b/drivers/net/wireless/libertas/if_usb.c
+@@ -41,6 +41,16 @@ enum {
+ 	MODEL_8682 = 0x2
+ };
+ 
++/* table of firmware file names */
++static const struct lbs_fw_table fw_table[] = {
++	{ MODEL_8388, "libertas/usb8388_olpc.bin", NULL },
++	{ MODEL_8388, "libertas/usb8388_v9.bin", NULL },
++	{ MODEL_8388, "libertas/usb8388_v5.bin", NULL },
++	{ MODEL_8388, "libertas/usb8388.bin", NULL },
++	{ MODEL_8388, "usb8388.bin", NULL },
++	{ MODEL_8682, "libertas/usb8682.bin", NULL }
++};
++
+ static struct usb_device_id if_usb_table[] = {
+ 	/* Enter the device signature inside */
+ 	{ USB_DEVICE(0x1286, 0x2001), .driver_info = MODEL_8388 },
+@@ -52,7 +62,9 @@ MODULE_DEVICE_TABLE(usb, if_usb_table);
+ 
+ static void if_usb_receive(struct urb *urb);
+ static void if_usb_receive_fwload(struct urb *urb);
+-static int if_usb_prog_firmware(struct if_usb_card *cardp);
++static void if_usb_prog_firmware(struct lbs_private *priv, int ret,
++				 const struct firmware *fw,
++				 const struct firmware *unused);
+ static int if_usb_host_to_card(struct lbs_private *priv, uint8_t type,
+ 			       uint8_t *payload, uint16_t nb);
+ static int usb_tx_block(struct if_usb_card *cardp, uint8_t *payload,
+@@ -187,6 +199,7 @@ static int if_usb_probe(struct usb_interface *intf,
+ 	struct usb_endpoint_descriptor *endpoint;
+ 	struct lbs_private *priv;
+ 	struct if_usb_card *cardp;
++	int r = -ENOMEM;
+ 	int i;
+ 
+ 	udev = interface_to_usbdev(intf);
+@@ -244,17 +257,10 @@ static int if_usb_probe(struct usb_interface *intf,
+ 		goto dealloc;
+ 	}
+ 
+-	/* Upload firmware */
+-	if (if_usb_prog_firmware(cardp)) {
+-		lbs_deb_usbd(&udev->dev, "FW upload failed\n");
+-		goto err_prog_firmware;
+-	}
+-
+ 	if (!(priv = lbs_add_card(cardp, &intf->dev)))
+-		goto err_prog_firmware;
++		goto err_add_card;
+ 
+ 	cardp->priv = priv;
+-	cardp->priv->fw_ready = 1;
+ 
+ 	priv->hw_host_to_card = if_usb_host_to_card;
+ 	priv->enter_deep_sleep = NULL;
+@@ -267,34 +273,25 @@ static int if_usb_probe(struct usb_interface *intf,
+ 
+ 	cardp->boot2_version = udev->descriptor.bcdDevice;
+ 
+-	if_usb_submit_rx_urb(cardp);
+-
+-	if (lbs_start_card(priv))
+-		goto err_start_card;
+-
+-	if_usb_setup_firmware(priv);
+-
+ 	usb_get_dev(udev);
+ 	usb_set_intfdata(intf, cardp);
+ 
+-	/*
+-	 * EHS_REMOVE_WAKEUP is not supported on all versions of the firmware.
+-	 */
+-	priv->wol_criteria = EHS_REMOVE_WAKEUP;
+-	if (lbs_host_sleep_cfg(priv, priv->wol_criteria, NULL))
+-		priv->ehs_remove_supported = false;
++	r = lbs_get_firmware_async(priv, &udev->dev, cardp->model,
++				   fw_table, if_usb_prog_firmware);
++	if (r)
++		goto err_get_fw;
+ 
+ 	return 0;
+ 
+-err_start_card:
++err_get_fw:
+ 	lbs_remove_card(priv);
+-err_prog_firmware:
++err_add_card:
+ 	if_usb_reset_device(cardp);
+ dealloc:
+ 	if_usb_free(cardp);
+ 
+ error:
+-	return -ENOMEM;
++	return r;
+ }
+ 
+ /**
+@@ -829,49 +826,22 @@ static int check_fwfile_format(const uint8_t *data, uint32_t totlen)
+ 	return ret;
+ }
+ 
+-/* table of firmware file names */
+-static const struct {
+-	u32 model;
+-	const char *fwname;
+-} fw_table[] = {
+-	{ MODEL_8388, "libertas/usb8388_olpc.bin" },
+-	{ MODEL_8388, "libertas/usb8388_v9.bin" },
+-	{ MODEL_8388, "libertas/usb8388_v5.bin" },
+-	{ MODEL_8388, "libertas/usb8388.bin" },
+-	{ MODEL_8388, "usb8388.bin" },
+-	{ MODEL_8682, "libertas/usb8682.bin" }
+-};
+-
+-static int get_fw(struct if_usb_card *cardp)
+-{
+-	int i;
+-
+-	/* Otherwise search for firmware to use */
+-	for (i = 0; i < ARRAY_SIZE(fw_table); i++) {
+-		if (fw_table[i].model != cardp->model)
+-			continue;
+-		if (request_firmware(&cardp->fw, fw_table[i].fwname,
+-					&cardp->udev->dev) == 0)
+-			return 0;
+-	}
+-
+-	return -ENOENT;
+-}
+-
+-static int if_usb_prog_firmware(struct if_usb_card *cardp)
++static void if_usb_prog_firmware(struct lbs_private *priv, int ret,
++				 const struct firmware *fw,
++				 const struct firmware *unused)
+ {
++	struct if_usb_card *cardp = priv->card;
+ 	int i = 0;
+ 	static int reset_count = 10;
+-	int ret = 0;
+ 
+ 	lbs_deb_enter(LBS_DEB_USB);
+ 
+-	ret = get_fw(cardp);
+ 	if (ret) {
+ 		pr_err("failed to find firmware (%d)\n", ret);
+ 		goto done;
+ 	}
+ 
++	cardp->fw = fw;
+ 	if (check_fwfile_format(cardp->fw->data, cardp->fw->size)) {
+ 		ret = -EINVAL;
+ 		goto release_fw;
+@@ -954,13 +924,27 @@ restart:
+ 		goto release_fw;
+ 	}
+ 
++	cardp->priv->fw_ready = 1;
++	if_usb_submit_rx_urb(cardp);
++
++	if (lbs_start_card(priv))
++		goto release_fw;
++
++	if_usb_setup_firmware(priv);
++
++	/*
++	 * EHS_REMOVE_WAKEUP is not supported on all versions of the firmware.
++	 */
++	priv->wol_criteria = EHS_REMOVE_WAKEUP;
++	if (lbs_host_sleep_cfg(priv, priv->wol_criteria, NULL))
++		priv->ehs_remove_supported = false;
++
+  release_fw:
+ 	release_firmware(cardp->fw);
+ 	cardp->fw = NULL;
+ 
+  done:
+-	lbs_deb_leave_args(LBS_DEB_USB, "ret %d", ret);
+-	return ret;
++	lbs_deb_leave(LBS_DEB_USB);
+ }
+ 
+ 
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0015-libertas-CS-convert-to-asynchronous-firmware-loading.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0015-libertas-CS-convert-to-asynchronous-firmware-loading.patch
new file mode 100644
index 0000000..79aafdc
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0015-libertas-CS-convert-to-asynchronous-firmware-loading.patch
@@ -0,0 +1,154 @@
+From 488c3ee77ea0e63c9ae4736b1610aaf39c6527ee Mon Sep 17 00:00:00 2001
+From: Daniel Drake <dsd@laptop.org>
+Date: Wed, 18 Apr 2012 20:09:44 +0100
+Subject: [PATCH 15/17] libertas CS: convert to asynchronous firmware loading
+
+Signed-off-by: Daniel Drake <dsd@laptop.org>
+Tested-by: Dan Williams <dcbw@redhat.com>
+Acked-by: Dan Williams <dcbw@redhat.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+---
+ drivers/net/wireless/libertas/if_cs.c |   88 ++++++++++++++++++--------------
+ 1 files changed, 49 insertions(+), 39 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/if_cs.c b/drivers/net/wireless/libertas/if_cs.c
+index cee5052..16beaf3 100644
+--- a/drivers/net/wireless/libertas/if_cs.c
++++ b/drivers/net/wireless/libertas/if_cs.c
+@@ -738,6 +738,50 @@ done:
+ 	return ret;
+ }
+ 
++static void if_cs_prog_firmware(struct lbs_private *priv, int ret,
++				 const struct firmware *helper,
++				 const struct firmware *mainfw)
++{
++	struct if_cs_card *card = priv->card;
++
++	if (ret) {
++		pr_err("failed to find firmware (%d)\n", ret);
++		return;
++	}
++
++	/* Load the firmware */
++	ret = if_cs_prog_helper(card, helper);
++	if (ret == 0 && (card->model != MODEL_8305))
++		ret = if_cs_prog_real(card, mainfw);
++	if (ret)
++		goto out;
++
++	/* Now actually get the IRQ */
++	ret = request_irq(card->p_dev->irq, if_cs_interrupt,
++		IRQF_SHARED, DRV_NAME, card);
++	if (ret) {
++		pr_err("error in request_irq\n");
++		goto out;
++	}
++
++	/*
++	 * Clear any interrupt cause that happened while sending
++	 * firmware/initializing card
++	 */
++	if_cs_write16(card, IF_CS_CARD_INT_CAUSE, IF_CS_BIT_MASK);
++	if_cs_enable_ints(card);
++
++	/* And finally bring the card up */
++	priv->fw_ready = 1;
++	if (lbs_start_card(priv) != 0) {
++		pr_err("could not activate card\n");
++		free_irq(card->p_dev->irq, card);
++	}
++
++out:
++	release_firmware(helper);
++	release_firmware(mainfw);
++}
+ 
+ 
+ /********************************************************************/
+@@ -809,8 +853,6 @@ static int if_cs_probe(struct pcmcia_device *p_dev)
+ 	unsigned int prod_id;
+ 	struct lbs_private *priv;
+ 	struct if_cs_card *card;
+-	const struct firmware *helper = NULL;
+-	const struct firmware *mainfw = NULL;
+ 
+ 	lbs_deb_enter(LBS_DEB_CS);
+ 
+@@ -890,20 +932,6 @@ static int if_cs_probe(struct pcmcia_device *p_dev)
+ 		goto out2;
+ 	}
+ 
+-	ret = lbs_get_firmware(&p_dev->dev, card->model, &fw_table[0],
+-				&helper, &mainfw);
+-	if (ret) {
+-		pr_err("failed to find firmware (%d)\n", ret);
+-		goto out2;
+-	}
+-
+-	/* Load the firmware early, before calling into libertas.ko */
+-	ret = if_cs_prog_helper(card, helper);
+-	if (ret == 0 && (card->model != MODEL_8305))
+-		ret = if_cs_prog_real(card, mainfw);
+-	if (ret)
+-		goto out2;
+-
+ 	/* Make this card known to the libertas driver */
+ 	priv = lbs_add_card(card, &p_dev->dev);
+ 	if (!priv) {
+@@ -911,37 +939,22 @@ static int if_cs_probe(struct pcmcia_device *p_dev)
+ 		goto out2;
+ 	}
+ 
+-	/* Finish setting up fields in lbs_private */
++	/* Set up fields in lbs_private */
+ 	card->priv = priv;
+ 	priv->card = card;
+ 	priv->hw_host_to_card = if_cs_host_to_card;
+ 	priv->enter_deep_sleep = NULL;
+ 	priv->exit_deep_sleep = NULL;
+ 	priv->reset_deep_sleep_wakeup = NULL;
+-	priv->fw_ready = 1;
+ 
+-	/* Now actually get the IRQ */
+-	ret = request_irq(p_dev->irq, if_cs_interrupt,
+-		IRQF_SHARED, DRV_NAME, card);
++	/* Get firmware */
++	ret = lbs_get_firmware_async(priv, &p_dev->dev, card->model, fw_table,
++				     if_cs_prog_firmware);
+ 	if (ret) {
+-		pr_err("error in request_irq\n");
+-		goto out3;
+-	}
+-
+-	/*
+-	 * Clear any interrupt cause that happened while sending
+-	 * firmware/initializing card
+-	 */
+-	if_cs_write16(card, IF_CS_CARD_INT_CAUSE, IF_CS_BIT_MASK);
+-	if_cs_enable_ints(card);
+-
+-	/* And finally bring the card up */
+-	if (lbs_start_card(priv) != 0) {
+-		pr_err("could not activate card\n");
++		pr_err("failed to find firmware (%d)\n", ret);
+ 		goto out3;
+ 	}
+ 
+-	ret = 0;
+ 	goto out;
+ 
+ out3:
+@@ -951,9 +964,6 @@ out2:
+ out1:
+ 	pcmcia_disable_device(p_dev);
+ out:
+-	release_firmware(helper);
+-	release_firmware(mainfw);
+-
+ 	lbs_deb_leave_args(LBS_DEB_CS, "ret %d", ret);
+ 	return ret;
+ }
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0016-libertas-add-missing-include.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0016-libertas-add-missing-include.patch
new file mode 100644
index 0000000..1a89816
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0016-libertas-add-missing-include.patch
@@ -0,0 +1,30 @@
+From 7608f165734eaeb530ba2442c0413e6e9630ad83 Mon Sep 17 00:00:00 2001
+From: Felix Fietkau <nbd@openwrt.org>
+Date: Thu, 19 Apr 2012 13:54:12 +0200
+Subject: [PATCH 16/17] libertas: add missing include
+
+Without it, I get compile errors due to missing TASK_NORMAL,
+TASK_UNINTERRUPTIBLE and schedule.
+
+Signed-off-by: Felix Fietkau <nbd@openwrt.org>
+Acked-by: Dan Williams <dcbw@redhat.com>
+Signed-off-by: John W. Linville <linville@tuxdriver.com>
+---
+ drivers/net/wireless/libertas/firmware.c |    1 +
+ 1 files changed, 1 insertions(+), 0 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/firmware.c b/drivers/net/wireless/libertas/firmware.c
+index cd23f1a..77f6504 100644
+--- a/drivers/net/wireless/libertas/firmware.c
++++ b/drivers/net/wireless/libertas/firmware.c
+@@ -5,6 +5,7 @@
+ #include <linux/firmware.h>
+ #include <linux/firmware.h>
+ #include <linux/module.h>
++#include <linux/sched.h>
+ 
+ #include "dev.h"
+ #include "decl.h"
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline-3.2/libertas/0017-remove-debug-msgs-due-to-missing-in_interrupt.patch b/recipes-kernel/linux/linux-mainline-3.2/libertas/0017-remove-debug-msgs-due-to-missing-in_interrupt.patch
new file mode 100644
index 0000000..2ad77c2
--- /dev/null
+++ b/recipes-kernel/linux/linux-mainline-3.2/libertas/0017-remove-debug-msgs-due-to-missing-in_interrupt.patch
@@ -0,0 +1,36 @@
+From 94938a2b8b1db241843abfe98168b81bf9273165 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 21 May 2012 17:01:23 +0200
+Subject: [PATCH] remove debug msgs due to missing in_interrupt
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ drivers/net/wireless/libertas/defs.h |    7 -------
+ 1 files changed, 0 insertions(+), 7 deletions(-)
+
+diff --git a/drivers/net/wireless/libertas/defs.h b/drivers/net/wireless/libertas/defs.h
+index ab966f0..a80b40e 100644
+--- a/drivers/net/wireless/libertas/defs.h
++++ b/drivers/net/wireless/libertas/defs.h
+@@ -46,14 +46,7 @@
+ 
+ extern unsigned int lbs_debug;
+ 
+-#ifdef DEBUG
+-#define LBS_DEB_LL(grp, grpnam, fmt, args...) \
+-do { if ((lbs_debug & (grp)) == (grp)) \
+-  printk(KERN_DEBUG DRV_NAME grpnam "%s: " fmt, \
+-         in_interrupt() ? " (INT)" : "", ## args); } while (0)
+-#else
+ #define LBS_DEB_LL(grp, grpnam, fmt, args...) do {} while (0)
+-#endif
+ 
+ #define lbs_deb_enter(grp) \
+   LBS_DEB_LL(grp | LBS_DEB_ENTER, " enter", "%s()\n", __func__);
+-- 
+1.7.4.4
+
diff --git a/recipes-kernel/linux/linux-mainline_3.2.bb b/recipes-kernel/linux/linux-mainline_3.2.bb
index 3dda4f8..0ca5c78 100644
--- a/recipes-kernel/linux/linux-mainline_3.2.bb
+++ b/recipes-kernel/linux/linux-mainline_3.2.bb
@@ -10,7 +10,7 @@ PV = "3.2.16"
 SRCREV_pn-${PN} = "b1be7dd1ec231ae751d0ce3acd0d2e5760704a6f"
 
 # The main PR is now using MACHINE_KERNEL_PR, for omap3 see conf/machine/include/omap3.inc
-MACHINE_KERNEL_PR_append = "d"
+MACHINE_KERNEL_PR_append = "e"
 
 FILESPATH =. "${FILE_DIRNAME}/linux-mainline-3.2:${FILE_DIRNAME}/linux-mainline-3.2/${MACHINE}:"
 
@@ -74,7 +74,23 @@ SRC_URI += "git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.gi
             file://omap_fixes/0006-OMAP-HWMOD-add-es3plus-to-am36xx-am35xx.patch \
             file://sgx/0001-Revert-OMAP-DSS2-remove-update_mode-from-omapdss-v3.2.patch \
             file://led/0001-leds-heartbeat-stop-on-shutdown-reboot-or-panic.patch \
-            \
+            file://libertas/0001-USB-convert-drivers-net-to-use-module_usb_driver.patch \
+            file://libertas/0002-net-fix-assignment-of-0-1-to-bool-variables.patch \
+            file://libertas/0003-switch-debugfs-to-umode_t.patch \
+            file://libertas/0004-drivers-net-Remove-unnecessary-k.alloc-v.alloc-OOM-m.patch \
+            file://libertas/0005-libertas-remove-dump_survey-implementation.patch \
+            file://libertas/0007-wireless-libertas-remove-redundant-NULL-tests-before.patch \
+            file://libertas/0008-libertas-fix-signedness-bug-in-lbs_auth_to_authtype.patch \
+            file://libertas/0009-drivers-net-wireless-libertas-if_usb.c-add-missing-d.patch \
+            file://libertas/0010-libertas-Firmware-loading-simplifications.patch \
+            file://libertas/0011-libertas-harden-up-exit-paths.patch \
+            file://libertas/0012-libertas-add-asynchronous-firmware-loading-capabilit.patch \
+            file://libertas/0013-libertas-SDIO-convert-to-asynchronous-firmware-loadi.patch \
+            file://libertas/0014-libertas-USB-convert-to-asynchronous-firmware-loadin.patch \
+            file://libertas/0015-libertas-CS-convert-to-asynchronous-firmware-loading.patch \
+            file://libertas/0016-libertas-add-missing-include.patch \
+            file://libertas/0017-remove-debug-msgs-due-to-missing-in_interrupt.patch \
+           \
             file://defconfig"
 
 SRC_URI_append_beagleboard = " file://logo_linux_clut224.ppm \
-- 
1.7.4.4


