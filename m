Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B9EC55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 15:40:48 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19473.1785858039015673749
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Aug 2026 08:40:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=K/ZA5NDb;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=PA/z5dvC;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674DSG8M2586249;
	Tue, 4 Aug 2026 10:40:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=UJhwQiP7OuYGg
	xsc/3wDdAk1MVcjeaa/nr/64NsHyI0=; b=K/ZA5NDbt8OL9Fo8chTyJj7bF1kaq
	5iY3BsgmNNu/qHv9C35tr40IghiMdsmqB3ftaeRih18GVQkIlhfHVL4MBysB129q
	BCaw4ppMbb1ZYLzAnOmzJqsG2nVkOuX88mXvL3jrrt8xph/YecMHg7C9cs5qokMe
	F1o2Wyqh1fe2PVLQLBoYPeQYluzH4nmYZENMOFcnxIsT6446ghA0qYnUReL5/w1P
	s44PlS9u07/CJOHwyThJ4ombzhHsq0NzbRmk0VtrfIXIqmhTOeCuOQroKSYBb1L2
	0souFKQYuqkYvkstAGLSUtbq1uQV8BL/p7p0Y+Ym8QKlsVYXRHgPHipsw==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011038.outbound.protection.outlook.com [52.101.57.38])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fufc6srca-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 10:40:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QEJZd9jyyefPhfUDZ08e1X+mYlAUfhn9ZQfaDeHZgnoGwGSMf9R5wmQSh0iV9XBBpvLOf6WLXlD0X6KG4ThnQCbji15j/HlVRTphnbISgSoSJ7AeNWzdJk20ozXOyhg6aiTMcQ5YWjtSTNDKRJkpIQUJ/Nzc6X+YMUP8MCYqzZs1D1N503EIUmC6P837JiQyqBd1ZFHqA6icQiavbCDeT/NOTH+8OqHYJxLRSGKNdA11sP8jEm+IkL7sNIhXD6RnSH1bV4MRGXfJF20ZBFoONojEVM6O+O72T4h9GAnhIHZEdmD2H53ZSJg1paKFaLnVskuah5xEqu72tJRs8WOyIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJhwQiP7OuYGgxsc/3wDdAk1MVcjeaa/nr/64NsHyI0=;
 b=mCJES9sgis9LbVc9mxyBiZ3YyaeoB3Ct2e6PdVtauRjFLT9mAXURao0gz0glA7iTc2HCtK9qXyJqphk+tsBO7B78Gtnql3SxgDemtOKf8wsMUadpKA0fwLRA9+7a15mYhw2MMBAeyU5EWfF/qlB6LBPgxyjxELAbZoe2Sb24aU/nFFMAeCUJIY/Kn8ojA71b78X2qky9l1qBOj4Mg98rQq5z16lqxU1z4d47fz8z3s8MHUo0HqY/fG3HZ/BN120ekSKlPg4DGm03BDY4/gwEo65MgOR3OipIeMuTwNSSj9j1+4rMEVqjt19qdeQ/uIdykHY5icz2xe908+YnK9h85g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJhwQiP7OuYGgxsc/3wDdAk1MVcjeaa/nr/64NsHyI0=;
 b=PA/z5dvCWiBBKBzJSrHJnisRwkS8r7iVaMmJuhdnANNjtRC0geNRUTMPpKuTnsjKmfQFkRYrsJFezKpyp+EXoE+VW6sR650Wodh2IBRA2krjUlbEx/E0PELUdbAHgLRJy2lzHukMZQ4fmXJM3puy4KvKcjENxqmxtE+ft991z3o=
