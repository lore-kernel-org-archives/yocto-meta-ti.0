Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 020ADCD98F2
	for <webhook@archiver.kernel.org>; Mon, 22 Jun 2026 19:44:09 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5485.1782157448489264549
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 22 Jun 2026 12:44:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Z7Iz45QF;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=IEj+TEi7;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MJf3AV3910444;
	Mon, 22 Jun 2026 14:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=3Ve6BcH16WPhg
	RwmP8Jq6hW2x9Gxypiapsx4FYOle+c=; b=Z7Iz45QFpd9n1NADnBDHe337b6xTu
	NzbVRn5mBDXnuigZm3MEDD2t1L6cG1JLTUYUjD81f7hHSmpvSKEPa8IyWOjZgqEB
	t5cqZ9zIDmMRNmP25gYrUNw2oWbxF/Nt3FAM6CepWuLawjpbM8MBRVOL5KBFQ2Vh
	vVuguuFSc6PBEfSlsGBPhRqZ4+svMfwkFsanSrkriLUmx3JFN18VKMntJrfUl8rv
	s5EGDsaQkr8i6TVZ4DqgXdr1GANrSMLOpeJCS8fnUHIaxoyNSOthNqJGmnGKlb49
	3q+v7ABgm3m/8NOyfqq1wNYZZkt/dcjqLtdghfHz1z0VTmhLzlqFydk6w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4ey43bjrvk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 22 Jun 2026 14:44:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MTE+r/DkhXnt5LPnPl9RSQiShyKEY1g0ndFiCdlW4+YHqCZvjUtrjBIK8Vz84dQcP9LOs0T+kX49zhQWZPn5epjzDNFj7ytCjAA1kZ+5KVBJUe7i2vBYfzpVRuWFiDVufGsC/y359vqNWjxI/uE2z1X03rhuCfawSneyw+ARQ2Bu7GLobPPICSmMjJ3vdMHOx5wxtFkSWGpfAaThlGQVVAsQK0QG2nWd20ycO+5x1eyNN87B04hPo3SakijtUIAeJHFeEUHcSgMJfFp/cSPDrynCHBj9JjUPdAvUmx/4SkZedgtl5p9hN+XIAbnHLjXEPznmmEA0k3OdWtKOWPSN3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ve6BcH16WPhgRwmP8Jq6hW2x9Gxypiapsx4FYOle+c=;
 b=rfunIF54xkqnV5C3Guxvd6n88KGczVe1TEha53/PL51TbpX9tlOZT0a5vCdSEzOKPSd8WA9pYUoHtUOuk+touQ1RrqkSAqzOcQccaJnUZf8YuNkYXz9+ID5a7b4/VcU6EiuvLf3GITacf1zdHNHnYRGUrWuRqV49hrnq5Ezm2DjexXxkd1c3OsSjkmh8trv56GLP4fUy7B5DzQtCTxKjvvQW4EatTlESqbDYr905CzIhIeGXoC1TQNx8dmVbOqYK4Pem83KNucBIFiV39DqNe7dDUkhbNarjWnvsjA+psuJzU3CwM+IZbmiXxGvyddBiX2RvQrfwXlYTAt8YrPptaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Ve6BcH16WPhgRwmP8Jq6hW2x9Gxypiapsx4FYOle+c=;
 b=IEj+TEi7V2nBIg98u74DO6ycQ6mLLZOhxjN8asmMY2Hin75/OkofqeIViXXgC6C7f9zbY71hHdALies1+Od6anWF4keUcD+67YwBb/7xd5MmYF3izkKGilkt3wWeunkM8CNLZa5zi4GxXF6uaXyLVXGJDPB4E2ozXbzeCzQYuN8=
