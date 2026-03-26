Return-Path: <anshuld@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDE3010A1E9B
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 15:03:43 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.63])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49669.1774537420369464705
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 08:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=Vx+hNJsA;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.53.63, mailfrom: anshuld@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zA0K+l2Y9kd4/jNqpMhKiWtTKQNe6f39TxrkH4JFSOh6lK2GkRM4fs9u9h8UnX4gNJvIxOemdwEZEh/IWtSOIyNxvmLOpFk5d0GbxFMsm9bmgDzsBKI3yAgJDEzF9nhxiVZDvVJTEv3nemeHsep4FLIAsrE1AnanXLbMEauPMi9GrOBsL9wAhLOIKY/gQa0/l9xhEos2MNQ6I5nPsibsw7UR1Zvsyyort2SsnPeAShK3/GjtLrdscxOBw2oimuHndUgzNU4iDw+skgDoMJin1EV1Tl7qOzwPFdHNvLT1rJiCSOdluE2lv/p95OdUTYlGtKf/6OPB+m2cfGkp0APOxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C4J9w3d6x6lg/eoiS7axHkFVeWzfMHzhBTMSF8sP9tQ=;
 b=C3aLywzufAgOvhjCuPPAGciVW4L63q6OcOGcbLxpvQlpdrF3u9Nyhpql+RNETUeUabytUWV0CcWj+5Vi2b4vp3Cgb4dk26jt87kmgSlc/zrma46TwOhBUV9yIUlOEJ11myIjV/lrgDoigPMMmmSky2iNy8d3Y1AuKvd88jS7Z6W8kNLBlEHxTJMDhsHpW/4vrrBLIfmL+a9AqySNody+NIsod4rJKiNuhZPYDzGlUNEJmOaxc0183M9bPEDDTzL/UTcIun8PWSPd8fOBDYDpcfJGRN6UelgUBG6fYGv1V39xrf2yLwU72bzY6y3FaEypxMQWVlYrF71QkuM7QPOFsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C4J9w3d6x6lg/eoiS7axHkFVeWzfMHzhBTMSF8sP9tQ=;
 b=Vx+hNJsAr26uI1FgxkSOwMeYNGTN1PJyoOExpWwJxlP0CiIK0jTYTsgaWLJZjY7XT+w3/K1Iv4mnYxJSOkMHHlDF1HY6VNUXUMNS18p0qLOJiBoyfxj3JaTZZrujiwXp9B5fo2ut+HjoK9fCC0MdjmKtopZh+SKCPDRLLNK9sng=
