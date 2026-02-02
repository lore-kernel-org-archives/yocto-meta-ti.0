Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6210AE7FDCC
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 19:52:11 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com (PH8PR06CU001.outbound.protection.outlook.com [40.107.209.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62052.1770061922887179010
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Feb 2026 11:52:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=LLX/8Cc7;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.209.43, mailfrom: reatmon@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnfOHl8F2FCfN6cEemXl+32XNmDb6eq8KMUCgjwj9f9ElmI8h/luJ0aznoimtVV7ktDfIuoIS8sDz6e1kyGnApT+xkoUvOLscRooqxu7GF7ze46pi1ErTzXYz/3oT71G27qvZUklMJacwIIWmW6HjYP+VSAemXjWLs12uclAuv/nSjmpZrkjhyx80OjkBXtf8kXerpy11YZDZTBjVMDifYR47DYCTgcTu3uZcQcywsWNGvL5icg/zuT2J/9WTdSonwS2FZk/H3XOxRX/BvRwMFIHKzboRpTp+37L1f6iNe6lBNATA7T1ZuhgQuNCbDONaFJDcDmk87tkol1z7pij8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jz1W8vpq4XCCfj6w2M7Fh90WTIvO86KPgOXadCrH0iw=;
 b=zEodGGWecGnlSTJgSpR57HrKWqmmiewDU8cSl+mg+XGfZ8xxD2Gxtf3B8M4y9tf2s1Pb54XN+TI/F7mbv/5dPnI/WSqySM9SixNDcFaz7FkulpHtl0wkHjrhJZXPBZb7gTHByxYnTEmhzu3PB/gKPDsuJO1jyEudh7ONNZrZF3aUtTYmnGkcMwIZqtelRCBNvzmoCEarHmRs63PVmWFOufisZ7Ux1oLMRkYfTV3ByngID0B7E+GlqZxHnp3Fv7RANE7S1ireT4gkT3Nz9zKqKIct4MKPx1dTHrDIrWjSZbgO+0Id4zyCIOKADmtMnelnx/vBgT+yorPti5Siqcpw+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jz1W8vpq4XCCfj6w2M7Fh90WTIvO86KPgOXadCrH0iw=;
 b=LLX/8Cc7U8bbqK/BaZTv1F5HZ9bdqUU+WM5vlIgD1IkJN+qH1NchUd4a55DbwssMCqSnolbOx1N3cmPy8M7MMArwwU6R3mkiipQdYUrOkVV5mF2XHQyo0uHDTHgtCwZs5e/31fw7pWh9X4eKE91zImAz8Zt0iLTcmXne/fjNe70=
Received: from CH0PR03CA0081.namprd03.prod.outlook.com (2603:10b6:610:cc::26)
 by CH0PR10MB4922.namprd10.prod.outlook.com (2603:10b6:610:c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 19:52:01 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:610:cc:cafe::31) by CH0PR03CA0081.outlook.office365.com
 (2603:10b6:610:cc::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 19:51:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 19:52:00 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 13:51:59 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Feb
 2026 13:51:59 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 2 Feb 2026 13:51:59 -0600
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 612Jpxeq2711104;
	Mon, 2 Feb 2026 13:51:59 -0600
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1vmzxn-000000081Yl-01nu;
	Mon, 02 Feb 2026 13:51:59 -0600
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 1/2] u-boot: Add alternative key signing
Date: Mon, 2 Feb 2026 13:51:57 -0600
Message-ID: <20260202195158.1912610-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|CH0PR10MB4922:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e52128-d113-42b1-0a2f-08de629487fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?97IMcq0YAK6BUt0IOt3wNG5YF9jeuzuLTWMA5onili1oP90XcmVLx+/R533W?=
 =?us-ascii?Q?aYyNUfiPRD79dhUH/ubaJWKrxMpLEAJcPxhgWI/49fSk9CWPrgbrGec3L1/u?=
 =?us-ascii?Q?PCgrAuBhkZJdnIlPD2OmoLt7Li4LDoh2dxik7LUasak5C5JdtMvTXF4sy0ke?=
 =?us-ascii?Q?YJ1hcbbgUFNRZAmajZ54Yal7O19CXqxcLdpDBnRhkPnGhjCqkvnfBsRQTzho?=
 =?us-ascii?Q?J+SPoMufuNPeJjtj8vWEcKdJUNt3A3NlBmPTMGR6xiPh+cd1J1wri0SxViae?=
 =?us-ascii?Q?t21lvTQyiNRYRjzNgU6+gJbYHAZyEK4nOAAefMM4AJVLWMlMqKAbAy/LDJmJ?=
 =?us-ascii?Q?dlr0nhn+cK3TrplJFvj75P5l/k6Mgbr9gCfa1YOv6l2i3uWnfklVtY2w0xQV?=
 =?us-ascii?Q?mkG2uJb9AveGs4bx5j4GvXUxvejR5MpMNzvW1rPq5eUm8uka+0JS79OStSSt?=
 =?us-ascii?Q?S432Au1dUdYmavSoXuUI9Kf495UYew1VVFIMMlmoTVtMK0J5cZpMZJT8KqCk?=
 =?us-ascii?Q?t+BVE0aRjjyTKxAWJCaISsTyUg+FqPTFZax2/5sGfjzXvVV2ahncliLu228K?=
 =?us-ascii?Q?7LaquwQWJsrEo0Y9k8WuAPmuAdUJnGYHVEom25XytQedMQHPB7SoX8E5PKQD?=
 =?us-ascii?Q?gxepa7FzuYKjkv7gY/e3LFMdu6pjCb9mCg2wHykpCw2BCpkGaQGI8UlVoCYT?=
 =?us-ascii?Q?i2z/PL8fb+uBH8iORa9g3BYwm0PaLBxEJ8co0XWDKwjiEZWI+IciCaoVOZVg?=
 =?us-ascii?Q?4HCWj2E5T90lOQZaFF7I9K3OIo1Edy++V3wgyXPRW+4o3cmuhN7Xqw4Fnglj?=
 =?us-ascii?Q?hoQW8rA0pnjfcCNCWAl432InGZy+srsBcDS4blxzeBaeCS3vyuDoe9JWy8K4?=
 =?us-ascii?Q?LF0MXBuv4bEnusEPEPoZ+pqthjA1Mjq8MIzbdPsRKeVB8GbC4hffvRr33TGP?=
 =?us-ascii?Q?UmQE/GuLVWvjX8oEeMJBrlVi/k8+yZrGjqJ44Cr04lGYC0U4hh/ZFqishAbv?=
 =?us-ascii?Q?zN7FxsDV4Xl/HSLRx6UhMtc9mMQJxkTRTF8XSJCpcoN9bKcVKbIJPIelQOsY?=
 =?us-ascii?Q?1wJftqzSD2NltjsOTybp1UUePliq3xEuuaVFk51f2f78rSiDB3Df1rvI6tYa?=
 =?us-ascii?Q?h27xuuPZm00wV6CthszsoWsH8AABjzzBgnUC7TAkgu4heoPkTTZAKflDjpsm?=
 =?us-ascii?Q?JiGI4e5YBqJEYCm18huxjQnsnk3BEVMGu0hFN+SzjqTODlVfKBjgXUddOE6/?=
 =?us-ascii?Q?WYk6uMN8aAmv8yKtv2YIiyVIKfiP5PiwWOAQ6xoXFeWQ9nwirL8fcSVOc68M?=
 =?us-ascii?Q?/0gbdNllOPMI7TW2Rdi1hwIye2NgeDmohMUMB1qlq72cHzeC5UG7O+kZhYrw?=
 =?us-ascii?Q?Yk1I4MF50A5Z1ObbzBOwdua9MmCmpignYeP6l3GTcNjnwGjULb4P5psJyFMK?=
 =?us-ascii?Q?46pBY97UgtNA58sxfTgKYR/5Bm/m24vNDjdyJmXDXntZPp491qif3UzWOQdB?=
 =?us-ascii?Q?9SWFauknOsQ2O3KeZfjP3fB5JHq2aZjHgbpGI0idYTJzNnlYkT/Mm5pD/Olj?=
 =?us-ascii?Q?9rc2EmbTkZxoV46jxc8VftcsF++u+6AmgomgW7CjMxCjMu1gaIcYX/OAYv8y?=
 =?us-ascii?Q?BTnl3ZwC1c/3c1NwQtH6V8NT5vJJYhTi+eQFy2apY5SfD5omwnZhamfd5mr/?=
 =?us-ascii?Q?lA6A5w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	U028+4qQThufy9l6brMoxAbHUPa9NY/cD7c37AzkIzWYLjmewwuOdPi6Po0W1CZBsR21FgF0sMvArbGpM1jxFXgmfyJTNLaNOXwuCeoTUyEXHu24Kf12Dipy89Vp7vS+xLV/JnmxES1Ybn9Oz4pXEUm8EaLRjzuhe946Ew2iP1+h1OZP4/WLa30tJ6bv2r35NOAVJV0BflB2wUBLrZR/zT7yCvtB18ZeUGJUqSnDzdGCdZXogEehx3Z0FF6mlO6xYXFrZaKf8ibPyDDVirSUtck0dqEHvmFiEgdf2qhzdnUUAx2HZ1rxZR3Fh2KNUA+kfRbwDZ7kaqAEKZTTDfoa6RNihcgDWgcZD3LEgr2wX3lYb8z+yyf76zV8iTaz/JMWRr32AN6D8/cx3Rn4f5s3zD1fIW5/MCDbXeZ4xl4m2gvjRHyc5t5L2U1AuqudFuLW
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 19:52:00.8327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e52128-d113-42b1-0a2f-08de629487fc
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4922
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Feb 2026 19:52:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19455

Provide framework for how to sign the uboot files with different keys
so that customers can see how it is done.  We have provided an ECDSA
key and follow on patches will show how to point to it.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/files/custMpk_ecdsa.key | 6 ++++++
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc           | 2 ++
 2 files changed, 8 insertions(+)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/custMpk_ecdsa.key

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/custMpk_ecdsa.key b/meta-=
ti-bsp/recipes-bsp/u-boot/files/custMpk_ecdsa.key
new file mode 100644
index 00000000..83dffcda
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/files/custMpk_ecdsa.key
@@ -0,0 +1,6 @@
+-----BEGIN EC PRIVATE KEY-----
+MIGkAgEBBDBDO9fzBU2LoKaYgji4m3ZCHKUBF9CTVnU6ClfNPJsTo0SKZpCsmyr0
+TKUNkk16vwGgBwYFK4EEACKhZANiAATCv6ftwnJW91fP5wpLpLAxt3u732oNnKr8
+pLbZUzi/s8/e7QiISJ8QKYGaWMnjORW82cM3UJKlCw8GOrb3ZrEXYWRKxkPWql0+
+BOhDQA5b21GtL9HQPvuCPz471ZaxGYA=3D
+-----END EC PRIVATE KEY-----
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/rec=
ipes-bsp/u-boot/u-boot-ti.inc
index 773fa1e2..678f3bcf 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -416,3 +416,5 @@ PACKAGES:prepend:am62pxx-evm =3D "${FALCON_PKG} "
 PACKAGES:prepend:am62xx-lp-evm =3D "${FALCON_PKG} "
=20
 TOOLCHAIN =3D "gcc"
+
+TI_SIGN_WITH_ECDSA_KEY ?=3D "KEY_PATH=3D${THISDIR}/files/custMpk_ecdsa.key=
"
--=20
2.43.0


