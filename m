Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web12.2198.1639104987845273531
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 18:56:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=KR0ESli7;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: yogeshs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BA2uOmY025923;
	Thu, 9 Dec 2021 20:56:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1639104984;
	bh=KkLafONQVeYfIEgAmf3zEurrFtdzCCyRacFo7N3hoEc=;
	h=From:To:Subject:Date;
	b=KR0ESli7b2dqsZ0Q22YZ+NcZaKAcieQb1VBqi/0P1vXENGAsjjrt/D6Yfyvp4kkod
	 gbhCzw+dKdEn2weHeteXwivbWh3VVauuwu9rsaHidczB30Gs49a2lrAuziI9rjrTkG
	 3a1WaioF9XvW+3mSCJyuRc5sQYmUPRIjgQX810hQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BA2uO8d129480
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 9 Dec 2021 20:56:24 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 9
 Dec 2021 20:56:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 9 Dec 2021 20:56:24 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BA2uOsU004773;
	Thu, 9 Dec 2021 20:56:24 -0600
From: "Yogesh Siraswar" <yogeshs@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][dunfell][PATCH] linux-ti-staging: block sa2ul for am64x hs and j7200 hs device
Date: Fri, 10 Dec 2021 02:56:24 +0000
Message-ID: <20211210025624.42987-1-yogeshs@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain

SA2UL GP driver will not work for HS. Need SA2UL HS driver.
Till it is implemented blacklist sa2ul for am64xx hs and j7200 hs

Change Suggested by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
---
 recipes-kernel/linux/linux-ti-staging_5.10.bb | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/recipes-kernel/linux/linux-ti-staging_5.10.bb b/recipes-kernel/linux/linux-ti-staging_5.10.bb
index 9fd9506e..3f3d50af 100644
--- a/recipes-kernel/linux/linux-ti-staging_5.10.bb
+++ b/recipes-kernel/linux/linux-ti-staging_5.10.bb
@@ -27,7 +27,7 @@ SRCREV = "dcc6bedb2c2bdb509709e4ae08303206e95ce6c2"
 PV = "5.10.65+git${SRCPV}"
 
 # Append to the MACHINE_KERNEL_PR so that a new SRCREV will cause a rebuild
-MACHINE_KERNEL_PR_append = "a"
+MACHINE_KERNEL_PR_append = "b"
 PR = "${MACHINE_KERNEL_PR}"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
@@ -43,3 +43,9 @@ module_conf_ti_k3_r5_remoteproc = "softdep ti_k3_r5_remoteproc pre: virtio_rpmsg
 module_conf_ti_k3_dsp_remoteproc = "softdep ti_k3_dsp_remoteproc pre: virtio_rpmsg_bus"
 KERNEL_MODULE_PROBECONF += "rpmsg_client_sample ti_k3_r5_remoteproc ti_k3_dsp_remoteproc"
 KERNEL_MODULE_AUTOLOAD_append_j7 = " rpmsg_kdrv_switch"
+
+# Disable SA2UL for AM64x HS and J7200 HS
+module_conf_sa2ul_am64xx-hs-evm = "blacklist sa2ul"
+KERNEL_MODULE_PROBECONF_append_am64xx-hs-evm = " sa2ul"
+module_conf_sa2ul_j7200-hs-evm = "blacklist sa2ul"
+KERNEL_MODULE_PROBECONF_append_j7200-hs-evm = " sa2ul"
-- 
2.17.1

