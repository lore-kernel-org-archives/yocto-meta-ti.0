Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C40AAC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 00:37:23 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35021.1782866238379808872
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 30 Jun 2026 17:37:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=SjZwdB1G;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=J+R+xQZH;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: jm@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UNLGVP2109205;
	Tue, 30 Jun 2026 19:37:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=Fm2kKOzkswiKm
	CetX5ZH29NOMzsslkJKXWxxFHCVWmk=; b=SjZwdB1G596/uWDtPIDZ93BBbkCmq
	Qz9Sa36Q+vC11B9iHsmaxe3grE0/IOzZKTcw0bqJyvFYxVx/lqkxIdGrc9JDcQYx
	WBbuaDhPa7HoQrGUmKtxfKUEUiWtj914P94m5C1BC1bOHT9lT/ojt4a7AaJm2kM3
	hOukyq0TKm/A9z+aDLVlTv1NSYSyH06uQc/DSZk0ZOn/HYsXVsHMd10YmGS0tfXJ
	9CUwsejUz4Y1Tued0z6AUsM5ZGHBz4+H85HKnyiSDNxyWvoppoco4pTLI67oMLde
	UcOkeGFwsiWRqQq6kezrdEHe82WfIk6KUYDKnF2KhechdaV377R6MtDJw==
Received: from ph0pr06cu001.outbound.protection.outlook.com (mail-westus3azon11011028.outbound.protection.outlook.com [40.107.208.28])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f4nva0t4v-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 19:37:16 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t8dziaGCyA9tl06eemLZOlT9E3nLD1n6XgrPblCs8cqa/RJP07rIst55mVtBxWoehNoopq3gj9p8e1cJhm7ikH+Ui0/jNJMbesoRJnGGQwPCVHs4zu9rEQe5kXpiYDoec7GvFNnXbQtlL5UUfQHrL5uJXNkAhfVSyPlP6A9YfzSgqVcQjUqQqrmBN24HN/hduzek8rKdfHWJjDMDK8DhkUEqBjiq1cFhjDmoduug/C2nlmsRkLix+G+M/36GSowTc6XOEGHR3rzL7OMV2FoQij7UZfGJaLSLYhun/8ApcSX3GysvR/DK3v3yyaa90yjXT+AapnNLri6yt8+GGXpcrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fm2kKOzkswiKmCetX5ZH29NOMzsslkJKXWxxFHCVWmk=;
 b=QTOjZavvWy9CVDSbyyAKORzzAv9/LluntuRZ1lVaP8W3xBLxylGkQKjG74iKsBd7EZMGBgstipuLroIW3CD74TfqBP4B/VmAZYaaJzZgUAgdfDzQFU2SO1a1Il6UHo6HF5jlh3BTIPPknF0YWfMCHu/9CZ8c39DH8A7cm3rCH7XxAmP7ksQa2KfwVcYZLWD1kvOtZIvZbse4h10fzByZQXYNfkAoXFv87gXWnfnZU1+tOx+18wY+nn1FgzabR1eooQ3PzPDeGs/ik8W0hUs1aBa7jw0MpMC10cAtphlLprfQ0kS5pfRH1NwPI8xwfSANk0AEZlGQOajQqpoDX0MjQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fm2kKOzkswiKmCetX5ZH29NOMzsslkJKXWxxFHCVWmk=;
 b=J+R+xQZHATJ61jHe1UMVFDMdzVEEpfg69XC2KyoEYkPW8zyxu2gumzExNdspJxnA9XpAWLAndnkPIkTWsvfUPfQUsGcYKlpLnzzLBIbNA9lqIJLrpx5ZSfEAQtbFmDpsgDCWc3oislQOiJCyKIavXqbfrz2dPXcnWrGHDK9zANU=
