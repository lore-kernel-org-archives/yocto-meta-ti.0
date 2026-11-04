Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5220.1793783024416984470
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 01:03:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=DL58ZSb/;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=vHcJn2yq;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A48J44D1287154;
	Wed, 4 Nov 2026 03:03:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=0VyyghPPuwqhV
	kqEtxiGOHtw4FrjbPHGAxbpj0bMe0M=; b=DL58ZSb/I5+65fbf48JQ06JXkKdTh
	S0tC+osaQMgZ8jydI1zNMY98QsJ1+1R2jyab8+smbbQgkjB9sAJ1+cXUKRC+J8zT
	76NbISPIkGuF3XSq4MeK+oRDWI+LQQ8IqhkUiuKjPmjaj/e+ETwoBMjMw5ZtVvoP
	wr3dMFwwLHTVcGQufRws2j9KiykCMzZNX+thB2sEAucqDNG2nFv7tbIBbbSt7Ra9
	wWNzumKB3zrwL9nHZ4f+FHzf63Rzrr/AbcduvvMviLhzVXEk8yN+C4X7ugXkY/z9
	AgJTqhagBUDOOhfKzepm+kHNFIFHbL1Vk4QZfJhnPYUtwm3sR/dBj+UNg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011050.outbound.protection.outlook.com [52.101.57.50])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hquyf1wcc-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 04 Nov 2026 03:03:42 -0600 (CST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rkKKQ2Wur90oteMT7Ui9HL1hNXIUfd8Zb9YejlNsVod3OEe0ILvZLWHOJ9lpnIyj+UMW9Y6C8tBEaYhP0ftu7Ak4JTfcQDhed6dEQFl2QvtehNEUNyaXyyurz4xSkU/yfcCciH5Lyh1PootCnSt0gOf2ChMy/vol7yQYbxH5z1i6rBz7I66s/PD57+zz+O7QGJHWcDLHMBp2oGarI/41FOEuOQPbwzKkqbVxzQIwcuJ+U/nLTXyFW5zFkwiBdZBneYwKxX5PaQpJxcX0Z62G3SSX4EZOZM+GsB2lZBPrXYKStAiqzN5zoxOkB9hDY4UpzOjClaeNKmERubX0nYMmWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VyyghPPuwqhVkqEtxiGOHtw4FrjbPHGAxbpj0bMe0M=;
 b=iL1CZoj9+8+z5IU/ITv+7wtTUbdEJKKaQ7D8pvLTBlDqaVuR6gPO4tpwWGeh9XOfL5GhmOBHKgaM5cR3nOfoaYFvuqvKWmJzW0FwZYCnRnLuaB+pCuRfcERP6GJE9DDTYg/NOs1Qhcn/vKtflWF0/htDshmPeDYa/eZ44IUXyoBlc7is5zUbiNC5OjGGaC2pUr0VJRWhb/SPeqrYPlCuiHY2ZIfVTFWMI4QzuYul92kiIUSu9rOMx0hZC5aZGnbEze9I4Nr78tIJtZKZY5BHkGN/k0gUrxNsEXQEQ1AoyHKu48J+2abyYN80k1zZnaJW7qvTtrmr/0/9GToKUfrfDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VyyghPPuwqhVkqEtxiGOHtw4FrjbPHGAxbpj0bMe0M=;
 b=vHcJn2yqH7mjTslaXKFcsZ4k63v7YjQJf3nPbyvomFhZamlaTNI4QT+a/ctwNL1CLY/S8Nc0w4bO6rZd3/PuO+pc1FaAQewHHz5wkzrPGQ1qEdyY8FcsPVxEwbKEI51LrUX74Jc4vkrZfxgr+rNZnbjcOQEjewQu+cnIxlRyIEjzMuo+A07zyfPW3lA9GGXew6LeFsKHb2tRHhXCyp4XAzj6IG4+7OITj8vl3Q7IiSvoMtAaobpSqMNMu5TVBiUZC+bMg0sudfvDFUQkL6BV+lKBC8XHh80jGXsBJDaHC/fy0kpir9b9r3U/98Z7K4gSqmcbVeu5TrerAnh3mwYGWw==
Received: from BN0PR02CA0054.namprd02.prod.outlook.com (2603:10b6:408:e5::29)
 by CH0PR10MB4972.namprd10.prod.outlook.com (2603:10b6:610:c0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 09:03:36 +0000
Received: from BL02EPF00029927.namprd02.prod.outlook.com
 (2603:10b6:408:e5:cafe::20) by BN0PR02CA0054.outlook.office365.com
 (2603:10b6:408:e5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.9 via Frontend Transport; Wed, 4
 Nov 2026 09:03:36 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL02EPF00029927.mail.protection.outlook.com (10.167.249.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 09:03:36 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 03:03:29 -0600
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 4 Nov
 2026 03:03:28 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 4 Nov 2026 03:03:28 -0600
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6A493SSI1840717;
	Wed, 4 Nov 2026 03:03:28 -0600
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 1E4502A61; Wed,  4 Nov 2026 03:03:28 -0600 (CST)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202611040100
Date: Wed, 4 Nov 2026 03:03:28 -0600
Message-ID: <20261104090328.3447973-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029927:EE_|CH0PR10MB4972:EE_
X-MS-Office365-Filtering-Correlation-Id: fac70cd5-d986-436a-e7c6-08df3a5282aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|261009223027099003|261021123027099003|260925021311599003|260925022911599003|260925021911599003|56012099006|261021121427099003|261102123227099003|261022075727099003|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: STOPXNjJnmgRlDvjeLEFSEFDeJIlt9uF3D//O43MGhdRuy7cZ6YmJaKqiDMClIvu05uq6hRinqZD2XMWP7RTc8lSzMKADlkK8pF3sd9qo6RMkHWOYWx1xMpalg1ZSdEQ9JpD6OUrSKOeavRQs4Py+KiQWzMSJF5omtt7QrAegzHr3NByWShudh5r3VnaS71maRti2ZeHL9QulIMpkCgpJNR42T7+/nhHRh6k60UWNIE0FbW97GjjJBQB76GtjaC38VEewh8k304B3hLCFJArLWdmIAfcIERH1zJxDHl//MUpVZZehlbVJfeVxpLJCfzJ0XhalA56QWfjIjEztKhhmPXte9oiv0HsCq88IHimQfMDMalHm/LZSVignwzLQimiGIXt3xDTl7ffZEgQhMDd2p21ZI5SBXXKlgQr4sifcE9/sApF907Z6YmTULX7WQMsbNknZVOaWKGCrl86ccxDlLd3sA2IoJqGYZX9LAgOi3T0NJxCNIhd6Wo5gk/pQb1pYy/2wepqwauloRLSCYF2FBsIMedTv+2kmIS98DFc/kRC+c//F/D12imAWBLqN+gFnkxPHvZFjM0oNfroh7D8pUrB/DHxxQ4VEBZ9qk14Ey/ciJbuW20/RcuH1qzjykPpv/IND1PSUt0HyHEFYS2TcSFFfkt46/IW4bVbZ/P+ZVWW3VB6dc3I+zmRL1mDAy7lmckLPqr5SoF4Y4HjJjiPsQ==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(261009223027099003)(261021123027099003)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(261021121427099003)(261102123227099003)(261022075727099003)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Nqv+GqE1NW8tNQHQeQhSs9vGHatHF0HqcH8HDQKj818Q5wVv/dkD/OL2GubCkxkfcBD/bfBJHqrzcwKZtvAdBxhNj1D4w4uyZUbO5tNQTjINUrI/B5f2AYGsM0RcvogQsd4P3xLcl5GNYehosh8MmyObgqUCPLHvqY0tNi+AKtGRjtSPSJvFvk9GYXGSq89MjGspMxIVft3DwbIrgve4lxhYpGX0veE2YodpgcwO+8yiDWe9p5whsnR2wX2tC6+QDtw3yb6qSuKiXUEkslI8zMcv6yl9y6XHyacwI/26pyYSDFZ2edATObT6vS2mwBuIt9SLdsaIaf4r9DUCBq6tYbtKM10LNK0u+tAuMHyCZr7Nn0WD9rhdhZoJV0fw5JJbT18RWH+yXbsYyj59pGac1EHkID4Od8FMv+f2J1aQQckJww9f4jzNi9MhGvMqf1C8
X-Exchange-RoutingPolicyChecked: RJMMT3gAF3AstfQb1IWmOsi03Sn1N+X3U5V1Vn+YCpTwHoz42jKa2rgHC7773wBTlF7ZHEx0/VVjKCDyxfL683xEvBdrwlnirUXyVcgYc6d9+/V6SBWclTt2RpoRbNZ7Ho8ll2cgPV6h2PtefB10riAsG+YEiaJKoQ53Tn+30EdEhX0lQ/S5XSPcr1O4727hcS0P3HKnU5JlGkQp1KO5VzwNlPlvUfwJrUWqxG3qFaXKxtCycQiIWZnhFGr7hyNIVOYBTegul//QYvVMSv/dbJ+usu/fmkQrZGS1/lVkZvXsx8bILA6djN4Z13bL5aC6aR0utb9hQW7Fx2PNrZMHzA==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 09:03:36.2637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fac70cd5-d986-436a-e7c6-08df3a5282aa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029927.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB4972
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfXxl8K3tAa0u4A
 SJYrH13R7pC9hfGZaiKTxLR0bLk1gzjO10Th596We4nXvsNWUpPWTNrwBEZbhpAvLx4xiZyBmOo
 fl4brJuxICz3IhLAioUTayJw7JhhWW6GvseSeXbEwBmFEC4unBFZRTK+6Ecp1EF5HJMccDc05Jz
 C5WbBqOtqVvWaZaqQBfa2RhFa2KQyvaYoTcAZaw4rmeyx6menv7e7FQFjXTQOwAo6BPZGtkkk1O
 nF5HK+Ue3Z5dCaVjK7/2FDFBqbYxk7A5PIDFJJsbmzRpFtaftCl75/avd01mV9YIJL7/jciDqCl
 42KhZ9/+T6sWWr+Jtyq+yh7Bq4muSGrllLAPuziYRdqHDDlkXReRpU2xrs0NAgjcJIKjgn94/my
 BvUgi2Lebpipf/Tpdxawn5vtA4CciL3uC1ouC4tklrwk5H5F5QK1vYEKir6eYPS3UYoq1KFoxlK
 d8bWg2kn2N0US7ZryoQ==
X-Proofpoint-GUID: ddkngLYT7OVyULMq0sA3sJRS-ODRRIQU
X-Proofpoint-ORIG-GUID: ddkngLYT7OVyULMq0sA3sJRS-ODRRIQU
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6aeaf4ee cx=c_pps
 a=l+Dg58WJtlZLJwH7BKFLvw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=zJRp6_cAMcgA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=b1XpvO65Q2qoUaGQSecA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzNSBTYWx0ZWRfX8tgSl1ZXm/hx
 ENOXEfkVrdqLcgrXDsKb0rsIe1GowwHDFOyzpjXtBdHE8kilvnmMSAQNEOqTp8q0qdFC5MYO73Y
 HVLrPRFhYVYyO4DHecNTNl6iqBZCTqM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_02,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040035
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 04 Nov 2026 09:03:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20505
Content-Type: text/plain; charset="utf-8"

Updated the value(s) for:
  linux-ti-staging_6.12: SRCREV

Changelogs:
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=5c0e395a2f28422a330b6db6341460879fc78454..29eb9539475463231b91007066aecd333f170a7c

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 2c837417..27775b82 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "5c0e395a2f28422a330b6db6341460879fc78454"
+SRCREV ?= "29eb9539475463231b91007066aecd333f170a7c"
 PV = "6.12.57+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5

