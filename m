Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8D8C43458
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 02:21:08 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61156.1782958862814569331
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 01 Jul 2026 19:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=G+ZwEGaS;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=UxVjGBfV;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6621LJaV659071;
	Wed, 1 Jul 2026 21:21:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=J0CMbk7aMh+ES
	ptO9KAAacQuTBwWxNAS/LzWhoucD34=; b=G+ZwEGaSiR50EFhMp1KCkRT6ynpuf
	O1w+fzHtEeOCnjbnxCLG/P3RvwMl9pTqyCavzTjgnhhrHiDXj6y6KEjIHu6LReT5
	87X2Vs7GMxkohEGOar1vyKmPAELFAU9NzrXKrql3vIZcyuF42wmHfCrRAQ3DV2r2
	3Fb49EEhkUuIJRZ9c7438lYHTxQFo0lPcYjXU5rl1YYbwDyMF3qPiCSwLXJpMsA0
	Q3hg1XCsABz1gnoAbR6nvwDKHoi8NbqNy4/dp0kR9eIYOp9gIEge7dcCOgmq4Z8G
	r/dgFj9DfCeSmGBgCtN+IDKYa26m/n7P0I1wZNyculilXfvwz+QY3m+Pw==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013071.outbound.protection.outlook.com [40.93.201.71])
	by m0384305.ppops.net (PPS) with ESMTPS id 4f5240w3w6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 01 Jul 2026 21:21:01 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brPzThfMooEB+MGKxHLXQHpTFvgwldV5YiZx6JcvG3MwzCB3KOd2vmJ9yD806T+s96T1lOdqGulCWvk9SQvtqSM0UO9wA+r9PCddcoGri5wadIQnpqRHTCwPdQN5cXP7/iOlXO6ZuOKDJr1ukpnXH4Ed/TgO1XG7SsOkcgo8xRJJVWhrsyHi7FzxbgKEwE55TFm6xrJbAnqh3iCxTSCBck8fQqNFfdMmSNZ10RnfoIxeHSSnMSe/HL322cXIu0Qx1iKiAq6IXID5ldtfD9tbkPuhtvTB/Zgeyxihj6VdPeEmVh/d5aYJqyuovOyE/CTBfFn7bs437TdjOGTk3U5Fww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0CMbk7aMh+ESptO9KAAacQuTBwWxNAS/LzWhoucD34=;
 b=zO98jjIjkeEfcyPyzWhNY4MXmJFScxdnwzKiIJ3jCeLrgX51oxhza7Akr1qTwiWHOIShIOEeFyK8Y/ktrQIH0IcNCIrPDkHXqmQVHy2mvTlDNFPFvTzieoLOJyPHYCLo336utXJr9IIpQOfAAIUCk+9+xrrJTMGgFJUOjjbHDKzTqmZud83lZx7ckwZGT/l0Am9wnnuJcd3yjlG/8pVitdn/LPKPVLdy8Q5n9Ug4I4r4hC/YCEtRKZeNZFgqV4giUPfVy5AXSUOcp5iocei7DRz8tzUIyY6ligMb1KL/FUJzs0ROj0qE3f59UkPds1EioxEqr/k6v6YAKmIlVeqiAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0CMbk7aMh+ESptO9KAAacQuTBwWxNAS/LzWhoucD34=;
 b=UxVjGBfVyTIhyPfn38q0lXu8bSJKf0xfRv0eS4fkFbcVdp8y9QsiPPCFlU/Ttc+ZRwZbKJ/n4QHgK5ge6QqbjPdspqg7r8Jnf8gdZBd4rAwwJGUB3B71a10vZwefvY5k8kko8FCKeiXpPv+O6wz/NPmM9hI6sE3Sa6tdZJWjnKc=
Received: from MW3PR05CA0003.namprd05.prod.outlook.com (2603:10b6:303:2b::8)
 by SJ2PR10MB7672.namprd10.prod.outlook.com (2603:10b6:a03:53e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 02:20:58 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::20) by MW3PR05CA0003.outlook.office365.com
 (2603:10b6:303:2b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Thu, 2
 Jul 2026 02:20:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 02:20:57 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 21:20:54 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 1 Jul
 2026 21:20:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 1 Jul 2026 21:20:54 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6622KsfK2793237;
	Wed, 1 Jul 2026 21:20:54 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wf72s-0000000CbrO-1rdF;
	Wed, 01 Jul 2026 21:20:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] check_yocto_rules: Add rule for new linux-firmware
