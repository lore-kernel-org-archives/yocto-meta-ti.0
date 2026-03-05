Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DFEFF3D33E
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 17:22:34 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49673.1772731345342578390
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Mar 2026 09:22:25 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=cECMPftL;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.201.64, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yd4vDH1x1uwaqoOPxuNBMhAofEzN5UoP4vyytQx3sXLcas2zEk81A6/PdsuWWZIKKKDfMuCxajIp3Edi48JrAziTOGXuCvazCNBJOyiD7KAMCvt41784+jiumbWACZW5rxNCas5PPJvgqZVpbL8z0mv2zO+Hes9EzK1gfeiHXR7Pn00imys/N/yRXSDefYiVIulJRYmhWiN2vbZedAx/cWNxsFWSau+U+G3UemkvJgJ7ziBXz9eVJ7KZXaGt1/uvTPzLNVseL53k3UKRmygjulEnh3pfeutzUHNZuwh0IUoxxyChOx+6ZV3W5pNpWcvpO+pK1WGsrauGONR9UDRk9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgpXKbP4Hnrn7c6jaSrwKUgzLC2d+9h/NpWF4xUW5SU=;
 b=Jv38EjE9O86kAj3QDU1qfy0lnXXsTgQ8yE3WcPGqNwo6H95ZKgdZXgwqks1IMiV970hGtNAt5rF9t3WL6ie9A3xN3ZZayV733uEdcgTYgAaA97x4+ZpeMDASl0Cv174aNYXO6lnLruS25HKTOKN8DnClkZYB60pUn0tpPCUrr4BQ7IOH6iuDpOt4D2WdGX/Ty+j2iIqAel3Xbnhgi3EWuYhqJtod9ViQKptK+tX5ZgORdvrz52ReKsEfG5iSKlP25EJSspCumqD2x7DSMzJkTDkI4gf8UlYJv9Cv54yQgpOn2jULr+5UIQK4mK9Bdd8K5dR76RizJRGqPeL8Sh4aBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgpXKbP4Hnrn7c6jaSrwKUgzLC2d+9h/NpWF4xUW5SU=;
 b=cECMPftLI5VT859c96PEFU2VwDYegLAFlceL35GMKNa0VZI4Hx7wKJR6Nvd5SvN1xmvjiI64XqdMXaJNgXdiKbkuuOXPPtErYF+kTNoYLRDkF9nUz7rmz+5lLb3eo4QxF7kNDthp4wR5q61DSs6fpNkKjkyVrrbmhoJ/1YBENiI=
