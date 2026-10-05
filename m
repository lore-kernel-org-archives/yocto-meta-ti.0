Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 086AECA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 13:03:43 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19514.1791205419913557317
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 06:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=kX7wPBtx;
 dkim=pass header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=bnnF3DM8;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CI8Jm4126204;
	Mon, 5 Oct 2026 08:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=PlShqQMSkx4YO
	9IM1D8/38MRAgV0xgLJ7zqwIzDJPOQ=; b=kX7wPBtx7tThjH62nAJLGDr+90T5G
	+fSWKZP83MadMb8IKYht83PCCh46Gs2PZnTQIky5n+9Mr//xHGnBNDnckrfWMsxy
	T1RMglyPgZvAGyjIZ0U+KRCBoOJbW1FMjRl0O1OsUsaLyJ/Tdz9Ayx6TlM0NK2xG
	SJzlD/M4jWwp2Nad2JwE41K9yoM91XrGV1MrZ/mDpInpagRmkF6RraeCmo3ifDgx
	oLo2iE/5DzoACjK9MdqTXN/rL5NXiw9Zdcgw3d2UOWu7CdNH5v9rMUwD+gAGv1Vu
	X3N+lahw0B9nW9M25Idk6zMJkNvj90vvIe56gBv53svzW8/IXlDdvhBLw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010035.outbound.protection.outlook.com [52.101.193.35])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h3h335d9y-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 08:03:36 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tNOKCkBoMSDW5RQy7Vl94WaUvhJpfdtnAwd03nYby48R7vrdllB28WjNSQ93r6CvOUr9e49AoF5tMjxCzb3zmI8L7bgcfwds+CJm2xjvHh5LaNCw9zAioLGMBtpWFO9IVc4VCnqTE/kCglYOeJTdOrGPxyxzuK1ct1DYaEPix50twUNWJXbAfqfxYaU3iGNkPWbb8U2IwRiiYuPxbIfNEzUoBsRV6djMGSlfDqW3OPHqUiT2sVv9Htn35If5YNaZFRB8ZZsuf9v8aj+ejrkYm6pI0ik1t0PKSFvvYairDbph2xtTyUkaFuw9DW65FpZEQogUChGNAucT0917m2G/0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PlShqQMSkx4YO9IM1D8/38MRAgV0xgLJ7zqwIzDJPOQ=;
 b=Vqwiri5aGbESbzZjNla7F49EubMmBMDNXxUQawMpc4Mg20OrKmxrGE48uk87JEAJn3+/2wYQZg//pCqyPQVJJwAvL7FXTzjY8uy0gO0S4sr/7HGs8e/uHtj7/kWXX0q4cGuTVQXe0aWsffzCyz3G4B+YbCiV5iRZA2jz+pzV9niwPmL3xyDF/PDAvt+IyPFyKldGQ4zQgQvwY9/dFviZ7N37univxx9WnwitO1egkOqMhI/iV8MFBN4GTA1GgrDg7RgtXamT6+ZcoU2mrhGOMuy1CItEax4AHTG8BbKNXk1A36z8iXFmnq1/DlayoHOqYDhQDOBpLynyeEDeMQTBKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PlShqQMSkx4YO9IM1D8/38MRAgV0xgLJ7zqwIzDJPOQ=;
 b=bnnF3DM8a0twFyf0kKVKetQYzyvt4z01GDfdVnc3FY9H30iFdjikfcWguOIJkqyJy8fwLFmoMHz/0/QwsjhdoeT9hmYl26QHw82GB8+eNpP8EVS8hToDHoFJJZ7vEbelZvpAVjjlY0jCoXjWxThjL1gkri+NY5iZG/rMz+pV56E=
