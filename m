Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.1509.1639602666616653880
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 15 Dec 2021 13:11:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5047540C93
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2vxY5FYoQaQ3 for <meta-ti@lists.yoctoproject.org>;
	Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 43B6540C5D
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 21:11:05 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id C40BF174721
	for <meta-ti@lists.yoctoproject.org>; Wed, 15 Dec 2021 16:11:03 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Subject: [master][PATCH 09/11] linux-ti-staging: block sa2ul for am64x hs and j7200 hs device
Date: Wed, 15 Dec 2021 16:11:01 -0500
Message-Id: <1639602663-32787-10-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1639602663-32787-1-git-send-email-denis@denix.org>
References: <1639602663-32787-1-git-send-email-denis@denix.org>

From: Yogesh Siraswar <yogeshs@ti.com>

SA2UL GP driver will not work for HS. Need SA2UL HS driver.
Till it is implemented blacklist sa2ul for am64xx hs and j7200 hs

Suggested-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 368b74d..1a0ec5d 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -43,3 +43,9 @@ module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg
 module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
 KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
 KERNEL_MODULE_AUTOLOAD:append:j7 = " rpmsg_kdrv_switch"
+
+# Disable SA2UL for AM64x HS and J7200 HS
+module_conf_sa2ul:am64xx-hs-evm = "blacklist sa2ul"
+KERNEL_MODULE_PROBECONF:append:am64xx-hs-evm = " sa2ul"
+module_conf_sa2ul:j7200-hs-evm = "blacklist sa2ul"
+KERNEL_MODULE_PROBECONF:append:j7200-hs-evm = " sa2ul"
-- 
2.7.4

