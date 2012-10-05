Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0310DE0049B
	for <meta-ti@yoctoproject.org>; Thu,  4 Oct 2012 21:46:43 -0700 (PDT)
Received: by mail-ob0-f176.google.com with SMTP id x4so1701914obh.35
	for <meta-ti@yoctoproject.org>; Thu, 04 Oct 2012 21:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=QXxh7+o9QQH7CWrsd2TZHieS3mP1CaVxEcMCrL/KnMo=;
	b=nNMVNt4tYPkS86vod/24MnGDroOGSK+/F/ABrpjKSDNaP8jK+D09spj+jUR92yRNmC
	JkeiTt/ex99UEf6TJkKneIUeTWYaiU05h4v4Pab/GP+MNDz6/8BoYVQ+9UirzUtNlj1R
	h/6NW2HwR6CoH6Ml1h7ICc6+8OJOlv2TgHunP3o5arLHG+SsxfKK9zMn1ufx9L5ahYdm
	8wuWxecBcILKFaU0/WBcoO4JaBgVqy3J/hDdOb08YpF+LXpAhvoY5cFRx8ps/R4iGvCh
	I7TQQuc2iYsF/jiRm1Nu9MoeoPeK6A5sIqM1ceTXnqyJ+7um20x51gbVCpY81Ja3wGNK
	Ec8Q==
Received: by 10.182.78.161 with SMTP id c1mr6142314obx.88.1349412403600;
	Thu, 04 Oct 2012 21:46:43 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id q3sm6688636oef.0.2012.10.04.21.46.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 21:46:43 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-ti@yoctoproject.org
Date: Fri,  5 Oct 2012 00:15:02 -0500
Message-Id: <1349414102-14553-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] ti-compat-bluetooth: Port ti-compat-bluetooth recipe
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
X-List-Received-Date: Fri, 05 Oct 2012 04:46:44 -0000

* Port ti-compat-bluetooth recipe from arago.
* Ti-compat-bluetooth provides the necessary bluetooth drivers for the
  TI wl12xx Wi-Fi + Bluetooth module.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 ...tooth-2.6-removed-unused-BT-modules-from-.patch |   47 +++++++++++++++++
 ...at-bluetooth-fixing-kernel-panic-in-l2cap.patch |   54 ++++++++++++++++++++
 ...h-Fix-l2cap-conn-failures-for-ssp-devices.patch |   45 ++++++++++++++++
 .../ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb |   38 ++++++++++++++
 4 files changed, 184 insertions(+), 0 deletions(-)
 create mode 100644 recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch
 create mode 100644 recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch
 create mode 100644 recipes-bsp/ti-compat-bluetooth/files/0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch
 create mode 100644 recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb

