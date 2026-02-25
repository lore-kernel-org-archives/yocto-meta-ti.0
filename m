Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CAC5F55448
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 02:52:08 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37688.1771987919598296011
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 18:51:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=cwLslgIv;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.194.4, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YVP1M6mog/PdFn5tdNe/dRFOEdsp/NReAE9rF6yumnGuDUmJqohTcvlhfQSlN/7aOwKyYxiyJEQA8gSisdVmsvy5/VCVDxcqc1ZEd1JTTApOhEevC4TAgN28OyHleLzt4rJazNzIUsG8BWbgnlqgG+FJ/XAS5DHKhjs6vtT/yp2x6wnaatTjM0ppNWxczgVzxCIMPTR+oSDXq7FKNJiji45FwC08rD1zzfRCRzQvWPFu32HGwdZ26g7VHolJo8nSiZeX2RnorEuuxG69A3mdmAD15VZjG9qxH1HyT7jSjcUZBYEtrCKmOWgFKvd1FpZ1LjH1LIeMiKG5yWzKALGlSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtYwRL00zl45feunDt6zfKY23MQpqtqDB8YPlN9QE/w=;
 b=TMn4gILisc6YoKkCfZPknfUeeqNfWgR9y+QoOjBUG3i8aRhZ3KOG7pgq/G3l1+9ZiteF9lKLe087cjtXRsxPZGDu9ldOwjiIEDkWy8A/sqdD0HWXp6sU54UPDKVXpyy066vVqP4ZCdISxYEAs+n+jpjpYuqdGkzavd3NPnZGvv80SxbhbSeGqTRhSMj3G3pZS52mXkWWmssZ+4Q4Q5zApMXqigfdeqrKdbdfw9R56zNfNfw47edk0hwiNdd1Zurtejh3lKI7WXCOEsgqHIJ80u1xjFPtGVKczIjQGvin72PwhAN2Zkpbz5i+ozodBulzBI55bSo/DKPB0CLxxILxPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtYwRL00zl45feunDt6zfKY23MQpqtqDB8YPlN9QE/w=;
 b=cwLslgIvRQ4+HHuKtTsEYTDay4RLQDtgnDU1Odk1bOtsCEjOnyQ1TQI/miK3vsuSSd1ss+e4AmvSt4S62dRX2Gbd47YHGibqk82bWRPkNcHzVkWCXnIHoqTXYQNZLHPve3byXF+84H0qm4kRzh0zpP7LKMaCT1AS/kWdv5/uI5w=
Received: from BYAPR21CA0005.namprd21.prod.outlook.com (2603:10b6:a03:114::15)
 by MW4PR10MB6463.namprd10.prod.outlook.com (2603:10b6:303:220::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 02:51:57 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:114:cafe::73) by BYAPR21CA0005.outlook.office365.com
 (2603:10b6:a03:114::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.8 via Frontend Transport; Wed,
 25 Feb 2026 02:51:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 02:51:56 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:51:55 -0600
Received: from DFLE206.ent.ti.com (10.64.6.64) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 20:51:55 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 20:51:55 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61P2ptrG3840334;
	Tue, 24 Feb 2026 20:51:55 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vv50F-0000000CVjg-21MD;
	Tue, 24 Feb 2026 20:51:55 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 2/4] ti-ipc: Set DISABLE_STATIC = ""
