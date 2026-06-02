Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01044CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:48:36 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com (CY3PR05CU001.outbound.protection.outlook.com [40.93.201.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22193.1780397306172444019
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 02 Jun 2026 03:48:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=WbuvF/cV;
 spf=pass (domain: ti.com, ip: 40.93.201.63, mailfrom: m-shah@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M4+li8GdJhDYe6WP+MXCkfy/DprhoLM8Imk3dFTyjqqWE58K589xS+2LrL0aG9GRerhB+ybodI02cil2NOyyDc8vNso2k7jmEOfU0yCH38LVhr1DNs4umXSCV2dwoekRiyxw09NlJefhy5yMQwjntGMU9VFbFNJJqQ4PMT+H+btAJZcDBW0FpeQHp0gQAoHOSg+6glLYXr65gsLJfS12JVkHm2Ubb/Yv/FVqonCmOpTa6rVpTlO+CNaMUjMf096AQZhrvdi23OfUGylH7OweA9EODxMygadbQar69mQR/eoCEzY8TrtyG+Cvf7Lik5lhsb9vEua5pChzOGZKCORZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwgmVJYa2TWx33yNKWeYRHxZEMQwKUYITlhcOlnDRU0=;
 b=EDmuSjnhnQf4Xa43kZCjU47CRcEy3mCt1sBL4Pyol5PVJH1CARCsgpcc9zV2KPlVijMAED/HuVWSOxauYjhR3EWlDuCWQ+ewQ59gFQBk+gJyeQetvYX117tPbs9sKbK0wIeUSsFN6G0PfhCZzSB70Sf/YsDkSCNpSPhsLIZ/KNZEC+v+cYkSPQxmgUVtbU1LoerSUyHRXWrQGQEc7gjFWGJWn/efFxMR9+k8k+MZ/lv79dTiFOpiMJiN7qo/OBVkBqwyz8QP+f6GOskvEiBiEtdA7yTMdxzpWwciPzSU3gS4VXjWxAWxivsrivRkTw3jGMviV7Zu9gAju7A7/vRZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwgmVJYa2TWx33yNKWeYRHxZEMQwKUYITlhcOlnDRU0=;
 b=WbuvF/cVt36+RELYCiySitApldm3Xx3zYbnWt47pB1ip+wcziyF720Zqo9q4nMLFnyrF7okGHukNPhzWcW9iwTA5iUSJVDJZVWfNW5JFb6QlPZ3BW0hIPZmk8/ggRdESup4Wnz/p0zzqTrsK+seTa/3LtnRM9xg32XZi6aJBPoU=
Received: from CH2PR02CA0006.namprd02.prod.outlook.com (2603:10b6:610:4e::16)
 by PH7PR10MB6555.namprd10.prod.outlook.com (2603:10b6:510:206::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 10:48:22 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:4e:cafe::30) by CH2PR02CA0006.outlook.office365.com
 (2603:10b6:610:4e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 10:48:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 10:48:20 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 05:48:17 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 2 Jun
 2026 05:48:17 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 2 Jun 2026 05:48:17 -0500
Received: from moteen-ubuntu-desk.dhcp.ti.com (moteen-ubuntu-desk.dhcp.ti.com [10.24.50.20])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 652AmAhX3602223;
	Tue, 2 Jun 2026 05:48:14 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <nm@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
	<a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
	<denys@konsulko.com>
Subject: [meta-ti][master/wrynose][PATCH 1/2] k3.inc: Add CPSW modules to initramfs for bsp-next NFS boot
Date: Tue, 2 Jun 2026 16:18:09 +0530
Message-ID: <20260602104810.1068959-2-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602104810.1068959-1-m-shah@ti.com>
References: <20260602104810.1068959-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|PH7PR10MB6555:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c400bf-e067-4791-58f0-08dec0947649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|1800799024|82310400026|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	B0LSbbe2m2+NtZjqfwtAgG/FMgp4moA5WCK0lR06oP2tIHQS5oip6TB9elNRmxx9q7wyXkSKULSR0nK0gsSOC4DIqEw012qCRCIP1efQypK1cCj/DAKR6so8HgqSrjFLzyKwUCjpLKh36nXh2+WWqg40Ra1FLQzhrW974+QsaROxU9RZuDW5nh+4DiciqPN4D3ywJbz/r5T6bzmmGokUq0Risu+7WJWyJEj/VZiCfxdT6vH1IKwg6dlM7zFk51fH7JDeOPQC/90YxEMC6PaEkwSNTrvaSssuPTjHA64+OhDDoZNsQ/KRj4++zofSqCdDunrTH+jO8uc14+xrOlP390tqI5ZCQqObQKliZGva0aZbz4+YWekVpfdREGhO4pwKOTpR9NsJSnIaJq7cnwHJ4YEDbtXO3cJll4kj4UJGfj9Y24tHvyctRDfnQrgkMU9Wl8snQy+INhegUM2+ESrgsk+1IFSkHuTkR1rirtm4vodVRyIQtymoNwlpcpXn2NLpBQ+jqgw51Zn9M09b4c2qQfVv+Q6QWR4V+8LsRFx29WTmVUN37qy1opju8ScB0a1wF3IPsIsfCaV9kzyphFD/YpIOs+6EhfNTODd56n9Gadypynnoo4+Cjvrx+TDW0G3RSmw63wq1b0vkF9qpxLU2Cg76A82ARf6Rw/4Jc0KwvGnQjd2wdOt3se49r5+PyH0PxsmPs4WwMmqcf9GhZtyLDN/YOhlVMSUzbZMniNfgjNU=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(82310400026)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	sS7klFFvKVEcrZrbyOUEplkxVLwngaPEcvP+OhcFBJBiMLK/m04M4d29NgEOo5DwMTBgOopcWdFYxCGhhSahoRkh/UAsayh23+ZEh5E7S8oXPbrZ92zsld8BsYUHy7aQHzr51DnHRWfRA4mRvirRYH7nlgk2hAZqZ/3W+8VSDX1nFeR6mIgVu1WA5wNQ4tQjnFg0LH1IKg54f+zOKKfPw+0t0es3BjZ6gduzo6g1Ua6RyMrON1Aw8K01lUO+KCAHzzsnp4Acv6BpHlTywjbxRij29VDKi0T5ePMQcy4UV7+Ow707IlDYKl/Obl0EBPO/MsGYufKa0Yofd3yzQzA7smRIGbGXGrrB5PKmTS3FyRxiiO7W4YSrejCMqNBbqCz+Rx8QOK28nO7fEvIHlIyrO0Mp4Q/bHGYAxcwO6Y+AnXqQMEWNomX/wVUNbOOrfXew
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 10:48:20.4473
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c400bf-e067-4791-58f0-08dec0947649
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6555
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 02 Jun 2026 10:48:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19946

AM65_CPSW_NUSS and its dependencies changed from built-in to loadable
modules in linux-next. Add them to TI_CORE_INITRAMFS_KERNEL_MODULES so
NFS boot continues to work on K3 platforms with the bsp-next kernel.

Signed-off-by: Moteen Shah <m-shah@ti.com>
---
 meta-ti-bsp/conf/machine/include/k3.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/conf/mac=
hine/include/k3.inc
index 6833789c..726c071f 100644
--- a/meta-ti-bsp/conf/machine/include/k3.inc
+++ b/meta-ti-bsp/conf/machine/include/k3.inc
@@ -61,3 +61,9 @@ FALCON_INCLUDE =3D ""
 FALCON_INCLUDE:ti-falcon =3D "conf/machine/include/ti-falcon.inc"
=20
 require ${FALCON_INCLUDE}
+
+# AM65_CPSW_NUSS and its direct Kconfig dependencies became loadable modul=
es
+# in linux-next (post 7.1). Include them in the initramfs so NFS boot work=
s.
+# TI staging kernels (6.6/6.12/6.18) still have CPSW built-in (=3Dy).
+
+TI_CORE_INITRAMFS_KERNEL_MODULES:append:bsp-next =3D " kernel-module-ti-am=
65-cpsw-nuss kernel-module-k3-cppi-desc-pool kernel-module-davinci-mdio ker=
nel-module-ti-cpsw-ale kernel-module-ti-cpsw-sl kernel-module-phylink kerne=
l-module-mdio-bitbang kernel-module-phy-gmii-sel"
--=20
2.34.1


