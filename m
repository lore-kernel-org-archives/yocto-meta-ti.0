Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44783CCF9EA
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 02:56:34 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.41])
 by mx.groups.io with SMTP id smtpd.web01.63.1761706589650313198
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 28 Oct 2025 19:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=jlSPOL/b;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.41, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UsIFJ3SMo3LhrO1QkvNZD5qqek3/6E5btNQ39xp7Rc+dC4QjlfcBvYcpFK19sMptvwttEY4ShaiXiic6StAiigM0h7/uYmCV/FZyPP7T4S0rjnOHHVunR5bXO2k7Bb27DUGKaK/ddeCnE9lc6EyYgwi+NCpbtCoRtpYzSuDsNiMVQtk81AjdyqVFmADN2Hkocr7Mex4PMPPdr4ow7AxV+uTtXu2RxfBsjz+R1WjN8vvms5MJbQUdn3FWnb8XqwJeN1VkmHXPKJ/5FuljYseswnwNH6nOlWGx5NDW1fm1VDZrkcLLXeGb+M7qAJ8/0FNgsQDgMzebb2ClYmRqdTLWtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wo3t2eKSxzdq5bv9JvMFruelt8+I0plFPXIaQ9wk4JU=;
 b=DEwYHPPjtzYFp66gND+yyHjZem1N4bs9wBwDRQUtjbvAqez/yEnvWADqVUvYFgS2ja/D5bwyNw7SLOaNKXpUBe9AVqsU9d15yvFMz+7tKT83xDZQrqGmB5lC805Sb5lZ9ydwouISRpl/FiiKcDF8qTLcB7BTKVMwkhSzPQRh7z46tJetc3JNZYBT8DGHa/mWBiMCs2/+n4iHgsl5qYraI3tONx40CN3IltVBrfYE9FJtU6pzWMYYf7N58OAXHIvz4V+xW/5xqUsSQcJn7hS41z/+jDfDUMTAm1MQqBZkOtBE8Zzr3dqQl8BKwv6QhT6ENlJyayPLTX9iRW57srzV/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wo3t2eKSxzdq5bv9JvMFruelt8+I0plFPXIaQ9wk4JU=;
 b=jlSPOL/be+WYXOG3tnUk/KhfCCpciz+IEDtlPE8a3+ahb3rn66LAl1W40h2KhleRKOXjsUf4dKpXKtyKvBaf7CJE0YcZY1si9m9Lpsd3qv/it3mROIWXzDFRf8uAxNkLqLFjwQ6unsPrdpWlifgoLwO7tZykC/S1QS7fIjKNGbk=
