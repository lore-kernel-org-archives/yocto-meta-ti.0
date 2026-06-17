Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 627B1CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:54:37 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11049.1781686476049072846
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 17 Jun 2026 01:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=BnhsSNGZ;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=b2tstjFb;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8ZBI71511721;
	Wed, 17 Jun 2026 03:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=AWp4X5xWUPDUX
	zFf9EwHJGL33kTUaBgvRj7+4GNb9Kw=; b=BnhsSNGZ6qBL2gIOu27zt8k+mhtJT
	eipLQVN5QB2rbI3x6wino6++jatDiV4t2t8xPOle+TonukWBr7xiS2PUkNoQgcsh
	P7cuQTG3QCfH+A+cktghlvC+shgb/amWYAF/dnklgQ9UkGTChYDE5mV79wDCe+iV
	eLsBQys4xi6FfTxN4qGdbtu4VotPJ7asOYoKVFR8etp57JPw5ToILiZwv70aziz6
	HtBQQrAbvgVvvlv0swB2R1b5ELB+gygwbKmevkIzZnvp37F+6s9gR0kAcTaEXyqY
	ZhHW6dxzfrcRf8fmOLYNh0jfG4Ssij5G0kTv81R9LdIgXWs8lKD0gLvOg==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011068.outbound.protection.outlook.com [40.107.208.68])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4eueeubfvu-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 17 Jun 2026 03:54:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgD+Xg+upWC4OT0GgwD53sUfgahmhpjgTu8MsqFiSnq4xj5sMA6p5igbxQEwwl7u8Rd8hAdZko8H2nl5yjYubSqhsCNmowa+p6YwD24iQvMX/rsF5NbNiE6UHMZvJPjGOfgyCXZb7xjJqSl7m+5fiwMXu8vUzoMHReL4v12YDeMy1Y5JPD1jARsb9dMmK157dKq+tU/Diu5Wgzw+jXvA3xM1cE1DdZZFqtGEjAolnsUbTel3rNjHi8JsEZNZL3PTER0pi2g3MS8uIegg6Y2XoCQYfz10hWL8pF+29obk1mUuhqkm2d8EMoLx1TqemneVjUmnWnbrfF7ZyBe7WVy2pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWp4X5xWUPDUXzFf9EwHJGL33kTUaBgvRj7+4GNb9Kw=;
 b=UmVSQcZ0qEI5uFCVKLgLvXOntac2iG6vzWqbbaZqMF8w4LsouotZndhKwDEA2ptdsXdqrBhIEvCUmGnNKlno2hMN217KeIwfxj9eszwZQSqb+Ya5W1mk7SHxPjLgIkFwMLXyGBuoKMVD3iYvSOHUANLjIKVgDnMr0+/GMwq4riBbdcqAP3wnL8t3X6X82uDoWkVXHqXxJp7mUNFQ/fty8SW03FbT+z9snUTnAhWrNlxyEaJ4X61Ut9tnWuZOhUoiooloWruUofIlamDCEMHo+5Tsuqb7OWHmfuF6Err+BC4N8OlgW8zdsPf1jKrerpIn6BYFXy6yGWEQuwUjFcGHZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWp4X5xWUPDUXzFf9EwHJGL33kTUaBgvRj7+4GNb9Kw=;
 b=b2tstjFbmWgtNf6k7zVKxzzctgkqU9+E409zfY7w6N3DnIeQlNNpnSZNWlS6GJCOTOuNn3Tg2Tt9Ys7DY9YVu5aoiW/ofbjXM0+X0ll346p99x1/nRnlqLhGyD+dpnyWGXPxpnnEOiCI+NrPQeqDFtK6MpHURMBQplIzIYLE+YlQLrSwYpFRuhtH18Q5JIz4Tto8HkiKyv/LV9oyihYgLv+7u162yMCCqf+23s6ccVIrqlsVZQHuc1bJVa5sc2QGBa8WrsOZyNzmG3nEpNiKNruDLso3G0SlfRxMf+6ssKXPxlhshJu3IydTKW4lmihFQ1lYsPbrYUxHzKb0E62UNA==
