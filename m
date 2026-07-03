Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9E4C43602
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 15:49:17 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96096.1783093755976098823
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 08:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=IXactqz+;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=PA6Y1erQ;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BDsM3945053;
	Fri, 3 Jul 2026 10:49:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=UQemUWjRFrYO7
	aTIFGMd5ZbKzvvh5/gW8k2OFbCwfcw=; b=IXactqz+4bkgXc36dFrpmFn7wChgk
	BqiuD9MPjL0X2hl5t50t0a3vWNHwMGxTl5Z8WlKt15ONUHYREA+3FhPpoBI/AxQA
	4fVzaKLYfoR/BGllUSgcoa6qRjhnyMvo30yLyy+y+QVJ8hdXcIKQOouuLvm576z+
	S/JoFwbEsqDScuRAACJVN6wCfYiKq7e4attJAJa9Ojf7Hj6X+3Qq2p1cw2wUXFRO
	+kMKEia45/FZvQhdIEpnyKJ045PjKLBN+i4rQmY4iiWAtfGGCamM0HrFI6qL8v/U
	rpZZPVltR+b58uuPUSRcVa+LPcLpbFt+Gv4oV1QwPO7NuH+E6GAWvVFNg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012030.outbound.protection.outlook.com [52.101.43.30])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4f6c1814gw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 03 Jul 2026 10:49:14 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j9yPXJ/DJp0EQa/MV2idxazophq3dS8IKeLpnMyRIhr2UW8/DCTAY3DYGNgnZqm1gcHATzr5/HfS0T51cQz/6HTSLkK1eFtNQOB4p7JGDwX6yvwiCjxI0o0qpMzX47GAyVfqZDMjWxQjvCJV6iG1hppaRuDHjh3nCLHfDurC6IEvjr9Zmyo2CkbRf79LEu0Qnfc2wjDL258w9KEnluhmkduGbTL2wggcSGdCXyRGer5Kik3A3R72yjWKge9RLngVVZ/wyydRWPIagoL0sNq8eIy/Cztdk2QCe1lUAXuyi00iV7JZihvWOkYbPmB2k2EU63Q8QnCB/hATtEX9KXB09g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQemUWjRFrYO7aTIFGMd5ZbKzvvh5/gW8k2OFbCwfcw=;
 b=yh7VfRHcOYT0PALwEtc8feMinD8bsJ6gugupsbh+BoubG3Qz0mVDOePU3StSdIJSCtWLxPL0R8tnj6wZSCHnAGwns2yEvs17UXp8eiYuI/dRx6SfgNIJM+IFl3PGcNWaNXX3rY9uTZ47q+2XvRROS2LYHiz6cwotXF3rAjDW+roFsZ4Fg5+hw1ZRujSD1lVC5DzR/asKyf0tGOKOaLM7q1rYiMoIVFcetSS9ITBQ19Ltk+IfGbtR/nWvGGcJoqqaO6kiMIlWAvErdQAhqPbOLiol0vEhh67yoWWo6tfrnctOm5z6QIFy7+eI4n7VKaUWBnkQRTyVzmhpRT4RKe/0zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQemUWjRFrYO7aTIFGMd5ZbKzvvh5/gW8k2OFbCwfcw=;
 b=PA6Y1erQnSSUSABrdXVXEaDLMJwNI3P4y1eqEpkdQjFy2x6IJ+X9rARuHYfsycUNFWjcJ/fF+/g/XpZKPEajVdct4i4mv/0MmsFxuxzxVT3HtEZ+tOaHZ1dG24l+EtArhcjFv1g5jCBmXPPgK+CK0FA67gh9schNfk3uEAFz7Vn4fPbVnlqtwNdjyyNY4QiI/EjAfF5ywRQTu1C0Q0BWyicTw196CcCwWvbwQgSuTS6kBYeiB7X8LZpS+7o7AQqGjvfGTvG8bgXi0bmaVApfWSPQGJ5vLGoVJGVxge5FK/HkqzUqA+Lu3m+PNPkYCzixPzjBcFg1zjIV+u4qjra8EA==
