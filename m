Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 640DFC61DBE
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 15:29:51 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24450.1787671784979567000
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 25 Aug 2026 08:29:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=SpZCNn5P;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=q3eyyOY8;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67PEVbSv2046020;
	Tue, 25 Aug 2026 10:29:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=ZYkgebNToh0Wc
	QVPNIcBEQlb39OEH5G75esPdgZiYj0=; b=SpZCNn5P/jUFIRkjb87dBj/9Pa08M
	DiABlxvyXsExHfx4+ObOrUVVl/mXHyIw1U9GmzgbI0wOOyKKf9sUZ1Ow6scXUQCc
	1T6SYBuU415LjsJX/qfN7QM1UNghou13laumuXp86ogPirqgtl29DljeYb9MjKMB
	vi79CLNZt5w3v288SpOeUd2EnzV/zEVjT8UEiOgVxCsxUF6MoiyYopbWiW8ZwMUG
	G00vuzz7u+GM7fH3/I0P/3xy4Oi5V5SV1kUROeP2w3d/+0QUFuPCbjk7frJG50By
	OavztPsvH5UU2VWdpWzKoMInPpbEvP12ujqiP5MxgKWO9IXCzjkVYWxow==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012017.outbound.protection.outlook.com [40.93.195.17])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4g92xnknkn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 25 Aug 2026 10:29:42 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BqPVz2Gl9J/H/cP7zSUVqAU5X1oXmcuRLp6D5BMNzUCkDdb3Im1ZIatrlc3ycXZfYp2chYt9FOsFjzUj6/dhEYx0Kp4PAUCyLtw0GjACTLKsxS1yUhgrhB9uP2v+0H5f2GiyRx+RGz7OxeqtelygpTZiEp1tv8Nj6B2tu+vpxjs9Xh1ysQbk58S4IAGVX23Rn+v1I7IvLewJKG3Zy2GsiNpPMjie3OqxtXF5ZG3Cqy2QCuw9kn9hSnnSA0K5YADeMMVwlkRuQCgkhlsGfvq2NkmR8TSfW1Af+W9FFMpZYHEMM2L6DcuKSM7KK7ss4GDAAvbqdXr/RkkfK8ErhLiKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYkgebNToh0WcQVPNIcBEQlb39OEH5G75esPdgZiYj0=;
 b=iKJiAwHrYvqKRqSHWoCFWw3e/U+QPbBRWGHXF9KrEGHvVV4MFMbIe8Z9/8kmFu8kUvFP5ZTR6nSX/+Kt2PvZxb8nFIwbK3VxhZUIfi9KSU0gVtIOCeCIQ7AgBD7h/o6d1qlhuBCkhup5xksSmGw02v4h2REuB3ptjDq46m7BOKpnAhz8C1iifRBdDdxAcbPCXwthyENe0aeWAAB3PhiGh/jy0xmD32CqFbtUvH8HPNoefooqfH62JhNcjykkYGEy4rS+vpWfVnxhIcKkkNjg6CK4ZWiZzt/0dj9zYK10ksy8g9NDhN0Mk8Ejmjtg6YQxcHcy02pGRKNZreDgWYIqHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYkgebNToh0WcQVPNIcBEQlb39OEH5G75esPdgZiYj0=;
 b=q3eyyOY8XxZF70wt9de/+Nui9KmUp55jBiB38K+1y0YV9xGbOb2vYa681esXQW9J2eRFhl0wFKuxsoM48GYI6DTQ2smTncJ8J2xKZTYFGuVJKSsg/4ReO1VG6zcMz30aQRdFHNOu3I7wxoCCht5lXi30gJQtuBOaXKmFpjfcgcw=