Received: from SJ0PR03CA0354.namprd03.prod.outlook.com (2603:10b6:a03:39c::29)
 by CH3PR10MB7862.namprd10.prod.outlook.com (2603:10b6:610:1ae::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 00:37:12 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:39c:cafe::a8) by SJ0PR03CA0354.outlook.office365.com
 (2603:10b6:a03:39c::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Wed, 1
 Jul 2026 00:37:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 1 Jul 2026 00:37:10 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 19:37:03 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 30 Jun
 2026 19:37:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 30 Jun 2026 19:37:03 -0500
Received: from judy-hp.dhcp.ti.com (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6610b3Ch3757745;
	Tue, 30 Jun 2026 19:37:03 -0500
From: Judith Mendez <jm@ti.com>
To: Judith Mendez <jm@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Ryan Eatmon
	<reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>,
        Andrew Davis
	<afd@ti.com>
Subject: [meta-ti][master/wrynose][PATCH v2] meta-beagle: Fix BeagleBadge build
Date: Tue, 30 Jun 2026 19:37:03 -0500
Message-ID: <20260701003703.1702137-1-jm@ti.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|CH3PR10MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: a52f4300-c7cc-4cd3-9bdf-08ded708e365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	y9UIVIN95CwBpNwq/GqoEduAmPSsBLaMbO7Ft7O3ZdvCt1u5/+goYC+yx3xG+NiI79edR71109bNTYhUNvR4v5vzOP7rV43I0zCQsVstg+i31rnS92JW+LlFD8TSHWiMs2oANDvV7QE1xvDbe9Y6ziLyVu7B0i779pLKJP3Wu1pppm03wKXOLP0LpX2JsQatwQfayIEJSGZwCBkgAddRAb+9Gsr7S46O9LMlYrfwoYkHBH/opOXYlnG9OFjza8pTMi2vF9/DxwJLHFAT1OMLOImTKOBUE7bmmDECxL7OG3l/F/DVaXZ8CRmig6Tq7S0mJglR2gy/PyjPwNv66ubkjYDotjsGKAUBIK5HCT+mxjNc1lUpRK/Wk5l9Luq7U2eYegp6HCsbzjJv4iSppM1aRmFc8iliL9/ej9/HEcG5iV29C5GEJe0vE9ROKSf6JeP+Ql37TOiblwGRd0sYIVmDu1c1sv5Lk6RFrJZgZ5NXYSgAMCHY5uMxhdgHsNnhCoOTDd+86mnGH5vhbuzmBU3T2Av2O0f23O7oRwf7DEMVfuWmUeA+5RPcnnO8CIRMgQblb1vsGwbWlGRIJ0GA0c81z7OCn1RI4nC4iarOMrMBmmzdnHk+cjLkQ1PUy/KE5XZxlV7/Op55awJHRIhirNaxWjTteNZ4pOGhExZ1DhxR7fzDt4csnYzRw6tEUgTelMCWetU9u8m/W9AM4PHPAJBdrw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JXIX5rxjvZrtPnyq3uqJTdH9CKklMmjkhk/jqhFSVeWSNoIhY0KM56w+C4BWNPSzv9X63N0p62CnvaY95mkyX3h1NlMxxS4CQpuMM5HR5zTyA9Ak3T7E97wC7kbxLx0IXsq3hxo0lM3MPoFINXx5C2S8JUiaMvDkvILkFS5lI261cyMdCKRC/v/sJdoteheY0UyB0vj2iYOW7X81O69NEYZSeo1MkvyULrqs/e5v9cCSWu7jCP5M9Rcdr1h8+3kmHKUnYfKH/77Kc8OeNxIpRvG5QGHc/xbFpCuAy7cTp4ZzqhDaMcrtG9i0KjTcwaubCmCeRZ0EBAhExk1td/r1G7I/WPV7nzhDG21ZUs1nSCT3IbWocC6XqspbwV7qFElsf5HB8PwCjgxPtzKF7cz1f46ydXynrOrKK0bkxwtcuOwFf/GMuByGoPTnlvMZGZ7k
X-Exchange-RoutingPolicyChecked: 
	KHafb6ijU/qHtQTLuEqKdInmBKUaA5EwqDyt43YjqktEBuPKY/rR31KTW6FFXhDhU9wZMb6/pVFDWljdAf3y8MUyPVE+dxQJzN9f1wJqCketExqZm4qy52NB0yOnZNajYV6mtRhkF27gCscdWy/q5gUzMhsP2rd4JjGGDlzQf6y9ue8mnpoVq0MCILcgBa9OxwoaSmsHRFmPpn8Azc1FbztCW8uA5iU8xSOsG1Q0+Dumq47P+96ne2WC/W01CJDEQO7k2ontnJNZ9/QnF8FuXpWUqe1VNyaJRS+o2gHTcGUj+lArToiMFOLYViG3E2pdakHc4sBVPB3oz8JuODfYzQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 00:37:10.6596
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a52f4300-c7cc-4cd3-9bdf-08ded708e365
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7862
X-Proofpoint-GUID: cMN2wDzUJLwPj2PMrt3KbpNE89Ng34rl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDAwNCBTYWx0ZWRfX4mAyFywdyxsn
 4JNo0NeZV3NFSE3JbProPyvwqq51MmW3sPHN2jzYPTsSBgkDxp+VY8crcCZ9gl6W2AjUOlou+A2
 vAZSCCh9n8B0pNdWNsXiOfdgIoInlG0omSk46l/1Yau0kgsp7OmumNEjfey3osGRTaxH+Nk9dxg
 Hy/4nxfT0Ikv133V61pQcvSyo7EG7E80fQpEtTyL6VgbHe9/KV+ZEEylR7Vh6ZJUVChDSqLCQ+u
 ziMGYJH77CsftlbYHh59WjPUKzoDxFl+4DvrjxcIzY4eauLsoDck9BpuzVKgycdFO7FGBXTXgeT
 qdoNNtwmMwDBoKrGJ7wlJTYH4+3tsROmT36j7MfThHtFvTZsnz4kOVcWitv3fsZUc1onbdvlZKe
 egtnzp0/Dr2GQpGE/evJHRqcVK3tEbY2sN+xyssTIdSkVj+Mt2MKB8QB7FUQrLFb/nP53qe1WU9
 GfL4T9ugprg/zzu5yUg==
X-Authority-Analysis: v=2.4 cv=FqA1OWrq c=1 sm=1 tr=0 ts=6a44613c cx=c_pps
 a=r8gZD2gelFFA3OdVKTiE/Q==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=sozttTNsAAAA:8 a=9XpNp7vMdl5Uw-I0-fQA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDAwNCBTYWx0ZWRfX/eynwt2cbfbG
 Hon1HVbcyDh/AoDT5Iy9ebBIyrMNoTIvZc4AAlTs+z2OX9t3ONtyT4/ilD6TRDZfTUv75+Ckcmz
 31jsGyJaTTIz6cFDig1j5WniPz7ZZxw=
X-Proofpoint-ORIG-GUID: cMN2wDzUJLwPj2PMrt3KbpNE89Ng34rl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_06,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010004
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 01 Jul 2026 00:37:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20112

Fix BeagleBadge DT which is now k3-am62l3-beaglebadge in TI Linux
6.18 and TI U-Boot 26.01 build name which was updated alongside Linux
DT name change.

Signed-off-by: Judith Mendez <jm@ti.com>
---
 meta-beagle/conf/machine/beaglebadge-ti.conf | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-beagle/conf/machine/beaglebadge-ti.conf b/meta-beagle/conf/machine/beaglebadge-ti.conf
index 78525030..5d08f0a1 100644
--- a/meta-beagle/conf/machine/beaglebadge-ti.conf
+++ b/meta-beagle/conf/machine/beaglebadge-ti.conf
@@ -14,8 +14,13 @@ KERNEL_DEVICETREE_PREFIX = " \
     ti/k3-am62l3-badge \
 "
 
+KERNEL_DEVICETREE_PREFIX:bsp-ti-6_18 = " \
+    ti/k3-am62l3-beaglebadge \
+"
+
 KERNEL_DEVICETREE = ""
 
 UBOOT_MACHINE = "am62lx_badge_defconfig"
+UBOOT_MACHINE:bsp-ti-6_18 = "am62lx_beaglebadge_defconfig"
 
 TFA_BOARD = "am62l3-badge"
-- 
2.54.0