Received: from BY3PR04CA0019.namprd04.prod.outlook.com (2603:10b6:a03:217::24)
 by PH0PR10MB5708.namprd10.prod.outlook.com (2603:10b6:510:146::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 13:03:27 +0000
Received: from BY1PEPF000264B3.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::8f) by BY3PR04CA0019.outlook.office365.com
 (2603:10b6:a03:217::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 13:03:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF000264B3.mail.protection.outlook.com (10.167.242.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 13:03:26 +0000
Received: from DFLE208.ent.ti.com (10.64.6.66) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 08:02:34 -0500
Received: from DFLE203.ent.ti.com (10.64.6.61) by DFLE208.ent.ti.com
 (10.64.6.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 08:02:34 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE203.ent.ti.com
 (10.64.6.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 08:02:34 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695D2Yj71179553;
	Mon, 5 Oct 2026 08:02:34 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1xDiKw-00000006Qn5-2Cvk;
	Mon, 05 Oct 2026 08:02:34 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] k3r5: Fix mc:k3r5:libgcc build error
Date: Mon, 5 Oct 2026 08:02:34 -0500
Message-ID: <20261005130234.1532926-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B3:EE_|PH0PR10MB5708:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c4de75-3abc-46c3-9bed-08df22e10b7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	JOAJ0hI3J3tcgfjDRPCWdmarNuGLS4i9d4onxZeOlEGdgvsL9bR+Rxh+r7UefUnRex3LUsau9Rs/mWdiYAin4s77aNMNmAHDo0QQn4HZp9nw4VEFkDHRR44oA3eSR+DhXWWWw2BERkP71PASKhvUWZQdcQ2ozZqPSbI1SSqdi4tZ1NymUviR8KFE1GkW0njj+F14o/pHE9o+tf/KjaETYVAVzgUahcI79Ahjfv2oSymYfa4erGMPHGAcoHE3NOOzGXX9NElO9d5Zgm5xl67WjhTochzadn6sZPhcx6NxDWmK1M/3TEX4/9XiPDEJ23Cjsucw8bPDCfZ4cEKbkb0xo1HfuO1z6XjPtvcCAG9mI9VXmxvqeEbBFfxpV3B9K6PoJNPmhwQR7jW2mARU7k7h9ddzkw7QS8itvGCdwzL/UV2rOdcKH/czvHNNbBoCKpw0CrC5zv5dHaXnWqw8kYQAjlGJlPnyE3YQhFRLrG0zLjJVuBv1s2+ayqu/9iGCtBRUm6azPZhdQK08OjvwPInckdfutb8AYbKO6qKBrqrIi4jSNkgNl81NcJz1Q1Uq33aPS0RE8nd+rzvNXJ6BCtrk5BPxhM7Ahr/hnt3Fm7wQHPtTA0kWDccKuZBGQFLAZBT0kln7pLbSDI+k7Beg8W25eO0v0UWTy2OoJLYkCQ07eyQ=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	bGYIfpZ1DK2twZScNmThgrjvrWILy27FGgOc8SXQJws26kMtERsLZ/IJalrpoh08TrD7sEoT02z35LhJEyJ/9NW1LPKFoSb5CA0GD2hPjT6YXOriXnvtzANdNDeQRVIv0AkkACPFlVn0KlDe3xfcdVypajNwX0PZqPkp0MrU9Ge0DXCmacYuCIDVPYbACfBLQdPVlhyKn+uz7lQ0N+/1BwmpzetiR+r6fbWLTYEsww2rtoN69m28wGjpxHbW/lREvlqf9OpnqPwJTlkEQK14VlxRSyQ8EvY6peBr6YJ7FkKHEXS9Rq7wtL+3iA1BjJIpm3rbKQnidnRL5EehiV+KxfbvPWeIgSAS5L4tjBz59gl8WqQE7EIlhPQQfb6Q35EwJdsOAAby5QgTl0kM+1kGPF3jDZ0YYZA1kRgySzxyfADjAyr2iYkjlLs6WHAD7gPd
X-Exchange-RoutingPolicyChecked: 
	1z4PetLwREcZ//eixg8ZKTQ6LS9h7sQigU3A2tFKGl1zi0TJS3wRnanqr/Qw4iVpKNkuHyd+OBw8g8OQ7YHQLWP/mBYSc55v5R3JfykuHNKT71jEgb6Stkp9Ma7jcV84GwRLlIgGCI/5RFrtXDs6UibzNkzcxIr0iOirMgL/gVaMOu7Uw2nzEvaNSwFTfFUJ9dHd6dds9R+veCmPPQuXXetxWHYb4fCdj00hg3uTtiVpOH+yZ1tSuaz6KuongX7jQQOL42pjPa1ccCmPJfDTxGZF23fZl0a6K8Tqd3I8zokWscWOwdDkcUiNdyswNrbz51OjhUoK8gLqK7B9LqQm0g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 13:03:26.4306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c4de75-3abc-46c3-9bed-08df22e10b7c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BY1PEPF000264B3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB5708
X-Proofpoint-ORIG-GUID: tQIBWFeqbd_gxbrEwHJWnq4xJ_v81set
X-Proofpoint-GUID: tQIBWFeqbd_gxbrEwHJWnq4xJ_v81set
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA1MCBTYWx0ZWRfX1xtn4DwwZEIc
 SvKrYq61JIiKK0l3WTWm1D6QRvhAQp3jFR+8eC7f7363F8pK5ppjVmdQwEa1PQP4NMm3amxrCZn
 7Nxm0DaZj7jFjDdv8OuN3tAze0NPQlU=
X-Authority-Analysis: v=2.4 cv=QJX91QLL c=1 sm=1 tr=0 ts=6ac3a028 cx=c_pps
 a=lqu9J6zwYwW4kQ66rv+4KA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22
 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8 a=pc44iWzMAs9hrzLHyysA:9
 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA1MCBTYWx0ZWRfX6pRDLbEVpPka
 zgpaPWBVe3eHXQuZGHO9lojTSIEG7WnPVfwatEXM7swmKq0JvlSr7SFEOcctbx9heLPK+LFohui
 n+BPa1MIjdRPRRjryg4vt3/OE7yH+y3riXic1fNg58co/du6oyOr17HWLT5Qnc9FBz9RRXDq4CT
 upo9oZ0AEWTItivoZPEmfSXjSu3LFWDKIhr4Eh9xLqCuBgD8nJhBpICrAz/g/AoTG7UOD/3mnH0
 wZeVTbsNbUNblBBLIn3YQz5dV/c6uEGI5llI9pgXv4nKRnRCLfbgK0MibTvSiXtd1MVEDN0lV3a
 8mWLuKc3vLU18FsJ/8y5DG0cU1wNEFbppNqN756xBOjGa1A5EBPw5Q2MWQnmsya7kVdNbkIUs1V
 ZxP2rP1ZZ3ARO28joZ7SdGeQ+tS/DEfxwcsFxLLcOE9I67BwSDri9GCJFxPwiHSCKhJ2/u/YEwK
 DIkqefvABCN/9pMboUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050050
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Oct 2026 13:03:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20436

A recent change in oe-core [1] is causing a build error in the
mc:k3r5:libgcc do_configure step.  We need to track down why this change
causes this error, but in the meantime we need to get builds working
again.  Add the removed line from [1] to the multiconfig/k3r5.conf file.

[1] https://git.openembedded.org/openembedded-core/commit/?id=020d5f018616bc48eae3a23d5498dec3c78a1386

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-bsp/conf/multiconfig/k3r5.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-ti-bsp/conf/multiconfig/k3r5.conf b/meta-ti-bsp/conf/multiconfig/k3r5.conf
index 936bce2f..fd871dca 100644
--- a/meta-ti-bsp/conf/multiconfig/k3r5.conf
+++ b/meta-ti-bsp/conf/multiconfig/k3r5.conf
@@ -8,3 +8,5 @@ TI_TMPDIR_APPEND ?= "-k3r5"
 TMPDIR:append = "${TI_TMPDIR_APPEND}"
 
 SDKPKGSUFFIX = "k3r5-nativesdk"
+
+EXTRA_OECONF:pn-gcc-cross-${TARGET_ARCH}:append = " --without-headers"
-- 
2.43.0


