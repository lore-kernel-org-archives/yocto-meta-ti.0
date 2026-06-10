Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 806D7CD8CB2
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 17:03:33 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.36])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25536.1781111011452385322
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 10 Jun 2026 10:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=RMmZhVac;
 spf=pass (domain: ti.com, ip: 40.107.201.36, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7M0JIKVKkdRoM1D4VGpuNS8Rk6Y43gjSjhc6WjYs0bF/Lar0rjBgtlbMkRb14uYyxprvktde40S0MUb+g9WU+3GSphM76bIRwVQUQh8hfKu89xlYNkiBMVUsTDBzgljLXsxXbPkHQJysPgka82Zj6sXGv6/FNO5cF2MrmJ5/hgpNA5ocl9g03TtLzO/RPAXwwtiIvMltW32+EOnY6UrxIlGrE9F/SD6x9ZE9vUUpPjQp1fW3dm0aM92IRHyBqu22b30gXjfx/HlQMSvVsIicgrQw3wZ2QZsDAz5Ywba/KNfYDtnEEi1qpL8aM3hD5RT3iPE0crEHul6XNvNRVmGkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JT6ksTKk74pPwIosQrY0AkDbCKbD+GhHD0cxfbXGoa4=;
 b=HqaSMYeKOwK2xTtQSH9EyRooP2gKa0wvkyCh/P/GlfBD3cExIUlP+/NJsHTk717IKC1HLHz8QoAo+jGx0l5DXmpdg4WNa/zkdRtgtImpKb5CK2DLjjMnpXpHYTEP3TGhdAy7MReWzP4J4B1mjV8dSJRiqLc1Ogo1PkZyuMtji6Am8AmDdcrA9PHjkBvXdJMkgapUWqXLLlEImw1aZyj9Pju7pI6C1+lG9lhC2MA9OMcrFH5vBltuZAi4w5nVjV0rjPsZOQFXikJePb86hN0YyKoIvPNhzOoucAtsvGwQhOdn25X+oumzeWsjOVhOlAlIdkcgyh8+MLdErQ9Cvr5sXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JT6ksTKk74pPwIosQrY0AkDbCKbD+GhHD0cxfbXGoa4=;
 b=RMmZhVacsXvwmr/FBn8/tkrma3T+d35Y8pnxWL6UJNrze4Oi9rVhRHEHGZJM+LWu1T+Xq9I9OS2y3MaYmAt4p9BM9PwCGfFVs5bO/W44kylDVFFWwZQB8jJ+fmOJcx4aecTo4jZudZQaN8xR0dIEurEZoTxL7rnfP5r5E/cUq2E=
Received: from SJ0PR03CA0259.namprd03.prod.outlook.com (2603:10b6:a03:3a0::24)
 by DS7PR10MB5104.namprd10.prod.outlook.com (2603:10b6:5:3a1::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 17:03:28 +0000
Received: from MWH0EPF000C6186.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::7c) by SJ0PR03CA0259.outlook.office365.com
 (2603:10b6:a03:3a0::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Wed,
 10 Jun 2026 17:03:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6186.mail.protection.outlook.com (10.167.249.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 17:03:25 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 12:03:09 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 10 Jun
 2026 12:03:08 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 10 Jun 2026 12:03:08 -0500
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65AH38lq122812;
	Wed, 10 Jun 2026 12:03:08 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Praneeth Bajjuri <praneeth@ti.com>, Ryan Eatmon
	<reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>, Andrew Davis
	<afd@ti.com>
Subject: [meta-ti]][master/wrynose][PATCH v3] conf: am62dxx-evm: Fixup packaged overlay list
Date: Wed, 10 Jun 2026 12:03:08 -0500
Message-ID: <20260610170308.19989-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6186:EE_|DS7PR10MB5104:EE_
X-MS-Office365-Filtering-Correlation-Id: 00ed1c65-b5a9-4a91-5d8b-08dec7122fdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	0JeQpfq+5roOQqz49BxtsnUKIM4JUEZuPna3wCUKAxeC8IdwB5eAPnuAT8VcJKBok+UUK+WwwgCY9pU9+GwQWAV3eG/Od4jCfIkPQyZPH96/G5EYIX9A++8rggFE46355OfdXmZWhzlMatcJNgTsrR7j5cXMzEbjJuJWah0wbDCPUlMuwTyfcTXgtPCTHCzZICBbkqGUYl0WWElcdarym5ZO2OI8K4r+iYPpYY1hihThf1l1U4QcUAGhBqIyL6sQ+oUxgl9RxY490c2AEDe/7r14TucAma71FQ/HYnco+GrrsDgyd4va9l19vs5BvRNAqFpCwkmrl3zjcgd3ZzRydAe/hSUJT2NsuDSDNAp3dTQfAma4h3KogYG5UXh4ujer/O5WXuH3N3/2KmA9NIpl+zBwPaVaruVwq3EudCP+D8jIzMPEhFrV7y18MFe3GbH5m6gnruqvJu+zuNRnceVhrZR9hX3zpZbLmHsHoyqnIV4+Py3UXNmkILhVsI6ajYoeb0iUEl4AohLDxzUOp1XvEOpo9UPmtZ9YfjV9Z1nSP33MayQZJ2ZBKf0far/iLDvDhDVi0QTwD0NOGHDyLdoamUn1UYe86cDg1Vbgd7Nesb/+cFA2D1zDDH9EEVQ66IOuodY6YIbmDQVXBAI0GgBZp8w4/MlI8UO4R1c4bQsZ9QI1nrebWE58p25ox9ZmSG9j0zesZOnKNvDecD7D66hCFHfBuXPiFeDziaGLaZb4xxA=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ehc9f5JeAbeD9/IUUNn2HVMSkk5iOyFc9vjwq6qz0gVB0d9LeeH00Tg0AEWhE/QerFKphdlq5OOqeRR54NstrB9eHeJ/2qjkt1O6EU+qB0FCiBCLZzgAlyaMA90n+4wuV26jwgb3dOy4ru3PI9vK0EqKC5ObDqa/e1gqhB0GRaz4pUFzV+/w+JPF5XaQWo1AD1VgG/KBsr4N9FmDE7BRFL8FhykOuxd7H4VAcYEbs0qsO7YPToAglMNGj8Esnd5klguy7KRfC15TihFonN+EdYeG2+hzZ9/KLiuZ6ZeTuLQfT51kvpbM0c2523EH7sDJcHz6NqCAoV8y9UiJE1HBXYUAnrGl08RMqHJbpZa4PxxZkFfmYUf1wLHYE/4e6JU6YJk8QpMsBc+Inf1NguTZgbvcHmDWAjU90a4+VVXaqcP3eZw927Qe0YFdaGEaFp31
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 17:03:25.8023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00ed1c65-b5a9-4a91-5d8b-08dec7122fdb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6186.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5104
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 10 Jun 2026 17:03:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20007

Some k3-am62x-sk* overlays no longer apply to AM62A/AM62D boards,
update overlay list packaged for AM62D so that the k3-am62a7-sk*
overlays are included as well as the k3-am62x-sk* overlays
that do apply to AM62D board. This means ti/k3-am62x-sk generic
prefix must now be droped.

Signed-off-by: Judith Mendez <jm@ti.com>
---
Changes since v2:
- Fix commmit message
- Add changelog
---
 meta-ti-bsp/conf/machine/am62dxx-evm.conf | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62dxx-evm.conf
index ef9df2f7..b723d457 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -6,10 +6,14 @@ require conf/machine/include/am62dxx.inc
=20
 KERNEL_DEVICETREE_PREFIX =3D " \
     ti/k3-am62d2 \
-    ti/k3-am62a7-sk-edgeai \
-    ti/k3-am62x-sk \
-    ti/k3-am62a7-sk-rpi-hdr-ehrpwm \
-    ti/k3-am62a7-sk-e3-max-opp \
+    ti/k3-am62a7-sk \
+    ti/k3-am62x-sk-csi2 \
+    ti/k3-am62x-sk-ecap-capture \
+    ti/k3-am62x-sk-eqep \
+    ti/k3-am62x-sk-hdmi \
+    ti/k3-am62x-sk-lpm \
+    ti/k3-am62x-sk-mcspi-loopback \
+    ti/k3-am62x-sk-pwm \
 "
=20
 KERNEL_DEVICETREE =3D ""
--=20
2.34.1


