Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C78EFCE3F
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 19:39:00 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27092.1772653130764843667
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Mar 2026 11:38:50 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=WuOQhS57;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.68, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WmKKhhpdN97CvX/G7SteP5ZK3OqtWanz3AtPkJ2ofJHcJ7QNRbGLSN+pkesOFACMKVpbSTd3vbSuZe6aetn/NUAax2Z9MN+QqnPA52V2JjH1qFJCcuqG4VdeR+z+n2X6r0W8hOEPdYvu2RCK7SFfPiccnKX+79UN3VnvDTfgS097PSsCRFse88uQ+okCSuFjGRrBbRSD+IrmfuuGJUn7V8hrk/yTawVVdp3IyZQ2g+awTCnydTwEWYbPWkAqRkuamtAaFD5tJUyGz/sDtF9AOYHjLX+5zxzd81E800n7KujaZNHR+kxWmyweDBd79l1QW2gs+cz8NV3MGZmEOjYyYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vgpXKbP4Hnrn7c6jaSrwKUgzLC2d+9h/NpWF4xUW5SU=;
 b=l9nqdpn5bYlsW66LmC9/mdneBVdBynMdZQ8uBbJTQRoy+m1FcyTUKqjg5HDVQEwD9tTgoKirz8pUwYmmDmFasYt7tU0SFDoLd1P1zAqBggLMOwxtCckFZ2KghBLIY8Ga83oly/3aQtc2ELWEy9ICRYw13DCZ5On/rps5GNV5ReEFllXLZsQHJRmqW019qYoaPYmxQuQuqkpUhCoH/NG1TeJK/wLXKhCbC2U7ILWMY2xktQA1N+sSLp9pZ7/hW0em+Afw15RErsKUxQNDB8XLzniohic35eB4CrzBjQhVSF5a60cLvB0fFb//iSjVpRhi03XvcdtPXqLJa028O7LRvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=criticallink.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vgpXKbP4Hnrn7c6jaSrwKUgzLC2d+9h/NpWF4xUW5SU=;
 b=WuOQhS57+hm9lolq3b9n8u5MJEHRbP6XU2iK8rNzF0PKXjlZcxOAX/jkWrLlnfoc+9G2O6wd6aZBKhUe9XFyBEWm6EET298vFKybYXIuTcTRXY62ZVfMkc9S5oV6l5HgdBZGGDnMymmivTEo7cZUAc5B4tssgAks0Yr6VEAIx/I=
Received: from DS7PR06CA0046.namprd06.prod.outlook.com (2603:10b6:8:54::13) by
 SA2PR10MB4763.namprd10.prod.outlook.com (2603:10b6:806:117::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 19:38:47 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:8:54:cafe::94) by DS7PR06CA0046.outlook.office365.com
 (2603:10b6:8:54::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Wed,
 4 Mar 2026 19:38:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Wed, 4 Mar 2026 19:38:47 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 13:38:47 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 4 Mar
 2026 13:38:46 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 4 Mar 2026 13:38:46 -0600
Received: from HP-Z2-Tower-G9.dhcp.ti.com (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 624JcaZK956747;
	Wed, 4 Mar 2026 13:38:44 -0600
From: Shiva Tripathi <s-tripathi1@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <rs@ti.com>, <jcormier@criticallink.com>,
	<praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>,
	<s-tripathi1@ti.com>
Subject: [meta-ti][master][PATCH v3 1/3] linux-ti-staging: Add LUKS encryption config
Date: Thu, 5 Mar 2026 01:08:22 +0530
Message-ID: <20260304193824.2495898-2-s-tripathi1@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260304193824.2495898-1-s-tripathi1@ti.com>
References: <20260304193824.2495898-1-s-tripathi1@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|SA2PR10MB4763:EE_
X-MS-Office365-Filtering-Correlation-Id: 4953c633-da3a-4cb7-0c86-08de7a25a776
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|34020700016|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	fkv9VEnG0RLjlp1TK+2L9dilCzV50NHlMR9bZ+BgsPBZtupmPyBEua0+VQiarR48n2spINVxTgBcQz2Bpj6w68l4gaiLVbm96S1xdggt276n2z+izhA+QrC0y1H0IsW9LYHY+LXinyI3WN+gyeItobG1QLDhqDskqWswyu/tiZYsJ+77hf3MsZhr2Tr3HZ4ZG+NTSiSjlFnSnZ4HBIl2nlV7VMjBlXx4UI/AeC4YmN6yXTrvWwYew5rAy8CmkZXf0cTXTkTd3pjJ4uEhk2IpEPf7kl3JHX+OQh/U0WpJem38XJkREVMfzIXDDilEKUzyuMWGAism8LLjiapXdqTLzuZNA6H1DBYQGFKWwsCsgz++GPYfaSTRwDCpS1iV55m+tKe+PjK22p84em9AdAIJ0SovkubuKOF4PZhdzjxvwEbPaC4PbmxNuIExNcS5xGjc4o4AdSeOJxCH1KGUfoHKDw5nKYDWBc4kIdcMv+IDOrn9PKzbYjPqYz0NTfZ4qC/Yl7y83kBZ5wyQU+BhpJmFP0n5O3+zdrsrhqkeCam1+GbLe1csF/CdxIPMEwMZZMou3ZrVdpV/w7q/rbK1a0g6FnwCY78h7Afk8eJZCIGAtixnn5JIkGmYRwU0AltcHJtoh1udHPZcZ200ySCbh0tXTuTRnG0xXmBmONBVf6HZohZYdMtw01txG4QEW4gvGKsLehMny2l6RuTodws5EG+CWCkH0QA8Sgi7O73t8Q7WEsnvrpk9wxaAA9J+6iN05jHF1G55Z2MlYxbHsACgcsOLRQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(34020700016)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	8RdV4Dw95PCsD02VD0dfAmXp4dd1M5IjoyoYL5TAprg6gXwsIDGqo10w40RBr3PMwyjuyt0mvRRFRtyR1889YQgjBO2o319l3K/Oio/OwXgbHNPcEXxrKt3t9bDPWL97Iw35E930meAnxO0Nwv02WAzT/DA2LnlsoLy6cAyEj3AIu0A0q3sJWCuChz/DCaRHgw6DrxkQY9sO9SoRNYreLiNCdzB8wVgM3DnYAPOhJNbTJMOtaw/lg/NVswA9A5hO/g8UX3EjrFTDdL0aEVnezNByy6m8Q2DMIGD52WiZ/cNFFC8EXPIxlHhak4eH5Qk3gV1Ezs/oKhWlLvUbevqmfMhoLsc81P9fDoi3GZ6H9L+sjG893MqqOa8np4vHksfy7eIT9resbsz4ucku5S8un+YxR7JG/CAC9o1FU/e7+oVq5zTSXB2NGa968whnnT/o
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 19:38:47.4083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4953c633-da3a-4cb7-0c86-08de7a25a776
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4763
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 04 Mar 2026 19:39:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19642

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


