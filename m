Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94A9ECD6E9
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 20:13:39 +0000 (UTC)
Received: from SN4PR0501CU005.outbound.protection.outlook.com (SN4PR0501CU005.outbound.protection.outlook.com [40.93.194.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28630.1770840817794046836
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 12:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@list.ti.com header.s=selector1 header.b=uMeXUK0J;
 spf=pass (domain: list.ti.com, ip: 40.93.194.28, mailfrom: prc@list.ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xa0d+zt7fP8QZB+q0knC3jQeXfofCqhIn8M4A8YT7gdZ4CFqifeL1aXdPqpMg1Fi0uk536NIbbBImmt5e7JWCycHT+4DDbxkurrQKJpsqg+aKPN2BHYqcWdIUDh6YbOf0csy8jMoCzvdED+8d7V5+sIkbdSArNa2WOaDs+U9exnoWzfVyCmGV+R1BEqaGId8SZ7bmYQCEehscXEAvF1AX5fEFV5eCFmzPNnhh/ThfGG+t7ViBFYIZdisgyjrGYwfkCopRFk0Rg8GDQXlKO/bf1wRoFDeEamj8MiRTF60/jvJdCWtEhhBwgmvdZvxO0uSQxOAhvMguTpIN5/dkxClQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5vuVHnpC1EI5KDmRiFy8r02u1OxN58R/vYmPgZoenKE=;
 b=fs2yxm3+kacNju8qk5uiw2fNydwKjRg6Jpk5PZcvPO95UsDAy7ullpd0No0CnQu6mFxYg5AunCbQRGvsKfvLchZ3Z1ESNsmCvq2L2c5JZnIsYbdU0nGxKixaQ83HBCnV1AqF2EnpDGC4hrRlQenodjCnVUM019l8Y9LPk+9d6mesNWoUJJTAzwjQC8k1TFToFmU8YsmimODKA6oQ6+2WxgLd7AWnolsXfz0KyjtBa46G+zzofmGAhfmBXmE3Y4cEEPjQhGUGMMBdFBi0urhgEQUsG3rnz8k7R9vMh/UtxL2VCSIV6ZcrCKzA/1ZE5v7CeHX6DGA5Q9yMFZuix9+RBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5vuVHnpC1EI5KDmRiFy8r02u1OxN58R/vYmPgZoenKE=;
 b=uMeXUK0JG85b3yD/bueCLcq2jPJBXgKkJnpZlV4CIDDtbp2A9QNBD38ixxw+nAJ86znDmIG0ZFQbNVpXD6uM1I3JvfrK+HXV7YUM1q4JiDaxB+PKrQVX9zN28JT/beKw5kgawzlosmYXP12H7ITs7Pje+FoN9I4veb+IheNv4OyyW9G/tZQpIjK1W+yl/sbc3KRkTG0hn9rRXRYOziphB3ulgJg9XsGDr872d3Ia//Dr0PVMvFn69jgXW0v1X7+J/m4kiAbzeSgckC2jZEBuUJW4Dknkft6ugbZ5iqGZ61ePIjTPLjwFAEQXecSRFiINXtDmiLOpQkOx6zNEfQyjtg==
Received: from SJ0PR03CA0178.namprd03.prod.outlook.com (2603:10b6:a03:338::33)
 by DS7PR10MB5135.namprd10.prod.outlook.com (2603:10b6:5:38e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 20:13:34 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::74) by SJ0PR03CA0178.outlook.office365.com
 (2603:10b6:a03:338::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Wed,
 11 Feb 2026 20:13:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 20:13:32 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 14:12:51 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 11 Feb
 2026 14:12:51 -0600
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 11 Feb 2026 14:12:51 -0600
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61BKCpef3120013;
	Wed, 11 Feb 2026 14:12:51 -0600
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 9588D9ACF4; Wed, 11 Feb 2026 14:12:51 -0600 (CST)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>, Denys Dmytriyenko
	<denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] ti-core-initramfs: Rework logic
Date: Wed, 11 Feb 2026 14:12:51 -0600
Message-ID: <20260211201251.2661707-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260211200414.1642061-1-reatmon@ti.com>
References: <20260211200414.1642061-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|DS7PR10MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab43d15-a485-410b-5d44-08de69aa07da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?loP6QTLn5dHFCeu4whBRJN9Z8Y1WIlrB4vukoI4d/WtDz9l3c0BryE3ovnr6?=
 =?us-ascii?Q?ibgoIWd1RH8csN1CU0HUN+G0/L4+co6tCWa+HzPtY06UxGX3zU5ygzRKWeUY?=
 =?us-ascii?Q?r8WQb4jBSu2MbcqiuV2wWBa6GE5ykyvZqLj4WVrJwzAK1Sg0KyRumNmFJzLY?=
 =?us-ascii?Q?VwGUAd0x/Oc4JgTipQuZhT+FLwQqAJYCcdJZvsEjkCJpjz7PskdCu+QV0mB0?=
 =?us-ascii?Q?5C8U/Fu86OdFvI0NiX9hyL71iyk6QjyWyVpGXQTJukc0UtX+jBpBt/tUmh7d?=
 =?us-ascii?Q?SQ3x2tEu4ftXeSR5RV/P0SmSWadHQx46kF/3bNUjXlQiVBEqwnbd7oFWfIA/?=
 =?us-ascii?Q?diWJNXeZfGkSoFgr5Ee4cN89vcpXdjJ+cQr9Dd6CX03wuTKxANf/qRPD9VAQ?=
 =?us-ascii?Q?1Zzcy9oRAMRquhr8ZRGDWiJhxOS80ZPdGQ9xE3/j8tKYyUEh79v25xYIuiy4?=
 =?us-ascii?Q?faH/z+S6rBFfchrLfWqVUPS7Cg4yeEG25sg4AfvCAfOkS9vke5w/isZoOhgy?=
 =?us-ascii?Q?Pds3zffBYskLkS421jZ12w+Vx+uq7pEnK7RKhKa/aB9ww77wlVNBcM4LHopd?=
 =?us-ascii?Q?jpmrVN9UBoIdKvrBCd6GvKg7dzOOmY+HoATDCv3S8P5kdybyM28pKA0ubRsn?=
 =?us-ascii?Q?2IulQ+ittxJhh02kC6dPisiFszq+hQQYW11hqEgTkcWlgCiQneuTzUlmase5?=
 =?us-ascii?Q?2w+mlHraRocCT4Pds3d/Ks6fip1nvf+NejHCIVsbExJFsJVhUg8i6yLe54ms?=
 =?us-ascii?Q?5pgekjz+JJDSBvF+8RO39SfCLo3wS4HYIsciiOiQseaMVRVmtw68N7DMjW4w?=
 =?us-ascii?Q?9th5a6VwXiS0ckls6OjIFVP9xWrVLyrQIKCcMcPazOM5iKbSp1itQVy0FpOw?=
 =?us-ascii?Q?BbRBcOirGF13EvU0naLn1IujuXyiA8MbddvaEcsasAuMoGyQ+0UukWd+121E?=
 =?us-ascii?Q?ebesMPgvQ+u0kW4YMgEdjG2+gEAgP/gacJqct6BIWtJrZ6a+g9pexlYWbDlC?=
 =?us-ascii?Q?TdkzaHiYogwuGD8PH4ptT2hOkKZVuLZI6xrymnVt7L040pP/GbtliqwdaiOl?=
 =?us-ascii?Q?hsyjCu94pIzZhDEoMN+5EgQ/UYvS5T3gYzJp8XRx7DasXsqWu3Shqo0Ri404?=
 =?us-ascii?Q?GLLw+aySckD3MQmhwmRPnCyN6ne4vPiGqbrwCI3Y4wFfnK9AUHacOojdtD+J?=
 =?us-ascii?Q?peBJHjs37/bIDT2sX4Gj8OKUDR35wE/BBfF+Q9QpJrhH5AcuplBdXPWEEL/t?=
 =?us-ascii?Q?H6nUhDEM239nJulKx4lxHp02CcwgWRS/E2iFg0nRBF5VA2iSI8XErPKfgK+J?=
 =?us-ascii?Q?KS2L7NmKP+R6YIrIqsHkve3NgV9/oCLP7bdSSIaevWgPkN/ybhBGST5tNMJJ?=
 =?us-ascii?Q?152lzZLht4T/bd89CP9grSQoTHEwyH1e3752qt+gYV4k5gKnxKRaNkL/klE4?=
 =?us-ascii?Q?mxAEZLskFf1/yjbiZw1rppapyz9S4iEE+Fdjw2GMkz/GQfPQS9dBTV7FpY2h?=
 =?us-ascii?Q?rmEKoUhrw+7JLUM7NiCyQ3jkjfLsj4T9tY/JcncidwPvEZqfSusXa+gkkuK/?=
 =?us-ascii?Q?VqvLJ2/Qt9CQWHHIENlYCjQa+bfGW1RTc1Hd4HP94Q+uxoGyC51rtZ2cH7oA?=
 =?us-ascii?Q?dXco6ygYtzAvKKLFnAo5JHJMAhq+P2lvdAtfLSTnpEyg?=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	+1lhDVgPcYdScFtMUorY/V/dT8R9ADjUQhq/r3PhdPk8PHFNqJH5sB8v0GHGC3EDpG6+LF0Oq+J8Xp0CCQcnFr3PgnjgqsJv3Alag/xdRBEgltCy58feuVhKgv9w7+iBRk9t/gWDX8hyGOlpOrRVQjzxDgONF0MjtyIQs1Og804K5++qw2+o+6ian2wjbCmMUSSHTUaREGgcsjGhIYp4BB3Jd2LBJ0C+KtoXYW6A5SDe7p5Jvm5eRpX61gTfCzcGfaecm1v4FudbQRlS0U/8tHMwfB+bd10jSznSyPzVHi0XBDpzH+r4R9jr9eShXs+Wcnv0GZrX9u+FdDU/2bVl+sUB+vWPKsx9yJdOytIKJAEVLcJ6afwkPKrQxfGGEj0pxSti60HCU2I6R/rPd7+9+YN49PE3j+VHSRFJloBUI+AQLTQfJ8RV9FIouLcYiQ6/
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 20:13:32.8924
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab43d15-a485-410b-5d44-08de69aa07da
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5135
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 11 Feb 2026 20:13:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19487

meta-ti / na / 20260211200414.1642061-1-reatmon

PRC Results: PASS

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-patches: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Patches
----------------------------------------
All patches passed



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  apply-yocto-patch: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Summary:
- Patch Series: [meta-ti][master][PATCH] ti-core-initramfs: Rework logic
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Wed, 11 Feb 2026 14:04:14 -0600
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: a3d3864182e452a9f2004bccdde0cd26d=
61b8075

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-next
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: u-boot: Update ECDSA signing make option
- Commit SHA: c0e80f86dec421d7518f47617c970eec6630640e

Patches
----------------------------------------
All patches applied



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  check-yocto-repo: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
PASS



=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
  yocto-check-layers: PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
master - PASS
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
All checks passed




