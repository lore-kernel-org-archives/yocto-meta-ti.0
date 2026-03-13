Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97884107BCE2
	for <webhook@archiver.kernel.org>; Fri, 13 Mar 2026 19:52:41 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.66])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24920.1773431557763446065
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 13 Mar 2026 12:52:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=HjxuGLbQ;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.66, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=msFlaOgaki9PW9GbUuaG4wiJRU/tbj4dmQqihLbycfoqN739nB3zScfX6lU9XdCWQesDaMNoQq2+bD+AuRE2hLh7k/n4SeCozmWkFBsct5uVHZIps648H/Fh+985Vfw86EZiZW23+UBZqtNIiZFl15x9Db02g3tH1He/Xa9993AQBqWd9LLvJEn5NDWcUNBYaRRqi/buAyKQxZpdGi08Nxkp6aQwUVPL63HThfy9X27ux4Ubntl58ZmjWT/Tyrw7ilDGrsPa2MZx+OZ+0PWH/G+l/x837wriPkMVhiRHYxVhgktvcGZ4BfMq41HVW4i16kRiSm/NjkOpKubLpblrGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=USoQZwdSQrEGoljNjEII0AOOOXhy/QFJlnYA3yWsyIg=;
 b=b7inhDJ3Y5znJimm1vwkKGA03t8x47wzJhhUMeBNvTQcBD3YCnsILEV08NN2Jg6ocy24Tuty17CaUB37YCZx/MTifY/ZH1vL74IhKQ4mgfa3YDg9c43DPNdtmohOXfkB5DoK+GhkKw6rSFyDlqa9/l4x3lvlXjNdTC+qyOsiHNapRVmTDxUYNhu+cFtWgwcUkTiiwNQFWS8ZDRfJz33N9KtMQ8Z9Sc5Kx6NlaOKQx4inEKJbAu1OoapfyuZNOcJbVoATlmyaUvJ4WJMvSvwQg9SJ0oAMcEy2dRegwq7lV8X5Gz+BZZycqY0qaZnKdVjJvodRvbnWJxpoYx+LKPs8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USoQZwdSQrEGoljNjEII0AOOOXhy/QFJlnYA3yWsyIg=;
 b=HjxuGLbQuOik3rn3JucYeCGhVsy1zlX8OumUF+LfAidq6Sz/GjgrxL/e6+/HhdnDkOwsfgfV5IS5/NW1lsPXbGWfzdVksIO9n4mTJdX1jDTeRfr6SNFZT0aV8RwZXWO6yvu2hqD45LZvORkgkzu1OZ8thN2vHvKsrnKNs4qHaBg=
Received: from SJ0PR03CA0240.namprd03.prod.outlook.com (2603:10b6:a03:39f::35)
 by IA3PR10MB8444.namprd10.prod.outlook.com (2603:10b6:208:577::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.16; Fri, 13 Mar
 2026 19:52:35 +0000
Received: from SJ1PEPF00001CE6.namprd03.prod.outlook.com
 (2603:10b6:a03:39f:cafe::2d) by SJ0PR03CA0240.outlook.office365.com
 (2603:10b6:a03:39f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17 via Frontend Transport; Fri,
 13 Mar 2026 19:52:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00001CE6.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Fri, 13 Mar 2026 19:52:33 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 14:52:15 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 13 Mar
 2026 14:52:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 13 Mar 2026 14:52:15 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62DJqFZ3603452;
	Fri, 13 Mar 2026 14:52:15 -0500
From: <rs@ti.com>
To: <denis@denix.org>, <reatmon@ti.com>, <a-christidis@ti.com>
CC: <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] mesa-pvr: fix compilation errors with c23
Date: Fri, 13 Mar 2026 14:52:02 -0500
Message-ID: <20260313195202.4047234-1-rs@ti.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE6:EE_|IA3PR10MB8444:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b2ff813-7b72-4687-ec0c-08de813a1189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	8vUeHZVXB++zmaEfWK7DZnQP6MEc0WWwmgvsjzqRE19OJ8pMiW4uV4Je90H/sUg4C0TXnBoZ8DLLcuir0xYgBNEtUBO8JEQUFugPG2i2NjNBRVry80ZTktqio33bym3AMVsKLyC4kILYvoFlQ1vg72swG4X+t8MuLGRAjLxhAv1T3snoo8ZjoAKFsTud5oaU5Dxp0ilIzP8ZmXsFRPILoFVAKJEyMXZn+HCU1PeQs3UfG6vWmJDr6hGJsqj7Ks7p0hk6t21MakArylEujYeXqHh4hmalmVKTWKvNhU91HYV133nFQH8umOC34aJCdFxAJMk5EP5ZuivWwRswMcdIDFeOUBaaxtAkPtvufBqp62/OvEZCineXZrTsdbR3fUc60gSaeiNi3dwnKvQx8QrFJjpPySjwaU0RcKcqkgHA3wWwIcIDq0TdxTiXayji556L5B8gXstX4g2JvaEwSw6fRycQADZKrZoT27G89JwIMCYMBc8cJGJX8+4sDSlXu5qty1KHsTMR6USSqCGmq68rc2c9D2wVbLtVuk+JD74+vq9XYkk2U+YBF0ZVtHL/Vm5iUxDU+EdmR7erd9KMyhkY/q0Hwir9hdqPhSkD90o4NjljKhLXJR9uLqT9T9bAHq/NC/gDxeC79TTHBr7kNOGF4Fh97czH5ShNIjoFmBMtoAzNAUlUBojVIv9043wYpY7+6SGPqSupH0stSsTnyXu847zmj0QLsafWe0g1ZuHEktvQb98+e55o4ueYjAegk9bUmmXGdLoIPMHZeUiOriSdbg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3xuVa7prKyxg85+wioAAfosDKNUX3C+YtUIAi+Fw1v42vf9cWWr+vhy2d7y5QXK4pRtfOlE8pWOS/NlIOrm6TMZzS2hD/PWyuoEWTq2UaQA5YK0GjSWtUskZN3WMVs+yuWQ3kjLtDBfxZ5qYVTaF2twzYlNhlf1Jr2+InIWATp9DI+lGTOUWXuq4NXnbmjoOgF4MQhcHRjd6TtMlojdyiLxS4z3kr/KtkHZejf7367TIzKqleaqrWWenqzemKwKEGJFIKZLxXHQnudp+RbkIyXY2cbioUEWgj9GCGhUTy8hXBi67I8i1SUAf+JFUHeNaK27FN9IG4KXyvzMVtnyOsBvgyYdWFasDkFDEO9ss5p9mLxQOpJVqCXhzGOEUvaQSLNtMa4MCOfzZ9fggXrRnKZ0WPcTHi1yOxwhS/G47tUSVfxVuBkJH3CoyvXiwbF2H
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 19:52:33.4288
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b2ff813-7b72-4687-ec0c-08de813a1189
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8444
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 13 Mar 2026 19:52:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19716

From: Randolph Sapp <rs@ti.com>

Pull a fix from mesa/main regarding C23/glibc's definition of once_init
in stdlib.h.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb b/meta-ti=
-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
index 992c6b2d..0b48bc15 100644
--- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
+++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
@@ -21,8 +21,9 @@ SRC_URI =3D " \
     file://0001-Update-lp_bld_misc.cpp-to-support-llvm-19.patch \
 "
=20
-SRCREV =3D "68af6a102c2298569e77d1aa8bccc1ff61438b3e"
+SRCREV =3D "7c82c1eebc67f5a62a347a84d42fe795cf7f523b"
 PV =3D "24.0.1"
+PR =3D "r1"
=20
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
--=20
2.53.0


