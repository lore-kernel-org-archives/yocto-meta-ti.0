Return-Path: <s-sadik@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40D3C9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 12:16:44 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6663.1790338598590883892
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 25 Sep 2026 05:16:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=InNtVdN1;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=ZFMzrYYA;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: s-sadik@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68PBChql2452171
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2026 07:16:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=hMp0sxNp8KmPI
	ufDALV8WRSCer2HNKMCDCoF/9Svf7Y=; b=InNtVdN1Kafge9+aNKgQmSHzSFZjd
	hK2VASYS1ZDhpOMfvSI1AmbBg+b94Typy96HfpQjLe/54jiL2RT2hYnmu6Pwfv6V
	o8j9es0g525/wOEIrJOl0Qfcgb+4IzFjePdB1eSCdhMuGAgsEVM737I3XmM9jE5F
	PNMypaUKJRYfQHHNLzAadH5Jy4uePJzdykW9Qa+b2iMx/XqyxlRWnHlJXg9P1uN2
	ukjXmveoiZainFT70nnGAOgnHK1eTe3MlWzvGyeqk9rsY72iTKyvZJvFd58SOu2S
	XQl53xiaGYqpB2GMjakJ6gqsznnegX2XFZ6poRnsyYvna0lbTn024L4jA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010037.outbound.protection.outlook.com [52.101.201.37])
	by m0384305.ppops.net (PPS) with ESMTPS id 4gwjq49u8d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2026 07:16:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHgdvRr3k1g+UViYqUrCb/PmXJqJXKOhgtsy/GY8ym1ALu12DF/uCINXd1ssGQrkHvgl1M/JzaPnGofpc5DjrrquYVfGq5aUGmSYLOKbIsRmFHEicrUwwKGQh2vfxoWyPYgiiREmvhdMHjq2KsAWedLneWJUs3dDsch6uCmEFOS/olQjVbLWNNbuF67ANwYcQgFHTkc1iSq/iR4J+xqpAbQfxg7OS7CRxlgHJI2j1aDP4lINLgU/msWk2oSPlOwKXrx8ncsV3InjiSCAX644ZXcVVf0/sR0mxKMmBZKcLrYwW8jJCe5iKB1hKeQsOMgp7ZXjtttATWh2Lqr/IqIwuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMp0sxNp8KmPIufDALV8WRSCer2HNKMCDCoF/9Svf7Y=;
 b=gTAXGnw2lNHpBVOz5voEkeEGF70gMz0dC4Rmq6D0m0lWKluzkijHTFaHA+M4phm39UhWijX1EFhd/XXqRh0yHqrvo/bOvh9gsvtKjpoItLeebBlABfIA4vRUnenMTVr6SqQkzzEW7zAfPxX+kDjLE93fYGMYDQFa6vCRQN09rfaDMt+qAmk289KA+UPabWVu98yxHqxKZWyQlsqwAmuVaWWqjVlAgr8Ylv97J8Tv3mdfTl8lqeGbzKD3NSFUioQtlc6sslCrmZalN5XUhlKXJr5eqayfHcogo93DxzUDs0gV038pZlhU6JnifWmoxT/omaIHeq/3MQEdk2ZvI7i2iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hMp0sxNp8KmPIufDALV8WRSCer2HNKMCDCoF/9Svf7Y=;
 b=ZFMzrYYAMjQFTU7ZMag8aHuAnnYB0F88I0+/EibRv8VmldrO9LeVVq5wjReGHrQ/Xfs288o1dWX/gStCOBfKrDZ3lIxo13cRshZtW/MWF1+QQnde6PHurbVXX+xHWgw6EPIzbAcXSbzDTTpXzhWIS1Rh0dtV6H3SR22q4VSjBcU=