diff --git a/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch b/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch
new file mode 100644
index 0000000..a383e4c
--- /dev/null
+++ b/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch
@@ -0,0 +1,47 @@
+From 267cb471c7b182786f58a2a74f3d8bc977cb4527 Mon Sep 17 00:00:00 2001
+From: Vita Preskovsky <vitap@ti.com>
+Date: Thu, 29 Dec 2011 16:09:36 +0200
+Subject: [PATCH] compat-bluetooth-2.6: removed unused BT modules from compilation
+
+  * config.mk is changed to not compile unused BT modules
+
+ Signed-off-by: Vita Preskovsky <vitap@ti.com>
+---
+ config.mk |   10 +++++-----
+ 1 files changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/config.mk b/config.mk
+index f09d16d..56ac6df 100644
+--- a/config.mk
++++ b/config.mk
+@@ -226,14 +226,14 @@ ifndef CONFIG_COMPAT_KERNEL_2_6_28
+ CONFIG_COMPAT_BT_HIDP=m
+ endif #CONFIG_COMPAT_KERNEL_2_6_28
+
+-CONFIG_BT_HCIUART=M
++CONFIG_BT_HCIUART=m
+ CONFIG_BT_HCIUART_H4=y
+ CONFIG_BT_HCIUART_BCSP=y
+-CONFIG_BT_HCIUART_ATH3K=y
++#CONFIG_BT_HCIUART_ATH3K=y
+ CONFIG_BT_HCIUART_LL=y
+
+ CONFIG_BT_HCIVHCI=m
+-CONFIG_BT_MRVL=m
++#CONFIG_BT_MRVL=m
+
+ ifdef CONFIG_PCMCIA
+ CONFIG_BT_HCIDTL1=m
+@@ -606,8 +606,8 @@ CONFIG_IWM=m
+ # CONFIG_IWM_DEBUG=y
+ # CONFIG_IWM_TRACING=y
+
+-CONFIG_BT_HCIBTSDIO=m
+-CONFIG_BT_MRVL_SDIO=m
++#CONFIG_BT_HCIBTSDIO=m
++#CONFIG_BT_MRVL_SDIO=m
+
+ ifndef CONFIG_COMPAT_KERNEL_2_6_27
+ CONFIG_ATH6KL=m
+--
+1.7.0.4
diff --git a/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch b/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch
new file mode 100644
index 0000000..db04b5c
--- /dev/null
+++ b/recipes-bsp/ti-compat-bluetooth/files/0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch
@@ -0,0 +1,54 @@
+From 95bb5df2c28a51790ab3d63b34e417e2fc9c6235 Mon Sep 17 00:00:00 2001
+From: Vita Preskovsky <vitap@ti.com>
+Date: Tue, 12 Jun 2012 17:56:02 +0300
+Subject: [PATCH] compat-bluetooth: fixing kernel panic in l2cap
+
+ * fixing kernel panic in l2cap layer. The problem appears
+   for first time in new version R5.00.18.
+
+Upstream-Status: Pending
+
+Signed-off-by: Vita Preskovsky <vitap@ti.com>
+---
+ include/net/bluetooth/l2cap.h |    1 +
+ net/bluetooth/l2cap_core.c    |    6 +++++-
+ 2 files changed, 6 insertions(+), 1 deletions(-)
+
+diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2cap.h
+index c0d168a..5651a70 100644
+--- a/include/net/bluetooth/l2cap.h
++++ b/include/net/bluetooth/l2cap.h
+@@ -494,6 +494,7 @@ struct l2cap_chan {
+
+	struct list_head list;
+	struct list_head global_l;
++	bool global_b;
+
+	void		*data;
+	struct l2cap_ops *ops;
+diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
+index ffa2f6b..847dabc 100644
+--- a/net/bluetooth/l2cap_core.c
++++ b/net/bluetooth/l2cap_core.c
+@@ -316,6 +316,7 @@ struct l2cap_chan *l2cap_chan_create(struct sock *sk)
+
+	write_lock_bh(&chan_list_lock);
+	list_add(&chan->global_l, &chan_list);
++	chan->global_b = true;
+	write_unlock_bh(&chan_list_lock);
+
+	INIT_DELAYED_WORK(&chan->chan_timer, l2cap_chan_timeout);
+@@ -332,7 +333,10 @@ struct l2cap_chan *l2cap_chan_create(struct sock *sk)
+ void l2cap_chan_destroy(struct l2cap_chan *chan)
+ {
+	write_lock_bh(&chan_list_lock);
+-	list_del(&chan->global_l);
++	if (chan->global_b) {
++		list_del(&chan->global_l);
++		chan->global_b = false;
++	}
+	write_unlock_bh(&chan_list_lock);
+
+	chan_put(chan);
+--
+1.7.0.4
diff --git a/recipes-bsp/ti-compat-bluetooth/files/0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch b/recipes-bsp/ti-compat-bluetooth/files/0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch
new file mode 100644
index 0000000..bf7bf47
--- /dev/null
+++ b/recipes-bsp/ti-compat-bluetooth/files/0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch
@@ -0,0 +1,45 @@
+From 18daf1644e634bae951a6e3d4d19d89170209762 Mon Sep 17 00:00:00 2001
+From: Peter Hurley <peter@hurleysoftware.com>
+Date: Fri, 13 Jan 2012 15:11:30 +0100
+Subject: [PATCH] Bluetooth: Fix l2cap conn failures for ssp devices
+
+Commit 330605423c fixed l2cap conn establishment for non-ssp remote
+devices by not setting HCI_CONN_ENCRYPT_PEND every time conn security
+is tested (which was always returning failure on any subsequent
+security checks).
+
+However, this broke l2cap conn establishment for ssp remote devices
+when an ACL link was already established at SDP-level security. This
+fix ensures that encryption must be pending whenever authentication
+is also pending.
+
+Signed-off-by: Peter Hurley <peter@hurleysoftware.com>
+Tested-by: Daniel Wagner <daniel.wagner@bmw-carit.de>
+Acked-by: Marcel Holtmann <marcel@holtmann.org>
+Signed-off-by: Johan Hedberg <johan.hedberg@intel.com>
+
+Upstream-Status: Backported
+From 18daf1644e634bae951a6e3d4d19d89170209762 in Linux kernel git
+
+Signed-off-by: Moosa Baransi <moosab@ti.com>
+---
+ net/bluetooth/hci_conn.c |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/net/bluetooth/hci_conn.c b/net/bluetooth/hci_conn.c
+index 3db4324..07bc69e 100644
+--- a/net/bluetooth/hci_conn.c
++++ b/net/bluetooth/hci_conn.c
+@@ -635,6 +635,10 @@ static int hci_conn_auth(struct hci_conn *conn, __u8 sec_level, __u8 auth_type)
+
+	if (!test_and_set_bit(HCI_CONN_AUTH_PEND, &conn->pend)) {
+		struct hci_cp_auth_requested cp;
++
++		/* encrypt must be pending if auth is also pending */
++		set_bit(HCI_CONN_ENCRYPT_PEND, &conn->pend);
++
+		cp.handle = cpu_to_le16(conn->handle);
+		hci_send_cmd(conn->hdev, HCI_OP_AUTH_REQUESTED,
+							sizeof(cp), &cp);
+--
+1.7.4.1
diff --git a/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb b/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb
new file mode 100644
index 0000000..6d6b1ba
--- /dev/null
+++ b/recipes-bsp/ti-compat-bluetooth/ti-compat-bluetooth_1.0.bb
@@ -0,0 +1,38 @@
+DESCRIPTION = "TI compat-bluetooth drivers"
+HOMEPAGE = "https://gforge.ti.com/gf/project/ecs_nlcp/"
+SECTION = "kernel/modules"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=d7810fab7487fb0aad327b76f1be7cd7"
+
+inherit module
+
+RDEPENDS = "ti-compat-wireless-wl12xx"
+
+MACHINE_KERNEL_PR_append = "a"
+
+COMPAT_BLUETOOTH_VERSION = "2012-05-22-r5-18"
+TAG = "${@'${COMPAT_BLUETOOTH_VERSION}'.replace('-', '')}"
+PV = "0.${TAG}"
+
+SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/865/5622/compat-bluetooth-wl12xx-2012-05-22-r5-18.tgz \
+           file://0001-compat-bluetooth-2.6-removed-unused-BT-modules-from-.patch \
+           file://0002-Bluetooth-Fix-l2cap-conn-failures-for-ssp-devices.patch \
+           file://0001-compat-bluetooth-fixing-kernel-panic-in-l2cap.patch \
+          "
+
+SRC_URI[md5sum] = "85118756a605ebd8f4fbff19995368a6"
+SRC_URI[sha256sum] = "d250a6447de54f0776a12ca604bf2a2a48b022108b699de5008f48462e535393"
+
+S = "${WORKDIR}/compat-bluetooth/"
+
+EXTRA_OEMAKE = "KLIB_BUILD=${STAGING_KERNEL_DIR} KLIB=${D}"
+
+do_configure() {
+	cd ${S}
+        ./scripts/driver-select bt
+}
+
+do_install() {
+	oe_runmake DEPMOD=echo DESTDIR="${D}" INSTALL_MOD_PATH="${D}" LDFLAGS="" install-modules
+	find ${D} -name compat.ko | xargs rm
+}
-- 
1.7.0.4


