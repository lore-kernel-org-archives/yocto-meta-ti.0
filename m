Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.24942.1617408631792532132
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Apr 2021 17:10:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 42F0840C93;
	Sat,  3 Apr 2021 00:10:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ifyXq0hHkEBY; Sat,  3 Apr 2021 00:10:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2E6DF40C56;
	Sat,  3 Apr 2021 00:10:30 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 0C64A17457E;
	Fri,  2 Apr 2021 20:10:28 -0400 (EDT)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-ti@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 06/11] mpm-transport: suppress gcc10 multiple definiton of fw_qmss*
Date: Fri,  2 Apr 2021 20:09:58 -0400
Message-Id: <1617408603-2482-7-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617408603-2482-1-git-send-email-denis@denix.org>
References: <1617408603-2482-1-git-send-email-denis@denix.org>

From: Denys Dmytriyenko <denys@konsulko.com>

Workaround for these:
qmss/mpm_transport_qmss_interface.so:(.bss+0x0): multiple definition of `fw_qmssCfgVaddr'; mpm_transport.so:(.bss+0x0): first defined here
qmss/mpm_transport_qmss_interface.so:(.bss+0x4): multiple definition of `fw_qmssDataVaddr'; mpm_transport.so:(.bss+0x4): first defined here
qmss/mpm_transport_qmss_interface.so:(.bss+0x8): multiple definition of `fw_srioCfgVaddr'; mpm_transport.so:(.bss+0x8): first defined here
qmss/mpm_transport_qmss_interface.so:(.bss+0xc): multiple definition of `fw_srioSerdesCfgVaddr'; mpm_transport.so:(.bss+0xc): first defined here
qmss/mpm_transport_qmss.so:(.bss+0x0): multiple definition of `fw_qmssCfgVaddr'; mpm_transport.so:(.bss+0x0): first defined here
qmss/mpm_transport_qmss.so:(.bss+0x4): multiple definition of `fw_qmssDataVaddr'; mpm_transport.so:(.bss+0x4): first defined here
qmss/mpm_transport_qmss.so:(.bss+0x8): multiple definition of `fw_srioCfgVaddr'; mpm_transport.so:(.bss+0x8): first defined here
qmss/mpm_transport_qmss.so:(.bss+0xc): multiple definition of `fw_srioSerdesCfgVaddr'; mpm_transport.so:(.bss+0xc): first defined here
qmss/mpm_transport_qmss_osal.so:(.bss+0x0): multiple definition of `fw_qmssCfgVaddr'; mpm_transport.so:(.bss+0x0): first defined here
qmss/mpm_transport_qmss_osal.so:(.bss+0x4): multiple definition of `fw_qmssDataVaddr'; mpm_transport.so:(.bss+0x4): first defined here
qmss/mpm_transport_qmss_osal.so:(.bss+0x8): multiple definition of `fw_srioCfgVaddr'; mpm_transport.so:(.bss+0x8): first defined here
qmss/mpm_transport_qmss_osal.so:(.bss+0xc): multiple definition of `fw_srioSerdesCfgVaddr'; mpm_transport.so:(.bss+0xc): first defined here

Needs to be fixed properly later:
https://gcc.gnu.org/gcc-10/porting_to.html

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 recipes-ti/mpm-transport/mpm-transport_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-ti/mpm-transport/mpm-transport_git.bb b/recipes-ti/mpm-transport/mpm-transport_git.bb
index 3c28f28..9bbbb73 100644
--- a/recipes-ti/mpm-transport/mpm-transport_git.bb
+++ b/recipes-ti/mpm-transport/mpm-transport_git.bb
@@ -19,6 +19,7 @@ SRCREV = "e0e44fe55bef7ddf89f7ff3574f07fa906e72a37"
 PV = "2.0.4.0"
 PR = "r0"
 
+CC += "-fcommon"
 EXTRA_OEMAKE = "PDK_INSTALL_PATH=${STAGING_INCDIR}"
 EXTRA_OEMAKE_append_k2hk += "HYPLNK_TRANSPORT=true SRIO_TRANSPORT=true"
 EXTRA_OEMAKE_append_k2e += "HYPLNK_TRANSPORT=true"
-- 
2.7.4