Received: from CH0PR03CA0252.namprd03.prod.outlook.com (2603:10b6:610:e5::17)
 by BLAPR10MB4818.namprd10.prod.outlook.com (2603:10b6:208:30e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Tue, 25 Aug
 2026 15:29:35 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::8f) by CH0PR03CA0252.outlook.office365.com
 (2603:10b6:610:e5::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.7 via Frontend Transport; Tue, 25
 Aug 2026 15:29:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Tue, 25 Aug 2026 15:29:35 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 10:29:20 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 10:29:19 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 10:29:19 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67PFTJRp2302091;
	Tue, 25 Aug 2026 10:29:19 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wyt5T-00000007fyS-3cix;
	Tue, 25 Aug 2026 10:29:19 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] check_yocto_rules: Add skip rules for libclc
Date: Tue, 25 Aug 2026 10:29:19 -0500
Message-ID: <20260825152919.1829637-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|BLAPR10MB4818:EE_
X-MS-Office365-Filtering-Correlation-Id: 510121e9-0833-4396-740e-08df02bdab0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	IE/O27agcVcIAnOkdLPxqHnfFcaO0+UdPeT0FPbFDuQvCSoKffQKFJaSjq2YwOqxbkqx/d5fX99jU8nzqUfLjt6s5XVSef7XJmjyS8bdqhw84I1IlupKYp6xBFp9vNHu8osYVm7qSnGWsAOXkmks9nFT6bCEfMDea8pAf0OO09inLB+D1K6ihXDwFSvWfetvl/z5jqvJ1eRL+Ig/77vMdcfOizOsKwzxEPFbLWB+AyT9+mNfUeukhtiW2ln9E0WVzgsxXvCEG7CIavxjyRQ+zC+4JdyjCQ5HPRPVCufN7o6tmE2hiMCYvT3aB3z9QeS6Vg3aNViLAFOMhRyhiTKnmeqkxnt8tpkYoOmk+EjrG60vmaArwMoxXBRmBZWqeRfEmETFT3KPK+DHYpE8rOWQLLCO9b9RFDNx8lBtha0P7ZR7HO4+pjYT034Iej/XReyL1vZgpBOsemkhZFTvA51F//0ggZblhPXhtUtzkvdBug40bo8jGG9KtiPstA94LGJRUPkTzuLtGATeVINATB7uIF77qzbTQD2a1qO6jCqFzTa+xP9swx/SjW8Oj9SuzRsw7CqR38/wZZioA707oW+EN6AbNMGP/GtjvnuTfePv3cfr9eXG2k40GPrGX9DQN6NvSIvx8Oxr8JrX6V/PzdezoXPvHbHypkQO+hBjRdr0yUM+c3tiBlloaxWVYiLYPeGglOkpOXXClUK1hHOowa2Q1A==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	nXz+bUKPAmFfhuTKPOdKbsNsAYpJw2TTQMRWoTGvY4o9ymkYugWZdZ3nkW1UADDn2bPbyGq6v1cg7XgwvizIskQG5RDKNm8F87uNXAZXiJJCHpgaHYBbSFrrT9POhlEPYFwKmiMX6Og8TjnO+EF6jFb2yuLYbQgTrXZbnIru88AvRuo20/olSaWapRgHJZejny+m1yjcXTt13eIrJIo5GBJ+p06eR06Otdl38MEDc+upsN2ql+8OrW0Hn9napNGyiQ0O8kjV0W1Sj7/XiVtTsTccG84Hf+LXKs3X5Uf7n/RrC/+L2+tc52a5vjdb6iZACoqcE65xZmztyyd1x7ql6lGiLyBNHy5olKwkRlVYJ4Ihzq0ifvzdTH3p0MJferoJvEOOuZH7hhMx38nwWE1wjiifSSaxEGFwlkDb7ileYr4pgwbfrgkT2q14ZmRelItU
X-Exchange-RoutingPolicyChecked: 
	fCRii6clZcxtgll8A8B8nWmkeweSXSBMaaBTJwYPA+fVylJ8YsVH01n7r7+w5+pZSYWyxb6GHoVSDdWURVzW6sgPG6jLGJzt5XsKleh3d8whB90/LZ40lWyJxtjXL9zk1gPOEUru2cPWkcseM6bMFF4m8RZEnNvRuiSqeDPiV7suwXqe8ZrYE53tOXDBsKoMPS1OEhz7F+BfWhead7opeJDYmBbAtFPsPmDqNURzUHMrCVOK/k53HBzEVR24+vg1lPRQ+BKZXpzQvSBmqGreALl8I2/TEZWCTF5ZnvVbJRd+WwnGZDAHuPWUvhBeXVn0SclIBj3Pue4+6UXqURaWVw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 15:29:35.0756
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 510121e9-0833-4396-740e-08df02bdab0c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4818
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDEzMiBTYWx0ZWRfX2I3ojCHG73oV
 jONXSwZwL0wFIZeADDmQr5REirRxEL29AXuMiUMFtIdLwzW4pnuHZVT+nOObgN01oYpZZTk9Qv/
 gNNlqfSKR7p2sTWkdBbEtUkkkAXtY6I=
