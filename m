Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A22571088E4E
	for <webhook@archiver.kernel.org>; Wed, 18 Mar 2026 22:40:04 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com (SJ2PR03CU001.outbound.protection.outlook.com [52.101.43.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27200.1773873599470477608
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 18 Mar 2026 15:40:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=I2MgVUTW;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.43.56, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ocLE/ZYre8SdL311NZ9pWiJkThGAEmWw15H95tAx8P6CFZ9NElpOsnikPJ66FSr8SExd6lc5Umyq6/wc46x81IJfDBrPN2zx8EAbY2ryDnAByNSLJriu/ejp/jYL2+Aqp8HRm/+OYnjnrOsDBrfZVLAXfAmMWLxuQrmxKI63R3fZpO0+RGsPHr+ysvucff3hMJ0QYB9ae7hax8RnUa3Z0+t0EJ6reA0q1huOL+Her0SQYc7J6UN3VtbeymfdsVhe0WSA3R6N/BX3HYuxVAOPuZEUwr2Ubl6akBgenNjynSmiVuEVauvXRF8dr0Gz9Qx2ll7QyUAUH1kM/lX3HJOCdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r/Ua8Ks0/4HjjyVHnzeZSjqsxdNjMKeFUqK1ZlZ6iOg=;
 b=PY4r1DObvdH0IqPAhAuxN+88UdcoMj17sTFKhVBKJ+NQ9xnI6pEXkyUxuKi3nuJFX+9qxTneawCGL/mKTT3Ng0bi0hXFdZgxQU6+UBVIaGtD2f9+Tos+QMKXSetKDVTHSgwDgkU9TzcYFAj4TUmJlkg7A6j/YrOw7MuOOO1VaoJbv+bjjW8weLpvtGA7X42D+fqAUZLJ/rfqX0io5Sta7lGELlIHKIreqXH7Bc3wUIcDbZtmp+rmCvALWsHAUJdrMJYH3+LgZIRTQSPXOTYNLCUNVuZx9y5s68mD3VaPTXGisyo6ibrNGNsv0TfQFqukoBHSeNNro3GqOUvDlWOEZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r/Ua8Ks0/4HjjyVHnzeZSjqsxdNjMKeFUqK1ZlZ6iOg=;
 b=I2MgVUTWmFxnRBRjfiFLMlCV4EYjMO53S8q1Nw1lhMKyQ573xQ16+XBbaIP41qv7BQELKKs/cyrlw5Md16eoMW0h2RAA/rD85tq/0y7A9Rx8Gv+a8LA+ajZLJrvTQIRKCtc+A7PWeJ22fQeL0dCgBnT6KrahSKvM0Tpi5qTiJPE=
Received: from CH2PR20CA0019.namprd20.prod.outlook.com (2603:10b6:610:58::29)
 by BLAPR10MB4884.namprd10.prod.outlook.com (2603:10b6:208:30c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 22:39:57 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::b1) by CH2PR20CA0019.outlook.office365.com
 (2603:10b6:610:58::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Wed,
 18 Mar 2026 22:39:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Wed, 18 Mar 2026 22:39:55 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 17:39:44 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 18 Mar
 2026 17:39:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 18 Mar 2026 17:39:44 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62IMdiwg1578341;
	Wed, 18 Mar 2026 17:39:44 -0500
From: <rs@ti.com>
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] k3: set console parameter to KERNEL_CONSOLE
Date: Wed, 18 Mar 2026 17:39:27 -0500
Message-ID: <20260318223927.922722-1-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|BLAPR10MB4884:EE_
X-MS-Office365-Filtering-Correlation-Id: 1084d9d8-2064-4584-68dd-08de853f475c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	WQrAO/4HcYeU9zIUMitqwV5EhYv/utwQC7LBu2YC2xHR6ZX5BqSwKLHJHxcfe8/yt34qjLNDcTh1OX5kk1NSfLeLKjcfM1Z04LYRwPyUMIa+A7nOJNXNZZgxg7l2oJoYK0DuGJQLenXVoxtoeqxPXEMOsdh+0LKsesQ2ljxeiwpFhuH3+jFA3y66sxb0+ZD8uBh/BgrjMFAx6T+LrlQMs07k6CqDEbjOWCAYL8lIlB2NF/G1iz0OMb2uGAR+Lr8FLSxQSylLyor9Un0tEOOEeVj3rW6384iI7N1hd8DLqbOh+EHxK47RDgR4i3Sf7h4DaiGsBNzcFET/C+oI731WRatqehlElOeL5kExAaZoHPYZmx3SbOXoPV9ENLHdvN6wPaEObvlRA0+fr1yXDPOH/v8YEX8WRpNg47KMHfw4GG62fiP2etTHl+PQ2uluAF4O8+VyQlB7PgBZfZTIsrv7h9WYNU5bmSYv+FXTHDBBNIfZoYqGkhUGLterdl0P8mAWCR+Kj9QIQezCidIbjEsdXWAE16QnU5vjwZuFCp6vRN5oU2PBXRnOkQcNsHI4wn/9dbMkDpBSAuc2n7lm/WBGWiil2/sk5bCedAYb1GK2TQ2q5r1HuLBJc5904whSOC653g3K/HUjljoYsoaSMm2MYl0WXHpaJF/mnVVmbxNr5OEE5oo+4YblyV7CYorfyzC2rh6LBFDc4hvxaOznRqjvArMwAMNTZkeFd54pfnYyvda0mY39dmy6fMm/FeaPisg6yk0zu2iFyU//WV24oQg6Tg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MMoRLuxiVw+A5Ck940puWRNNEK3h0uEQcwCLhq79bTDtcX5vXfheyYaRams0+qryHRyb5QM/ZrlI5+hUxGQwVzK+Js8VAnLjbu00m9bXstKeTaSYDC8FJMP18V4iEXQ6FEdvBNKbtHV0YiqQueOpQs4q16iQ3YsaYFStBJ0Y29/DHPVODNQyfOH/2bX9w9mOMUF/jkTmgi4JvBXuTxGfkORIHRjla39W94FOIRj0Tko8mz2fdzHZUq4SGDc5TMjWhqUxXOkWtnV4d63KYCZpbTpqkhWhm1wjmqRPo14UeFhF8IMVJHlZp8SJUzdDGDHxLnQULI8NQwRN20alYn5rWQ2y52htTQS3mOL3cR1OmAfV8dYFOCHB+R88UfSPrbn00y/DUoVqm5HdTlcdilZT4xg9yBc/FyR5cwF95hY+d16Ht4AGPUErYuFdQgwfXpQ6
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 22:39:55.8924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1084d9d8-2064-4584-68dd-08de853f475c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4884
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 18 Mar 2026 22:40:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19768

From: Randolph Sapp <rs@ti.com>

Set the default value of TI_WKS_BOOTLOADER_APPEND to
"console=3D${KERNEL_CONSOLE}" to populate the kernel cmdline console
variable for all k3 devices.

Also define SERIAL_CONSOLES for am64xx.inc, since it was previously
overriding TI_WKS_BOOTLOADER_APPEND directly for this functionality.

The KERNEL_CONSOLE variable provided by openembedded-core is a sane
default console parameter automatically populated by the first value in
the SERIAL_CONSOLES variable. Their UKI and EFI flows already use this
variable to ensure the kernel cmdline console value is set to something
machine appropriate.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/conf/machine/include/am64xx.inc | 2 +-
 meta-ti-bsp/conf/machine/include/k3.inc     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/include/am64xx.inc b/meta-ti-bsp/conf=
/machine/include/am64xx.inc
index aa2dd1ec..6af4d050 100644
--- a/meta-ti-bsp/conf/machine/include/am64xx.inc
+++ b/meta-ti-bsp/conf/machine/include/am64xx.inc
@@ -30,4 +30,4 @@ OPTEEMACHINE =3D "k3-am64x"
=20
 MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "prueth-fw pruhsr-fw prusw-fw pru=
prp-fw"
=20
-TI_WKS_BOOTLOADER_APPEND =3D "console=3DttyS2,115200n8"
+SERIAL_CONSOLES =3D "115200;ttyS2"
diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/mac=
hine/include/k3.inc
index 89a67f3c..3138cf08 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -51,7 +51,7 @@ MACHINE_FEATURES +=3D "efi"
=20
 WKS_FILE ?=3D "${@bb.utils.contains("MACHINE_FEATURES", "efi", "sdimage-2p=
art-efi.wks.in", "sdimage-2part.wks", d)}"
=20
-TI_WKS_BOOTLOADER_APPEND ?=3D ""
+TI_WKS_BOOTLOADER_APPEND ?=3D "console=3D${KERNEL_CONSOLE}"
=20
 do_image_wic[depends] +=3D "virtual/bootloader:do_deploy"
=20
--=20
2.53.0


