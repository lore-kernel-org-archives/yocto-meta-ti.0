Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFC5C88E75
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 05:53:56 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17004.1789451626429745452
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 14 Sep 2026 22:53:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=EQKrSKvR;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=V4rLv1tC;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2m8Kh2989378;
	Tue, 15 Sep 2026 00:53:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=NNJbsnNcxQian
	jt6BDOk7Q4yvD9GzOwwyA5WTyvrs04=; b=EQKrSKvRvSek6BuMfNJ8d9H5pq28r
	+1r+I6npkmEeQo3YvbxF3nTpON7yWDV+U5Po3LsG2btWJpcbzEmhzKuOXH2ImGm0
	jSLP96RMiN3c4HrbaNYWWeHIrYd5WrbUbz9VAuqQgj9uqrD8/h1h8RWIwkkED6I5
	jsfQanFKgMHKVd6s5UOcWC0Z7NUAsXGsHZJTD9zs7zhHY4tP8zK/wRRsV7qXmQPL
	ddiinJ8FRB0ocvhk5l4D9UxgKFwOrFMOwPFzfU8DzYDr/a5crT0l8LR1s4u0Uvll
	7MARx/eM55MP9UvMpu6M3vbhj6nVKPJGv/u8iDZJ1DmJY83KQE6BTPdHQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013005.outbound.protection.outlook.com [40.93.201.5])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gpm40v44m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 00:53:44 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XQaJbE1pOj4cVcstpI6XOOLoLZvc0A5a8P9iGgahPJM9u7/60QmZXe+7tJfeTwr6/jlpQpmgFsGC77DdjC3+FvwGHxNd0MQr+fpFgZLskMGo25vekWtx4AcTkjLEqNoTizD7+m0q4WN20N2nK/f8HVu2Pj3E8SIOhgo7l5E0iu+T1hESOHVxs2clm+G8C9KD09S4/LTO2qNRJc+5aDJiI/KapQw2A2T2PKgO/vQWwDNB6QwDTWN18PQNJyclO4IrwoZGCMDhrcp1SHvRWXR9mTmKm3IYv8q5ZFSTAo5DbASDBxyh3ZD7RAd5+LBFtw7FO3fgy++zfrjFoxH6B6YFsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NNJbsnNcxQianjt6BDOk7Q4yvD9GzOwwyA5WTyvrs04=;
 b=Ai3568Lt8kQP9SK901lF3c08m2+vGr/f2ynQ7PL2bW0Phsfzsu4g7zvcPuz/jyPWGT9hO6hmseVLOtk1S/OpfQbdgkU21/jXRelwGG0yzhmgZNIqjNfAl8E7nfHtdyu+srbpa+gEwRhob9s1JuZlQUjodzjwQsLwGFIyDC/UT68Tr5YuinW7zavTiJseLc5hxTLL0B73vhHRWEc+UVWhNJM8KGUPfFgX4uPecTZAbxYni+TGxlRa4hZac0Ao99X+Fjz31ZS0oUrBSctRIs3MIW0w+W9qT8gotSGTVQ6rcMS/qJYL48F3VwYzWOuWFWvKsHuxOy57NwpszHSkgesUTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NNJbsnNcxQianjt6BDOk7Q4yvD9GzOwwyA5WTyvrs04=;
 b=V4rLv1tCo3WjebgifQggQivPMYuVWn4+5FCiZdxsOY5Ny7Q7ShxLjvyTuW432pQ32tpeBtRMvbjPvpvjAfdIWCKDJ2456wbmmEV3eBCpX7H1h2kki9xxRHNaW9lKBg0nCut670/hFUHfMCO4OlQRkNvK/NPn+iDqac+HYqPD9HYnfD2ceF7wD3a2HsUnUNx6xVlUbAdUIbzYEb5VZhhctYFA/WAMPkrptXcGVkVPVUk2kRJFESjNsBDeADaHiB8gNYSQf+8TyKj1faD83uqjaflZP0LH9amkxqKWs76ckWVHNcfzs49LL/g/qxn56+PQi9h2eHCcbHVEasEXT7efDg==
