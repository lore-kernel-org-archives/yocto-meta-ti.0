Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C57731091903
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 17:54:13 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2347.1773942846412201890
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 19 Mar 2026 10:54:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=TkzzRJI6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.21, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WZnp9jTW7yugBxtH/5mxMLAfntkFINxvQnF1joOrawO212CJOIVEF5Q++z7txHPwXexSvsQJU1hMUSJwdeQK/IWVnWwIHotXahhWMkcGilskzvnF7HIAfUwO+xxe9lZHNiPJQYgNWWSeSZY7TgseMV+MNiFIHpnW26KWUS3EcE2pR6osUmmHKiD5pZO4qbZXh8sO8AgARpuI/MzJ7XjRDm59CXgEqamacttL3G/8tZnSLj9UptqxjxMP2FlPpv/V30qKVUUaqK/GzKhVcjRTSduaflGy+Ob4vuL8WgZCeB7+6um2QAZiVuflMWsbsICKa8oKMZMhgicwF5vwTMGgGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1kEbKrA6Gd73a+PIvTkdLnV+Uq274mNy1BjoSMo0Q8Y=;
 b=b3o2Y3Nck1Uxrv1MY2bFGcJvm2nERZ+2MOXoO0X/PVW8rzMOzjcH7UFpIi4Zw625pLUsOYdonpLof7LWGPQ4Y7i8haccuSk/MpijTMTQi2YJj2WCW5W2vEB26zCGq2iQiW+mafvhhidnDj24n1lHlU+PCe9Cc8ByIAjxpFALv1bTeA9c3Cj09vi9lK9tTcCPbUlOZatr0DdSWjQxPYAgnT6otZUJb6o1byXA6RBnwjLVMePk3f6kq3BplNhdeKUXt5iO3YjXlj4m0szla5ZSeqXUYpE+pC40DghT6UNQeXyXNGZvgCLl8UkuQgpNe3OdK9h9Q8k8Ee/PobmFI5U2zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1kEbKrA6Gd73a+PIvTkdLnV+Uq274mNy1BjoSMo0Q8Y=;
 b=TkzzRJI6H07LI8DcGddmA0maZIjwm1dnlw016ApBtxFPfW1dELeWDm5R4dlaD9SIrUBS/XvkjYAawjja9YmybgnbntkdRvoIOFxyuQft84m4tFlEIs9ba+A5cT7ni6VIt8FhcYB3cYS+LQzW89z2W22Z/6ZgdhBf3KA/WFVichU=
