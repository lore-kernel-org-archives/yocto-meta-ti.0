Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F10E1F41819
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 17:02:36 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com (SN4PR2101CU001.outbound.protection.outlook.com [40.93.195.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19706.1773075753274845808
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 10:02:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=nYjfkUW2;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.195.47, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4Gn04n6fClaXZC2X9rjSkNWNjlF2KVfJBZs7HJJ6oy+boQTn9Mobw/OTQOyqPlZrqFymOsPFwt0B9oPQTGjx0MmzI5tm6CsVGpVf6hIYejmx2nHYyM11bhjHXMa9YCohCucE/SWKmWv8a+FI+Q6rPp2H0EbXrvselCnEN9k/oEHGpJWU9nTCXmDconkwWjFaRV33mn23rvuW2zKpYHd34A6RdhtxpwmQsMyRcCbd/FaNRkOXbrSE5Bs2CMZWKPwEMBxjQV2JyHhnTjim125VunVuNQndPFMpdkHSTGkUntgo5gGrGAgHBY5WkDlKadO2kiveFR0UxWiRW0/YcBr7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XldSEPXE0zM2mLx2ujDyY9BeDaskxTm3K+2Zz8mceA0=;
 b=l0v5zj+wY3W5favGl5UOUWnV1jK+dNZTg8zvi9FbJOzxj2FAPTJJuFIZbM/S7PZt6rt2J/PRaBRnBlp6akUEXdFEDJ2eojYEYOzWfTSXyYqrJq6KnmRsrLQXKFjfOrnn1MsnEvSJhUCsWEL0Pzhn2SxMDAd1fe7D0WuEYaGs3S7WdXW7GP5gpu6sAn5ATJjmeg6KnXN9fUdIt33a38LTOn5KNec7QImszdfvanq+TBW8+132vnwYUJ+opJUckDbxIwK28k6gNYYoxSlCLR3eZBrGIcJ7+d2abQ33gI5jVL4doXF5yYKnKZOwCWL3tpbJSw6c88HZypMkngINa2Tp4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XldSEPXE0zM2mLx2ujDyY9BeDaskxTm3K+2Zz8mceA0=;
 b=nYjfkUW23GrSnnCYxqx+9lToQVjRXJ45IpjXFEsUTLG2DnAPFlchGdtugGNWXZeIYpG82ugkOQnH+xiwGSrKN7IxpsHJkn2GMPpQoBV14Fs99cYcCotbBRK5GoEtvs14NyUUrB2lNR+fFDYPTTZF329Y1SraYVgTR49weXK4HZo=
Received: from PH8PR07CA0040.namprd07.prod.outlook.com (2603:10b6:510:2cf::26)
 by PH7PR10MB6227.namprd10.prod.outlook.com (2603:10b6:510:1f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 17:02:30 +0000
Received: from CY4PEPF0000EDD0.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::a8) by PH8PR07CA0040.outlook.office365.com
 (2603:10b6:510:2cf::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.25 via Frontend Transport; Mon,
 9 Mar 2026 17:02:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY4PEPF0000EDD0.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 17:02:29 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 12:01:48 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 12:01:48 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 12:01:48 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629H1egC977422;
	Mon, 9 Mar 2026 12:01:46 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Mahammed Sadik Shaik <s-sadik@ti.com>
Subject: [master][PATCH v2 2/3] jailhouse-inmate: Inhibit debug package split
Date: Mon, 9 Mar 2026 22:31:33 +0530
Message-ID: <20260309170134.2779295-3-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309170134.2779295-1-s-sadik@ti.com>
References: <20260309170134.2779295-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD0:EE_|PH7PR10MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b07f083-82df-4937-6cb4-08de7dfda5a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	D7XejG45lUMhIh3bA5j2Y5x822hQsi8rw3ErFhZfCak/rkN3NGim/vbwbhBSvLFw7ccrwXzJLACGDcqp1/wAE5to9+1kAJSSz5wfPDFEthl05rMkMZyjfs+L7CGxrfp6vXYrwba7aZj2hX3FLT8LAqSvWrVo/v/4bf2c7JQgsC3wZ8k/4JurXqCfrqiPwRdHEuTXI5nNm3Z22EOYEnW3+cUi302Y2GPEkTFWQLueCWRxfIV2AjgO3/0xmPS8D2ARI46xR0gSHCGL8ohDaaikgjyJie+e4dLQMwzh+4/zP8Yxin0hLQdQBVofHFf726hIsBvM7gmLZE0zsegvgrsOMmLGE1saO2htD8T+JSlxyEmNT8awWpQQoItrc4vum0mi7IJOOvYQU0G5kGLnuNXx3kVI5DIYAC6drKQC7fparbd1lcLXvE26fRyeiE8hY4TLN5APkxr+TNfqTMXgFkOIq5MO+1meQkbTCGK8V6UhvUY2DHEHtWAEAIbSbl/TRzpUOi+QeQgWLcT/trH6Elb5k5g2TmbQCn75a7gooHajU/+rJ3RGanlrZIxVuTqqn4xMRRM/bxWHTs/rTdzIbXAaTOdCpsdYt4yH8F8ztW16cKGM4HGEjdHzY4lpznybvW0yIIbPP1tcZGIhenYVPuJoGvxBVJ1N/vB800ERSgkGC5ZURxOv/xFl85XFWrxUsOlM2Dl1FhMBRwkwtOyyuXQCRCi4JhDJfhBQ96XdLgKXWbhRoh20FIYGmHEcoTeBYKTg44My12rM7kUFoaDTAGAYGA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	N09aIsvJ/2BJJdhtOP9GinIcQpZZRkDpQaeWe6lsYKHJKeWnDddRCG6WF3QiIvYY3l+V6lRwl/m3UxbsYLK9IK1yjVin53UgT/DgSit4JmZav9yA0L2NjLg2evlgtvUtE/3Wwryhp4ibazRbqrkRswO/Dz/BfcpGeB9XoeQLO31ja+EdvnoftxsQak6iohHCAA81bCeOTSIhoKDSoNGlk4MeHGtcAHikbZcDkX3u87iPWgmXJ5ZpKIjI4yw2v/yE5SmPS/+R8GJhUIz+kgHPMb/caGqoYbRarplxNg01ZKC1+luZp0Z2G9ZdFgkez2RiAoey5Upp7pZCUxGJrd2ckoKhfuo8nZm8sGCJeuR4fDFZjs1T2AOBJPhsenl+g4MfZwxdiQFi9nICfkbuhxE5J2mFqUOYTbFBX7rwGpKXuxp8uIIP8RECpCepmG1tmxzc
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 17:02:29.1426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b07f083-82df-4937-6cb4-08de7dfda5a1
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6227
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Mar 2026 17:02:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19681

Inmate binaries are bare-metal applications without standard debug
symbols that can be meaningfully split. Inhibit debug package
creation to avoid unnecessary packaging overhead and potential
QA warnings.

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
 meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb b/meta=
-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb
index 39654a53..c6b3b85b 100644
--- a/meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb
+++ b/meta-ti-extras/recipes-ti/jailhouse/jailhouse-inmate.bb
@@ -1,5 +1,8 @@
 require ti-jailhouse.inc
=20
+# Inmate binaries are bare-metal; no debug package needed
+INHIBIT_PACKAGE_DEBUG_SPLIT =3D "1"
+
 do_install() {
=20
 	install -d ${D}${bindir}
--=20
2.34.1


