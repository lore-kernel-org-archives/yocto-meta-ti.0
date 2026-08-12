Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3E66C5CFDB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 21:49:34 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6224.1786571365792342442
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 12 Aug 2026 14:49:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=BJ08lYv9;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=OwJdr5Ct;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67CK0EBv1399379;
	Wed, 12 Aug 2026 16:49:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=JgPYE/5oprqkWpXgfCFJoOOl9xWfl6fND6RT+94dI
	iA=; b=BJ08lYv955lGkl9wb9FDMc7QlVMfx9oLgIRh3oGx6QtKXxjTY75KlKXzI
	7+vD2Ay38ae9zKa/goYhvdO5/6ezkarhLxXpCJx//RTv5b11fyV8MmNXQ4NzT8c5
	cSGJLD4HTpkwDlQvuW52ljePU1wzAqQwcd+PRVN8FfITvrmI1y0oDAOKMtS0qLrg
	c4VbfoQW5oKT3vnckOMAhnZMaOaadWWUds4k0TkRGazx6CuEdBAuOUlqodCpkYSj
	ZOnGhjdp+yQD04BkTaLDXZDZdDkcUEXYmNIM+ukte608Mo1HyJ6mDjEwN0XypsUy
	B784uYv6bjsaj3/Xk/Ai5gRh406hA==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011025.outbound.protection.outlook.com [40.107.208.25])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g0muscs0b-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 12 Aug 2026 16:49:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RKwhCFpZ93Pu5sJRCvDJz+B8xZRYl/5BN3Wf7v6IrfU4M9nWC6lJ1h/8AntB6ZmAjw6osI52EnsdvTGZtnbenr7WVvBMOAbE/25NvIQq+0zINhGV8A/paRlyAE+t2D5R2e6q+83sTNbnTsp1B/fgEkZKeojLBNJjecGniJzCftqNN8FX9GldzCy10U0JhNcwvO5pW17Chn9jmWqwIik7AO/hXRvaIs/5ACD7MW16YV+/9CkxrWVE4x7LhjcIQLpnERmooV3gIGvf+s9As1klYhkEmNBQIzULEHCryCxN0kZq/7M1SG2B+rolnstz7xYn6EVhx4EbjRhFTsu3p7aJKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JgPYE/5oprqkWpXgfCFJoOOl9xWfl6fND6RT+94dIiA=;
 b=Y9QysE6U+Izh8+U1X6SQNxLBafCPQazeoWSl5G9LtbHxjYjM/2P1trUOA1tZzZf0WsiGUTaFLvgGltJcXdmsqovE9EH0A5Jo3eUjAaL4KSzXmKuko49m+KfM0qhHZHFXOJ+fRLzZPNZCdmOVIv15ACI8CWBxNkoyDZfuEoWBRXGIZyBjRxpqa4u2sMJzB40pvtX84wmhZsOEVxJoDuVFco6pA0Y9DftbEKfE+/V6rOftpGfoJnK8xuzfKtcxo1p4AmgdItJAPgb+HiPGrRfGCQS3Qk3QNYt0YGoR2m6nJFCQu6KyeCcZ0QzrkTxanz+ism5rxshopgZOMPxhB51t3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JgPYE/5oprqkWpXgfCFJoOOl9xWfl6fND6RT+94dIiA=;
 b=OwJdr5CtB7ZeGifLOug65ChqT7pam42+5//bnHV/UxN7NvEhcDzihAJlzbJokJE+uzPMzyymvisRzT0G3oSntid1oVAOopVoC6LrHSHdK0GWz00F1HvtT8rQPpXx7vArd2C+i5YjCBi6sQt7JwFrjQwlIJqpMY5EyGCS4LXodXk=
