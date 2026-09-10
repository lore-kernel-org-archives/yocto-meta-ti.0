Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17BD6C79FB7
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 00:59:19 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3434.1789001953621290562
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 09 Sep 2026 17:59:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=nJx68kiC;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=dgZS1s0i;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 689MA2XV3700104;
	Wed, 9 Sep 2026 19:59:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=AEdAdq0OTZAh4
	0j+CSlXz3YxgWrpSUuBcdkfuX4MYRM=; b=nJx68kiCxUW77XCPKLKgfTbzg+TDk
	xF7n4FcwHd+hOJFxKyvy3SAF0NrsG68V/3AH8N1RJN6NZIYeLpFCjwPMYDkqvUv9
	tlFMXkPTlT4R4Axtpd0QTWOYxfHZzavqgfRMcRYGyLD7K/OBCtBWIWhWCK7r256C
	mSu5yqo2IGMZ4JizAnMaO0tWxqN7fWLSc1vYq6XeTv7dI67boBIh+1o/2beSHUih
	CgppCiA1gTqsd0V21fywRetk68P+hRy+xn++CW5qAiRPHt94WHaDBD8E3gsPfaTM
	k6ETZcd6mrUvP3nxmY6A7ai37Qbz+8Byg4GKrVxzJddi3WS9grFnD+CgQ==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gkcxg9xsa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 09 Sep 2026 19:59:11 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LVXyu+khFUsNYQQQGtRoP4/F+WBhvQgHQOmGAYuKpOvLXWtaDhF0zbtNrgKea0ELt3gIsPUvAP0KUfW+uf98OgUDXBFBWPdYylZ6WkVNUQ26Nn+7TA4MX7CI4E+X0FOXFHmEU79IGidipW++ekNBCRuDQ5+waNNVJ6e6Prg8aYZ4lmww1wg8Qw0mgC42n60YPOmfY0C63nHowQ7smRXNG2lh14DtI3R8OPHuiUAVtkH7PPZy/zphcMuJYYvxTdUc9F+tRO/7ved53uN28qMAqM7gJrhz8zp4gQJ3mdQ01lK2ml1eu55hSN1ETxxwVb3XOiit7BQs5d/tVT/vgREsaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEdAdq0OTZAh40j+CSlXz3YxgWrpSUuBcdkfuX4MYRM=;
 b=rrWD0w4zGGRgV1KAiiJ2UUDe/Uz0xq5POxYu0sM8rFphJT0khgELwcmtXqsZfUjon4ZZyZcWYjyCwCgCtMMPZ7vlmWAQoPa8M0b2hd64eY162RFHizXRv7hVar8aFJuKY4Pv7p+hkS4O8WTL8yGaXxpsb2ddrCaOCcP674gDPYDbfRIiNVRsVNq8E8hHn5Q6sZwV1+bbqcJnGjbP4GNW7TCHn6stgeQWvEbXP3DNisHSOB4hhmH7gCpLjCfFOsiI4Ra5OO/UGseOP0OIa+hA1geBKrIlub8rdirGkJGekTBPz9RoeTW4soZIcHBeOFWQL5gw83G9G2bZZPl1zEa1Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEdAdq0OTZAh40j+CSlXz3YxgWrpSUuBcdkfuX4MYRM=;
 b=dgZS1s0iaqPyQXuKdfILro8pph1xQpbFoHo2OdG5cN7RYrZu+u8AfktjhhBltTeMBdDcVn4UvW2YZAz7dyAhQ8UwdCUPSg8p8tcGkU48sSC/3WcOnsJeCBaDgs90iz/q2mfUB73de9gNYepzYCQEwp8rgSVN8wUzDRlZxGFgbfI=