Received: from SJ0PR05CA0140.namprd05.prod.outlook.com (2603:10b6:a03:33d::25)
 by PH0PR10MB4711.namprd10.prod.outlook.com (2603:10b6:510:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Fri, 3 Jul
 2026 15:49:10 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::2f) by SJ0PR05CA0140.outlook.office365.com
 (2603:10b6:a03:33d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Fri, 3
 Jul 2026 15:49:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 15:49:09 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 3 Jul
 2026 10:49:05 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 3 Jul
 2026 10:49:05 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 3 Jul 2026 10:49:05 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 663Fn5Mp2455047;
	Fri, 3 Jul 2026 10:49:05 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 1C7662A61; Fri,  3 Jul 2026 10:49:05 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202607021223
Date: Fri, 3 Jul 2026 10:49:05 -0500
Message-ID: <20260703154905.246374-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|PH0PR10MB4711:EE_
X-MS-Office365-Filtering-Correlation-Id: 94e49f11-a67b-44ae-65b4-08ded91a9f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|56012099006|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info: 
	RFw914gsUebYT1V0XFdlmnWGh3Q/BnjU3wfFovxEZAdvWeE0aHIx2MEzYleX6eMqt58mYW39rW1ZhkIP/0NAbyjwNVdNtDTWCMDDmD4yOBevaMTP3I/TSLuuTFJHi6NHSXu/DqVIkX5aOunswFhdhEXK9M1A8tzfDg8C7J05JoZ+ltqq7wBMA86Ebb9ibX0h1X8yljF+5E/x5QWMAt+BCZrzMl+XRpSWoFf5bhfDWrKvNWsXl+u4DOoMl4xUBUjq5LsdkHqBV18y2WWtwzwF9Vv4fCAuioQm73lmcjLw43b45pVDqC2IVKveWW5A7nC4Z08gsSZawTskhJSRxVeibPZZUQmRh15eXVgzAmDbKRqhbFmheZiHSP/9A7lGhqwbmexzs7AHN+cDvz5m7As/qzWduZBAhCG7b+bm3r6Ql0FqzfYU+uneH3gn6PDSxyNjZYwRLBWtiaRJZHdhhxbf7S0CPzS0AhjlLbSUr7Lxe6JZUudGAt86LEC+L9O4mXorL43TaWqJKWooxFcPBZb+zPPmUP/ePXd7Eoym2USI2rESnmh8YMMwBcpfbjKJXlpIVPvYvT4SzXIpvp4VcjqGyEEO9DQqUVqb4h+EyT/Z6rGMJkNGquMY4wMtbDwVPGFZIMzbe9KYctQpUyYN2ar28rX1NCZy+A92s05yUnWaTzjmIs/nafW0agyCvRfFpz0Xh3GCr0CEFcz3dyjI4T9e8g==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(56012099006)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Rr9o76sWU7vfmXbHi55jL89CmjQQWsaFjSTzN1wBlSBkol+7C6jqRgKLeHGl/kmUeKNnccCGRwygjh+eDf1UthNltKyMcLL+FH40+Y3F6EDBYGX37lPZhJ2Arzo1tdKxxKCPgKtdgPFXng2k1N49DZrgtV2sl7CNwd8e2CLNjCC+lV3yHHLfIJTpnb9N38nZmEdOFGvp3nGciKNClDLopta9Qrr253VnA5Hj87vb4k9Av6RhcUcUBfI+vZY4SOT/axyVUtYoBmFguxIAKojzq/Lep1PuESLdVib7ACyb55cXNj/xrcbo1e/r4EEc/qxB6+VKx+OF6eYh1pQEq9hTRzbmAjSTetWFNtYK2LugrD2+uTV9DiViG64cIxXQ8BcxEE+lcMYTf0qlzodt0xE9F50pJbiWWaS5JXQTpBQcHB7TBYbqCNTKA7uK05X8Vdlb
X-Exchange-RoutingPolicyChecked: 
	WDd5lU37UDEjGhvBcWkjrK761w4zTU1wyMw+pH6vtb64deNCvmZc2NCtXEOVOQKht1oAMXc+IPj73CvFyqq78UV9PfxKy72/Dmjo9fnvxbIJ5B2xrlXN5MiFj48NWhrXcM/k403TSbjnMYBe4WlkNuiF2xwtatjmfq/LvFsXNn+2boC5wN8DoAPv6s9L59JSE0oo1fPOBZfCczRhDY63g7iUQDpLc51anA9dctfN7qBc9tuSzp/3pNfyO+h7YFEn395leS2/OxPm+C/iZJE3Jl/OBW4CQd0jfVtQr0RpB9qNjWBdyEWuHGMyukHf9m6Biu0gWp3v4dxrKUnZaFCBcA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 15:49:09.5728
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94e49f11-a67b-44ae-65b4-08ded91a9f34
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4711
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDE1NiBTYWx0ZWRfX6HdTXOntyl/v
 0vA4KOjFOdwya+C5he3QUKj1d3jP6GdKcUeO/rGqw38N4eZVJYGvClDoJciGQc8y2bXYguV5Mm0
 SJWQ/xTmIi1JNuRpXukoAjjX5y4+3TD/CxYpX9zrGIt7HxDZt2ePRENrY7KnCVUNu0NdNJlRBLy
 NF4bomL7qgZPATgNjfB60eMYsBQfVBU6S//h7wCZ9oHQH7imSaU1qvkIvddtdHLZ58GYVaDlCbB
 Q48GxybnwhSHHYTBKfxsNAGKkGNsOIy/L3Wmc+JHGYc/I1u4ZimmQPiqPQyQjs4W5zLIb32d1pq
 K/nLZ7W8FPBQNj6acwGpdvvkooGvWDLJTbO5ZtrTWpIvimvcshI2+YEVMahalPBOKLsKQ6rv1+u
 I3rby8JHPiiijXVynSJZNczCMKe/bPFZnTgEiFJc8RKFkxlB97pkr1iGgLpVdD8gXxFgnQSWBVG
 USFSIpLW0kx9r6fOW6A==
X-Authority-Analysis: v=2.4 cv=I91Vgtgg c=1 sm=1 tr=0 ts=6a47d9fa cx=c_pps
 a=H8CAifLk0DAaaH9V+JapoA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=sozttTNsAAAA:8
 a=b45o4kL6AAAA:8 a=NEAV23lmAAAA:8 a=moPrUAWzCUszb5AcTwYA:9
 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-ORIG-GUID: vwCY7wrwS6cD6DvWRPkON8VBHhkM9nqX
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDE1NiBTYWx0ZWRfXwjy9/NbDVM6t
 efHJGctz4YXt48IcFTWgv65XLpD4KDHlABxH0smbyQ7puuAILhXQ+R17jDrjWvxF3PSNhqtaGf2
 3muhnJDRK5fiK/mMDVvs3YRy74dRdRg=
X-Proofpoint-GUID: vwCY7wrwS6cD6DvWRPkON8VBHhkM9nqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030156
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 03 Jul 2026 15:49:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20123

Updated the value(s) for:
  ti-linux-fw: TI_LINUX_FW_SRCREV,TI_SYSFW_VERSION
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging_6.18: SRCREV
  ltp-ddt: SRCREV

Changelogs:
  ti-linux-fw: https://git.ti.com/cgit/processor-firmware/ti-linux-firmware/log/?qt=range&q=5ee4bc3535481fe9831c0223974101e5714e7357..8f8592375a7930bcf41feff1bb26a5aae46857ae
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=ced00b83625b0270e481d517b76313cfa517c2ed..901e2d14358a9fdef7c13ffd3d964cd5ee5259b2
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=6b2eb7030f32ff300e925dcc01a15c9ec4f3e470..4615c56b34aafb8425404aaf864a925899783815
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=fcf2909c4d225f0116d7d497c511f5d61029320c..267f219ebde0f56eff5b8d6281d4b1b823616e78

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc           | 4 ++--
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb   | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb     | 2 +-
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb     | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
index e3a2708e..0302a36f 100644
--- a/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
+++ b/meta-ti-bsp/recipes-bsp/ti-linux-fw/ti-linux-fw.inc
@@ -15,13 +15,13 @@ CADENCE_MHDP_FW_VERSION = "2.1.0"
 IMG_DEC_FW_VERSION = "1.0"
 CNM_WAVE521_FW_VERSION = "1.0.8"
 TI_DM_FW_VERSION = "11.02.07"
-TI_SYSFW_VERSION = "12.00.02"
+TI_SYSFW_VERSION = "12.01.00"
 TI_HSM_DEMO_FW_VERSION = "11.00.09"
 TI_PKA_FW_VERSION = "2.1.0"
 TI_IPC_EXAMPLES_FW_VERSION = "3.52.00.01"
 PCM6240_FW_VERSION = "1.0.0.0"
 
-TI_LINUX_FW_SRCREV ?= "5ee4bc3535481fe9831c0223974101e5714e7357"
+TI_LINUX_FW_SRCREV ?= "8f8592375a7930bcf41feff1bb26a5aae46857ae"
 SRCREV = "${TI_LINUX_FW_SRCREV}"
 
 BRANCH ?= "ti-linux-firmware"
diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 2318ef4a..d4d3e660 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa:am62lxx = "04a8132f33bc1f70b363d1aa203e58f7012ea535"
+SRCREV_tfa:am62lxx = "550f0ad2bbd033b92b7a88f52ed23cb5984db65e"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-tfa-2.14.y"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 1337b373..915b96dd 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "ced00b83625b0270e481d517b76313cfa517c2ed"
+SRCREV_uboot = "901e2d14358a9fdef7c13ffd3d964cd5ee5259b2"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 8a3a80ba..9b12f40e 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "6b2eb7030f32ff300e925dcc01a15c9ec4f3e470"
+SRCREV ?= "4615c56b34aafb8425404aaf864a925899783815"
 PV = "6.18.32+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index a9ec110c..78d9cf2a 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "fcf2909c4d225f0116d7d497c511f5d61029320c"
+SRCREV = "267f219ebde0f56eff5b8d6281d4b1b823616e78"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