Received: from MW4PR03CA0108.namprd03.prod.outlook.com (2603:10b6:303:b7::23)
 by SA2PR10MB4554.namprd10.prod.outlook.com (2603:10b6:806:111::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.20; Mon, 22 Jun
 2026 19:44:04 +0000
Received: from SJ5PEPF000001CB.namprd05.prod.outlook.com
 (2603:10b6:303:b7:cafe::78) by MW4PR03CA0108.outlook.office365.com
 (2603:10b6:303:b7::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.19 via Frontend Transport; Mon,
 22 Jun 2026 19:44:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001CB.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Mon, 22 Jun 2026 19:44:03 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 14:44:03 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Mon, 22 Jun
 2026 14:44:03 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Mon, 22 Jun 2026 14:44:03 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65MJi3qi618759;
	Mon, 22 Jun 2026 14:44:03 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wbkYt-0000000E9et-03UJ;
	Mon, 22 Jun 2026 14:44:03 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH 1/2] packagegroup-arago-base: Move to libpcre2
Date: Mon, 22 Jun 2026 14:44:01 -0500
Message-ID: <20260622194403.3373710-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CB:EE_|SA2PR10MB4554:EE_
X-MS-Office365-Filtering-Correlation-Id: 71d7b549-8585-4289-f965-08ded0969d78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|23010399003|1800799024|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	11jsBG2YIeTC1MSHKw05tSE+d4Xe5+c9fjY6KfoGtgm5wFrKc7wToC3TETkKULufFy6hAof5HURDQN1uir4rWFgdojQQp3REjuvqET22VnJAASJaHtfMfIGaj2pfRoWjOr85JO4YPdOJV25mmDkUrUN2TImyixmQe43UeEHFcQEx2cOCgHkbwK+mawATYkb2avd68px/kz4DoyE1g+ODB46X7KBIZhX4rJCbp29CIrGMaCwR62uwlBWhPbU0VcV3YpMVVf1rgQwgf9iWKjzikO0OnSGN7MhiSsmnu2UAR4/w/O1jjQIbunWXnHVLXgm6BcBgjHQiKG9R1HNySPParU4qg/kiV3rC1a0c2EtsAIheceMesJs2nnbtrfDxHcyy6wXU7+718/S6PxWtwIr5MNhkBXqcAYdrtzdYu+TOZYkUcKFmW21KgAxhzWxQ27Pf3ocKf1vRXFB/roFnG9pO8AJcIgVfx7d/0HcB47753WUEc66XkFZGFHpLZENBEazoZg2NLcz5k7pzwx20yJYCp9u7zru7l1rq94DT3BOZaFHS2z7ViXPWAfgG8cQ7Dw/zmId7dKcBYqIKuE3nPm3KG74LGhp8Nwww9pWLH2ainYFZu2u1liGHkrh3SJP9RkTWRsDGDQTe2hlinxAcCDHIwkry7TMASPyBkOcOrsoQMsoC/IOF0/fMcQRWvukLuh8itlNWwFds/GP/HdefF4Xfqw==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(23010399003)(1800799024)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	s1OYsQ1UbjR7Tk3wcYcxSBey7hXht22Mq/AsFeo1znlZQeD02y71LOoEofn4iE+BK4rMIOBGlJmDtcAAXulFPrOyupofd5gw998UXOVvrADb2OgXY/UpQL+lv+BKZVUOgf3q41ult7f7k9RDLiBtTpBCitnODpz04cdq4+rqZbmiHxqHKb08zqB3UeBOeA7nn/Qg5VbZXpHJHCaNVQJBuaKG221/h9wznwFEXF9CAEa37LKueVQ6u+oxUkfixmOxLlgDOUNwjPpLE1gUC6ZXjc8KP72JKJBQt6o1/vPwrPiS3AlJylC5kHPWHkq4J9W96IWncqjsRPCe3nwgIKFv1b7UxAiJtK2NZSBhvZSPR7RbKhJzU07gWEMWbj5m6d2DjmJTlfHuwHZO0tNqw+BNwic7ojWQxy86Ez1Sv3SLpH8eCX1GQiDvjbwthChu7HTb
X-Exchange-RoutingPolicyChecked: 
	BAIYz9f7Q0SYrtcCYew+vTHA1QCraaU1Dn2o9RdOlvO64IWH3J73osKCFWAb2BMiPo8HhbA/ac/qlwBI/4rmXHCRyTFuHRGTMY6oPiZRM+v1TXbVIRw9ubjB/qQeCzlKk8d7AYG0j4nNxljiLkpypJP8qqkIR7ckZaQJuFWHbZVYR3tZuM8kAJ/Cdo/qI5ElncUCO1omaLKNlyyH8ORoo6pE96Nb6Jb35mS+I6bs0DOVM3WGDL4vHyAd3RifkSt/WcYihEyf2NZMBaNrMRoPJZKpfPVd+2xvnBGFMHy5gsSHr8QvoAQbrq0btnsbfWNPKoY6FVgvN2Q0vyyYRlDl3g==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 19:44:03.7421
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71d7b549-8585-4289-f965-08ded0969d78
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001CB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4554
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDE5MCBTYWx0ZWRfX1ZhBJHPQoPch
 yFMWGsOqpwAS0sgrUdQKQmpVJJ/oC7U2nSgPl2cTvZLkD5nuLZG+rlmqPCpYckEnSIoppyYiDmg
 K4FD4uTQQQunMU+FFZ5U1Wi7pfl9JTA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDE5MCBTYWx0ZWRfX2KMXV+g2RzvP
 V2bMfm0PfgE+BK2tu5FWTXt3hxNEbbYlbHnOpkRpTeZMp2oWqvPe9ZbbWIL5t2gLLkp3vOLRUJZ
 UUNuYvrF2hEch+lt5DsfXbuZyJuaIIxi7nKYgNoNvTfzjVsGKMNwKDxR/KmI5f1BsSvolGE23bl
 SrFMJSZrBb9zRai6RvCj93onWJPOaCzklszkVyUofe6Q26vLhig098tanLPByk8wxm3zDniE18J
 ImGXo9h7rlHTQn4lPlH6t+5i6jdEngcolCoVfiqgnksDtu1RTCq+7KPf55VZAT3roQAQ6VWYfQs
 Bk4KC6y+RIaObftjEpfSB9on+dxsC1b68JQk4LCOuqEv+CyF7XBv1Se6AY9QOL7+iKhDbX/wWMx
 8i7g1rU7e2ZOe65jFcBqqofYPcV97iUbT5PVjiiaLZpadhKy8oxkxGD8datculmWIRLED08TAK8
 MjB4G6JxIWY71xzPlYw==
X-Authority-Analysis: v=2.4 cv=TPl1jVla c=1 sm=1 tr=0 ts=6a399086 cx=c_pps
 a=2iQKv3wDMkjwRE6X2MvZ0A==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=FelO9ux0wxsA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8
 a=GLtSDv1vAtqjQl1esDIA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: L2gRr4a_4cIuLn1s0JZePjAQ902mvIUb
X-Proofpoint-GUID: L2gRr4a_4cIuLn1s0JZePjAQ902mvIUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_04,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220190
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 22 Jun 2026 19:44:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20048

A recent change in oe-core [1] has removed the libprce recipe in favor
of libpcre2.

[1] https://git.openembedded.org/openembedded-core/commit/?id=057cccd9576e1dd0f947fbfc390bc06b210f71cb

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-base.bb       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
index d36b4397..34e95926 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
@@ -38,7 +38,7 @@ ARAGO_EXTRA = "\
     expat \
     glib-2.0 \
     libxml2 \
-    libpcre \
+    libpcre2 \
     iptables \
     iperf3 \
     netperf \
-- 
2.43.0