Received: from SJ0PR03CA0197.namprd03.prod.outlook.com (2603:10b6:a03:2ef::22)
 by CO6PR10MB5633.namprd10.prod.outlook.com (2603:10b6:303:148::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.4; Thu, 10 Sep
 2026 00:58:56 +0000
Received: from SJ5PEPF00000208.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::3a) by SJ0PR03CA0197.outlook.office365.com
 (2603:10b6:a03:2ef::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Thu,
 10 Sep 2026 00:58:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ5PEPF00000208.mail.protection.outlook.com (10.167.244.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 00:58:56 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:22 -0500
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 9 Sep
 2026 19:58:22 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 9 Sep 2026 19:58:22 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68A0wMnF2306715;
	Wed, 9 Sep 2026 19:58:22 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1x4T7O-0000000GEvo-0OfZ;
	Wed, 09 Sep 2026 19:58:22 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 1/5] u-boot-ti-staging: Fixes for OpenSSL 4.0
Date: Wed, 9 Sep 2026 19:58:16 -0500
Message-ID: <20260910005822.3867633-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000208:EE_|CO6PR10MB5633:EE_
X-MS-Office365-Filtering-Correlation-Id: c32f893c-9fa0-4096-5937-08df0ed6b0c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|13003099007|6133799003|3023799007|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	lhVIA43G7ygCVVh0UghulPm3OjgiNo0DMBPSDL4RyoiCtnDMi3xiK4oHYxYeh6iahvHk5E0Kkl+hTB9EPZ9iaYLra6AKIUbrQCCgZu7peTEMJGH/78C7ePRNHiBJBb87CKogk7+oYk9B9d+X0PWN+Cyg0XuzX1/yzkYl29QyA22i1VZ3akPL3E3WkFbmD3SVjNQECIMeM1WW/ozBhxcZy+LHWhakt1Es/Lt+iXPYdIXIAIPlV7vNyYGDUlFAFWlekEZPUWM9TaqJYz3mPw8e+aw5WeUQP4aMGJ3p1jaais2SQrk7KNyfNRBrdl4PMi3ZFEdo7doA1CZxZZ7liXcWxdRXYVIowVn/ZrOc4eYDqWTNEduV8Eitq//yTj+iWI5EmAXI5vPEm6/u1AFpDyK9M5puhFvjjAhUegyuWdypDpLjWZQTVaXhn3cFP2o6pFhBv+RP5+/qxBxjaj0ifMH3BG897rc9HA4e4Fr5PCf/Zs+mFs9a1d9PjRO1rwYAX1aXrK1v4Vv/9AzLMBMNv77cXPnWeOLsE8hQDACN+Qiu2+CDYcL2JZIWsDHcaBh1WIZueXg+nA82i64Kv42AJImfVjZ3OCS9jJwG/ZqsbRxxXuFVHabUPVGgJXr+b1dSwm+GWNU96dDBZUA5R1MgbEjrZGk8jY+P+op8BhX3PkCPHaOVpGCSe4A4nv7jJOdCVKG3FUBciMVV9MREeYCbowrORA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(13003099007)(6133799003)(3023799007)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	ywr/txqbBpTyfvH6fhePxj9IMwcNtlYOEQX3Ygxd7c0D+ACTVpa1eupupBufKBCIGiTi0CjO3T+gkX4ia+W2J7OHXL7gi1GYcKvxmdqwKHfJ+ug2VbNM19D/4+jwO/XBgjSdrLpukehPGd4N5uxaRzi3cdVHWwFcc/7K9dwj6Fm37e+JzLKA24K4WJrl6M/oIIXCfwzzoRDy09gmsLKPaQOSv1k/sOyVoXmvv1zSf3yXR9m6MwKN/ovmwluTIYiQEoX4ekVinN9zWZIwPWdcqJMbU9m2AcngXcVgtsJexs9Szz1bG7DdWwI5zUEu1Cc7BtJQLuoi29psJI94dZ186vVMzxhja1i5oPB8HagpteaiBnYvporfmeIMpmZXeAyo2jVyogycKKhOK1ETfis7C+/n6DOu64b+V4TsPpoKmX4meRa9Qva3P6r3lES+aubP
X-Exchange-RoutingPolicyChecked: 
	IkPsdlHA7C109M8py1EPy0FiVl0FCnTMrf0tMnstAiQr/lyKa2vA0kUYMK9Vdt2ZhyhfP1CqqAmfl/VbkgkBFGyRIqHjGElDmllubFrLeoKZYHoA60DaB8GMsHxcg+ISLPs2BuVEHoX5BA/5DyCKassdWPlfiVl+7oEdRjuTrcAeQoPdONxBqBkozfuF6N7zN6NyIp+4UBt/Aw/i7mVRxu268YovHo+ID2aauBbSJNEhMVdREe/2cvUL3YWNH2+zXoGbiCWEXBUMzIP7hbCqo9Wl0+dKU1cdh1u/qNOYLYRV330HDC7m8HPJXnwoVcb/3E9JDBWuH6er+7TEtfm9CA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 00:58:56.0242
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c32f893c-9fa0-4096-5937-08df0ed6b0c7
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF00000208.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5633
X-Proofpoint-ORIG-GUID: AfXjiqkG0GJoQTdtVGRJP24a2XaROxmj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDAwOSBTYWx0ZWRfX2McJJDuTlrRX
 V87unBtP1vE94M7XviXiWa6cNjdvKktjyLAY2PxCt3Ab+4LDC0FnyrvwC8KsIEKqt++BmiuFoid
 U8yKH3DMwNvso5ekK+oJAQzok2YMysE=
X-Proofpoint-GUID: AfXjiqkG0GJoQTdtVGRJP24a2XaROxmj
X-Authority-Analysis: v=2.4 cv=MqbHeGae c=1 sm=1 tr=0 ts=6aa200df cx=c_pps
 a=8o+REoaIO3XrXU6fRoneHA==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=Q4-j1AaZAAAA:8 a=VwQbUJbxAAAA:8 a=20KFwNOVAAAA:8 a=sozttTNsAAAA:8
 a=ptNznvi-AAAA:8 a=kWlOZTdTBx2Y8M_f7woA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=__MQohX_fo54y4GeBRKl:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDAwOSBTYWx0ZWRfXycw1Y7Z1trP4
 csEW9Ox724uB/vZcASjGkGTNhD+aWHGx+TchX+1UO3aOWLJRhatLxltPmtTW6DVQ4svgYBthwqz
 C1fekA/TKM0wYPHDxsZLh5rdx4+yEWtrgEiftQV7GMwMb9BkM09RyyLphIxwwBhPjAk63Rspy8H
 dfiT2O6jod2PRjXz48dxAG5LfoY179C3UlIseIP8z+aiixU+hc4w0WvJjNgZqfuzCFIY45tVmjo
 bFpHxafc1uJ1eBCi0Fbq8zmm49IuIXC53RCCwxcznp9HVGFD3KRRH8WzbarmJhTicxKqF4i0bRe
 A9+GyQqBGYjZW+egIfXAVMYDfkKRxTIYkmrBqm0vVFBKnQ27IhjZjUgEgYQdNKrnL7nK6o4cL9X
 mSu8ObVoDUAp70ftLoyfzUPi0kbnpcTJVsSz2YIPtBYyCl9rlwisMR1/NllHj4nkcC1u96PDwIz
 xFqanHxxsYW7B4m/hGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-09_02,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100009
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 10 Sep 2026 00:59:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20354

With the recent move to OpenSSL 4.0 [1] we need to update the same code
in the various u-boot versions that we support.

[1] https://git.openembedded.org/openembedded-core/commit/?id=20bf704e5809e95036b998f0f45145cf7205b05b

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...ort-for-OpenSSL-Provider-API-2024-04.patch | 300 ++++++++++++++++
 ...ort-for-OpenSSL-Provider-API-2025-01.patch | 300 ++++++++++++++++
 ...ort-for-OpenSSL-Provider-API-2026-01.patch | 340 ++++++++++++++++++
 .../u-boot/u-boot-ti-staging_2024.04.bb       |   6 +-
 .../u-boot/u-boot-ti-staging_2025.01.bb       |   1 +
 .../u-boot/u-boot-ti-staging_2026.01.bb       |   2 +
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc  |   1 +
 7 files changed, 948 insertions(+), 2 deletions(-)
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch
 create mode 100644 meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch
new file mode 100644
index 00000000..9f67644b
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch
@@ -0,0 +1,300 @@
+From 401c19f6b0a7c63afad92e9d3f2cbb75d6ed8566 Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Wed, 9 Sep 2026 10:04:50 -0500
+Subject: [PATCH] Add support for OpenSSL Provider API
+
+Backport from 2026.01 patch [1] by Ryan Eatmon <reatmon@ti.com>
+
+Upsatream-Status: Inappropriate [OE-specific]
+
+The Engine API has been deprecated since the release of OpenSSL 3.0. End
+users have been advised to migrate to the new Provider interface.
+Several distributions have already removed support for engines, which is
+preventing U-Boot from being compiled in those environments.
+
+Add support for the Provider API while continuing to support the existing
+Engine API on distros shipping older releases of OpenSSL.
+
+This is based on similar work contributed by Jan Stancek updating Linux
+to use the Provider interface.
+
+    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
+    Author: Jan Stancek <jstancek@redhat.com>
+    Date:   Fri Sep 20 19:52:48 2024 +0300
+
+        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
+
+The changes have been tested with the FIT signature verification vboot
+tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
+Engine library installed and with the Provider API.
+
+Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
+
+Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/]
+
+Note: Modified to make pkcs11 provider loading optional. The upstream
+patch unconditionally requires the pkcs11 provider, which is not
+available in the OE build environment. File-based key signing only needs
+the default provider; pkcs11 is only required for pkcs11: URI keys.
+Changes from upstream:
+ - Load default provider first (was pkcs11 first)
+ - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
+   of ERR(1, ...) which calls errx/abort)
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ lib/aes/aes-encrypt.c |  4 +-
+ lib/rsa/rsa-sign.c    | 95 ++++++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 97 insertions(+), 2 deletions(-)
+
+diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
+index e74e35eaa28..8a6f7715df9 100644
+--- a/lib/aes/aes-encrypt.c
++++ b/lib/aes/aes-encrypt.c
+@@ -16,7 +16,9 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++# include <openssl/engine.h>
++#endif
+ #include <uboot_aes.h>
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x10000000L
+diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
+index 2304030e32f..29b3bd3dbb1 100644
+--- a/lib/rsa/rsa-sign.c
++++ b/lib/rsa/rsa-sign.c
+@@ -19,7 +19,47 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if OPENSSL_VERSION_MAJOR >= 3
++# define USE_PKCS11_PROVIDER
++# include <err.h>
++# include <openssl/provider.h>
++# include <openssl/store.h>
++#else
++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++#  define USE_PKCS11_ENGINE
++#  include <openssl/engine.h>
++# endif
++#endif
++
++#ifdef USE_PKCS11_PROVIDER
++#define ERR(cond, fmt, ...)				\
++	do {						\
++		bool __cond = (cond);			\
++		drain_openssl_errors(__LINE__, 0);	\
++		if (__cond) {				\
++			errx(1, fmt, ## __VA_ARGS__);	\
++		}					\
++	} while (0)
++
++static void drain_openssl_errors(int l, int silent)
++{
++	const char *file;
++	char buf[120];
++	int e, line;
++
++	if (ERR_peek_error() == 0)
++		return;
++	if (!silent)
++		fprintf(stderr, "At main.c:%d:\n", l);
++
++	while ((e = ERR_peek_error_line(&file, &line))) {
++		ERR_error_string(e, buf);
++		if (!silent)
++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
++		ERR_get_error();
++	}
++}
++#endif
+ 
+ static int rsa_err(const char *msg)
+ {
+@@ -98,6 +138,7 @@ err_cert:
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 				  ENGINE *engine, EVP_PKEY **evpp)
+ {
+@@ -157,6 +198,7 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_pub_key() - read a public key
+@@ -170,8 +212,10 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ static int rsa_get_pub_key(const char *keydir, const char *name,
+ 			   ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
++#endif
+ 	return rsa_pem_get_pub_key(keydir, name, evpp);
+ }
+ 
+@@ -207,6 +251,38 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+ 		return -ENOENT;
+ 	}
+ 
++#ifdef USE_PKCS11_PROVIDER
++	EVP_PKEY *private_key = NULL;
++	OSSL_STORE_CTX *store;
++
++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
++		ERR(1, "OSSL_PROVIDER_try_load(default)");
++	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
++		ERR_clear_error();
++
++	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
++	ERR(!store, "OSSL_STORE_open");
++
++	while (!OSSL_STORE_eof(store)) {
++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
++
++		if (!info) {
++			drain_openssl_errors(__LINE__, 0);
++			continue;
++		}
++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
++			private_key = OSSL_STORE_INFO_get1_PKEY(info);
++			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
++		}
++		OSSL_STORE_INFO_free(info);
++		if (private_key)
++			break;
++	}
++	OSSL_STORE_close(store);
++
++	*evpp = private_key;
++#else
+ 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
+ 		rsa_err("Failure reading private key");
+ 		fclose(f);
+@@ -214,6 +290,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+ 	}
+ 	fclose(f);
+ 
++#endif
+ 	return 0;
+ }
+ 
+@@ -226,6 +303,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 				   const char *keyfile,
+ 				   ENGINE *engine, EVP_PKEY **evpp)
+@@ -293,6 +371,7 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_priv_key() - read a private key
+@@ -306,9 +385,11 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ static int rsa_get_priv_key(const char *keydir, const char *name,
+ 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
+ 					       evpp);
++#endif
+ 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
+ }
+ 
+@@ -325,6 +406,7 @@ static int rsa_init(void)
+ 	return 0;
+ }
+ 
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_init(const char *engine_id, ENGINE **pe)
+ {
+ 	const char *key_pass;
+@@ -372,6 +454,7 @@ err_engine_init:
+ 	ENGINE_free(e);
+ 	return ret;
+ }
++#endif
+ 
+ static void rsa_engine_remove(ENGINE *e)
+ {
+@@ -471,11 +554,13 @@ int rsa_sign(struct image_sign_info *info,
+ 	if (ret)
+ 		return ret;
+ 
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 
+ 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
+ 			       e, &pkey);
+@@ -487,16 +572,20 @@ int rsa_sign(struct image_sign_info *info,
+ 		goto err_sign;
+ 
+ 	EVP_PKEY_free(pkey);
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	return ret;
+ 
+ err_sign:
+ 	EVP_PKEY_free(pkey);
+ err_priv:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 	return ret;
+ }
+ 
+@@ -636,11 +725,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
+ 	ENGINE *e = NULL;
+ 
+ 	debug("%s: Getting verification data\n", __func__);
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
+ 	if (ret)
+ 		goto err_get_pub_key;
+@@ -717,8 +808,10 @@ done:
+ err_get_params:
+ 	EVP_PKEY_free(pkey);
+ err_get_pub_key:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	if (ret)
+ 		return ret;
+-- 
+2.43.0
+
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch
new file mode 100644
index 00000000..c5f3655e
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch
@@ -0,0 +1,300 @@
+From 0525693750b1b7a8fb7228dbb97bf592a21322fc Mon Sep 17 00:00:00 2001
+From: Ryan Eatmon <reatmon@ti.com>
+Date: Wed, 9 Sep 2026 10:04:50 -0500
+Subject: [PATCH] Add support for OpenSSL Provider API
+
+Backport from 2026.01 patch [1] by Ryan Eatmon <reatmon@ti.com>
+
+Upsatream-Status: Inappropriate [OE-specific]
+
+The Engine API has been deprecated since the release of OpenSSL 3.0. End
+users have been advised to migrate to the new Provider interface.
+Several distributions have already removed support for engines, which is
+preventing U-Boot from being compiled in those environments.
+
+Add support for the Provider API while continuing to support the existing
+Engine API on distros shipping older releases of OpenSSL.
+
+This is based on similar work contributed by Jan Stancek updating Linux
+to use the Provider interface.
+
+    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
+    Author: Jan Stancek <jstancek@redhat.com>
+    Date:   Fri Sep 20 19:52:48 2024 +0300
+
+        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
+
+The changes have been tested with the FIT signature verification vboot
+tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
+Engine library installed and with the Provider API.
+
+Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
+
+Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/]
+
+Note: Modified to make pkcs11 provider loading optional. The upstream
+patch unconditionally requires the pkcs11 provider, which is not
+available in the OE build environment. File-based key signing only needs
+the default provider; pkcs11 is only required for pkcs11: URI keys.
+Changes from upstream:
+ - Load default provider first (was pkcs11 first)
+ - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
+   of ERR(1, ...) which calls errx/abort)
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+
+Signed-off-by: Ryan Eatmon <reatmon@ti.com>
+---
+ lib/aes/aes-encrypt.c |  4 +-
+ lib/rsa/rsa-sign.c    | 95 ++++++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 97 insertions(+), 2 deletions(-)
+
+diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
+index e74e35eaa28..8a6f7715df9 100644
+--- a/lib/aes/aes-encrypt.c
++++ b/lib/aes/aes-encrypt.c
+@@ -16,7 +16,9 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++# include <openssl/engine.h>
++#endif
+ #include <uboot_aes.h>
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x10000000L
+diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
+index fa9e143b4ca..af5b18e0c95 100644
+--- a/lib/rsa/rsa-sign.c
++++ b/lib/rsa/rsa-sign.c
+@@ -19,7 +19,47 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if OPENSSL_VERSION_MAJOR >= 3
++# define USE_PKCS11_PROVIDER
++# include <err.h>
++# include <openssl/provider.h>
++# include <openssl/store.h>
++#else
++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++#  define USE_PKCS11_ENGINE
++#  include <openssl/engine.h>
++# endif
++#endif
++
++#ifdef USE_PKCS11_PROVIDER
++#define ERR(cond, fmt, ...)				\
++	do {						\
++		bool __cond = (cond);			\
++		drain_openssl_errors(__LINE__, 0);	\
++		if (__cond) {				\
++			errx(1, fmt, ## __VA_ARGS__);	\
++		}					\
++	} while (0)
++
++static void drain_openssl_errors(int l, int silent)
++{
++	const char *file;
++	char buf[120];
++	int e, line;
++
++	if (ERR_peek_error() == 0)
++		return;
++	if (!silent)
++		fprintf(stderr, "At main.c:%d:\n", l);
++
++	while ((e = ERR_peek_error_line(&file, &line))) {
++		ERR_error_string(e, buf);
++		if (!silent)
++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
++		ERR_get_error();
++	}
++}
++#endif
+ 
+ static int rsa_err(const char *msg)
+ {
+@@ -98,6 +138,7 @@ err_cert:
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 				  ENGINE *engine, EVP_PKEY **evpp)
+ {
+@@ -157,6 +198,7 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_pub_key() - read a public key
+@@ -170,8 +212,10 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ static int rsa_get_pub_key(const char *keydir, const char *name,
+ 			   ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
++#endif
+ 	return rsa_pem_get_pub_key(keydir, name, evpp);
+ }
+ 
+@@ -207,6 +251,38 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+ 		return -ENOENT;
+ 	}
+ 
++#ifdef USE_PKCS11_PROVIDER
++	EVP_PKEY *private_key = NULL;
++	OSSL_STORE_CTX *store;
++
++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
++		ERR(1, "OSSL_PROVIDER_try_load(default)");
++	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
++		ERR_clear_error();
++
++	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
++	ERR(!store, "OSSL_STORE_open");
++
++	while (!OSSL_STORE_eof(store)) {
++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
++
++		if (!info) {
++			drain_openssl_errors(__LINE__, 0);
++			continue;
++		}
++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
++			private_key = OSSL_STORE_INFO_get1_PKEY(info);
++			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
++		}
++		OSSL_STORE_INFO_free(info);
++		if (private_key)
++			break;
++	}
++	OSSL_STORE_close(store);
++
++	*evpp = private_key;
++#else
+ 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
+ 		rsa_err("Failure reading private key");
+ 		fclose(f);
+@@ -214,6 +290,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+ 	}
+ 	fclose(f);
+ 
++#endif
+ 	return 0;
+ }
+ 
+@@ -226,6 +303,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 				   const char *keyfile,
+ 				   ENGINE *engine, EVP_PKEY **evpp)
+@@ -293,6 +371,7 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_priv_key() - read a private key
+@@ -306,9 +385,11 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ static int rsa_get_priv_key(const char *keydir, const char *name,
+ 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
+ 					       evpp);
++#endif
+ 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
+ }
+ 
+@@ -325,6 +406,7 @@ static int rsa_init(void)
+ 	return 0;
+ }
+ 
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_init(const char *engine_id, ENGINE **pe)
+ {
+ 	const char *key_pass;
+@@ -372,6 +454,7 @@ err_engine_init:
+ 	ENGINE_free(e);
+ 	return ret;
+ }
++#endif
+ 
+ static void rsa_engine_remove(ENGINE *e)
+ {
+@@ -480,11 +563,13 @@ int rsa_sign(struct image_sign_info *info,
+ 	if (ret)
+ 		return ret;
+ 
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 
+ 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
+ 			       e, &pkey);
+@@ -496,16 +581,20 @@ int rsa_sign(struct image_sign_info *info,
+ 		goto err_sign;
+ 
+ 	EVP_PKEY_free(pkey);
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	return ret;
+ 
+ err_sign:
+ 	EVP_PKEY_free(pkey);
+ err_priv:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 	return ret;
+ }
+ 
+@@ -645,11 +734,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
+ 	ENGINE *e = NULL;
+ 
+ 	debug("%s: Getting verification data\n", __func__);
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
+ 	if (ret)
+ 		goto err_get_pub_key;
+@@ -726,8 +817,10 @@ done:
+ err_get_params:
+ 	EVP_PKEY_free(pkey);
+ err_get_pub_key:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	if (ret)
+ 		return ret;
+-- 
+2.43.0
+
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch
new file mode 100644
index 00000000..346d0584
--- /dev/null
+++ b/meta-ti-bsp/recipes-bsp/u-boot/files/0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch
@@ -0,0 +1,340 @@
+From a81cb0932dce109af44d7245d47489fe54ae390f Mon Sep 17 00:00:00 2001
+From: Eddie Kovsky <ewk@edkovsky.org>
+Date: Mon, 23 Feb 2026 09:43:22 -0700
+Subject: [PATCH] Add support for OpenSSL Provider API
+
+The Engine API has been deprecated since the release of OpenSSL 3.0. End
+users have been advised to migrate to the new Provider interface.
+Several distributions have already removed support for engines, which is
+preventing U-Boot from being compiled in those environments.
+
+Add support for the Provider API while continuing to support the existing
+Engine API on distros shipping older releases of OpenSSL.
+
+This is based on similar work contributed by Jan Stancek updating Linux
+to use the Provider interface.
+
+    commit 558bdc45dfb2669e1741384a0c80be9c82fa052c
+    Author: Jan Stancek <jstancek@redhat.com>
+    Date:   Fri Sep 20 19:52:48 2024 +0300
+
+        sign-file,extract-cert: use pkcs11 provider for OPENSSL MAJOR >= 3
+
+The changes have been tested with the FIT signature verification vboot
+tests on Fedora 42 and Debian 13. All 30 tests pass with both the legacy
+Engine library installed and with the Provider API.
+
+Signed-off-by: Eddie Kovsky <ewk@edkovsky.org>
+
+Upstream-Status: Submitted [https://lore.kernel.org/u-boot/20260429180247.83091-1-ekovsky@redhat.com/]
+
+Note: Modified to make pkcs11 provider loading optional. The upstream
+patch unconditionally requires the pkcs11 provider, which is not
+available in the OE build environment. File-based key signing only needs
+the default provider; pkcs11 is only required for pkcs11: URI keys.
+Changes from upstream:
+ - Load default provider first (was pkcs11 first)
+ - Make pkcs11 provider load failure non-fatal (ERR_clear_error instead
+   of ERR(1, ...) which calls errx/abort)
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ doc/build/gcc.rst      |   4 +-
+ lib/aes/aes-encrypt.c |   4 +-
+ lib/rsa/rsa-sign.c    | 102 +++++++++++++++++++++++++++++++++++++++---
+ tools/docker/Dockerfile |  1 +
+ 4 files changed, 103 insertions(+), 8 deletions(-)
+
+diff --git a/doc/build/gcc.rst b/doc/build/gcc.rst
+index 1fef718ceecb..29a6a632e7e3 100644
+--- a/doc/build/gcc.rst
++++ b/doc/build/gcc.rst
+@@ -25,8 +25,8 @@ Depending on the build targets further packages maybe needed
+ 
+     sudo apt-get install bc bison build-essential coccinelle \
+       device-tree-compiler dfu-util efitools flex gdisk graphviz imagemagick \
+-      libgnutls28-dev libguestfs-tools libncurses-dev \
+-      libpython3-dev libsdl2-dev libssl-dev lz4 lzma lzma-alone openssl \
++      libgnutls28-dev libguestfs-tools libncurses-dev libpython3-dev \
++      libsdl2-dev libssl-dev lz4 lzma lzma-alone openssl pkcs11-provider \
+       pkg-config python3 python3-asteval python3-coverage python3-filelock \
+       python3-pkg-resources python3-pycryptodome python3-pyelftools \
+       python3-pytest python3-pytest-xdist python3-sphinxcontrib.apidoc \
+diff --git a/lib/aes/aes-encrypt.c b/lib/aes/aes-encrypt.c
+index 90e1407b4f09..4fc4ce232478 100644
+--- a/lib/aes/aes-encrypt.c
++++ b/lib/aes/aes-encrypt.c
+@@ -16,7 +16,9 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++# include <openssl/engine.h>
++#endif
+ #include <uboot_aes.h>
+ 
+ #if OPENSSL_VERSION_NUMBER >= 0x10000000L
+diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
+index 0e38c9e802fd..f456f3c58e65 100644
+--- a/lib/rsa/rsa-sign.c
++++ b/lib/rsa/rsa-sign.c
+@@ -19,7 +19,47 @@
+ #include <openssl/err.h>
+ #include <openssl/ssl.h>
+ #include <openssl/evp.h>
+-#include <openssl/engine.h>
++#if OPENSSL_VERSION_MAJOR >= 3
++# define USE_PKCS11_PROVIDER
++# include <err.h>
++# include <openssl/provider.h>
++# include <openssl/store.h>
++#else
++# if !defined(OPENSSL_NO_ENGINE) && !defined(OPENSSL_NO_DEPRECATED_3_0)
++#  define USE_PKCS11_ENGINE
++#  include <openssl/engine.h>
++# endif
++#endif
++
++#ifdef USE_PKCS11_PROVIDER
++#define ERR(cond, fmt, ...)				\
++	do {						\
++		bool __cond = (cond);			\
++		drain_openssl_errors(__LINE__, 0);	\
++		if (__cond) {				\
++			errx(1, fmt, ## __VA_ARGS__);	\
++		}					\
++	} while (0)
++
++static void drain_openssl_errors(int l, int silent)
++{
++	const char *file;
++	char buf[120];
++	int e, line;
++
++	if (ERR_peek_error() == 0)
++		return;
++	if (!silent)
++		fprintf(stderr, "At main.c:%d:\n", l);
++
++	while ((e = ERR_peek_error_line(&file, &line))) {
++		ERR_error_string(e, buf);
++		if (!silent)
++			fprintf(stderr, "- SSL %s: %s:%d\n", buf, file, line);
++		ERR_get_error();
++	}
++}
++#endif
+ 
+ static int rsa_err(const char *msg)
+ {
+@@ -94,10 +134,11 @@ static int rsa_pem_get_pub_key(const char *keydir, const char *name, EVP_PKEY **
+  *
+  * @keydir:	Key prefix
+  * @name	Name of key
+- * @engine	Engine to use
++ * @engine	Engine to use or NULL when using pkcs11 provider
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 				  ENGINE *engine, EVP_PKEY **evpp)
+ {
+@@ -157,21 +198,24 @@ static int rsa_engine_get_pub_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_pub_key() - read a public key
+  *
+  * @keydir:	Directory containing the key (PEM file) or key prefix (engine)
+  * @name	Name of key file (will have a .crt extension)
+- * @engine	Engine to use
++ * @engine	Engine to use or NULL when using pkcs11 provider
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
+ static int rsa_get_pub_key(const char *keydir, const char *name,
+ 			   ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_pub_key(keydir, name, engine, evpp);
++#endif
+ 	return rsa_pem_get_pub_key(keydir, name, evpp);
+ }
+ 
+@@ -207,13 +251,45 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+ 		return -ENOENT;
+ 	}
+ 
++#ifdef USE_PKCS11_PROVIDER
++	EVP_PKEY *private_key = NULL;
++	OSSL_STORE_CTX *store;
++
++	if (!OSSL_PROVIDER_try_load(NULL, "default", true))
++		ERR(1, "OSSL_PROVIDER_try_load(default)");
++	/* pkcs11 provider is optional; only needed for pkcs11: URIs */
++	if (!OSSL_PROVIDER_try_load(NULL, "pkcs11", true))
++		ERR_clear_error();
++
++	store = OSSL_STORE_open(path, NULL, NULL, NULL, NULL);
++	ERR(!store, "OSSL_STORE_open");
++
++	while (!OSSL_STORE_eof(store)) {
++		OSSL_STORE_INFO *info = OSSL_STORE_load(store);
++
++		if (!info) {
++			drain_openssl_errors(__LINE__, 0);
++			continue;
++		}
++		if (OSSL_STORE_INFO_get_type(info) == OSSL_STORE_INFO_PKEY) {
++			private_key = OSSL_STORE_INFO_get1_PKEY(info);
++			ERR(!private_key, "OSSL_STORE_INFO_get1_PKEY");
++		}
++		OSSL_STORE_INFO_free(info);
++		if (private_key)
++			break;
++	}
++	OSSL_STORE_close(store);
++
++	*evpp = private_key;
++#else
+ 	if (!PEM_read_PrivateKey(f, evpp, NULL, path)) {
+ 		rsa_err("Failure reading private key");
+ 		fclose(f);
+ 		return -EPROTO;
+ 	}
+ 	fclose(f);
+-
++#endif
+ 	return 0;
+ }
+ 
+@@ -226,6 +301,7 @@ static int rsa_pem_get_priv_key(const char *keydir, const char *name,
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 				   const char *keyfile,
+ 				   ENGINE *engine, EVP_PKEY **evpp)
+@@ -293,22 +369,25 @@ static int rsa_engine_get_priv_key(const char *keydir, const char *name,
+ 
+ 	return 0;
+ }
++#endif
+ 
+ /**
+  * rsa_get_priv_key() - read a private key
+  *
+  * @keydir:	Directory containing the key (PEM file) or key prefix (engine)
+  * @name	Name of key
+- * @engine	Engine to use for signing
++ * @engine	Engine to use or NULL when using pkcs11 provider
+  * @evpp	Returns EVP_PKEY object, or NULL on failure
+  * Return: 0 if ok, -ve on error (in which case *evpp will be set to NULL)
+  */
+ static int rsa_get_priv_key(const char *keydir, const char *name,
+ 			    const char *keyfile, ENGINE *engine, EVP_PKEY **evpp)
+ {
++#ifdef USE_PKCS11_ENGINE
+ 	if (engine)
+ 		return rsa_engine_get_priv_key(keydir, name, keyfile, engine,
+ 					       evpp);
++#endif
+ 	return rsa_pem_get_priv_key(keydir, name, keyfile, evpp);
+ }
+ 
+@@ -325,6 +404,7 @@ static int rsa_init(void)
+ 	return 0;
+ }
+ 
++#ifdef USE_PKCS11_ENGINE
+ static int rsa_engine_init(const char *engine_id, ENGINE **pe)
+ {
+ 	const char *key_pass;
+@@ -380,6 +460,7 @@ static void rsa_engine_remove(ENGINE *e)
+ 		ENGINE_free(e);
+ 	}
+ }
++#endif
+ 
+ static int rsa_sign_with_key(EVP_PKEY *pkey, struct padding_algo *padding_algo,
+ 			     struct checksum_algo *checksum_algo,
+@@ -480,11 +561,13 @@ int rsa_sign(struct image_sign_info *info,
+ 	if (ret)
+ 		return ret;
+ 
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 
+ 	ret = rsa_get_priv_key(info->keydir, info->keyname, info->keyfile,
+ 			       e, &pkey);
+@@ -496,16 +579,21 @@ int rsa_sign(struct image_sign_info *info,
+ 		goto err_sign;
+ 
+ 	EVP_PKEY_free(pkey);
++
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	return ret;
+ 
+ err_sign:
+ 	EVP_PKEY_free(pkey);
+ err_priv:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 	return ret;
+ }
+ 
+@@ -645,11 +733,13 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
+ 	ENGINE *e = NULL;
+ 
+ 	debug("%s: Getting verification data\n", __func__);
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id) {
+ 		ret = rsa_engine_init(info->engine_id, &e);
+ 		if (ret)
+ 			return ret;
+ 	}
++#endif
+ 	ret = rsa_get_pub_key(info->keydir, info->keyname, e, &pkey);
+ 	if (ret)
+ 		goto err_get_pub_key;
+@@ -726,8 +816,10 @@ int rsa_add_verify_data(struct image_sign_info *info, void *keydest)
+ err_get_params:
+ 	EVP_PKEY_free(pkey);
+ err_get_pub_key:
++#ifdef USE_PKCS11_ENGINE
+ 	if (info->engine_id)
+ 		rsa_engine_remove(e);
++#endif
+ 
+ 	if (ret)
+ 		return ret;
+diff --git a/tools/docker/Dockerfile b/tools/docker/Dockerfile
+index 73bf6cdd2c52..50e98e83dc20 100644
+--- a/tools/docker/Dockerfile
++++ b/tools/docker/Dockerfile
+@@ -122,6 +122,7 @@ RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
+ 	openssl \
+ 	picocom \
+ 	parted \
++	pkcs11-provider \
+ 	pkg-config \
+ 	python-is-python3 \
+ 	python3 \
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
index d3a78d8b..5812b914 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2024.04.bb
@@ -4,6 +4,8 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2024.04"
 
-SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
-
 SRCREV_uboot = "29d0c23d67ee7b88e46fe1753cd020e2b04c2ef6"
+
+SRC_URI += "file://0001-scripts-dtc-pylibfdt-libfdt.i_shipped-Use-SWIG_Appen.patch"
+SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
+SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2024-04.patch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index f7475c2b..af4b1b77 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -7,3 +7,4 @@ BRANCH = "ti-u-boot-2025.01"
 SRCREV_uboot = "4ca322ca563a21cccad8c9ba65e386b9fd34dd16"
 
 SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
+SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2025-01.patch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 7637cfaf..d1ef241d 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -5,3 +5,5 @@ PR = "r0"
 BRANCH = "ti-u-boot-2026.01"
 
 SRCREV_uboot = "2a85f4bcffc50ddc8b443d8e4162e9e46ed0f200"
+
+SRC_URI += "file://0001-Add-support-for-OpenSSL-Provider-API-2026-01.patch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
index 3d6769bf..8213ac60 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti.inc
@@ -25,6 +25,7 @@ UBOOT_GIT_PROTOCOL ?= "https"
 UBOOT_GIT_BRANCH ?= "branch=${BRANCH}"
 SRC_URI = "${UBOOT_GIT_URI};protocol=${UBOOT_GIT_PROTOCOL};${UBOOT_GIT_BRANCH};name=uboot"
 
+SRC_URI:append:bsp-ti-6_6 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
 SRC_URI:append:bsp-ti-6_12 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
 SRC_URI:append:bsp-ti-6_18 = " file://0001-pylibfdt-Replace-removed-SWIG-Python-2-compatibility.patch"
 
-- 
2.43.0


