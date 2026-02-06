Return-Path: <p-bhagat@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9B6EEB28C5
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 05:06:29 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4841.1770354384366995761
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Feb 2026 21:06:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=FkQ1u1F6;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.93.196.51, mailfrom: p-bhagat@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xT46cpIIbFvfNr0uosHskoj6oh2H+1BPP0vtY1NHbodNkv6iJ7LXT5TPI4aRMegUhG26+M1Q+etlwUBW8ogStypm52SA8FqjXxr/l/mlR7aIvjARqJnvMrzn/Kty5xg5M5OyFeBfLD1cgnGqhbD0Zge5eRaMF8lWs7wuXR+r0AlX0R1HBCl1NkwIjJRoZnh7RovIZSnIxT3qY5EEDK+GDcRr3kBsKwm9JXpwlpMkhHPYmPFG9Ut1iHNBIT7M+xcykeZ2KXkwupmYcqn9dhjhuZXrPQIvXhUaiBdLXCaojnhvfQSV1P+BYxhXRmLzHP1+NP3vJYJ4J5UkzWT2T3hRRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDMbkguX9xqAteyDY6OmdYIGuUqqv3tONsVlpZ6/MbY=;
 b=e/hLxrd4BuL4wP5cuM0rXC43QeN5f3we/ZjXoIpVjsXoYDVAj1zPPPeHBqHFvX4FnEM02ABk969KwJqiL/eRSgSXV9fsDmaUjKG0YbF4qP7KGfvnxozaqtjRalhLJR8sJfUG1FUvJba17cktwn0+Ctm3Uq+M6JvX37wfsGblmUjaOzxFZyX7l39nM4LvRGD7/MUbE2q2vZOwyeYf+UAQjkB+WzdY5F71zaaCOBqLP9XVlOT4W7q8LggFCrGuRwu8u4rGwu4ILjaej/etVIxJwT8de0kR5xmNtjyOGulGC8EIbKN2y/xli6twD5iB/9RXr05tUR72T7119bzjifk34A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDMbkguX9xqAteyDY6OmdYIGuUqqv3tONsVlpZ6/MbY=;
 b=FkQ1u1F6kIa+Oc5nx438PnhFfFCDOcR00APpYamlkdf9lib5tkl0Y/1e+u3LIPbJVOtAv9xuNftA3csnrLVuH+FrOtjnsN7cEGH9Od54t0XE0HL+iWlbU1e5H23ySmt/YPvhIMPX+TPB7M6y4O4lbAdYBFurtFO86Xr9XE8uGfc=
