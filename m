Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E3C3CA5FD4
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 23:45:01 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.707.1790898297514504931
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Oct 2026 16:44:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=cYWM94zs;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=RXltxfYh;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691NGXUw2685447;
	Thu, 1 Oct 2026 18:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=OXH3TTDUarjWW
	UVyipq1laajHuv9trSrYTFsG2MMO00=; b=cYWM94zsx+anBGOp2MvAuyeOd27Ft
	Kqgx6OtGepsdHYxUvm39uE7iVWEtlv8RJ1debhUSsEp+gyFXzPtG/tkTRWEAdb0t
	ezT3ElxgKQE7+dc7C3m6zjfYdmlsCv2bxert3RNdry7G/VdM1dw/mShOe+g8ztLC
	QYInn7LQJlMVxJN+Lx2E8It2RBolN8P8j+cR1JL6piRJUiz89Tye7l2yPdhyhAlz
	9fDWC3VlMz31GxjWhCPWvDSTrls6wP4YYTKb/d8gJm9pvj11SZHajsWTXnBXzv8n
	YPdRFhwAkiWW9lQpE7KqUOsPVX12qvoRh5Ql0cSFHW6Gd8M3iDCMHCvxA==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010036.outbound.protection.outlook.com [52.101.85.36])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h17dk1gn9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 18:44:55 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pYn4jbE+k81EfP1AvHPYXbze6QIXJkPlpx0v7KlYhIJuEAyUWfaJEU5nqCCJEl1sj3u1Ka39Vg1DyAo8VtchtPFP0TaFsyY0WK6c/FyWo3Y6E/79hgUqI4ipfhzpQlnnhUGkVB3eYZsawpnJwQ3+T9W35N6JpkqJyBNdbXJkhQ8QFJf2jU3KjbVTnALdEsJdDg4hEh4mvlvK8MMw8o8+sVyKlhceuN3TaoKZCzIzkmUOOcVDfksgSnf71WXKSdKcXNUDLBPyE+prY5UIvhujB5FDIJ9HGLvdVjREJYkAdRYCf2hkav+sVvWUduYgh6V/NQjpOpvrtYwoJ/aUbTZ++A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXH3TTDUarjWWUVyipq1laajHuv9trSrYTFsG2MMO00=;
 b=AlD79wIb/BwhIrMYy08+C9AKrnhHVYBsLJLdmFIxw6qgavNGkU9S7U8dbP3dVyrj2JoDyBvbl6LLlssYd1Bz2qdy+J86IaGZS4YKjaREbI/wXyXNIkLZvYtQRkd1JjihpR2YZRHztwzB8/RgWm7ZwYD0etAbTXBLYH+Fx8G8vaTNNKF0/PVW3jF8FTDROb9LTLllLWeuamjf3NtYQg8OAnxBgLRhRwB1FG8SMp3DsRiAVS+VCCAMANurrlo9AmKSOx5fAFFwKODZmX3g0YE9yGcml2PTOWFh2lbON5A5Mz/tAMF3XIBzY+2cXezT8P9TVLvucLkmCuMNBUTD+Q6cCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXH3TTDUarjWWUVyipq1laajHuv9trSrYTFsG2MMO00=;
 b=RXltxfYh0E/YD/33M6q7/pRXtNroC0ouB78FvoVIffKsVgH8IOZgjo1YFxRNPtuvzraZL+JZJkqRL2DoeLKkW/13syBY2++IPJTZUPpeF/4E64bP8vTM6WPkCWoc0Z7yr3wdkQpDWgwj/gzSylyg1WlbD/lE4azD9gBA9Fhui1JZB+HDOovLSejltwSPKgt+lmxeXNIaAbn04JIog9qMrcZrSCYWEUNXud0Kc6IKRTXJPrUmHRow8ARNm2TwMWWdlx6kPuN7TbWlkhzPi/yAw890HOh0tyqtv+vGV3pqp8fPBsFUDB5dSRWoSlhQulbE+PdpV8S4ovST38DfaXVeXQ==
