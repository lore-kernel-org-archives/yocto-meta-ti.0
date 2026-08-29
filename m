Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFBDEC61DD9
	for <webhook@archiver.kernel.org>; Sat, 29 Aug 2026 16:23:06 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10158.1788020576320153618
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 29 Aug 2026 09:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=o3Jtjf5z;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=Fzy6GOi1;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TDxovs4097392;
	Sat, 29 Aug 2026 11:22:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=es0P9ZOpoQaG1
	aZ/RlqUWd7jbXRpx9qFCTwRDWCl1CE=; b=o3Jtjf5zLe3vQfOex8rPEbWcleG9T
	a3cqFAJIgNOCKobg6A7b1+wqDS2N08bIbeminwA1ETEx530epXZZBOx5Kc2UN/U2
	to7pxkhQgWX5DRai1A26EKzrmf9F/dk9wEvnh81/DlFkJ6rJJrfhHjFemdqH5SUm
	w7rK9IiEB28JBZF/xsGoLGQ4+kTqnZS0gHnfVrDFaW1Ua7rlaB3/ILKjBaxV02ar
	ABMLxVgq5N0BP1+aF0jkrPU7zwb7aa9kkmnpIm86xTKgg/PXJp4qwoHziV4LRdr/
	UVvjCosu7yXbl7QlZdZl80MHH6sZmNoIVrSEPoyBbQbv7pPyV+RbZ2WcA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011064.outbound.protection.outlook.com [52.101.62.64])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gbqr2a489-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 29 Aug 2026 11:22:53 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TxNfKZM2JP6IJxMk6bqSXEdvkCKxiUOeMMImr0g5oo4n0O3e06hTcnxApzS1H8Z2oq4FQapR3RUkxeF9f7lsKLBMMZCbm+MmXrYdDAJC68EqsdolOCFNW+MjvP1P1GnS6fznrxooq4lJ7BAOHG69DGaC39nyfvXiWpvn/q0kz78sFq2N8T9VUyhBPLlnKedU2YCKOkt1A8WDneDh0wTC1t9T51hkx8hSz3EZ6QiM8p4Ncv7pU1lrnxXtJF8bgjMsGh1bWJdSsag2E+bZfz5zN1IVS1uCB7//WfwcHKISTGwdO/ps0Mi0AVF1beaU9uI9/+P1C0iIP2HjdGCDU4KuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=es0P9ZOpoQaG1aZ/RlqUWd7jbXRpx9qFCTwRDWCl1CE=;
 b=jd1uMixrCej7APlXOzptxGX29EzVd7WEMveiI4LLPF4nlqeT/UjH8MEeN3VzoR6BKXW9Y5Z7nFHBgaJdtGke/3gEN4v3miJpQeqVeglb8YdDkabrwN33HnK498aoV36hAwcreQZcIRCNDI8iwnS+KHHtRbnYGFzOxddHK4UuLb57pky2OD5mXCJIUPu3EdKQe0TP8vV6oBcnKmCdcoH3HGpgypX2VLu7MLGIuhTs4D+eB5vJAmMFN63t/dGHGwiVHb2oVTzB/cLdHW6F6aPjIaUZ3iIsXBLA/KcibIan8OaUKuNC0JyJF1ll48EmXehwslG5YMX5bzllidO03S1P3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=es0P9ZOpoQaG1aZ/RlqUWd7jbXRpx9qFCTwRDWCl1CE=;
 b=Fzy6GOi1Di6UEHq5poRQAyC+iOo3gY3/+in4H8Q784MEL8H/cCrE2kVmJkg1z/imd9yoSHGQA5W65HQKCzuRWyUr7O5ysPvT4nOoUGoRot2Ku0ar0xi49RvXcrl5V2kqDhtFt5o6KhVTO9PsMsX6jPFhNyzEhBYYs21uYwIaoJhQtl91j0U+INf1ZQORdQPRrmGoaDjq2nucpa9pan25GMXuom9J4aRzhu+UsYF1ajloImHm69TJ3AuNrDcXV44oD2BqyI9ySYR4oKDLgpss8BzN7BzxgOJtpEuhnCnis+8bd1ARITQxM5r5ASfA3e0ooDd4sn5R5U90XV7FVF8HqQ==