Date: Tue, 24 Feb 2026 20:51:53 -0600
Message-ID: <20260225025155.2981821-2-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260225025155.2981821-1-reatmon@ti.com>
References: <20260225025155.2981821-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|MW4PR10MB6463:EE_
X-MS-Office365-Filtering-Correlation-Id: 36334207-01a4-408c-8c3a-08de7418d6bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|34070700014|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?X0nG/RRhM+tAz6FVTWtNYbruRLYTDjTXO9eAZJDqxSgdzLm5qYgGA/15cA2P?=
 =?us-ascii?Q?NC/1E9wDowaun4KZLQdGrpqmfN1Qv6H6g/A91mfrRkxEzgU0kvath9bBsjBo?=
 =?us-ascii?Q?eIBoEY1GiztDEfIonss9AJkNyN+lcY6d9vpTJ9lXeKq6VixuTo4b6q+7wCp9?=
 =?us-ascii?Q?yqhhiT2nY54hWeFX5LuftYnLW0KPCA9zw8tZB4hkOuuSC/uTS2gZvUD7i4NR?=
 =?us-ascii?Q?Lz95R8r+OVBl4Kymws3GQfOaDxKRJEREFi30AC+z34ULxwWw1deanL0y1Jtr?=
 =?us-ascii?Q?6QF3dVWNKBt0J4+DDSxj7Mmk73yzNZR4eMFPxtDT1nl8lmv3Vf+jLot+YXNi?=
 =?us-ascii?Q?/INaSJqsIIHIlyWSS7OU2+pBMqjMSvhu66BHlMW1pkBVwI2Gi7gzxd+dGaT8?=
 =?us-ascii?Q?5JvwiCUgCbjBr0Z3lVat6WogA0UJRMAVZ9T5SyNtYhnqAmkUS+AAANgCUARa?=
 =?us-ascii?Q?lcb70QSLYOwCXRh8potihUptdZ5uU0a2Wb32EgrGnz0IjhQ2KchIhlQ1OYhP?=
 =?us-ascii?Q?KfutmII+XrUKyMAFjcjPzHWS6KXyhvjhQ7PxEQc3dt76oDSN1kCfFGpqLCH/?=
 =?us-ascii?Q?vo2LQavQC13X96Lb5X6OwkACKzaCHIQ4R2YMZjmSRE9Fm1NTBNssB0QSFh3h?=
 =?us-ascii?Q?x03RhHWsoGvT/1/Aat3xODOihFVXV6imUOf+GzZxxcDmgqFeSYeTg0Iq8AK/?=
 =?us-ascii?Q?5XPDmcWCf03RhAEQ855V/ANI1aiUsOfTqaSLFjUUlhuvQVc6rpJKfZ6vrARK?=
 =?us-ascii?Q?dgq4T64t00DMdbxDFyKwXOYwkvWwbo+cHicF2h/XvO6Y5NZqOeNuglfkddKB?=
 =?us-ascii?Q?57Ma5sxFQqdj6XH7AiWc8BRgJ/NRVpvSfeXFaiK57MYldXhObBX/2EqWGH8I?=
 =?us-ascii?Q?KiWnm3lriGsUJm8h7pnV5BqJRQMAZKA2IDkE3qhB0WcczmzzZZJFHTj5TDwD?=
 =?us-ascii?Q?hjp79WY05xZUaIGd21AUEMxvoznFnabjO9xzvr7lbSMZGDIdLKAwgsChwYAy?=
 =?us-ascii?Q?iSeUfrb/ey8FLtfePcrppSmn8uZNvBn8/YR1ASGaJfO6vtbphi3liZvEfsTP?=
 =?us-ascii?Q?PFHb/a8TBfJaSyZy36gR/HAkXPrLp+ryl4Wznr+u6PlGLOU3RM/jDeNHy8Od?=
 =?us-ascii?Q?2KOZAJ09SURjWosVk/baZKPTOhdAY7trN5GM8R+LeWl0+I/qBP44KHTFfWgZ?=
 =?us-ascii?Q?VIBXYLFfCcdFo9dGyw0XrjICpZdv57jswoh6oUwPh9NzIAqUlo5GIAz6LMQ5?=
 =?us-ascii?Q?ajwo3lMob6db0BfQRDbQF5BzI34FZGgqqmS6d0dHCD2uKIfkKbRbKbSRhbxf?=
 =?us-ascii?Q?yU8mYjAKWcAlpAmHt+zjMf/tL3CYzUQdrBdKSuBJYRBmFXMMta/DeNAInW6H?=
 =?us-ascii?Q?sNPKfWEWnTfHTdtF1ezdl0B9WoFwLqB35YpTRtj0hL6y/jXe+9eOz2j6nqiz?=
 =?us-ascii?Q?y8++4qsQCQTYhZduxFDYf/eU6TIw7Q964x8HWi+EmfkQKuCgE7mRThP46cS5?=
 =?us-ascii?Q?kQM8/itrggPMFHzMWEhPzJQPySvVb8s56tGafXr7EPTny4dtFn9g8g1f03Td?=
 =?us-ascii?Q?L5pHZ3vZeF5sPbUfWyVy9u1ckMCWiCEbL5yuiPSk3FauR673HJOsQ5ITnrsp?=
 =?us-ascii?Q?LsZe5/K83qe7YZY+eT2uEJkZ2AIiswWJwnw6c1NPsy1++MSPuTjEamr0sS68?=
 =?us-ascii?Q?uJq59g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(34070700014)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	v+9WyFe14OnPR0ih/BSEgKOJy5HzF2OWYW8oNlLDiXIAO3BcZWg7tze5nojNjc6dZQCVJPuYr1cgchAGZfkds5qng+jaOWySWlu6gXiSDfEpAHapM2a4FBkmuzRSE5l5Qp8alx5niPpnYIWYc/mYfPMRcWUSS1zTc697HRi4B/G67cABrS1QJX69tCFfJOvVgXxZnET9eVszM764xgMIorg6atxSjVyfwRn5ZJUxiEWsiPkz+Pg/BhAOYoTs1qQCmNthU4Fgkdj2GTHsADUSOXRX9eCVtT2xNeYZHsa6dC1/TxcoZqx0zwFGAeqHloFYVKRSTv1UrHs2s0fSr97LuscxMJPT1JU3ojME//+2ponVo3r6UKO77X94OJwdTk0VU0gQJ+UTorfprCCsvOKwrggusDQrL6LOGxvJJWBOzFCdgWTGDGUGBjg8uq64EQte
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 02:51:56.2582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 36334207-01a4-408c-8c3a-08de7418d6bc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6463
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 25 Feb 2026 02:52:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19600

As of [1], static libs are disabled by default.  But this package relies
on static libs, so we need to allow for building them.

[1] https://git.openembedded.org/openembedded-core/commit/?id=3D03fc931bfe9=
ea3fa9f33553e6020cbc067b24291

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb b/meta-ti-bsp/recipes=
-ti/ipc/ti-ipc_git.bb
index 3e4be816..85aec4e1 100644
--- a/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
+++ b/meta-ti-bsp/recipes-ti/ipc/ti-ipc_git.bb
@@ -34,6 +34,8 @@ SYSTEMD_SERVICE:${PN} =3D "tiipclad-daemon.service"
=20
 EXTRA_OECONF +=3D "PLATFORM=3D${PLATFORM} KERNEL_INSTALL_DIR=3D${STAGING_K=
ERNEL_DIR} KERNEL_BUILD_DIR=3D${STAGING_KERNEL_BUILDDIR}"
=20
+DISABLE_STATIC =3D ""
+
 do_compile[depends] +=3D "virtual/kernel:do_shared_workdir"
=20
 do_configure() {
--=20
2.43.0


