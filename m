Return-Path: <b-brnich@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA722C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 21:59:30 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9491.1784584767906033032
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 14:59:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=fTgVQeQb;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=P7fYkjTE;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: b-brnich@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJQL9u2995687;
	Mon, 20 Jul 2026 16:59:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=AvT3vo8CltQOW
	29SX/hcCOtnydKzKCbCV9B5XbGklYw=; b=fTgVQeQbeitSzPhK0dX5b2ncHUbye
	uzehvxeh+b6XAnfkiBAalZCzHD7RvJp6kcIHNLgMYB0sStPZMh82uUElc2jrNcys
	P4/ZbA+tyLcLq4lQkTQz1t8W/ZMyC9JZfzcXFdh1Ps4Pp7A2f/BD8VSyJxpTlfH6
	jI1BVvp93DyogdnAZSPeBm3vL5OVPQhc3jz937SmIkd07q8CwmtZRqPGNcI7CinO
	MmtlUM+DcfL3s7gtRNQpuMMSW0Zq9UTHKs/q20+HMXRH0M3IcK06VDqGDk/Gmovq
	nOVx9mSJmizcnNawYtorvLow4cOV3AB85ghKAlwwJRfjnZGsAB83VphHg==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fhjnjuspn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 20 Jul 2026 16:59:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lv/4xp2DZ9LEukX2UEzb166TKchb+Gs6JmCnHj/vyFyE2P/zzO+/MHzbArAWGOvcj+jR4R4fVr/oWeDL55oZFJJP1tn+tpnYSxpENjGFHQ7DJtRiq+QAnX2bouu4p8PczU7b8PJGZTCBRAXHHzUfkJJuq9uBudTrBEYeWiJUV1cagYkAIp6/G2Qs6vkWiZurLgil9q7Ij/SzWOBQ2NirmdSgxsPtU4pBYTprMQIHjjOvgdTbjOAuOb66ZqL79tXVM8LElN9r3suexMy7hPun4weSzvy8eigd4UEAAYJnyKHapkDAzlMtvea3dG5BruMQZr1FI0ijA/CN2JqWCAFU/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AvT3vo8CltQOW29SX/hcCOtnydKzKCbCV9B5XbGklYw=;
 b=VAgXCtXEtIfwJ6y1vJ5ttsE4qQE/9t7QHbkSNFxj9vxMSSJo+YuwCMjZGp4huKlNp/iSzpoj5y1bHTieSXiAeL8d85SCw8siWRVLCaQUnxNQ5oZePbpY9q5wH9kGBN2S0/h2Wb10jUGBAiTKnXZyv4WXVPT1/d0QhHUt1VzvKvw52x2ySSMgbbmmWphhzsTKH3HNcLcSgzreqmKm92b6DF08w6i3TdvPUm2iN+dFcPCfbXO1Dh8LzZyz3ZSkaWjVxRmi5vuVoBT/pXFQ6nKApENbR4UqBgjM+GF2HBjg9p++PcdGuXpdnTTbTMIQ+cxFbgPg5xuMlPVHNhrSNDl0cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AvT3vo8CltQOW29SX/hcCOtnydKzKCbCV9B5XbGklYw=;
 b=P7fYkjTEAX/plhzIlE9bKq+y1UVmrqPvfU605HoaK6l1dMCKDUYlbauGHCFjbRSM2G5wbOdoWogGQfr6a2JiODmRzq44yZzxxl9xmb7Wt4wzSpP5xNFLYvPmf5Vr8LCYrvbYqEDM7Wa28Hz342AKxKkz1kd3sqOiyGnRlieAuvs=