Received: from CH5PR02CA0014.namprd02.prod.outlook.com (2603:10b6:610:1ed::18)
 by LV3PR10MB7984.namprd10.prod.outlook.com (2603:10b6:408:20d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Fri, 25 Sep
 2026 12:16:33 +0000
Received: from DM2PEPF00003FC9.namprd04.prod.outlook.com
 (2603:10b6:610:1ed:cafe::52) by CH5PR02CA0014.outlook.office365.com
 (2603:10b6:610:1ed::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.19 via Frontend Transport; Fri,
 25 Sep 2026 12:16:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 DM2PEPF00003FC9.mail.protection.outlook.com (10.167.23.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 12:16:32 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 07:15:46 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 25 Sep
 2026 07:15:46 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Fri, 25 Sep 2026 07:15:46 -0500
Received: from sadik-PC.dhcp.ti.com (sadik-pc.dhcp.ti.com [10.24.52.210])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68PCFi4X1819281;
	Fri, 25 Sep 2026 07:15:45 -0500
From: Mahammed Sadik Shaik <s-sadik@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: Ryan eatmon <reatmon@ti.com>
Subject: [PATCH v3][master/wrynose] conf: am335x-evm and am437-evm: Bump up max_leb_cnt
Date: Fri, 25 Sep 2026 17:45:42 +0530
Message-ID: <20260925121542.1008370-1-s-sadik@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC9:EE_|LV3PR10MB7984:EE_
X-MS-Office365-Filtering-Correlation-Id: 661188f5-d147-483e-5123-08df1afed5e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	4/MUC9ANz0G0T3rlCZjcVkUZx/GLa3WwYan9vjOsnBzJ5tTxjg3wzXuDsIUNDHqoIFy/Hz8gAqCfwd4mck0UTPgjVw+F1LcdjE3wiLDA1AYSIwmcoC9H6fCVsOl1eQetxXqw3Fej4LUID4XzfhAmTUsaoHqnJa3CkBGp+wYv+Wx9wWgbXuLivhusSbBHzhJhgowAPUi6l4em5Nwq5JtUTU4eiWmdMaDstHcdgt49AfcNjVbyqmaHfWI3iqo47b4AegBYSLpuY4bHyCYD3pevNzY4oaX2PXxlJNggQk2/11yO5GhwytIm7QOImXQCK8056TUPmoUdlv/e0BxJjtTlBa3O6f01tZaxMDIHV0IPV8P1u/UjjvNJ0acGxH3WR/DTr+BTWDyOBZ1UJg7k3QH0PEvaWkRYDJw0sBFyq+5VoIXdJymKyO7/FmzhFzrcilYnCbryo5LcU11AbHc8pz2k/OAw6PreGlLx7N89ex0R2BKX8PFjPI008+JUURSjPICrnqxM/Cqw/K9zpc9XL6auoGtvmFEzMDN51uHjPJKsAHaV07ghPD8OKquP+ODeYz92/EyY/V2+lMoVaTDxpuqJO+pdgq7k/tsDd8byzALecnwrGL4ENjpei/1CA+G6VtcVTTTKhduGC+9HlblS/T+o2vsy8CK8lTvQaHjnBqYRqpwJfL0sq684yM5rJHj31NeZqCHzsVXz9Ch3NECFda3qjw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(10067099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	tNHOoLj8Wbmein9z/mSd4YpYC+unWdZ20M7JVyXMF2E4ZvidjJQhGAf7V3gcW/EdYlX/tEBzvpOoQ84sZPtZ/4A+H+5GTk9oGatlh8oPY78MgJIKw9m51kSrv8wncYTKqZt5dmkn5USFBNjqzEOyx22EhsBk3oznwXoTE3K7mIl6mzHUGUYnw5EkNKQFL57IG3r2C7Ca7o162tNNQikpwEIuc3QEOm3R1A3oz8mGaAGQAF7BGxR7QFiFpfNAJzXroeU9UTjFACBNJTv8asrNJMwJTqZZduxQBU3hEzak/YyyJXVsg5P2wx4LwR1dNHE54i8Ov/M9mKM8r+VSDVXOZpjtMlRgkfmX+fFjrGI5ib1oJlFd3ov3X2Czbsx3vd9GB7uDYE8g9wsI3kzHuYeEVkO10XcbxMTFhG/OhLalkdIUTXEXXdZ25kgumLjkX236
X-Exchange-RoutingPolicyChecked: 
	jBNoz+sAjNKigYkK+9VgUjlJE/QviwpiS1WEGTQOzdMX4ur+Wjin6GPGmHldSeH6WoAtcXOgAFjgg0Uy6F2WI4MvuZy3EEMAC3LS+m773aPtiNfMxGL2KHvop6USINO1Cs9n77NsV+OA/0jzAEuHK9jtmpW/Amm5gFbD+yM9l0tHV9OhQmWiQ9znDds4kOljmaXbTLC4lMRyPWPgp1Tt841V19PdfYiIjGsm3aHCDdxh0t5v+C9EzgVqCpmzhjXvVzM0Qe9/Ohq4vR6qVon3BvkuJtmYIjVSvCqTTKD/RFxry8RyF5CCyhYajatN1gndrWmFrc1eqYtSFOqoaLuKQQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 12:16:32.0662
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 661188f5-d147-483e-5123-08df1afed5e3
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7984
X-Authority-Analysis: v=2.4 cv=H+pOUOYi c=1 sm=1 tr=0 ts=6ab66626 cx=c_pps
 a=fIWvqWWOoOps8dVAlNTpGg==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=VdqzKS8jKosA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=sozttTNsAAAA:8 a=-xjxhgg8ke8-8qIiNEsA:9
X-Proofpoint-GUID: uUTy7UV5gHK6jiHKjyJaATKXFahGa02K
X-Proofpoint-ORIG-GUID: uUTy7UV5gHK6jiHKjyJaATKXFahGa02K
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0OCBTYWx0ZWRfXzLIgL/9J6nlG
 2mVxgOxTo0+FbzOM5mmhL2IZH1oEIu6rMG36pYWpUcZ/w8qQpAKNMhAfnZ1PRD0pgxuRdL/EAXT
 FaWiicRM62RFdcuMWd8aWnTc23VaM5c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0OCBTYWx0ZWRfX8sEwEyCqR4oG
 3RfZJ9c/x3hA/OH97MtsdpypJERQ2+eIa0qbs5oyHqpi5VzLyCxBT02BtgyAO21ZgoJ+Y29fmy/
 p2+UNkMtiS35fsB4n57sqjT5pdtXDoWjU06PwtqKisT0xc1LuhKASl8qsc7W8miWwy8450wjrMD
 PxDFjZ1PtcLi7fuku93NvBA5WBHiuuvK6ztoKHFMgF4PN62bN0PZjoAe1y7wvYzHs42L8H9I230
 nQMUPd6gomADvkMhfGqdhJNrF40r5K/G7rydZBDBk06VxqrG3LNAZ7inANFtjyB5dUuDnesuGY5
 /4YEU06eWbTmq4PAWPurlReT8nsp8ZNqLtuu0twYCr2MDHHukrI4QdyTlS+4pvyhmgh05EHBNxV
 xIpLMVF/EajcgTytAOlqxJenm4ZWsZhbCqPZt+wpZsZrtfUvpG9aEXknNZq24pzo7Wo7a2ICMWM
 tRtLNITzn75kcfqDrkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250048
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 25 Sep 2026 12:16:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20418

New features added require another increase to max_leb_cnt

Signed-off-by: Mahammed Sadik Shaik <s-sadik@ti.com>
---
v2<->v3:
      include change for am437evm
      update master branch identifier
v1<->v2:
     update branch identifier
---
 meta-ti-bsp/conf/machine/am335x-evm.conf | 2 +-
 meta-ti-bsp/conf/machine/am437x-evm.conf | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-ti-bsp/conf/machine/am335x-evm.conf b/meta-ti-bsp/conf/machine/am335x-evm.conf
index cc5d87d7..0dd4e7ce 100644
--- a/meta-ti-bsp/conf/machine/am335x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am335x-evm.conf
@@ -22,7 +22,7 @@ SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS3"
 # UBI: logical eraseblock size:    126976 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 1988 LEBs
-MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 18000"
+MKUBIFS_ARGS ?= "-F -m 2048 -e 126976 -c 24000"
 
 # do ubiattach /dev/ubi_ctrl -m 7 -O 2048
 # from dmesg:
diff --git a/meta-ti-bsp/conf/machine/am437x-evm.conf b/meta-ti-bsp/conf/machine/am437x-evm.conf
index bbe956f2..33b97227 100644
--- a/meta-ti-bsp/conf/machine/am437x-evm.conf
+++ b/meta-ti-bsp/conf/machine/am437x-evm.conf
@@ -21,7 +21,7 @@ SERIAL_CONSOLES = "115200;ttyS0"
 # UBI: logical eraseblock size:    253952 bytes
 # from ubiattach stdout:
 # UBI device number 0, total 994 LEBs
-MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 10000"
+MKUBIFS_ARGS = "-F -m 4096 -e 253952 -c 13000"
 
 # do ubiattach /dev/ubi_ctrl -m 11 -O 4096
 # from dmesg:
-- 
2.34.1