Received: from BY5PR04CA0012.namprd04.prod.outlook.com (2603:10b6:a03:1d0::22)
 by PH3PPF54E75B76D.namprd10.prod.outlook.com (2603:10b6:518:1::7a0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Tue, 4 Aug
 2026 15:40:35 +0000
Received: from SJ5PEPF000001D2.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::89) by BY5PR04CA0012.outlook.office365.com
 (2603:10b6:a03:1d0::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.16 via Frontend Transport; Tue, 4
 Aug 2026 15:40:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SJ5PEPF000001D2.mail.protection.outlook.com (10.167.242.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 15:40:35 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 10:40:13 -0500
Received: from DLEE205.ent.ti.com (157.170.170.85) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 10:40:13 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 10:40:13 -0500
Received: from grumpy (grumpy.dhcp.ti.com [128.247.81.229])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 674FeC273935681;
	Tue, 4 Aug 2026 10:40:12 -0500
Received: from reatmon by grumpy with local (Exim 4.97)
	(envelope-from <reatmon@ti.com>)
	id 1wrHFU-00000009glJ-2G1c;
	Tue, 04 Aug 2026 10:40:12 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][master][PATCH] meta-ti-test: Add commercial_mpv license to LICENSE_FLAGS_ACCEPTED
Date: Tue, 4 Aug 2026 10:40:12 -0500
Message-ID: <20260804154012.2309012-1-reatmon@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D2:EE_|PH3PPF54E75B76D:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b79ad7f-8f23-4c60-519c-08def23eb9d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	n58gql8bemNhETJ5QIvpajyaZITIkNFgYTK59bRiGmaLXPd+xtmQdFue0UB4f5hphAsJvxxmrRYhfar31ZwzA7CZNSTy014Rq5EzOOb/EQ7aJI3oLJVI++7eAgV70LGMBQHgCxK/ItLhNKJOzBzZ9Zc6DFVRGfbrhD7UdOK2RILbxmkI80TPEiUuqweXqdLIMO605ZU6yoTIY9ztHcxriyaoRlASDk2Xh+nfmJCmyRz7ShibVU5Ra3FreEIcKIJ125GHkoj1aiyDDD+q96IGi1/gSpKogPQDbDepJtjtzhmpuV1Xvu9KK53NUok8ALuU/j3iF6gpuY+lj5nllONwMHAC0JfTgnooF/X//zNCPakBBFnBhQ3/d/xTxkR9WIhZn7ahwpfpbRHKsEAed9t1apnhiVAJcFd2y56LvnDXYzU0/pxZZeqLuUqVhU8JrjqPQC93ktf+1ylb3TsopMWM566ZaAvLtSn+kdc7NChKaIkqgWUBWWIlhvhoMaAtZ6StrFwkBHAacXd+FAj7N8udQaUgFP9P/1ACn5DB7oBsNxJXdc1mq4ugNrSBH+MccJOZnK/aEmCmiFyNNVnN5ByLS4BhREnQr3zpF1R1meKPa+gSQjqen9SnZ8oycjOldVv0S3fmJuUl4IwLpCfUzZ9tnP77ECbUQwtNQZNZQXRWE+3ZAo7w69ouDATc1MVNYTGnRjghbk0xZ/4y31fa9ylEow==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	dppAF/GOsOy6fYGYICwbOshTMTs4jTGAaWpIMb/HerJ+9MQfCS0M6IIH1tJJ20rTte6RzYDrYtb6KAflaJ+GpZhIOMDg8rL1MMVgM4rXSCBKsvPKiSnUz17oaRhC7SvtGlNto87+s78EHCjH9mDfUte16zGQVoPfnVzf8NdFA23ELz9TB8s2Osif7ChxqObZzZZJDtIR5OkbSdhEtsvk/CnuDyuda2OdMdJlIvKyrmzrniVkJYkgN56h+h0Yb5ZQ7Zetmm5I1Z+toRTUCmOb35IPv59ZCC8alt6Y4V0KbMaQQGKBeOf26+GG2M0CyjZ93THJwZ9WR8irWGvO8TNmdRQj24insc3cUamildMRpLpVmohZnibDBurzf7q5HXFddwuX+Qk/pyQ1Jib0MCUR8yuMj1FRbDR2R/JacTJD6o+eCwEIbfkAgdi/KO9phO63
X-Exchange-RoutingPolicyChecked: 
	HAU3xroAUXKLTsc/BnSdyxvxmIfaQDSdQLRP/gLEGUpeCPtDBt+93FkDiRQMIKHSwxhhxN+wOEzY8UaOt49vpTAcg3s2GVS991TtvOmUruVPUkspX2f6evCQAZtNcnMc9k7EtN7VAD6v6/IhdMBpSAqT6nwuBSnXNZYSiutSpj88gjupKRF2yoBBqjiyL4ysl7/9C0e6bKI9hTZZEplPZCPpoAujOvHLmwlxmmZY0nPJDyHT5R0qyj1Gd0FMyERFJBElLJ0l/FC3d/ERpkDiFXoFR4X3ucIoSl7cSPdwwW/iHv27SS4r3ETJVgrL4o/NV5+90/PscuTI8Sk5aV+buQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 15:40:35.1208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b79ad7f-8f23-4c60-519c-08def23eb9d0
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF54E75B76D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEyNSBTYWx0ZWRfXzZGeJzjMmKwq
 e98CfqVGcfDhO701kDRWonIh+BQA4K/fwdD9XBrBtdFshXKAaQCURY03FcwulikUCZ0HKiLdRiF
 X06XiBDeLuWKEPwnuyEwQurbFsEbt+e5tjw8ecGeBZFaTvx0wlZpSxEuw4AM8NMuOIUPbb/Q7nI
 md23reLq9oY5ugL85wipC8pzBxjk/bEAjH0nv9d7yhi2q5m8M0Qo8clf8R1hwtUOzlBwAengqq3
 hJ/tC83oZav8lkaO52VQPsam6rjO8c30NFDNlirLDHoH2ScCHVkotVj0Tq/NDytOrUPE+nke8s8
 qhqJOGZxQUap1XVu0F0yMSMBPeYa7UxR97vOO4KvxX7l331V7gRVvhOtm3kRi4bTUFpus0z6bO+
 wWMsQqXSGZQU+pj8nE3I4XYEAwt761T0HjxapSawC0/J3+hjxhp3s8by7q5r/fuQm8mgXqmNvyI
 mAvEzU/4WFqEY9++cnw==
X-Proofpoint-GUID: 0nSFG4b687cEmk_CSuKX9Kl8CiylGU__
X-Proofpoint-ORIG-GUID: 0nSFG4b687cEmk_CSuKX9Kl8CiylGU__
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEyNSBTYWx0ZWRfX0z1CE+dkjSCa
 QdXUJrjbxHkuPbpwYbuuGjxDHMPkI2gkOiEmibObIDQOTSJGkBS02e9CiwT+ZEP4v6EBBLZjY7p
 49A92L8Ham57ElwFSV/OnLwEDC3P74U=
X-Authority-Analysis: v=2.4 cv=Va3H+lp9 c=1 sm=1 tr=0 ts=6a7207f5 cx=c_pps
 a=n8wvYzHE7/phCzIUoQmMUw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=Q4-j1AaZAAAA:8 a=sozttTNsAAAA:8
 a=mhCe8n6kjg0C1GM6VkIA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040125
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Aug 2026 15:40:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20214

A change in meta-openembedded [1] has propagated the ffmpeg commercial
license setting through into mpv (which depends on ffmpeg).  This means
we need to add commercial_mpv to the list as well.

[1] https://git.openembedded.org/meta-openembedded/commit/?id=5f4e021e2df0cd434f9266aadb2353886e57854a

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-ti-test/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-ti-test/conf/layer.conf b/meta-ti-test/conf/layer.conf
index 5e370d31..39a9b6de 100644
--- a/meta-ti-test/conf/layer.conf
+++ b/meta-ti-test/conf/layer.conf
@@ -37,4 +37,4 @@ BBFILES_DYNAMIC += " \
 # Codecs in ffmpeg with questionable patent status are not included by
 # default.  As this entire layer is purely optional for testing purposes only
 # and not meant to be shipped, add support for the ffmpeg commercial license.
-LICENSE_FLAGS_ACCEPTED:append:ti-soc = " commercial_ffmpeg"
+LICENSE_FLAGS_ACCEPTED:append:ti-soc = " commercial_ffmpeg commercial_mpv"
-- 
2.43.0