Received: from PH7P220CA0156.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::12)
 by DM4PR10MB6742.namprd10.prod.outlook.com (2603:10b6:8:10e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Thu, 1 Oct
 2026 23:44:52 +0000
Received: from CY6PEPF00000047.namprd03.prod.outlook.com
 (2603:10b6:510:33b:cafe::8a) by PH7P220CA0156.outlook.office365.com
 (2603:10b6:510:33b::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 23:44:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 CY6PEPF00000047.mail.protection.outlook.com (10.167.247.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 23:44:51 +0000
Received: from DFLE210.ent.ti.com (10.64.6.68) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 18:44:15 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 18:44:15 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 18:44:15 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 691NiFt13435912;
	Thu, 1 Oct 2026 18:44:15 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id 9AAC42A69; Thu,  1 Oct 2026 18:44:14 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][scarthgap][PATCH] CI/CD Auto-Merger: cicd.scarthgap.202610011545
Date: Thu, 1 Oct 2026 18:44:14 -0500
Message-ID: <20261001234414.3295046-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY6PEPF00000047:EE_|DM4PR10MB6742:EE_
X-MS-Office365-Filtering-Correlation-Id: 24ae6e00-d3c4-4e62-11eb-08df2015fcb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|10067099003|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	2Wa0IADHOVmNLAv5mGa3Jzb2TuS8mNNOdkqZWqt3joxby8t92bW5yK2GePxk586ndISFcQ5PtsYSL9fEu8/GX/c8wBkWLR7tqO/VakwXNA2gbZzjn3iQhXdWpileijNyjeMW+KOJUXByDGxHFbdQYcLo4zmNuFlNYJP6PXxX2Jtc+EdrMtlVDlmHPkbqXvUySBZ9MpQNTynMIG5MPWMDp/IQCO/Dilxb9b4RNRz13uORE+GMZ2uadSCVDsZk3kkIpzUsl/ep0TVkj6htjyU/HRUmRiTZkulyAlK1b5u1hSxh0M16NEco0cpXphRUfwJ0ugT4qmsjl0WjLCgYVWZxJHPgOKHp6KRfeW+oIo4v3YbTMvGj6rRr0RAqHp8LE0e/heO9z1iyV0sWUYYpDCVcQEggKUBwXLkOsscTuPs8xnb+GlZ4IQtCaRIvacFC5ZShX3gzRRuB4OSp5P9S21AJ/27zlBfi2rYQ4+8mkq8uiVdrj6Gv91v30W/nC4uyrQXfSuAXnhgWmO/7PZ/hYCE4R8kEA8bKP9cQf0gbmYTo1PizELfn7nR6Rq/eyDbQ0DyMdqemJnknPS6ayNjJX7gy3QXiX6Ef76TdxdOjB3rezejmGHpygkAbLDnA0+NiNfpOGT0jfFjfFas9eclBZe12zdhmn6BcY7Rkg4X/c5anoxe1ePzIGa2+tn8n4RwgQAkwEI8RtJuYaAcOdsdgPnsIpw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(10067099003)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	JKYqLkRs2FLJ9WVXaylZr9FLTjJg5V0RZ+LvosMgGKEJdrYsgy/iYyEoy1O3q14SupUjJ6UuxY6ZbSsZvELQZdFJn2ge6qr/WCg/mFfT+dkNKeBwhjL+Sl/ShFRo+/fKeXHvw3bt82pi67syeS9PuDhU2Uq9D9yWaujV1evo8/a6Wi44erIT42TrDwnI6ihmi2D/6BQey+Qfpz9bCZQKOXyG72ntxM2hVZCCkBO8KdqJLjPeLIrYgxYutIEWdYFy4YhoCHon8PrGdmApmKSiy5LarytoW6Zc4GXuCj41MTJZ0aFnnjn9jmJVUgtwHWZY+iX12/Zpi6mn84W0orGA5kO06+smNpcLY1ufjrnyGbamcbaLerfm///MF2W3UM5kcAGUlz3OtiYbCedaY3bhzD+XsyS7QKpRG1LJ+Kuc+S3Vebx8kVQJrW1Rff91jvuE
X-Exchange-RoutingPolicyChecked: 
	rO6bF8TLOxbnkblJPbKEifc6ilcpB4z927TeqjFY0Mslmw0NsKzjspsIGkHmHjWhyqZ/y4/BJ6uMXTO1iLMe/K8oBSJV2a//abZvCEBGfcRfpwsrMj+pvkumb7xwlr/YEC8V3AobDS93XXPEHIMJfROBwVS7kzw8Mo0Zw4GowUWcNCP8ASAG/K661unhhnVPMhztmx2d4KuwwxGyEKEqH58AJ4gakxPwXT9FtnkTQHyjnFJfjhTiKiXh11NO0K52RmCzvx0VYcfHUUsPUx387IJFsQ+oF29RueAtuv0xM4Zgnj/3c4BbnRoWYe2h2vxlf9yl6IVhFh9TcbWD1fTXkw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 23:44:51.4789
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24ae6e00-d3c4-4e62-11eb-08df2015fcb0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY6PEPF00000047.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6742
X-Proofpoint-GUID: CPdC6dSsakvvM2rQCXpdbsltIEtv2Pqv
X-Authority-Analysis: v=2.4 cv=aswnmiZV c=1 sm=1 tr=0 ts=6abef077 cx=c_pps
 a=Pnh5LeqhM4XIZ/aCP1A8uQ==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=sozttTNsAAAA:8 a=b1XpvO65Q2qoUaGQSecA:9
X-Proofpoint-ORIG-GUID: CPdC6dSsakvvM2rQCXpdbsltIEtv2Pqv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA5NCBTYWx0ZWRfX4a2KkBHc3RzO
 uZj8exhSFZiAvw2TxF6MVhdHIqIPL9qII/K/3/zACEfiuNAfJ+Ih7A/ijpO4Owaf45W+Ko7dcwA
 1bZoGRGMzxigdZtQBCzNeSz0FgmwENY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA5NCBTYWx0ZWRfX9HbSn6sZ6zQJ
 RIBesksHUGvkDc6CatH6k/05btBHLEZU83snRJwMYseATYmYa+bkH2mjJtbtYyFC4349gD/dupc
 /ie8IloUJ1NjnI3HuPQFg9Sh6WGPt9kxxkoKgwH8We8FnlT3OBfyMHLuAjtvgTNGYhzmqJRaNc9
 yMFbWyoxpjXNiqPEPuN0ZPl1kazcmnv9Cqd+lzMOcjigDmIQsw4DYj2y6nqvOVexNODlhTeyT8M
 FwwDql/QU4J2dEmnlrZX7GvtDzgJA68uwXzSEaYUYMTEZGAO/uk+nqNaSdFBri0DbUWHtDId7YK
 bx5jAQDOtaL3/laCWSlogG59bZqP1bq3vuDKc07ZwkxhbPR4DvtSYoHnC84vJaDxvdi5ZQeJvJO
 4iTXNulxTLnzNM0/2meehmvkm/M95+t02XwnpD5zeB5gusVeHLE76/Gv5YeEpK23r5NmAwlUAKd
 zc5Tsm6BK9t/cigVoOA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_05,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010094
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Oct 2026 23:45:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20430

Updated the value(s) for:
  linux-ti-staging_6.12: SRCREV

Changelogs:
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=ca77f7291a4f1c5f6927fee4e47282b03a39ebfd..1b14f5313a97da1edd4e4d92036b727ea267ef5f

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index b4d7c122..755d4ceb 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -22,7 +22,7 @@ S = "${WORKDIR}/git"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "ca77f7291a4f1c5f6927fee4e47282b03a39ebfd"
+SRCREV ?= "1b14f5313a97da1edd4e4d92036b727ea267ef5f"
 PV = "6.12.57+git"
 
 # Special configuration for remoteproc/rpmsg IPC modules
-- 
2.43.5