Date: Wed, 1 Jul 2026 21:20:54 -0500
Message-ID: <20260702022054.3005463-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|SJ2PR10MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 944d43ba-cc29-4d3e-a42b-08ded7e08d53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	vcavVW3vOVpoTthpDDN34FDlJ1c40YYfBAS1ZrNaCDCaCwh2o1HktGL7rJQrL8bduXGkpsAoxV17rNv496OVcan8JstPEdhsh9t3QhnJB7NeRD7yXwHftHFeVsbOPZMTX3LJvXMuH9ROEidKawPvKVn0XBBudVZuEo5ch91Zv4+DibtBtacixVn0Xv89lr4M6SBZcP1OnlGbKC2OgAkzSZkl/2mrI3AJcoFN1+eWnnp4TFtrlfheYbiCvKwp3ktyN3SUVXnS8GTt6l1JfyfcfxjSfh3wHN3uHYyp6umcuaQFs89D9xx+FrOLO4Y7/3SDWLiBOEGr8CotvKJwrwdmMRFfFF0Ew82LKF2L744r+0Q8t8M0m56o3dzTM+GBORQCDdsYp4OZbfSdZiEt0GdhZYECoC5kJsV1xdPrNDLyqXxSnilN55BBjybezAnVYu98/hmxbxEbJw8uowDAUYQYj90zvgF3pzxvaeekTIsFLujliHlG6ICdCL4+RX6Y3pqdIU1tgQ5ruZQEgMAnkS6MczT2kUpagCFyJ1XcQ/TbVA+Rw7G/LveF6s4iyXoLWuXu3El5yDhHvZ/3Hia8XF30ysEN2YjX0S+KitqG34Wued0Az9Yov2CWWoAj45zkf7ePTkZoQFBO5ThferxNbtN9hlOkVSVpbCFnM4tZ4fYSaz8miS/rCc6NrwTQ0xQCjI7R8bNXquygrm0cdRBD4mTclg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	EHrCQ4WrZrHltn38LU8QKgw7Ea36WZLwOOKRB+ktOms58ojCJGUWZYybHTMwICytCNiucUp9/WMWsgsSLFNFZb9PxuP/Snha9CXzq2gQdCK0QSR4F+W1XUeotuUc9uowtguaVTrOsatqz/9wkujRMl67d49v0FNOxd4V4JVizy/ek8rfG5zoGexapjq0cxLrQ8i5jmGt2btb8llQ4RjDYMPxI9ahuarhk5Kmi7JMN02rczA84gRiCINWCrtc4cLDNk9TBOVJydA8Dw/WeAzYId+idW4GkQWIN1bdOFtlx3B07l1s6/gHHZhj5zIlFnOgbgC2tJe9zQV0nBzQsLLbx4TZ7jfSINg8Sg+nuOCHxHCR/kBfwM+7l2kPnx6QBu63uXGxCslMRx939JNU0oeH9/CNXX/k0G49RPUxHRSPClS9Ve1tuO5qSJFDhB+iY/HN
X-Exchange-RoutingPolicyChecked: 
	AUP9okdzpBOE7xwwf20j82sdXp77dIBcWSugBtimt1KrzCqgW1rhIn/Bud06Hjf2Pk4GYh4T0P7DEM/gFoU0IFrGUI9JvxBw/lkZmYrmPdvAwIbZIpKXH2NkEZ9tNzVsNPacW5hn2noMg+KQpCc6hBCoBQQFox16Uy1B4IRrkOVWScdiB36lSLJhtZ457Snv7+ZsyYf/o2EVRbp61EswHopaMJG8TvU939kjtOt2q7QH+E63JessL4kzDQl3hEwal2p1BQO/c3TtNvOlWx1t2socdEexX8UgcF3OKKeBYZeQRYhBQ5nqiIcm3LUc39DmuSk/boFiPGHauc94eiLUcA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 02:20:57.5607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 944d43ba-cc29-4d3e-a42b-08ded7e08d53
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7672
X-Proofpoint-GUID: UwtYGv8onysBDcqzGpb9WSyd5Q0ssEhz
X-Proofpoint-ORIG-GUID: UwtYGv8onysBDcqzGpb9WSyd5Q0ssEhz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDAyMSBTYWx0ZWRfXxJUkbh5gBRn8
 L65/hKR4e9Ls1URtXYVUinZBTjragqA5tW1s9fSDYPBPc1BT+hBw0bkcrUfRqvFRHnA5TyJIZ8c
 uF0yiXaveTj4orr4EzOppwh0Svn3j6c=
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=6a45cb0d cx=c_pps
 a=J0RhwYao4za//xiv/28V8w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=1Lw1To4mCTofJQ74EKYA:9
 a=ZXulRonScM0A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDAyMSBTYWx0ZWRfX5KEvlX5/nEr+
 kfBUEzHQ9bUjq3yIug7k9aRaxIt4SC8m6vdWdCG78N8sgxiUE4puKTNdeziUS0ifUXQT7sPWVj1
 +MBVLiIjL/GR7yf90zEp9psbKN/kIMdTihmiaHlul7w8KboIbsGo4TeyOjfJ0fQsdzIX/wGm+TP
 HVdmSJdAhlh0++nIgzqCoNYqrO1oTLjNPVaIqSW37gGLwM2dj9uQmIqG+sPkXwFTuae8KLIJkOi
 sGa/P2lPWeT6maILjTqFNzTLz/mEDd1zi/1XpWUGaGZoU+AIr5+Cf3BHkwdRbfMC215E9cEFh7J
 aazkpEC+F2o8qw/gdLri1GWYstqzb65UAZfxDTCKfaB16cNrWyDelHXi2bM617eZlvfohshKvBL
 tITWmXQscbOAM5SO5A28knHo9zTLQtCV4fHUw/kdeqZ+Gf9p7m/DnUXQUZzFTOlJkyFKUktqYBY
 PMRv9y06BXKzJ0n29JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020021
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 02 Jul 2026 02:21:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20120

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 1 +
 1 file changed, 1 insertion(+)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index aaded6db..6867614f 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -17,6 +17,7 @@
         "skip_files" : [
             "meta-ti-bsp/recipes-core/udev/eudev_%.bbappend",
             "meta-ti-bsp/recipes-devtools/binutils/binutils-cross-canadian_%.bbappend",
+            "meta-ti-bsp/recipes-kernel/linux-firmware/linux-firmware_%.bbappend",
             "meta-ti-bsp/recipes-security/optee/optee-%.bbappend",
             "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-bsp/u-boot/u-boot-ti-%.bbappend",
             "meta-ti-bsp/dynamic-layers/openembedded-layer/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bbappend",
-- 
2.43.0