Received: from BY3PR03CA0020.namprd03.prod.outlook.com (2603:10b6:a03:39a::25)
 by SJ1PR10MB5908.namprd10.prod.outlook.com (2603:10b6:a03:489::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.13; Fri, 6 Feb
 2026 05:06:22 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:39a:cafe::47) by BY3PR03CA0020.outlook.office365.com
 (2603:10b6:a03:39a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 05:06:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 05:06:20 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:06:18 -0600
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 5 Feb
 2026 23:06:17 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 5 Feb 2026 23:06:17 -0600
Received: from localhost (ula0502350.dhcp.ti.com [172.24.233.249])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61656G9o127796;
	Thu, 5 Feb 2026 23:06:17 -0600
From: Paresh Bhagat <p-bhagat@ti.com>
To: <meta-ti@lists.yoctoproject.org>, <denis@denix.org>, <praneeth@ti.com>,
	<reatmon@ti.com>
CC: <v-singh1@ti.com>, <c-shilwant@ti.com>, <khasim@ti.com>
Subject: [master][PATCH 1/2] recipes-bsp: Add TI PCM6240 ADC firmware recipe
Date: Fri, 6 Feb 2026 10:36:07 +0530
Message-ID: <20260206050608.1929093-2-p-bhagat@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260206050608.1929093-1-p-bhagat@ti.com>
References: <20260206050608.1929093-1-p-bhagat@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|SJ1PR10MB5908:EE_
X-MS-Office365-Filtering-Correlation-Id: fd145b69-0be9-4ed0-d651-08de653d7741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kPUB/hxDcGZnzxavLxd3lfNlBjc85cJM7TMeKAsCZy4HHUWSbn2R5i12zWos?=
 =?us-ascii?Q?5Kud2DehSArE64//JKghcNl7R4ai1nnBufifouElCpiWt7ygs7yei0QISWD2?=
 =?us-ascii?Q?y5TFQBluUbyaNTDQaNK4K1zWc/Oey8YS0LpUTV1c+PmdSvrQTI7SajNwKrur?=
 =?us-ascii?Q?QeSyw4AkSlv2COOEjit+TF/dLtqBuL8OUoBDCjk2OxV1R/9pAsvsaeMI0YWk?=
 =?us-ascii?Q?4KU/OVV7+BPq3Qwz1/swApieIx9pE2j7F4uKXecDL2UGkvoady+5ySeh8ClF?=
 =?us-ascii?Q?7nEbkK78MOqLZ9s+ow3G20E9IskRdglZ5exj9g+7elahYdp1bjNAlXVvzXSZ?=
 =?us-ascii?Q?vf7MOid04rf9XrzYI6pGRch7L1NnOBIaxThbLcM1wHisOB92Yp9VayBRmIVo?=
 =?us-ascii?Q?Pfv5B7tvaA6Upd+enWh6qgZsS6pWIupAkq8En9U8QtGbgHMl2ZDOLjTNMKOT?=
 =?us-ascii?Q?k3f3MG1gj2gDFOnBpZFzbxeRpB7EYuxU8Lkkjx/hOhZpdiElWvuPB+jfeOlU?=
 =?us-ascii?Q?7HXBK8G8/uGtykJt8A9JSZankT6k+8qPRv96Gonx6IK90bGKEDsNPVo77mBM?=
 =?us-ascii?Q?SlXumySQSUSPmnIF4Mad8+ElWRdWutTFZ48iQyRPSGqBKrzMLbWielm2KogE?=
 =?us-ascii?Q?CpjCs8jb3WZXsM3pwdFdT8HqJvTUF4ZGfOG2RSO0P18uJWgL7BPHmr2O4wdh?=
 =?us-ascii?Q?/r6T9NMwxfZwcGbLIELtDkPtyZ/Qjiko2k5BcoULo9MN/vrKpTgdx24ONEAa?=
 =?us-ascii?Q?Y2WeojzYhtI2k3L73VL2IN5o4v6ZeRGe70Dxwm1nCHQwKQ0HCpc9ppYjvQnb?=
 =?us-ascii?Q?GaoQK4X2YckCNg0ke7oV8QrJFR+fpWivuu7sfajg9OW3qLXQSkHi1UP6yXrQ?=
 =?us-ascii?Q?esBxi9yrql+wXVj5fPEQeDvLpSRD0BctQguB4GVZna5aJC/Fl70ZY5YjxkG7?=
 =?us-ascii?Q?8wgeuKxojxmxFcd1WIRwiQ+QimSJi8IomgdgbIkO+fpijgSDR6aEeUKIKA8r?=
 =?us-ascii?Q?l3LWQCREkjY8RgVHMTUHCXSAJH2xwxYs0Tqx83Ko6wTHj9wCjP+m2oVnKyJQ?=
 =?us-ascii?Q?YxioZ49vSh7c0aZCHNAzOhqLCKltvrsucfnAHDFZz5iPWR0Q/EDGE1LdwWum?=
 =?us-ascii?Q?F2dbNSf223hvpbdqEWNu6qdtFcODCWSYbRoqtUbN9+cOCqScifgJtdbgCirA?=
 =?us-ascii?Q?VPiL8BIycDhvBqjp+KlZiWYiwYKH8oyjOteSqUNVwl8PwH7bPMdB7RWDGxQ+?=
 =?us-ascii?Q?wJnrX5DfwqGf/MqJbaf1/nwtjEgIIGAlVUsjo1qZ3ikkISkTUjOLhcOwUfrT?=
 =?us-ascii?Q?cwnvarGlPghAYz0cxCVkrFFj4AoGkof3/u6ndg/m6wW3sew/fCNpbgp/RTHC?=
 =?us-ascii?Q?OkB/Lg/Mq3HkSn5ENj0SBGafYjVLLdrWcTgu7nbwYMCrw02oNrlXJKtjtiqZ?=
 =?us-ascii?Q?cxNKq4Q0uEouQumQfaQkuHUP3yPP8HNNFaPswg0Q+FaZS/co/DAqphe6hlES?=
 =?us-ascii?Q?AVI1nYgqV2fOYUKGdZkPR+Bkz6O5TaFuXUOq8OuiJMuIF+jPNdXT6v2Q4/WI?=
 =?us-ascii?Q?ulJWvBaVd6a85A+D/8+VXRxpc6+uoGZKfBfI54D/aj0bmvr+kTMfqG5OlweR?=
 =?us-ascii?Q?bgiOYCgWKq4/CCAg3MzxYFOtbsiUwVe2deqhVrJguaYRy+J72S94T70j/7Lh?=
 =?us-ascii?Q?t99gyQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JoSaiVACZ3aDWtZo+ht+bIp/gKSX50y628U5342IM6MaKxb4ZZvGYsjreMBB5YOtGj9g1hAqqE89aWlt2OdFFfO90RglEbPpAaQehjw6jJvnCw6TERjHxWbl9kzsqbj38IoYj+32rOLced07IqqdUTS5N44I9VkSW+N1GAY3lpBSKHlYa7Ly35bZ5Pgp6LcL+5Xg6uNqdygn47EQw6LPGz/J1PlMBfe3f4a7+RMonmGXsdRyWEZtI9Itqx+1AoelCfea8D3caVhEjDsChH+Njens+KVUuGIEcAfFKvd4P7QIna7r0ILP2K2jaKXvNIXFbBreBw5f+REffD1BWyBrTxluhg0wLpCNWKBTfy6yIGes0dpDPCxAKkPsUqPfhamY8YAPSatAfHyngbeVRvHc1JrcfVE/uXt+07glWIPGqA2OXG1gXdUNrvOsm6Q21jzi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 05:06:20.0078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd145b69-0be9-4ed0-d651-08de653d7741
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5908
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 06 Feb 2026 05:06:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19465

From: Vishnu Singh <v-singh1@ti.com>

Add PCM6240 ADC firmware recipe for am62dxx-evm to support 2 PCM6240
ADC's, each supporting 4 channel recording.

Signed-off-by: Vishnu Singh <v-singh1@ti.com>
Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
---
 meta-ti-bsp/conf/machine/am62dxx-evm.conf         |  2 +-
 meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb    | 15 +++++++++++++++
 .../recipes-bsp/ti-linux-fw/ti-linux-fw.inc       |  1 +
 3 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb

diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62dxx-evm.conf
index ea851d8d..4b77656d 100644
--- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
@@ -17,4 +17,4 @@ FIT_CONF_DEFAULT_DTB =3D "k3-am62d2-evm.dtb"
=20
 UBOOT_MACHINE =3D "am62dx_evm_a53_defconfig"
=20
-MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-dac-fw"
+MACHINE_ESSENTIAL_EXTRA_RRECOMMENDS +=3D "ti-dac-fw ti-adc-fw"
diff --git a/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb b/meta-ti-bsp/r=
ecipes-bsp/ti-adc-fw/ti-adc-fw.bb
new file mode 100644
index 00000000..ad025483
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/ti-adc-fw/ti-adc-fw.bb
@@ -0,0 +1,15 @@
+DESCRIPTION =3D "TI ADC PCM6240 config prebuild binary firmware"
+
+require recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+
+PV =3D "${PCM6240_FW_VERSION}"
+PR =3D "${INC_PR}.0"
+
+COMPATIBLE_MACHINE =3D "am62dxx"
+
+PCM6240_2DEV =3D "pcm6240-2dev-reg.bin"
+
+do_install() {
+	install -d ${D}${nonarch_base_libdir}/firmware
+	install -m 0644 ${S}/ti/pcm6240/${PCM6240_2DEV} ${D}${nonarch_base_libdir=
}/firmware/
+}
diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-=
bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index df200716..ecd4e350 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -20,6 +20,7 @@ TI_HSM_DEMO_FW_VERSION =3D "11.00.09"
 TAD5212_FW_VERSION =3D "1.0.0.0"
 TI_PKA_FW_VERSION =3D "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION =3D "3.52.00.01"
+PCM6240_FW_VERSION =3D "1.0.0.0"
=20
 TI_LINUX_FW_SRCREV ?=3D "8ec0c42b8ccf2c9e8bebfd7c4e03d93fed555442"
 SRCREV =3D "${TI_LINUX_FW_SRCREV}"
--=20
2.34.1