Received: from CH2PR15CA0026.namprd15.prod.outlook.com (2603:10b6:610:51::36)
 by DS7PR10MB5198.namprd10.prod.outlook.com (2603:10b6:5:3a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Thu, 19 Mar
 2026 17:54:04 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::1b) by CH2PR15CA0026.outlook.office365.com
 (2603:10b6:610:51::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.20 via Frontend Transport; Thu,
 19 Mar 2026 17:54:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.19 via Frontend Transport; Thu, 19 Mar 2026 17:54:03 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 12:54:03 -0500
Received: from DLEE201.ent.ti.com (157.170.170.76) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 19 Mar
 2026 12:54:02 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE201.ent.ti.com
 (157.170.170.76) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 19 Mar 2026 12:54:02 -0500
Received: from judy-lenovo.dhcp.ti.com (judy-lenovo.dhcp.ti.com [128.247.81.193])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62JHs2er2952373;
	Thu, 19 Mar 2026 12:54:02 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Andrew Davis <afd@ti.com>, "Praneeth
 Bajjuri" <praneeth@ti.com>
Subject: [meta-ti][master][PATCH] RFC: meta-beagle: Fix TF-A machine name for badge
Date: Thu, 19 Mar 2026 12:54:02 -0500
Message-ID: <20260319175402.2517003-1-jm@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|DS7PR10MB5198:EE_
X-MS-Office365-Filtering-Correlation-Id: e4fd7b04-9076-402b-fdd8-08de85e08224
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	IqOc4WqR87VFhKq0UA/Sk0GStyEfs+yb6fb9EIvWlEj2xGcC2thQEmFB6h8lVeN/zr/Ni27r0Y9m3evMRE6u3/tLPkRzDzU2hVj4WvfELcFlR9MMA/gIAMo1gzd3rvE68oXEXrvo+l/pJ2B9cQBjmPHmgSIik2PwtGxMFFHcw3YyQ2SUB4nJpn8sqFdilJawfpsgaSWJDU9mk6mUyyuLRatzPrgbwWeBgVKKATvnY0W1ASo333roizZNrmNKhJhJwiNvTGtSusOMjietug+zTuIXeOP/54VLi8C3oaERGAVHFn0WlJJI6aOi42AwKjgevFqs4JFO8JUPZDRK28gZyUTAgByb3zm8LfDJEEgCAWI4IMPW6mRdotlQfArzUzSPyrJYKYXZQu85Gm6caniIrq+ya79j/hpzFzWpG/LN6gpG6OAX1GSuoLDTnajXRBwWBOlmbU7z3UdmBb8Hnc3tkAyv6CMjbjwML0y0z02RYWYiMxmecpvVwDQcMhmXokz0kGtD7TiLJJhd7SLKGGTr7iFLxW660Fv3aLZEJsAKqLlC4PRpjRQK+CL+s+637e/mcptfA9UTEe6tZ65sMrv3fd6nFzKXP/aXCQYj4qt/Zx3RP9SkBQjtAbeWKuFgAYCZ6P3Dki6KUVdtNYERyVk3eHiCC8HY2EuWlPpElDw3E4/VF/b37M8yNSh9ps6YadNh389DHDHR9qSP13vz7btnFG7ibR6k8qVRXlVMCOg8Sxg=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4JYYZ1/Gbrlcg6HodcSvaNj4uIKfRv5a9f+KK5LjzsJC+ErcC3UEqXvK2xlSqhewr5tI8mEn5cveOgYat6UQVR+XaAsAkaw1SgonqxOPzMyA69rRJxE52QxtjwDvl2VfZuWn0Sfl42WWZT5T6QyfcRzsBBvEm/sUVEIKOaEMdgZ1vOJTut/DS3h4PRybh8CGhp+To7w6htuqDTjm0Ic5I2YO35lSythygK1cK99ucCIuPNp4mNIRcmi5eF9XFYKqw/y+FJEwC1sPfU7Z1jDjtrl3fn7I9w72y5wQWewX7AHTx5Flv05K7onKGEPHsjEsdVYTSBscn+Mh6RlWmsFhQDNp8gO4daMF5TBfc/jN28m+p05xjNskLYCf6ZV+uXAJ7ad/zy9WYhIyh6N0f358BOSGdzceZiRvw1yv8bNhDS8wQQokBVT8T1lSj9ZmbO4d
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 17:54:03.4853
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4fd7b04-9076-402b-fdd8-08de85e08224
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5198
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 19 Mar 2026 17:54:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19788

BeagleBadge board has been renamed to am62l3-badge
in the new TFA ti-tfa-2.14.y branch [0], so update
recipe TFA_BOARD accordingly.

[0] https://github.com/TexasInstruments/arm-trusted-firmware/commit/d203b84=
53905178252094416448de009931087e0
Signed-off-by: Judith Mendez <jm@ti.com>
---
Due to build errors with arago-master-config, this patch
has not been built tested, thus sending as RFC.
---
 meta-beagle/conf/machine/beaglebadge-ti.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-beagle/conf/machine/beaglebadge-ti.conf b/meta-beagle/con=
f/machine/beaglebadge-ti.conf
index d62730ed..78525030 100644
--- a/meta-beagle/conf/machine/beaglebadge-ti.conf
+++ b/meta-beagle/conf/machine/beaglebadge-ti.conf
@@ -18,4 +18,4 @@ KERNEL_DEVICETREE =3D ""
=20
 UBOOT_MACHINE =3D "am62lx_badge_defconfig"
=20
-TFA_BOARD =3D "am62l-badge"
+TFA_BOARD =3D "am62l3-badge"
--=20
2.34.1