Received: from BLAPR03CA0135.namprd03.prod.outlook.com (2603:10b6:208:32e::20)
 by SJ2PR10MB7759.namprd10.prod.outlook.com (2603:10b6:a03:578::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.18; Mon, 20 Jul
 2026 21:59:23 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::34) by BLAPR03CA0135.outlook.office365.com
 (2603:10b6:208:32e::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Mon,
 20 Jul 2026 21:59:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Mon, 20 Jul 2026 21:59:22 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 16:59:21 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 20 Jul
 2026 16:59:21 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 20 Jul 2026 16:59:21 -0500
Received: from b-brnich.dhcp.ti.com (b-brnich.dhcp.ti.com [128.247.75.1])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66KLxL5j3372618;
	Mon, 20 Jul 2026 16:59:21 -0500
From: Brandon Brnich <b-brnich@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan Eatmon <reatmon@ti.com>, Brandon Brnich <b-brnich@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>
Subject: [meta-ti][master][PATCH] ti-bsp: ti-img-encode-decode: Update SRCREV
Date: Mon, 20 Jul 2026 16:59:20 -0500
Message-ID: <20260720215920.663363-1-b-brnich@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|SJ2PR10MB7759:EE_
X-MS-Office365-Filtering-Correlation-Id: 30982400-3dc9-491d-0523-08dee6aa282e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|18002099003|3023799007|56012099006|10067099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	4nS07VJtWenV70xeZSVpNscxemxieUQUlCAB08u47QCi84awkEsKZ9RjQftBCXnREZg3Zpz3JmZ26IQ0NMgcGkiPHq8VKpHpwrdlkbf759wOI9mrFV8eRTo6aH990T2qZihFvVrfWyRFw6XdOdyFO84ejI0QCwfs/I9WD9cBt8TxBui1ZHL4KxkFatWHxqG+YKI20Fj+zrIjnSyUorALw6AIDa0YLe2lv0kNFCybwf3xuDwZpoAcz9W30n+vRlQgCboIv/qYbu0GKG9KaCELPRCSdn8+rIM8nCtFC3fqPM32zSn+669vibI+0VY/26I14DkV8Q7pep0jQtja7pbWxoYUwUdRWlMUMVDoSxVXYWJSwLy6uX8Sombq4DVqZ+NmvRPBPkiuPIgg9usSp90TUJI+QphmlTyTNRk4BdfmYR5CpSmfv5UyKyFYPcCToz7m7VswO/H+XqhU5hT65l0h/13nqhlKcnP3cpNmA5XgaZ64Aie730vXfcu5xiNOLcM5I+SGHizb1je3ikGhabnDK0RmaFl/p6/mGloIn8XPJpqnqwNLdtqru6rOSkfEUI+jgcKRPdr6FOcW9p+iBssv13zA0o2sRip6VF8M+aJABa4OISmNP8oEsILQHoYy/AzaKTySsvJc7oA9+dH2oOtI6NgMsa1oesXd/RSnyj2CJ1ht6OmzNq6ZHZR/GAcfSMtcnuyItbkDgD67j4OAty4apA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(18002099003)(3023799007)(56012099006)(10067099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Ins2ZKKtdiAsxAfKHxr0Yi3E9fyxCD9OEIaEkkMdjZJ804PImjd5PtFe8BQZF0tDrbb9CNdWkZtp3CrSZMDJIj1oQ1UnbJsttrWyf5VCZTDP6pbwKO2yRghfoGmrl/BgHEACJxEkuAFUSw1IQOwuXDNs/cmwlHgJTMz6esUgwIoa17Rx//n13voqJ8lORJC8Rzo0YK0EYt+mHYPds0/xjPmRSG6a8t1wymXj7nRbIwoieLnYXk/2Og9Ai460Wm5f4maJghMGiTMnxsZyCasEJC1de3nH2l3HU/kjh5MwYYda/6UQvNT5fYNRt2HdoPUcKYwl9SGGM5VyxQtj2gpbOvfjoN4JR4144x6Rz2Lr+V+/+y421CX+aGykwHl7nE4M3eC9a+6kqh4IbkBy8NQpDl8h1wedoIST/q+epIjAK87ppQHxsx5Fa975s84F2FPZ
X-Exchange-RoutingPolicyChecked: 
	k/rE57t57bI+a+yQ6+LxfrgRPpyKlnnnJBqaZyclGlXEzUKaTChjVOOexRJpNsd3G9ZWdKSNmiyjW6K2lydrF0Ne+xyAwfxyvwpOzVkn+FFqw9ossDg3hm9vz+Gj7PYfdBvQeUIBZNrM4A0UJNjLLXOlZZ8mPMTdOv1aWvWBYZnvmfU2m/12IOTY2Fm6XoViMNwUd5YhpNxErVyHuBmRzz6AbVfpgMEwJOlHlLgXESRv030yRlosrURm09KnUXTMuPXc8CMb+2zjINdXJ7vE0JXzFV2iepNC+9pmmTlFpO2Xqfvc58cPj9vF/vKTAgMIehPQKpJdqWAVvYdoDvnWwQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 21:59:22.4884
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30982400-3dc9-491d-0523-08dee6aa282e
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7759
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIzOCBTYWx0ZWRfX4ctQCC6Qvcbk
 EYhxMX3Rn1oT01Z/5oNgDEzXiePwhKu7pBeKeUSJyXoDfZr7tY6IYszQ/Q+1d8261Yv4Sz3649h
 +MXaWRuZ7vis9biHnDZJ8zsuRT0vlQA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIzOCBTYWx0ZWRfXzA/G6D9jE4/t
 bikmxsOqh7AI5moxZRTX6nuOXY+7lrf7PmRQ7QtUJioJIHvavTNeVoEaAutYNPy8MT1kf+muvou
 NZqdgp0qW8bbO1szZd3Gfv6EIn0BJaOMeSBN+/jek8CEYnbQ4+Sz6he0r/wt8CnKg2DSBRrychx
 hh7yiF5varU6x8Lad79IC9zst79LQwpzRe/HuLUIbMUdnYRa59a5ix9/RVlqQG7/8V/7xTcD0Ax
 fqjqcmwaQMulCnBQUqXdTPGZ5RDdvpekBxV0GBuCfZRpmIVQbIxfTgl3ZzYLUTy1tM9QEZiBQgH
 0ARk8LPTAFyKf/AWyoexV0S2tawrxznPZTAXtzBqHPBg+GNlGXpeGPxIfxX9TP7oAI4nFoJW3ex
 RyOR3gnuxY2c1d6TkgH9ahsJhqOTvQ4eQx7x5Pz6yGL+FiNhFu6vSAY3k6FzGriVp7NbyEFN4Fe
 RKY6FtTFMzstWfr9SlQ==
X-Authority-Analysis: v=2.4 cv=N6wZ0W9B c=1 sm=1 tr=0 ts=6a5e9a3e cx=c_pps
 a=miuBlqXM8bFb40OTON37XA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=ExGC7fgG5MR0hoSQGZMA:9
X-Proofpoint-GUID: xN_lO5SylpCCPNZBSSlk5VM4EMx_SbSY
X-Proofpoint-ORIG-GUID: xN_lO5SylpCCPNZBSSlk5VM4EMx_SbSY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200238
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 20 Jul 2026 21:59:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20169

Fix compilation issues with latest 7.2 kernel that removed support for
functions currently being used by the IMG out-of-tree module.

Signed-off-by: Brandon Brnich <b-brnich@ti.com>
---
 .../recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
index 10a1b1d7..a483c407 100644
--- a/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
+++ b/meta-ti-bsp/recipes-bsp/ti-img-encode-decode/ti-vxe-vxd-driver_6.12.bb
@@ -14,7 +14,7 @@ BRANCH = "scarthgap/k${PV}"
 
 SRC_URI = "git://git.ti.com/git/multimedia/img-vxe-vxd.git;protocol=https;branch=${BRANCH}"
 
-SRCREV = "9453ad8ebdd42a5e5a384c21cd5f6bc2c86aa6d8"
+SRCREV = "9c5544005dfe3fa3acec4cfed7537d5950d16833"
 
 TARGET_PRODUCT:j721e = "j721e_linux"
 
-- 
2.43.0