Received: from MN2PR06CA0012.namprd06.prod.outlook.com (2603:10b6:208:23d::17)
 by IA4PR10MB8495.namprd10.prod.outlook.com (2603:10b6:208:55d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 17:22:23 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::c1) by MN2PR06CA0012.outlook.office365.com
 (2603:10b6:208:23d::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 17:21:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Thu, 5 Mar 2026 17:22:22 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:21:54 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Mar
 2026 11:21:53 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Mar 2026 11:21:53 -0600
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 625HLoDo2250974;
	Thu, 5 Mar 2026 11:21:50 -0600
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<denis@denix.org>, <vigneshr@ti.com>, <s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v4 1/3] linux-ti-staging: Add LUKS encryption config
Date: Thu, 5 Mar 2026 22:51:48 +0530
Message-ID: <20260305172148.3684377-1-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|IA4PR10MB8495:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e9c7f29-77d1-4907-5c0d-08de7adbc347
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|34020700016|1800799024|36860700016;
X-Microsoft-Antispam-Message-Info: 
	X64U65bQswkNVB+A5bNGnxyTXJ2bfTcZhf2GYA2C2/nX9EHlYDb1ZfJgGsM7UDYPeHR+5+Lenq8udOMYsFhsUqHnab1JvYMfNvM/nwPziFuN+FXXz+XahVRIkr2cjq6IgbTezLdgKj+qDdyTteGapr/mHPzP20IJeePh4U6Efo6MzbTribUpoLxjGt8vJejoeY13lzcui9iSsN7P2cnCdMUs0d46c3fC8yWPVR7Sa/pjZW53eAbqMB5H10RB3yQgecYVQxoJPxWJu0JOue0S0MqweuFo44GomS3iRHeAU6grnqxA/2ohn5zh7cn18PtEag5NTMkZbmsGeX/JSrbQySdYqMhehXiJHy6b9X38Ik5PYsPzwpIcovhiMpfWBIvMLtjdt6YB/5uaI9pIkTzT5gZQvoX0QDmGtEfiQ/ML/uk/XxMaTE8FQloSjqPsCTAjVJ39lBeDlV5hfiTycbIr8QePAgj/LaszARvYeZSQAzv2iTTH7HXhPbRokumGSJVDyJ/QoIcN4pnQ6mpJn7PpbhBnsEvi4k7XxVSVCqmPrQm3ZZ92vScS4WoiKoFRwOXk9NiKT5v9BYZjSDqlVuNVAtKEmdVkBLJx0Reu9ofVrP5fSxj2mK/VlFdrZzrgHPbUwukefFZUZ6xAyH9DDvAPuRYOZ8wmzRtl4+gcW2vnS8V8o+ZF6YDwSfBOO/vBdorl1HGaM+3GYW269+pkME7/ybc/Tc7lXNqizhoS3cq4gM4O2naJUeu9Y8m8tX8zlmJNRSzImpkMZLAJ5W0rpktzCg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(82310400026)(34020700016)(1800799024)(36860700016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	chMZsb/1tntWJx1QTlVX5g5CJlHUubB7PppKINTVbGV0iZupWgRQZVc2RABIBXn04WGmSJms+vJi1kW0EPe06+n3ZYzgQI9K8M7d9lo3w4QGvflofIZsq57EDKsk71V4O2uIELV0B4yecBB2slti/sLPLvK02NzRAwRtXhEUe8SyQ45PT/vZKIIaoHdcUKMZpsq85skKJZ8pnT9Eci9d2iz+pe7QN4p1/97sN8AjgjKJlS8JxhOjsbpYa2Zlt9adZzRBlN/cgZ/2Gae0wMptFheFFzavLv2TQCydpAfjKdd2x3PNcu6lZgM3fXRr4xZdcQ6tqd96lDtnxWk6fI/XfWc42Pbw8QKH6t0lTqhuQGi+1F+/4EFkw/2pg/m7hPfvXrTGevMjtNxpks3KdVpu8Z/X5KGNeXI2Bt1OZa8k8gfVzCMJChlZ/Lv//ijVf4Y9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 17:22:22.4689
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e9c7f29-77d1-4907-5c0d-08de7adbc347
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB8495
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 05 Mar 2026 17:22:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19655

Add conditional kernel configuration fragment for LUKS encryption with
fTPM support. This enables dm-crypt and necessary crypto algorithms
when MACHINE_FEATURES contains 'luks-encryption'.

Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
---
 .../linux/linux-ti-staging-6.18/luks-ftpm.cfg | 28 +++++++++++++++++++
 .../linux/linux-ti-staging_6.18.bb            |  9 ++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/=
luks-ftpm.cfg

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ft=
pm.cfg b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.c=
fg
new file mode 100644
index 00000000..234cc087
--- /dev/null
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-6.18/luks-ftpm.cfg
@@ -0,0 +1,28 @@
+# Device Mapper support
+CONFIG_MD=3Dy
+CONFIG_BLK_DEV_DM=3Dy
+CONFIG_DM_CRYPT=3Dy
+
+# Crypto algorithms for LUKS
+CONFIG_CRYPTO_XTS=3Dy
+CONFIG_CRYPTO_AES=3Dy
+CONFIG_CRYPTO_AES_ARM64=3Dy
+CONFIG_CRYPTO_AES_ARM64_CE=3Dy
+CONFIG_CRYPTO_AES_ARM64_CE_BLK=3Dy
+CONFIG_CRYPTO_SHA256=3Dy
+CONFIG_CRYPTO_SHA256_ARM64=3Dy
+CONFIG_CRYPTO_SHA512=3Dy
+CONFIG_CRYPTO_USER_API_HASH=3Dy
+CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
+
+# Additional crypto support for LUKS2
+CONFIG_CRYPTO_CBC=3Dy
+CONFIG_CRYPTO_ECB=3Dy
+CONFIG_CRYPTO_ESSIV=3Dy
+CONFIG_CRYPTO_LRW=3Dy
+CONFIG_CRYPTO_PCBC=3Dy
+
+# TPM kernel modules needed for initramfs
+CONFIG_TCG_TIS_CORE=3Dm
+CONFIG_TCG_CRB=3Dm
+
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/me=
ta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 8e4ccd7d..69d6217f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -35,3 +35,12 @@ module_conf_rpmsg_client_sample =3D "blacklist rpmsg_cli=
ent_sample"
 module_conf_ti_k3_r5_remoteproc =3D "softdep ti_k3_r5_remoteproc pre: virt=
io_rpmsg_bus"
 module_conf_ti_k3_dsp_remoteproc =3D "softdep ti_k3_dsp_remoteproc pre: vi=
rtio_rpmsg_bus"
 KERNEL_MODULE_PROBECONF +=3D "rpmsg_client_sample ti_k3_r5_remoteproc ti_k=
3_dsp_remoteproc"
+
+# LUKS encryption with fTPM kernel configuration
+SRC_URI:append:k3 =3D " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', 'file://lu=
ks-ftpm.cfg', '', d)} \
+"
+KERNEL_CONFIG_FRAGMENTS:append:k3 =3D " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'luks-encryption', '${UNPACKD=
IR}/luks-ftpm.cfg', '', d)} \
+"
+
--=20
2.34.1


