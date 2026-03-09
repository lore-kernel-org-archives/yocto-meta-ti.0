Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1598F417EE
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 14:44:29 +0000 (UTC)
Received: from BN8PR05CU002.outbound.protection.outlook.com (BN8PR05CU002.outbound.protection.outlook.com [52.101.57.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16153.1773067461476647813
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 09 Mar 2026 07:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=WDktupar;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.57.69, mailfrom: s-sadik@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zRzxZN8jPdUZyrJ0v2uaIzHW6WsqHwaOO9U7rJusQy05cXAcgMSyX+RMfmnybZnZmfPYVPMa4MbXVhrZOlEoh/+usrbbV/zJXkS/ZrxgdEPq6T8izTiQXImTynxhZ5s1u1BDWMwUaKlvsku6sWAwKUnCENPrvtYckE3p5A+7xpk0cqnD0yQnRCOfkzy1YAXqZsc2wapiw36+tZeniPkXKvPrYfNxIsm2sjfjIQODdYhHdhfN2Q7PK3L9DwI/PICVtEMI7BJ86gUiCQ4YjYH7x19Of0yAN+Qbm5sBw+jSFsSMIcXNojDm7D7Z2jF+LIG4CNwWo8Evh2Lstv/pZO4UlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f5wSi3nij3w76ksSuHgx7/Xr9ACOWwll0pPS4y+JYK4=;
 b=M2W2tZJ4F6rJhbnE0jcWo0z1MaEAh5k58Mjd8Q7AyP877htWbQtmra7lymqGNl6i1Plg2vShvntjW6F3MNajivBt6Q4ZXi/0csxZqvkak+XFfF2W6A/Vs+P7wt2gOa+0vLHwhYeH7AUWOzakaNligb9mWN3R4w0UQX4aicfaIYOaesZaINYpN7GT4mIJzdvdJdGwfWYbcIv+x45XdqKguUSqOy9N+YcFotYC618wdg23ZoR+f1/zfHnM3gG+h61nolES++lrj1SIeTyqJTvZW20XEVzrfvgkcsWTmT1gCMNW9OlBw0nRjDxfD+g5zKk6hD5i3YQX3ZT0auQpls0yiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f5wSi3nij3w76ksSuHgx7/Xr9ACOWwll0pPS4y+JYK4=;
 b=WDktuparvi75vzYHUqThsTsn4DI5KjAzqMeLlpyfxXaL6bsqa/nE2we2zZOtUN+M+90f5RKWGhXF4R4lqpC0EZiXLncrG80oEvVs5P1khiBS1sWTIlvko7Xjd5tjAnsku664r7dKxC7KeeSQAweydaA9whnHED1JnVLWIYZSHU0=
Received: from SJ0PR13CA0197.namprd13.prod.outlook.com (2603:10b6:a03:2c3::22)
 by SA1PR10MB7792.namprd10.prod.outlook.com (2603:10b6:806:3b5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Mon, 9 Mar
 2026 14:44:18 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::7b) by SJ0PR13CA0197.outlook.office365.com
 (2603:10b6:a03:2c3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9678.23 via Frontend Transport; Mon,
 9 Mar 2026 14:44:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9678.18 via Frontend Transport; Mon, 9 Mar 2026 14:44:15 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 09:44:12 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Mar
 2026 09:44:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Mar 2026 09:44:12 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [172.24.233.244])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 629Ei3V6778250;
	Mon, 9 Mar 2026 09:44:10 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Prudhvi Veeramachaneni <prudhvi@ti.com>,
	Mahammed Sadik Shaik <s-sadik@ti.com>
Subject: [master][PATCH 2/2] jailhouse-inmate: Inhibit debug package split
Date: Mon, 9 Mar 2026 20:13:56 +0530
Message-ID: <20260309144356.2709949-3-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260309144356.2709949-1-s-sadik@ti.com>
References: <20260309144356.2709949-1-s-sadik@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|SA1PR10MB7792:EE_
X-MS-Office365-Filtering-Correlation-Id: 4763e617-1ae7-491c-402a-08de7dea565f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	eUY2lXbXup0d94yzZVWXe66EbKRHp47GHc63MR1Up1TUgWqM8aQTZGkRovQJPwFdkgdtWlQ31siGdWaN3Ss2pA+QRdm0weE3JzEWEDyVZpf7cpOmIXFMcY/YotN+UCtdNKKh4kwDzL8llk4dNVbkhlU349Y7hYmDBb8RJaQ4yNiCj92cbs2Coe08EB/EDar+DEW21EyHgi31TLcsE1RnEoFFUscUUKI0EL3Ju7Vstp3eqJC5coUHKXAphyBK7IbuVsmMLa7h2+nmFa65oeubntuvxoTmwZGxQ7Vop5C1GszoPfUoB021WVJ1vIQtCbPa2NJ4yP5B4fGIJ1lv9ds7TGH3FQbqKO3//+kEOaeIpRqdxTwGlS1e2ksbdzAXT9T+DEaoEggvSVfNz5S03QH61/VUQ9AfgjGhvNhGX7UKkUX911+7RzAuts4axuse9KXZdCosAA+F1oC4IranQ4cSv95cvK7nwlbCyRnCAnwi/nM+ty+FO60j6SE8s8vZF1jsxhX4MRKHp2qNINYpgvtziXCjTubTjCrj8eains0hk39gjNqoCPddFX4GCtEflY/89Gfc9UCVxhEskaO2ltWA7MZQ4whsEaXoZHpecXMWm7JFiGXP4vFrp9XsHyknuirfn8Fm9k1QSh2P3NHY1QjuF/gAUL+aLjZUy5c/0i3cnsd3GwwxdjPlMdCByQxuZoNMfqC/jztecfOQsRlIC5VBoDKSw68nnDOWkXWawiVhCnk69FvNzg1wcVyNlo5G1/EccLXErISBvw3JK1D9CwdEAQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Osz9JsTUnH8+mljhzOQuPDDeKysxcBLddAU67LljRCeKXMWVXIpYMXyYIJSn9ln6URmWN9F9TgbUdPeXf6TmI6MO4KiCK395K4dae76eUFuf5R8m3EaXhKbwQxiSdL2/OkCkEm0ZPtLBYU7//om4k9Isd958duNltZjBQ5reO59VOnQIiwgtlaWAiGPOvcfMZNteGm++Jmeqx5mBVkRRH/aHwZsPU2jN3iM1YQG4V8npIROgYuQYhxYPNErTIjFQyqMHU67J7cNlN+CwPcffAf0gTizi8WxolydLj24WHx6CZKATfwn+p8bVYvOjYlROyLKJAJkuUbxwpeqfF6aWGXuCuspkHUHYmh3RC//Y9IT7u9MHbEx6BhFWKtfmabQypJjS4y32vnB/voopIs1sGAm6wq/wMapIvqfBg5djOamFQceJ1sodb4pUlRopLDch
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2026 14:44:15.6845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4763e617-1ae7-491c-402a-08de7dea565f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7792
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 09 Mar 2026 14:44:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19676

Inmate binaries are bare-metal applications without
standard debug symbols that can be meaningfully split.
Inhibit debug package creation to avoid unnecessary
packaging overhead and potential QA warnings.

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