Received: from DS7PR03CA0243.namprd03.prod.outlook.com (2603:10b6:5:3b3::8) by
 PH7PR10MB7804.namprd10.prod.outlook.com (2603:10b6:510:2fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.14; Wed, 17 Jun
 2026 08:54:30 +0000
Received: from DS2PEPF000061C3.namprd02.prod.outlook.com
 (2603:10b6:5:3b3:cafe::72) by DS7PR03CA0243.outlook.office365.com
 (2603:10b6:5:3b3::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.11 via Frontend Transport; Wed,
 17 Jun 2026 08:54:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS2PEPF000061C3.mail.protection.outlook.com (10.167.23.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.8 via Frontend Transport; Wed, 17 Jun 2026 08:54:28 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 17 Jun
 2026 03:54:27 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 17 Jun
 2026 03:54:27 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 17 Jun 2026 03:54:27 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65H8sQ3V4085724;
	Wed, 17 Jun 2026 03:54:26 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id E84EA2A6A; Wed, 17 Jun 2026 03:54:26 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202606162200
Date: Wed, 17 Jun 2026 03:54:26 -0500
Message-ID: <20260617085426.756396-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C3:EE_|PH7PR10MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: 8984fed2-5d24-4a22-739c-08decc4e0a6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	URZU2fkQJLuP2+FOnuOgMohpiopwJQWatvtRgyxa02UUZpo5RdMZK1/anMj5lGy1uoeUQCNbZ/pxAj5CbZv+ehLjUb4eTENZPbOtLz4LMF6sh0KR14txPgR1FhudmTFnbWbQpKr7/HdCCClv2a8vI3DZryWs2CLVvIX9GM0XxU2y7qQ7fWRL4ThUKxeT4wE7CMlN5vOXLXvzFy22Gquo0KTNfEFjpvV06SvbWWBHME2iQJGdHiq8129fkKuERqlCT73oC8amb9zOdV8XhJ9SzHf5So1Lr6uXCQqsneok2AuaJd3sjhROVyE+QGoXYd4siX+JS7+C337hVCGpYOUomA2fNGfhYUE0rIz+16OUqhisp3/VozGhu7rvGI/yn3vROeisO58FT73+Ca8JYs7hiWuIm87aDhm20nsBhjrDXpu4xT7H5aE0NTsh1Vx3V52ul5Tf5ioLvErIuQxuZF0vjsAM3JkSMmhKi3E/12BK/KYvumtC+Rf0i1W6v+IOh9NJdQTJIB03HRX+Ob16JQHFSLJ4WscHsvWNS7FcmjA6JeWf0Yc0ikZEKE7ss/9YQDFfHWGR/MVWHhY7Ls7W1seovIBKgS2mwws27izJ8xEAQHjlYW8MlZiuTiJK4XZlY9Y8MgNteysbkd/5BUNXLLiIkTaribzhpYKBiUmLqNQFUAebwU15s0od6c158DjlCIn46xYUvzQkT+aEMSn4bOp+XnNYZeaplIpP3MyGxV2m7SE=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bSjj4YQ6GwULH5xfatTEkoahflFiSvg6/IB1WwgvG9ZXtdt0xlBm1PkJj39RPC5k195c8J+ojXaNw3/xuhPXd/btYHaKi+PJtxfNBIbrcKrsjhJ2HA3fI0NH3TBF4wIdEkEvVHKZJibXcVQqY2Yhuh3b21eYtwpoLP2ZJZkX0yZcwopzIBA79xnvOFz3mFkE3WM9JjJzdaQVbIOMPIy1k0hY7zwb7pjwc6GfsWwE+pqtU7vF6xkxpYT5GQswMAxtfO7/wNz24/Vwnm8QBX3kPExiUue+qvfNJFOoHPAxzCXPlCrFeC+L9aRdadlvwUl44cKK7NZmDWR8wVlYDotLsCaYS62QLIsEBlxT95VtU37nCB1DpRnS5ZhEUyEVBj0YfxbRAgLN9slmiKTWKUWdFJpiI20cHV1xbns7M9hO/20AaWVltGRI0TEPJzVIOpU3
X-Exchange-RoutingPolicyChecked: 
	THA8DuB98UrhJmUb0fUYHes5i39xVRgxK2nCSLfi49De2oyYebCdwjeAhmTTyU4Z4vfTixkrOvlCTKHxoZz+alX18mdFflVGU6WcqEKTJ3/JNIKT/iTnqR0qe/7dhesdqDaxNieETgETSjJOnsAHFOKrcxdQjyG77ST0Fi1Vf0VZy+n8dOqzlC04uj6OpORpyXWCMnP9oEMYsXm5XhJQJ4vvxHIMc3fTfAXStR/Bg4PRF9C5UFBX7EnOwOl5TCOFGF9l/ayCTfoHm+MtIj+x8pC+pkRen8Jb9NAM7YtQSYKAOql5CJo70u1bxkphWSsMkynpH0uuQb/dL2PwQ346/w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 08:54:28.6522
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8984fed2-5d24-4a22-739c-08decc4e0a6a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF000061C3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB7804
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA4MyBTYWx0ZWRfX12Y3QgGvJFvB
 CaqqqhX3eOMQWmOL2oLaeXc3EpwXPRxiqFMQC0ej7oTlhyoi7VNzcR/Z3Aev40s5T/FYAxIsRwI
 daTerNoFgDpgtzOGk1jRMoVhD39UaOw=
X-Proofpoint-ORIG-GUID: -EJlFR7eUB09Z_Iy5-X6AeEIVFnLBg6n
X-Proofpoint-GUID: -EJlFR7eUB09Z_Iy5-X6AeEIVFnLBg6n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA4MyBTYWx0ZWRfX9s3kTkGb0zc2
 yo5Pk333rsGE90JWeBucPwqE7QOO//x9YHBGhIoiilNaQP7IqaX/B36cFs5ZgmdKgTO8N0AZtWq
 6IoQMIU++DzH5ueXNl4cZG9Jkf3E0/aLrpxk7XNyhFzhy5g8r9bLabAfwDzk4zTqymJU5JLX2hE
 BtysuPdkTNTEJ7EZGmfbkRKmN7JWO1LFVq7sQufbdkkm9anN/q3jFJ5iNLxPtSZkwfTJo8SLN59
 ZTWrTbypPFXV7OynmMGqKoLwscgN2+aKscDcGj1CMsZJDdG+XDBjPk1qCLKShsqD0+42AabwRUy
 pLU9tTpGbBgmSY24nxRg+OVgxkbp+RMrBrjL9dapYkaJjt0z0ycyv2djqu0rh433WrQWaQrpKjU
 YlbM9oWsrj+yiNHbdCPuuoyRFr+QMor+01ec2Goz0DHQDBVaQ58XI7FaRaUaxfkEty76IhjZsLo
 SH9gGsqS2L5RNkYKEfw==
X-Authority-Analysis: v=2.4 cv=KdvidwYD c=1 sm=1 tr=0 ts=6a3260ca cx=c_pps
 a=vivBcqwirDOV8GiKLGAusg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=w6tKz_T-MfRErUvdgp4A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1011
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606170083
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 17 Jun 2026 08:54:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20040

Updated the value(s) for:
  u-boot-ti-staging_2025.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=f6338e22d2ac0777a68fb0f295f4cf1e3e63f659..1612e4d1deb11d49304c715576854b28cc10e34d
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=d7f2b5b19f14fb51ad279f76fbeedd0dfd40b69c..c6cc0cab5b8575a2a70f0c4f9dbc9981f367d8e3
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=4e3bcc10a5d1e9822e0ed2dad5cdd16f7cf30fe6..98bbe0d37952d0ce1b6508f108c357ceb6d58bf3

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index 31fd341a..bb841fc3 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -4,6 +4,6 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "f6338e22d2ac0777a68fb0f295f4cf1e3e63f659"
+SRCREV_uboot = "1612e4d1deb11d49304c715576854b28cc10e34d"
 
 SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 21baed23..64a5e0d1 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "d7f2b5b19f14fb51ad279f76fbeedd0dfd40b69c"
+SRCREV_ARM32 = "c6cc0cab5b8575a2a70f0c4f9dbc9981f367d8e3"
 PV_ARM32 = "6.12.57+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 33972782..61cef2a6 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "4e3bcc10a5d1e9822e0ed2dad5cdd16f7cf30fe6"
+SRCREV ?= "98bbe0d37952d0ce1b6508f108c357ceb6d58bf3"
 PV = "6.12.57+git"
 
 SRC_URI += "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch"
-- 
2.43.5