Received: from MN0P221CA0029.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::20)
 by CH0PR10MB7463.namprd10.prod.outlook.com (2603:10b6:610:181::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.9; Sat, 29 Aug
 2026 16:22:49 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:52a:cafe::3c) by MN0P221CA0029.outlook.office365.com
 (2603:10b6:208:52a::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.12 via Frontend Transport; Sat,
 29 Aug 2026 16:22:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.0 via Frontend Transport; Sat, 29 Aug 2026 16:22:48 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 29 Aug
 2026 11:22:29 -0500
Received: from DFLE209.ent.ti.com (10.64.6.67) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 29 Aug
 2026 11:22:28 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DFLE209.ent.ti.com
 (10.64.6.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Sat, 29 Aug 2026 11:22:28 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67TGMSo23332403;
	Sat, 29 Aug 2026 11:22:28 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id D5B552A65; Sat, 29 Aug 2026 11:22:28 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202608280716
Date: Sat, 29 Aug 2026 11:22:28 -0500
Message-ID: <20260829162228.2725880-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|CH0PR10MB7463:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d6bf298-7e50-4a85-a367-08df05e9c411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|82310400026|1800799024|10067099003|56012099006|6133799003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	XAoJvTqZj9Hw+bkio8UoanZg+NQp0cBAGgCqOtgv28vv3Ssj2nekynPWbizcuuJAu0l3Ta+3f7f9FJzjRf7u2klZKadEsmPAqlaAdvaeElL/Am4EbZ+HXr0Wg8odnnL56sMruyh6EtJJ7rfCdSSx7qwgD8ZluQM2PFtSJGtTv9T13Z/9dKrgVtKE9kIaQO+gg2m2GlpvX2YTn8b0o1YDyNzwlv/cMdJotz7ze0y80aKgtZ8dIUetFeodNrgh++7VHndFrFTFfg1oBc8WVGTZNqyoyr7IUlH92uITOTnh7GDpD5z1qu9HfUI5K3eH+SIaREgd2CJlIdlJJiiaEsr9vnjPD5qsRPrvNHD5BkGvlnJWxCwT9sEz4E6+yjZTey1wHrRutAe91ZkeQIGldJk0B334XPqsrm1xkuoL7x/DSJavVmDbWsJLyoZF2rkKGNz9MSiXOb9rN+Mb3vb/jFDDqWSCnyRDeCtgnZnPCnNbB4ovt0+CXZz1n61PjrzOHleInUcUEPUZ6RVwosibokDX0HypAD7wTMwsVRrr3150zvU3Cr/mc0Bix9T0cmXZDmFYdMye0griEs3jRK/BpfBxlLJhQUNGFAnYFp7jCd07KV03C/5IjmD6lP5n3Fg6rcy9Cwdz4BrBUTV0tM0kVvueCPUahhjzYMV7OnkSrXs5q8IIdB68oUUFT3d0w6aj/ij7wgpEcTuSf/HZMNfli8P8Hg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(82310400026)(1800799024)(10067099003)(56012099006)(6133799003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Munl7f5aUFo2aZ9llZmrURCab+/TLkT8g/ekxX2/TKDGqAZybX6hWdq6qBnrC/nBS0jSLqRyywjiEwuTVBLYknPC/deGlf/Mqp+PFPGVZU/XuuXRdd8YOIeaCRhk7Q6vyjCC6Te4TH1cP6eFVa1LkH7fXk3AfuxmhIlLP+ma4YYKlxUYi3xp8zRrFSIAu/RPK+sCD0IZdkpBX3Q7Jhb5aXY2PTk+RcBTThbvpyDvE8AJ98yl07DuJzVNrsI/DVIi3Ld62uQuypMbEI6VkdmcZDiz5JkKx6yNx20o7gwPcQM0u7nggqyJFAVrvtAV6UCoYKzMRqlSSqaDN8YKU5AEkztq55qZ2ad0AYzn3FCAqD0EizUZkfiITvw7i+083CzXtXRX3OLgzh3SzsWxQO248cvNMMwtklvAbCG1S9pp1uyN7Awxoai32Ms7m/T67dM8
X-Exchange-RoutingPolicyChecked: 
	CUhHm1nkdlQ5HqNeyB3UdTk2DkJmjK8Lair/Dl9aO6C9lshY1ohwbyeUt8vo26SExiEvWoMrr+ugLDnSn8nEYBI/JeSK87+5AniY4H6TXnHoPgZ8wqR+nM/nGCfTlk19px+BAj1zXyryQwhiHw7zrrUVO9uqwUNRYn+ZKt9yk9tzIcoC6IbvtGdop3TlXO7hsH7QQwzeo1QGArJ2/H5D4Pj4rfnEtArJcAWDxhtCDp7R2h6GLMinAbcAVtViTZj+7SJ2ueStFCcY9HWWfh/CYVoZn+oc5tnOOpnitp/lahbGIpkD9yl7Zk8J6/gizAB+wLTHqThHimmRczsv7sMjeQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2026 16:22:48.3823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d6bf298-7e50-4a85-a367-08df05e9c411
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7463
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE0MSBTYWx0ZWRfX935pLlsSk08P
 /ai7Z22XaN0XD21LGMzdLFhpqJzWuRVkGaiCek7rNm8yYBmtfxH3MiZ2PIpWpKAU/LpsaiHMqrs
 H2rQEB6MzAgNLWzsX4tdkcY8uE6yqhM=
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a93075d cx=c_pps
 a=ImwGUT2bfrWU7DBu6bNfJw==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=b45o4kL6AAAA:8 a=NEAV23lmAAAA:8
 a=HrgOwymDlB_F89b_pgAA:9 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-GUID: RcMWXQ8NRRD-G_KIky4EG11D0PoAo0AI
X-Proofpoint-ORIG-GUID: RcMWXQ8NRRD-G_KIky4EG11D0PoAo0AI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE0MSBTYWx0ZWRfXzYtrMBDlvY58
 4Giizi71SH6md79BXySxLaVwdzxmIt29UKHDHXTwgNlrWNWH5QREuVhZGLWk6mxB3S3X4rMXH+p
 8LjObykGBc7gVN6WqFUn1cNHLIPX+40s0PS28nP8xmadtUso1cBl5YnYapRV/AlVBjD25bo8O5E
 YqDfiaFtbMxUHe+FTYsVeZ9Qn3I3fT3xYuTyJo5HBqaBDmRGXTRPoB8cRQQBuJpjTHywbKv8AqM
 gvqTup2y1gMICTw3zCiq5i5ujwis92n/pK82SdtiDl3rPsjaGw/VXtZP9+/HnHwmDy6vzwWJaDT
 sgQl9y4IhEacJhTeXCbxKeoU2NHkAhdgwM7jrwQKmEeXYR/nTtAbgJ22Az1iftvhgU0kltbpjEx
 n/u7xi1hO8+8rduWWHpybGaNcTizx3ItKhD7yVOVMn/gP+FytwFj/yasdWB5cOgRRWLDU6/NRhu
 whEgGLOM+pM5g8+FWyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290141
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 29 Aug 2026 16:23:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20310

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx
  u-boot-ti-staging_2026.01: SRCREV_uboot
  k3conf: SRCREV
  linux-ti-staging-rt_6.18: PV_ARM32
  linux-ti-staging_6.18: PV,SRCREV
  ltp-ddt: SRCREV

Changelogs:
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=8a78938c2d8a270d851c66abc2cb9d8fcf77c690..2a85f4bcffc50ddc8b443d8e4162e9e46ed0f200
  k3conf: https://git.ti.com/cgit/k3conf/k3conf/log/?qt=range&q=eaa148f9640a047511be89f7652f8b1e93a4249c..2a55868676119435c408642191d1b5523910f288
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=66c3ddf05d9d378cc4f8f43fd2a7cd491e9265cc..2cb14eda73fdb89b09e5cb92ce9d691a6a36c250
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=76fe5cfa8d2eb4ae1681d49f8313bf02a68e38b2..38638d15d7e5797387d43b56708a16b3af52f2e4

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb   | 2 +-
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb             | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb     | 4 ++--
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb     | 2 +-
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index e40b6ccc..1e33306b 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa:am62lxx = "b54338ab6ee648bb9bef2e9dab7550a9a1d11d54"
+SRCREV_tfa:am62lxx = "72b61c96ce11c54530bd68d721321022d031b628"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-tfa-2.14.y"
 
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index 58d335a3..7637cfaf 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "8a78938c2d8a270d851c66abc2cb9d8fcf77c690"
+SRCREV_uboot = "2a85f4bcffc50ddc8b443d8e4162e9e46ed0f200"
diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index e33a1e91..ed4ab0ee 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -10,6 +10,6 @@ PV = "0.3+git"
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "eaa148f9640a047511be89f7652f8b1e93a4249c"
+SRCREV = "2a55868676119435c408642191d1b5523910f288"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
index 71fd330d..96b3b2b6 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.18.bb
@@ -11,7 +11,7 @@ BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.18.y-arm32"
 SRCREV_ARM32 = "65cf808e0410dd16ff0bb1f03a1bb7e67cbd6c32"
-PV_ARM32 = "6.18.38+git"
+PV_ARM32 = "6.18.47+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
 BRANCH:ti43x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index fc27e7b2..8ffd6072 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,8 +22,8 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "66c3ddf05d9d378cc4f8f43fd2a7cd491e9265cc"
-PV = "6.18.38+git"
+SRCREV ?= "2cb14eda73fdb89b09e5cb92ce9d691a6a36c250"
+PV = "6.18.47+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
     file://0001-perf-python-Fix-compile-for-32bit-platforms.patch \
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index 6f4728ef..044244f5 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "76fe5cfa8d2eb4ae1681d49f8313bf02a68e38b2"
+SRCREV = "38638d15d7e5797387d43b56708a16b3af52f2e4"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