X-Proofpoint-GUID: xQJHotFPfKnxppIc-2rBhX1tmp5bcgrJ
X-Proofpoint-ORIG-GUID: xQJHotFPfKnxppIc-2rBhX1tmp5bcgrJ
X-Authority-Analysis: v=2.4 cv=PsijqQM3 c=1 sm=1 tr=0 ts=6a8db4e6 cx=c_pps
 a=mbkJAKHg+hX/fqCzz7NXWQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8 a=BD8TRoNnLf52TA-oeMoA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDEzMiBTYWx0ZWRfX6oM4i7dHxskQ
 1JHD8ZZ1Jl7KAXzn6HCPhlvXulR7LBpCIgb0Jx0ZuCNLzFnofEcLKBSqTBNqem05Ui4ouR2Xn5q
 66Hlmb0+64+pkYbWYLSJishH9dp5rzT2sR+3MYB1zBEKMQ9tTTM3BuhRp8AGsx1Gm/xjZIF3TS1
 uMUwibJmQsssqn4eK+FaO/OhrBcQ14CdLiFQlLLPnInT8Uc1gkE09svNVwPOuhQQQZ7q0ccvjxW
 dU8wkK5yKpT0xV3fo1CWllIWhr8PoenQNacHhwmh/xNYs4Lx58HotNKW86f0zyGwUL2x1WLsW0w
 AMMgXWKbyNRLJO496I7cELBEwg9W0RtGsqk14y/DLlb8RUpkUC4KTpTIcHgCFLiFRBfmVX7IM+H
 zBs+BBIjwrkQoYKxRpaz+iW5tlzW+t5FFSluE36z8rI86GpSDBaqMSOaVDANv1pTQbjqFecNRmA
 dSutMioVAQ9YZd/sLCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250132
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 25 Aug 2026 15:29:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20290

Since we imported the recipe without changes, we should not enforce our
rules on the recipe.  Add the needed skip settings in the json file.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 check_yocto_rules.json | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/check_yocto_rules.json b/check_yocto_rules.json
index 6867614f..7d8d1181 100644
--- a/check_yocto_rules.json
+++ b/check_yocto_rules.json
@@ -40,6 +40,7 @@
     },
     "PV-1" :{
         "skip_files" : [
+            "meta-ti-bsp/recipes-graphics/mesa/libclc_git.bb",
             "meta-ti-bsp/recipes-kernel/linux/ti-kernel-fitimage.bb",
             "meta-ti-bsp/recipes-multimedia/ti-multimedia-udev/ti-multimedia-udev.bb",
             "meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb",
@@ -56,5 +57,10 @@
         "skip_files" : [
             "meta-ti-extras/recipes-ti/ipc/ti-ipc-rtos_git.bb"
         ]
+    },
+    "SUMMARY-2" : {
+        "skip_files" : [
+            "meta-ti-bsp/recipes-graphics/mesa/libclc_git.bb"
+        ]
     }
 }
-- 
2.43.0


