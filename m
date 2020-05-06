Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.3002.1588779488512369559
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 06 May 2020 08:38:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lf9unOkA;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nikhil.nd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 046Fc79R011800;
	Wed, 6 May 2020 10:38:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588779487;
	bh=LU8tTw8e5lWOfpelF1rD7z/LNvfYztYlmSKhuFlJizE=;
	h=From:To:CC:Subject:Date;
	b=lf9unOkAN+my+hs0aiGIkQy5rHP9qCzU69c63b7jeWA7u0yeT4YZkYBbe2QS42JE5
	 BPDJcxMa1lgN9hPDm9p+h5AuAejj8n7FFQ1bvGJdWHpEVwEKTiftK2Uh3q//bef9/3
	 t885dqpyGl8SAWwsBHQEsTHOdEr8POhUkL3+eLDg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 046Fc7g1044620;
	Wed, 6 May 2020 10:38:07 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 6 May
 2020 10:38:07 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 6 May 2020 10:38:07 -0500
Received: from swubn03.india.englab.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 046Fc5bh061261;
	Wed, 6 May 2020 10:38:05 -0500
From: "Nikhil Devshatwar" <nikhil.nd@ti.com>
To: <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, <meta-ti@lists.yoctoproject.org>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>
Subject: [meta-ti][zeus/master PATCH v1] recipes-kernel: linux-ti-staging: Autoload kernel module rpmsg_kdrv_switch
Date: Wed, 6 May 2020 21:08:03 +0530
Message-ID: <20200506153803.11083-1-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

From: Nikhil Devshatwar <nikhil.nd@ti.com>

rpmsg_kdrv_switch kernel module is implicitly dependent on the
for virtual ethernet driver. Ensure that the module is auto loaded
by default foe j7-evm platfom.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.4.bb b/recipes-kernel/linux/linux-ti-staging_5.4.bb
index ecf72af9..1ec2a2fd 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.4.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.4.bb
@@ -74,6 +74,7 @@ SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
 
 FILES_${KERNEL_PACKAGE_NAME}-devicetree += "/${KERNEL_IMAGEDEST}/*.itb"
 
+KERNEL_MODULE_AUTOLOAD_append_j7-evm = " rpmsg_kdrv_switch"
 # Special configuration for remoteproc/rpmsg IPC modules
 module_conf_rpmsg_client_sample = "blacklist rpmsg_client_sample"
 module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg_bus"
-- 
2.17.1