Received: from BLAPR03CA0148.namprd03.prod.outlook.com (2603:10b6:208:32e::33)
 by SA1PR10MB7756.namprd10.prod.outlook.com (2603:10b6:806:3a3::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.8; Tue, 15 Sep
 2026 05:53:40 +0000
Received: from BN3PEPF00022BC9.namprd05.prod.outlook.com
 (2603:10b6:208:32e:cafe::69) by BLAPR03CA0148.outlook.office365.com
 (2603:10b6:208:32e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.12 via Frontend Transport; Tue,
 15 Sep 2026 05:53:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN3PEPF00022BC9.mail.protection.outlook.com (10.167.248.218) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 05:53:39 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 00:53:25 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 00:53:25 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 00:53:25 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68F5rPnV1450033;
	Tue, 15 Sep 2026 00:53:25 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id EBEE22A6D; Tue, 15 Sep 2026 00:53:24 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] CI/CD Auto-Merger: cicd.master.202609142200
Date: Tue, 15 Sep 2026 00:53:24 -0500
Message-ID: <20260915055324.1142908-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF00022BC9:EE_|SA1PR10MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 482d5e99-39f4-451e-0eb8-08df12edb130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|56012099006|10067099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	gqdF9fpo/NjdQLmpR2uGAIi0/JOgVVf5nsMhCmTeZ13IYYy4okLDX8ZrfmWm7yNdKXaBPwbBHpjiPI3dv8ySC5amQEu7gCuzb0AzeXYQ1CG1xJxF3h6qHsMWDt6Z95V4H6+GR8nm+KeVAtbFEXdFZuvsohLvEnqFP9uLwSfa5NXD4CCn+REQJ8GG8xWqfSxusN3AYfLA/7E7ZN5uR30gPTn5PsNipuPFmyZDQ4BoYYbgn+x3339fzOBcIRUQfy3u/SX6VkJnVNpRefqnHMgZi9c7OVWk4zjj9h05vqDBHCVnLuW7UNzYxMTfJM0OvIEURkw2Rel7C3sIHRv9z8lKBs0cSoloJaigARn+WwVHBGxW6Hixo83+qxc5q3ML5+w6IB0rk3MPnGkfaVd4BbVm6kD3/x5lcS6yA/Fb8c20WkJW0/uNQC8nsTVZHUiJJPQctuWPCgRnyeGUq84tz4azP4tlnR4IaLwL/78YT/ei3SdiTWS7Os2eymBOmFz1x1E96Cbr5bMx1G6X5GBQefvMmP67hXir4ZfXiE77L7A2K0vmTNhprLf4o1bbRMSwI4XvSAD/rGPdPGnL+2DVbvyyiXbB5MzD4adIJc32T1weJI+omwC8G4lGVHs3Rky02j50lBCZUYj1Fy1QLDbtMuWmN+r/b9oNBDw67jJe9XUgtzPppOLSnsfgYgKCoZQQKX/TaVxtEws79o4gQ3OiDUL7Yg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(56012099006)(10067099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Sa++b2c4a6jGj+aLw+fJWSBC1737O4WAopVogWSyfJuvlW+W316kXPuzLjhIw+blEAEIrzDFuBJvqaguploik3VpQJs8C/lQFtvpxk5kAqXtu9a8dCwu6IMSQGqEZm3OhX0MJZZq4J3a3V2ivT4qyOQiCBCltkLMjWWerSamN8WdYcuYfcU0Qkl3ohkWSjAfX/kNes8alub8spROqhreiG+Y4mi3GoMxOih6dkJRA8KsNAxMq92ebzNf2xnY1qVhSZvqWKAsG10AydTQFlSnRlzWIkOeurlfbcZR0fbJYYdGl72wxMnlMMfQI52Mu3g7gbIby0NGh0uppcX9/RXxy5wHHm4lGsgYjKekVsQ0X/VVuwG8VBy01cC+P1a+nKtmPBc57TaLUv91sB3G6WPtGBow+xBwYXZJCzaxVXAwxIdYWZXJEIxEeCKrL8C1VaVE
X-Exchange-RoutingPolicyChecked: 
	eZVTPELQPAYtXKx65pq5l8bxLJO6wH4rDeg16Ytnrri5c+P3rSgW0iwF6hmmwDI/FpvtP7UgXvLJlEOHnUXWQ7JjTMn08Nzv91arSJZMEhj2NMIDc/Lw1XIMRQtsjDjSFmLxeWedaIIzYMjTiTz8raYv14FlcoRJ9oq3K2XfKy1owIg7Svd3EEcrapPwrru2FFUzzOc1Fg/WqtqyHE3UymepgV2nc2uPZLDdUQYj45u3mbpaBcpY7kNjjPRHtmaKF//QdRgK1keV9ZsK3m6KvbMSqsIWDdGun2zqnJ3CiG7uYEAb82UhtkT+wgPkrNXbcLhg0DYt/3DX34WnHqnlFQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 05:53:39.7849
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 482d5e99-39f4-451e-0eb8-08df12edb130
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF00022BC9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7756
X-Proofpoint-GUID: 988gKClS3Fe-tsnw58CMvYA_WuI1mRLY
X-Proofpoint-ORIG-GUID: 988gKClS3Fe-tsnw58CMvYA_WuI1mRLY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA4MSBTYWx0ZWRfX+V5vxJHtbSKe
 XCKiG1u8PJkxCAM4PsyCs8/h5fO20s6+/HFkE4rM+mASpb7g3O2znHPxoHbMzElqyCDp2ShjP2D
 Tokhevnkvxz1l0VEndUNidCQUmmuqudxhHGhHaIFwiXm1+pNyXFmBdekuYkAO2dELf2bxdmr8B6
 k0J6u3duGyDuKGIxKLX6CQkSgXv1GphpshkZX66Gj8WRQiWTgxCeCV/7jNOPzNsGe2zjsJ1U0/D
 L8JHXslXsvIQFcu9uBt0fYuGmE4pFVUR5lvV7cgQVXf1Cl5f3Qrms1uSOBDI1maulo92YKvPqmq
 TJGK/9fVzoRjs2+mmQgsyx7bAJSyvZM09CyvKL1mKpevMzCVHW1sjWfBKGwo3TSAGfIyEMmYwhm
 4lzOclJqCj7iIQDscf296PSXrbD42ZRE/eWIVJi3OevyvgP9FsmEyJ/L5eKuIMzYCOjjkDqD1ga
 3JSmIBHas2hbWKUDjTg==
X-Authority-Analysis: v=2.4 cv=JIyuIMKb c=1 sm=1 tr=0 ts=6aa8dd68 cx=c_pps
 a=l4G2nZJL/liaK5VsxlxrQQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=s63m1ICgrNkA:10
 a=f7IdgyKtn90A:10 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8
 a=b45o4kL6AAAA:8 a=NEAV23lmAAAA:8 a=7s83N0c5sWE-hGNbeH8A:9
 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA4MSBTYWx0ZWRfX8DSU46PGqPo9
 /HnpXb3tV4X9R+/iC+HoO6oPSyJ28+GmFhMhA543PM5pQspdNem/XNNGpYHSk7GDAKYQYIHwmF3
 3Mid79xOuaNrA8g/zN6wfuITZVHfUys=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150081
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 15 Sep 2026 05:53:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20374

Updated the value(s) for:
  atf: SRCREV_tfa:am62lxx

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
index 1e33306b..9692bdab 100644
--- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
+++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
@@ -10,7 +10,7 @@ SRC_URI_TRUSTED_FIRMWARE_A = "git://git.trustedfirmware.org/TF-A/trusted-firmwar
 SRCBRANCH = "master"
 
 LIC_FILES_CHKSUM:am62lxx = "file://docs/license.rst;md5=6ed7bace7b0bc63021c6eba7b524039e"
-SRCREV_tfa:am62lxx = "72b61c96ce11c54530bd68d721321022d031b628"
+SRCREV_tfa:am62lxx = "77b17a538f6506868c92b08fe69b5a4c02abeb90"
 SRC_URI_TRUSTED_FIRMWARE_A:am62lxx = "git://github.com/TexasInstruments/arm-trusted-firmware.git;protocol=https"
 SRCBRANCH:am62lxx = "ti-tfa-2.14.y"
 
-- 
2.43.5