Received: from DM6PR03CA0008.namprd03.prod.outlook.com (2603:10b6:5:40::21) by
 DS7PR10MB5088.namprd10.prod.outlook.com (2603:10b6:5:3a2::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.18; Wed, 29 Oct 2025 02:56:26 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:5:40:cafe::56) by DM6PR03CA0008.outlook.office365.com
 (2603:10b6:5:40::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Wed,
 29 Oct 2025 02:56:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Wed, 29 Oct 2025 02:56:25 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 21:56:24 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 28 Oct
 2025 21:56:24 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 28 Oct 2025 21:56:24 -0500
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59T2uN4d3323941;
	Tue, 28 Oct 2025 21:56:23 -0500
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>, <j-sahu@ti.com>
Subject: [master/scarthgap][PATCH] conf: machine: am62dxx-evm: Package eHRPWM overlay
Date: Wed, 29 Oct 2025 08:26:19 +0530
Message-ID: <20251029025619.499855-1-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|DS7PR10MB5088:EE_
X-MS-Office365-Filtering-Correlation-Id: ed388b8a-c3c1-4483-a00f-08de1696bfc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|34020700016|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?4Voe+XdtDdrizWkCUsYTMdp2AGF0EO/NsjDFkVnwCnZUvBY/9GVxqQlSEEiC?=
 =?us-ascii?Q?GpxNgUJJO8WQZZ4++11o8/iYwofQbuS6ZrsmdOHqLkgnswSfer/FwsVYpGwv?=
 =?us-ascii?Q?21SL6LsolNEoDGLkVeGbwdgP4qkWfWD4Lf5x3HFDAHTTvK1xprBEYN1UGeV9?=
 =?us-ascii?Q?2F91Dv7zc4OrT8odfCuiGeyETZH4HK1MC33E1oTKm15YYoCRKkguoP0Oce6b?=
 =?us-ascii?Q?axG5iyMoNr+vgoSzJKSkw4EHf6FEysxzHu1iRw97Z/YhvlGjBGUpIDdie4GA?=
 =?us-ascii?Q?eJRP9rjzvWPSPQByuC4mZ/B3nE3Aho7qz6d898/Nl6tixgugJKM0vOqUaNmh?=
 =?us-ascii?Q?JlT9AqYvEMBv899zXZ198wuGhI6EZtAAY8sfvXFLuqrJmbX329wEJVIiaMzj?=
 =?us-ascii?Q?yO0+rKcgEnARz0LTnH7/wF5whyuTSr7NjuQ+TX1dLJH9erl/UG+Vkzgaz5gn?=
 =?us-ascii?Q?+iXNNKPFaevbVJpxfXC842W1UWSvQ7IdlOK1UvSwRgoEwRbNkP3+ZVuJ+9QR?=
 =?us-ascii?Q?WNwjf/DntLceEyqH/UkIv+Z9XIApYlDycqMaiDIEQztAJQvQ5dNyb3+WX6os?=
 =?us-ascii?Q?ImDrhfzCsJbV/STC3QbnFK0VkVWAHjlAphkXDnc5cy3MyI+MCBQXCmqWlCUR?=
 =?us-ascii?Q?vsLzgHXL8tQTMEu13/9nTjmQ7Log2QFCUpWVinqn07lr13MtB6RbMn/8L5sl?=
 =?us-ascii?Q?HiCxLpIizt1mktoePGyCdkXuDQfHs2oohODF550K69s45lK3ssZ6RAVflm4Y?=
 =?us-ascii?Q?wHQKH7zKa4CZdTNIu2z2d95td+6kd6efcsg/PToLb58mL/bCdqmgdE4g8IqZ?=
 =?us-ascii?Q?Ojxojz0btM60g3813emWQvaBJTNUk17UPpGYnEBp5LjnNuA9t0Q73z6nCkE1?=
 =?us-ascii?Q?9bKZJu1+A316FpGamk8p/YZBAop7sm4ingSwpvw8gD3uuCNYMb9t8tQhpc95?=
 =?us-ascii?Q?tehs9lVk0jguJBgMqR33VC00hBKbj+cJcbtLeMFiIRlMiEocQcpZvExh1CBg?=
 =?us-ascii?Q?2lOtODUEPBJdMMP21kyJm1E3qDsKBPGQSYibpg9Q1TjoXLEhvrv+oGVnI+28?=
 =?us-ascii?Q?VasylPhYpHxT5Z0c8QWb4kikz70c+XyB3k+FBHJK2c1YI61MjotxGgT6Yqi4?=
 =?us-ascii?Q?jI30nIzWxy48h9F+PRG5jYBZUvGrctNiQB2GmuI4SOU+k5DRXZZnLV5w5vL+?=
 =?us-ascii?Q?izi7MdOBvDtbOOqRDLDo9PlPSeBcY2Na7REVwad0LeGGBlbZYbBtD59UHYbu?=
 =?us-ascii?Q?fh0HtJKBIu+mL6pxLmOvdNVzHfNCLrHXpb+5srGG0FopDLmOYqxeBHPvzR4t?=
 =?us-ascii?Q?AoHZfInCOMYzJnAsRVhteoiqpXXfsvc4WJoAOejvg4dpcFohp/iJniG5JgLe?=
 =?us-ascii?Q?EpKjldVmZsOH4mVRUUMFqZZBxHTia3QBQKNExgFclz5mF5IJTysdH2lsUDU7?=
 =?us-ascii?Q?1CQpfOkCI7gB4UOU0L1Vb9iTj3FeR/7nWPVGjr/eXmfrjJnVE8jcDeEyjIy/?=
 =?us-ascii?Q?er+lc4o4xWp8zdM4YMy5KYEmdm9XTxjVy27IXGairtrFS5dISDIYSJASCoTg?=
 =?us-ascii?Q?3IiCqRP0T4RhDttUDVw=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(34020700016)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 02:56:25.0468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed388b8a-c3c1-4483-a00f-08de1696bfc3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5088
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 29 Oct 2025 02:56:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19187

Package eHRPWM overlay for am62dxx-evm by reusing the existing overlay
for am62a7-sk.

Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-bsp/conf/machine/am62dxx-evm.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62dxx-evm.conf
index 9008a6dd..b229132e 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -8,6 +8,7 @@ KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-am62d2 \
     ti/k3-am62a7-sk-edgeai \
     ti/k3-am62x-sk \
+    ti/k3-am62a7-sk-rpi-hdr-ehrpwm \
 "
=20
 KERNEL_DEVICETREE =3D ""
--=20
2.34.1