Received: from DM6PR07CA0114.namprd07.prod.outlook.com (2603:10b6:5:330::29)
 by SN4PR10MB5654.namprd10.prod.outlook.com (2603:10b6:806:20d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Thu, 26 Mar
 2026 15:03:37 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:330:cafe::b2) by DM6PR07CA0114.outlook.office365.com
 (2603:10b6:5:330::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.22 via Frontend Transport; Thu,
 26 Mar 2026 15:03:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 15:03:36 +0000
Received: from DFLE203.ent.ti.com (10.64.6.61) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 10:03:32 -0500
Received: from DFLE211.ent.ti.com (10.64.6.69) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 10:03:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 10:03:32 -0500
Received: from localhost (ada0543016.dhcp.ti.com [172.24.233.9] (may be forged))
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62QF3U0Y2326010;
	Thu, 26 Mar 2026 10:03:31 -0500
From: Anshul Dalal <anshuld@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Anshul Dalal <anshuld@ti.com>, <praneeth@ti.com>, <vigneshr@ti.com>,
	<denys@konsulko.com>, <reatmon@ti.com>
Subject: [meta-ti][master][PATCH v2] conf: machine: am62lxx-evm: fix fitImage address for 128MiB
Date: Thu, 26 Mar 2026 20:33:22 +0530
Message-ID: <20260326150324.3689647-1-anshuld@ti.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|SN4PR10MB5654:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ffe315a-b684-4b7e-4042-08de8b48db16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	z9KcoYYVIOkHwNQ7BhoSHMVwwIkbS/zzEMf30t33nqrOEiaUHvvk7FAw8SjStIaadpErgQtAlGiW8zBc0qwZ3Vjc23yFn/xpElJikbuU9aIQeYKfkYPKRbgfRCmRYYhp9UwmSZTNMfKl/pj3iNbqiXzPlYocGEkaG3i0LWdEsOSrD2cyqm4h1aiQziBkEptjcvZDwL2F6qSRwNvT4YfAfZCr0hsmN4XTZyhdSEkxYfBDjKB14MTeUcLU+NrpfmH03VLLuAL0PrSx3+BOOU7qRsNU/qRz7EzNRu/VRW6gTWRMn5a7kErunsjJ6+sGqztjBzey9DwaP18BZIuPQCsgvxZj2iZIEesX/UZWmHg7tARbjarRiRetDFk/DolelRcFaujvhUjY/FtWEToL6ufDrDOXQNUkQZ0QPC0SckqDwg83P1iJWqe6ihxQS2hDzQrhzX1s5PpMPna5q09imDE4L9hM+xi1X9NhJhOGBDBYWpO2DWLS1m+7iMHNQA5tCFL5dr1MDALfa5rzi3Yl99fSbHGexRJVzSzgwbYYq8gJoJxViFYXuG49TKNvK4JTH8+m+A077JtlmqFiCMgG/L3iioq8hUelEmK12KukbKtmMbmfq3j76KPTH7N62+cBNdjHNtaigl13K/FnTyHWTQnSlrsc6V5moKjbVo4N/De7JUuKvkZidDbL2Ez16iq0m8AYVroc0K1EQp+9mGr5cq6WixhdErKq+v4CrLpwjk7YsUio36Y7biCBasNRCLXX6lnu8UAgHED4UnDUjm4KN2Ikug==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	D92PHUzJKDIC+YS+j1DhBXYhIZ6UK3LZVufsZn50D79ZiM5hP9UgIxKPo5UOXI59g04a1DqX6sG7ZIGYVur0ougH+Ja3sSl2ywzRRnFhsrnzCCpuK3uTKZGrHcv5/OfPy37swdGI9ra1zsQl+9ia6rn9BZ/XCBJazzXnpkCtzWZdkxG2YRy+UFuXwE5PAA5EHYZCDLKHRHnp/hTQ1sBiPyx3yWItqWGdGFjH34Mf6YeDBNOM6p29/Ssv3G/Z+Q3T28RfqV6cdZ0xjeyalD0knpxira9VsFF3CpvS5k6mTg1VVaT8N20GOViAneVGxYR1WOmgqYS86ce2V1di2um/LYerxVIt7uklSQA5mf+LUl3dVbZqCm2nxUHJ+5WLYPNkWZEQhuFnoNVdVsPpd/vorzPX2+3O5hOeCtjEy9wz64+sLxHM8vp1DuWbBht/FJmh
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:03:36.1827
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ffe315a-b684-4b7e-4042-08de8b48db16
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR10MB5654
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Mar 2026 15:03:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19827

This patch modifies the load addresses for the kernel fitImage to
provide out-of-box support for 128MiB DDR sizes on AM62l.

The current fitImage uses 0x88000000 as the DTB load address which is
beyond the 128MiB boundary while the kernel load address of 0x82000000
conflicts with U-Boot's SPL load address which causes problems when
enabling falcon mode on the device.

Signed-off-by: Anshul Dalal <anshuld@ti.com>
---
Changes in v2:
 - Fix commit message
v1: https://lore.kernel.org/yocto-meta-ti/20260326144126.3675044-1-anshuld@=
ti.com/

 meta-ti-bsp/conf/machine/am62lxx-evm.conf | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf/m=
achine/am62lxx-evm.conf
index a0bccf57..d8e1614e 100644
--- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
+++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
@@ -17,3 +17,10 @@ KERNEL_DEVICETREE_PREFIX =3D " \
 KERNEL_DEVICETREE =3D ""
=20
 UBOOT_MACHINE =3D "am62lx_evm_defconfig"
+FIT_CONF_DEFAULT_DTB =3D "k3-am62l3-evm.dtb"
+UBOOT_LOADADDRESS =3D "0x82400000"
+UBOOT_ENTRYPOINT =3D "0x82400000"
+UBOOT_RD_LOADADDRESS =3D "0x84000000"
+UBOOT_RD_ENTRYPOINT =3D "0x84000000"
+UBOOT_DTB_LOADADDRESS =3D "0x84f00000"
+UBOOT_DTBO_LOADADDRESS =3D "0x84f80000"
--=20
2.52.0