Received: from DM6PR05CA0051.namprd05.prod.outlook.com (2603:10b6:5:335::20)
 by EAYPR10MB997950.namprd10.prod.outlook.com (2603:10b6:303:2d5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 21:49:22 +0000
Received: from CY4PEPF0000E9CF.namprd03.prod.outlook.com
 (2603:10b6:5:335:cafe::93) by DM6PR05CA0051.outlook.office365.com
 (2603:10b6:5:335::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3 via Frontend Transport; Wed, 12
 Aug 2026 21:49:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CY4PEPF0000E9CF.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Wed, 12 Aug 2026 21:49:21 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 16:49:21 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 12 Aug
 2026 16:49:20 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 12 Aug 2026 16:49:20 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67CLnKaj2824866;
	Wed, 12 Aug 2026 16:49:20 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wuGp6-0000000FGv5-2fpj;
	Wed, 12 Aug 2026 16:49:20 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH v3 3/3] ti-devicetree-prefix: set ARCH directly
Date: Wed, 12 Aug 2026 16:49:20 -0500
Message-ID: <20260812214920.3639941-3-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812214920.3639941-1-reatmon@ti.com>
References: <20260812214920.3639941-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CF:EE_|EAYPR10MB997950:EE_
X-MS-Office365-Filtering-Correlation-Id: b9a9a0a9-333d-46b9-cd9a-08def8bb9162
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	hYUv4p3b8Im8m197re1J6NpvGTfgoMHbEYy2oN87dtq0QjNxDwFpwplS8k0wSwdXffftipwBRLY5rnfiP6VAyRJQw33+ByQF4GdgyHaQGmeoGsVfafJqiJ+CVBh5zUsDoEKZMScAjXSok13+X42wyXYB4XdDGrCZi4XXef2NjRa7gJ18w2KW6NgdjMhdBt7YxgxB1+vRsf0feLlOo9+AaC7Uw1u1BOm2OzQe7dIQkfx2etl4Q9+2LvbqFhl9MJXDW6o991qa9WXe6S3MUKM+AzNIqaXVVKo0J59KUl6lWj2tjskSJlGDy0HgxW7fD/2tSR/+UHpL1kHP3PVTie39thlPKEyPTFfyeiN/ng0wBMp4GRP0Lb43S9kdH4hgUtT6hwQmVkT4L0EXGITUSeEBxRBccU4aB95DbLbnYrxJXz1KpVaR7ax7aLX+vfz7OJmTEBPFHFufc1ekveEAyLxzbm8x7LvV3ina4NLWaS260T0892M63WQ+s3fspCq3jkdUTPEtWvyTvdyKGXd8Ph75tRE2Q+YwCN3FRGPg1/sdQ+Bgzu/VAfOgKfNC4/W3VTDru2nkJAiKY2I8rCvWubQ+d8UXESt3d+A3BndWcSpig5LZy//FaVt9mZckJh33BM9d596zEiorjGlJqsdQntLOJ82F0Q55PfMyXmVlTE8ZBw2ACKjzR9Cclv3IoDxW+kfkoliwY/rVKCfN4BQkZKRdZA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0EUDLGZPhA21GpzcyP67hGRlgxul3vBSrwnCwP/anOALJYuFpO1OPD6PeAfMx+00Pv9ef2RBJGoQjewdN/U7ezZUgrCEWw7z2jMyDEhW4lNLOr+19sw4sRqiN4aN/p+Wj311sHfBqla6+jhFGEODUrsRqqJGAqPf1AikM6lhI2f2TCUwBed4so5zXR8NoEITuRUEKK7aKaGwa9f0D+DgISneSsKllO7HFsopQK03rH4GnmB/rJ6Ozxt0tBtW0MnGk1wwCI6YNgwQo+gX+v3VBRo283jlIyWx6tQsH667GfkNWFwOr0UOCBk4n1GW83cEWt4i/UfnffK785TF5tt2/erSA+4uDCDY3+6XEo0SozuwM6QNf0oFsW+p8Q03UVAqNacGxQBYAj0rGWtPzUTJPBTw7upKBF0KcisdsjMbn+o795E6dZAv978oQshrne3W
X-Exchange-RoutingPolicyChecked: 
	XpidPaOwx+kFxDeLz6l5r2XmJC4fIF1h/Ue17aoc6eh04xFj+YY/uw0u89znCM+kK0w/cmjs7LUktt9G4eiBX2xf61MNVbTESjHgP4XXPH0s/XybXm6/4khOx5it/NMDXunjzptRppS+zxcCm/WBwbPS0+pavgF2vJSLDwJeS9EHOuiRRn+s+KY9zS4Hfnn3ytzY+OUShEksH6VjVKT8Js6PzI9jUu+RGVQcNHwA0jNqsgHdIT/FzTuFIuS9nuFxShETe2/qQwi4OJHUiwMG9eI6+5fZP6Ue5aaCjcJsMGgK7upliXjm45cQTTR66aLIZaHN9NBVMi695Luog5zlQw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 21:49:21.4069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9a9a0a9-333d-46b9-cd9a-08def8bb9162
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9CF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR10MB997950
X-Authority-Analysis: v=2.4 cv=cY3iaHDM c=1 sm=1 tr=0 ts=6a7cea64 cx=c_pps
 a=C5fyF0bn1LKt8LWMWUNbGg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8
 a=TQNyws8Eu_bvOnJVYgsA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-GUID: AfSuj4tfF-RV_TPgeVqb3tJLp7aZTidP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE3NiBTYWx0ZWRfX5NkqHtMvDhPZ
 qIr7N7FNfAeMbeSTSk132ceY53i3ktqYP2SJnFwIW4E0gX5t3TZ2gpq3Y4DnoDLE5H8gtdwFaFn
 jC6s31fxZrESF/GRN9GpAIq+9RbdqoqzcnfnhjlyipmLda8d6fGE1p4HR/gdpGP/Va5oS00sBnN
 hcRWUnuxdrKevxU2AGCSWPhlSkUFqoLdH422PzWjc81HlNOJPRelMCTSXSgTg6s8cFk5WXRmjGz
 4xSFnWKAiTDI/OVUAWLwzglnaPXvBDJbWMFgYHAMmrQbbtjoItVO5VmKIdjfeFhhIdKWlMfYMX7
 AXI00DTST84kYU0WZg+ItLoQBgozgWPTSyoLW4QEdoVamVAkOlCsSaNaegn8lBTa2BioeZEmrhT
 KOxI5M7hSAYbRIr1k0eOH6ngNO52sw9IlTzU8WRr5/Vup7pzMmoctWW2x+cDPU2tTbYdenjpOCS
 t2Icf+xXDDwHQ16mQzA==
X-Proofpoint-ORIG-GUID: AfSuj4tfF-RV_TPgeVqb3tJLp7aZTidP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE3NiBTYWx0ZWRfXxg2bL3LpkUoO
 qp/0RXKzP0KyTKyXPxM+uzgGVedDUkNhk2NrzgN7EJx1rvIcKYyPncMBSfzsZYt7203ZgWHw8iE
 kiRQJg0uhOIAJ4maa0eOsv3WUqLQV1Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120176
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 12 Aug 2026 21:49:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20257

A change in oe-core [1] no longer set ARCH but prefers that you set it
yourself.

[1] https://git.openembedded.org/openembedded-core/commit/?id=635f85b7b8ffe4bfd5f282a98bdf640aa037cde1

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
v3: No changes
v2: New patch

 meta-ti-bsp/classes/ti-devicetree-prefix.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/classes/ti-devicetree-prefix.bbclass b/meta-ti-bsp/classes/ti-devicetree-prefix.bbclass
index 5858cc65..65c0134c 100644
--- a/meta-ti-bsp/classes/ti-devicetree-prefix.bbclass
+++ b/meta-ti-bsp/classes/ti-devicetree-prefix.bbclass
@@ -35,6 +35,8 @@ def get_merge_dtbs_from_kernel(dts_dir, dts_pattern):
                     matches.append(pattern)
     return ' '.join(matches)
 
+ARCH = "${@oe.kernel.map_kernel_arch(d)}"
+
 KERNEL_DEVICETREE = " \
     ${@get_dtbs_from_kernel('${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_PREFIX}')} \
     ${@get_merge_dtbs_from_kernel('${STAGING_KERNEL_DIR}/arch/${ARCH}/boot/dts/', '${KERNEL_DEVICETREE_DTBMERGE}')} \
-- 
2.43.0


