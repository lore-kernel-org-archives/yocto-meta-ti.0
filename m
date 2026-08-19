Return-Path: <lcpdbld@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E101CC5DF7D
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 02:42:42 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24452.1787107355921221133
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 18 Aug 2026 19:42:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=l0/HAXRD;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=MlKVj2IW;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: lcpdbld@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 67INsao4653916;
	Tue, 18 Aug 2026 21:42:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=cWhtVzrxOjwpR
	+QssYeMzCk3ETsLU+fank2fO8pBbM8=; b=l0/HAXRDaIaZBBqGy/6cstZRs2KzE
	AzB3IjxKH3I22ZvcBX293ho8V+A6AF9pvZjzYej2RocZjn5JIQuijxSGeFtuYsbo
	DczYl+aTgXU0kyJDPxzNTj0ppjtn39qzZvJL+07fbMsAl8zt2jPnUU+gSOW3gUJA
	exZn2CeQEhF/Ia4LvINXcGdey00c6s0uiuF+ISWOefxzCXBzPdDLMGSoD+2qPeHs
	NlYfRj4LcM3R6nxb1eeUS1LarPr/Clmlq7dwK7NoTiTkH7W2U1CgnmqBUWol++BI
	JqahaDA1bV5+3wRdU7zlQjsfwog22BOaussFKDfkXba//znXm8HilJdJQ==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010049.outbound.protection.outlook.com [52.101.56.49])
	by m0384305.ppops.net (PPS) with ESMTPS id 4g4yemhhaq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2026 21:42:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B/1W3pL4cqrXq9oiFTRLg5+h9AQdwQP4osl9vYYBYq3lfY6NBrmRyjEo/d5alD7ukP2KjJkU82e6ntMRdwRxVjc69MSPCrDTUWJUd9jb/vMUO0ZGtiHbgJ+jzAL6NdjzmgyXjml/wgA9/p0v74vgLhV2/Bh6IfyW+rc95MwUXzh34ns8Hu23Wa3nfhX4+xKMFXp2+JqBhD6aaFDeCWVUWHNRIrJ89NaDrnrChelZthhIR+OozDlkA8MC2N5tlT+jfhPhCtiubNcejALTTDxARm5T2ArRW9mFh5R0Tr07joQ84Cmf8C7RQlzl34nGGKhrIGPDP5vvJZaj/s4s2MwQmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cWhtVzrxOjwpR+QssYeMzCk3ETsLU+fank2fO8pBbM8=;
 b=faT6VZvvpnpUEsSRjEYF8Iq3YqeXLjbaQcCw5t+Yah9xFS4Qd/uZVA58t/addRO2jCAAXOxmYsWRp4lgFIy/xrYPtK4btsKyVQIO7I1Op96kGb0gIj0mg9wC+nofev1wHvpr5PdtqyH5FBFhnzu+bDs3bD57xo9XLmMx77c2eUrFXzYuM+7CT4WB3hAW3DSPHpmFCmkL+40UTyaoFvP+c68WbomelYUihecK90yCibfiBpc4LJ2IEHJUCjV8RXU0bvsvbbg+UCwSjpTrBoHtyVxbnoCLDqFjQAIQ20ntDb/JL4YtqpS3xvv4HvmR1rupeR7S7AmadsTX5xex0K11cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cWhtVzrxOjwpR+QssYeMzCk3ETsLU+fank2fO8pBbM8=;
 b=MlKVj2IWdP4ZmYJRyXxj2hHd+4cBS0PVX6NFIvit1lz+dnkyxrL2Jc72UfE8b8n8RsUlBAdZLAmV12TBzzIRVVuAO6FHcf7lwNchDpv04BliqFLnq+g9TaYDFJyakdlxmmJ9Y6Clwj0MpyXBURRsL4KyZHGAh6F+PhT6+21VW/e6E34bvPgcIzcOUt1hCOFxAnamVEWKduil3/3aH1ztBKd+bljI3bFh1Ck5Kbu5mSTB6ouP+Aj8pT3sP6u7vRn5C9cACmIqS3LWDkKpeLC1cC0JbbU0rnleHOsArjxnNvgEvJEiIvH+1n7FufGoo5Wafx6sl0wf08p3yzvpcRtQ4g==
Received: from BY3PR05CA0017.namprd05.prod.outlook.com (2603:10b6:a03:254::22)
 by SA2PR10MB4666.namprd10.prod.outlook.com (2603:10b6:806:112::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Wed, 19 Aug
 2026 02:42:30 +0000
Received: from SJ1PEPF00002315.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::97) by BY3PR05CA0017.outlook.office365.com
 (2603:10b6:a03:254::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.8 via Frontend Transport; Wed, 19
 Aug 2026 02:42:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 SJ1PEPF00002315.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Wed, 19 Aug 2026 02:42:28 +0000
Received: from DFLE213.ent.ti.com (10.64.6.71) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 21:42:28 -0500
Received: from DFLE212.ent.ti.com (10.64.6.70) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 21:42:28 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 18 Aug 2026 21:42:28 -0500
Received: from fllvdckhpci102.itg.ti.com (fllvdckhpci102.itg.ti.com [10.64.72.97])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 67J2gSAb1509088;
	Tue, 18 Aug 2026 21:42:28 -0500
Received: by fllvdckhpci102.itg.ti.com (Postfix, from userid 60899)
	id E353B2A65; Tue, 18 Aug 2026 21:42:27 -0500 (CDT)
From: LCPD Automation Script <lcpdbld@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        "Denys
 Dmytriyenko" <denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: [meta-ti][wrynose][PATCH] CI/CD Auto-Merger: cicd.wrynose.202608180935
Date: Tue, 18 Aug 2026 21:42:27 -0500
Message-ID: <20260819024227.3526160-1-lcpdbld@list.ti.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002315:EE_|SA2PR10MB4666:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ff868d-9912-46a3-7537-08defd9b82cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|6133799003|10067099003|56012099006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	pmgZmiyAHSwspbrSkRnZRUZD6/BBzDFfTHA6UrLuwCSgmjNvXrmNEa2Q0FK6F5sa4n7lUJYdH1R2Eeomby/CjHSOcio0cCW42d9Gx5u6YifCkEfPdALIztfIpj55IRSFYPSHMW2N0pNsKvth8QdUnvRZ1ipOMsH+GxIfJUBEA5C2k3cI0PBBKTpLIxw/eRcjNisvUTokFiz8ZCMy0sTeqG63amsuBylSNO8xDsvdabCQ7iQ3w0bSt7NMafP8RztngzfscE/B7uH6Uaodu22HoM9VvzkWtDvHiSQ9ZFdn29myUOlllR2bBUA/abMYn+EgxAj6QzY8H+w1ue2hICE/qySbd0OensohBXI8TPHmT4+AIxTZIvivGYs0UhGyfnBeNIaW+ssj22ZvvBpbfZU86Z1KeKljYwjvzqGy/N2ZP6dwcaOPdFohJmOf9BsPj2KFaYbvLH1C+pQVh3rfxQF2Wo1+zFyWqgymdPku8oFe8DItgeD93rbTAN9pj0mFnILjwMiH/C/h8ypuaeK9miGnpMYJCBzENDg4KfE5fK0MRZTFG5ku4nnKQvIeq6elEIvaldt2ZA5z2DkE9ycQslmzZEn5f81kTwG9rF6ThdyCW4r/5SpCv7M5NSv2pFo7LYkWQWV2ZXsd+ICaRQBRmtBtDriR4ZH2H1oOOv9cC3hZj4E=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(6133799003)(10067099003)(56012099006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	qSevZ2xBVWy+/Lre44HM327nyGJlPXqOI9Cq/8iMNQFtm2WkoFM+iN579BaewIwUu87dhOQSmI7HF4TsxKaE+XwfP93k9od4Lj4RR1LciUMMyQAR6OtG1rvdXzeFuO8uvNTsqyfoK/+kn6j8eLI+XtUfQGa++qxzQPtDQVQry+82z+pI2ni9R1kbyNuwY67P0McFvb+BnemEcwstgxUpI7ziQUv0aRPW85ff183ZKWk+TICKBl8AI2uX+DfBio7wnmYsAHh398FjUCuNIEoALgvB3bn8q9wu7eoGEHaSNcxCZFZto6e4MeqIw36NMoQtTBbmTVEhZV41DWEbNcIvYVY5ARPAbO1WEsHmErkanQg0xKh6Cobp4M5W1W6Wm3iRZFoRIMy1/oi4/Lvk1lWdz6X7bNlspdcAJwh6cjy5CMIY9szkfRWZ+EH5h+qoEEtv
X-Exchange-RoutingPolicyChecked: 
	EQSJYU/wNvkjCyXV2yE4wlLyDGnt0BoUm5dUpFaKeTZ7MMOdX967IODXOTtAsCn35gDa1LseElUc4FLZHeZGzJvtELC5BKEdrrZVuTQJ/rtmMJOj0CgnalOW2ACLm8o1VSmfx18kXHlbh1ALm4JPOyX5yoB5Tq5k8kHrjzbktJPEuSpcBtyv3PyPSf48qKmYgFCP5eGxeuSxhvKLTmmbgarYpVA4jbnt9N946qHpb18swiEkZAHbkfKWEFYD65BFdqk3rDM9X3FoUFhipyEExnrUbsBz7XH/0E+/5ePgg71St/T+Mf0QFAda3u337fsPRBC3G1Que5Cw0CrRIUQBAQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2026 02:42:28.8184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ff868d-9912-46a3-7537-08defd9b82cd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00002315.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4666
X-Proofpoint-GUID: 92WwNccIvaaKiXCGd-JVsNitnssY5eGr
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDAxOCBTYWx0ZWRfX/Rrri8lz+991
 LllH9TTyKaIFnJKiL4rOACp0mL9vevarTU6C06p5Xsn9oCIx/xRQubVXvoTXek2+wi9Gyw29XCM
 RQqwdIcsBhKeQDdS58gH/OVW3goOKbU=
X-Proofpoint-ORIG-GUID: 92WwNccIvaaKiXCGd-JVsNitnssY5eGr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDAxOCBTYWx0ZWRfX+e2tRIUJZbIC
 iY6/4w987V1em5hvB6GdqB8jP9nKS6SiKnINOVaVuiHHBmnQH1mmdY8FVANLw191X5U+GU6B19s
 WCEKwVVsi6sDLx+KGEHumTQJDV86bJNeL+vBkR7CY9p9cht17d5V2IjxJ6kKMqqWTvdFpB7W40P
 KesgcAxeVLBnOlDQYmBUaqWQe6LkLZqn0bfTTJkX7OImjymAwxxd5NtHoQOi4WfTAKvEhsOhPQg
 7fLa4k7d6wPzkTwjOIpWukbhi6oHf22HY4pyxoTOTsgFpKGj7L92PV08RXyLaazvTXZFNJAn69a
 Qb9cd73KcXmnjXtWVclIqsFwazhRsFXjY/4D26os6TdLW4PsFpNy013S4HC71TL3JndD2yDXjjA
 WcVa369Q4uDMc2YoTX5IgFtDzHCKu+n2NsbdTtkGYuBzXOzIGgO5FRc7jlnZZEZ7E7IWbb8Rf3M
 6yXrTTFwrNpv0DnNRFg==
X-Authority-Analysis: v=2.4 cv=S9LpBosP c=1 sm=1 tr=0 ts=6a851819 cx=c_pps
 a=gJeMUiwA5g2xtJW4k6eMww==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=f7IdgyKtn90A:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=sozttTNsAAAA:8 a=NEAV23lmAAAA:8
 a=_IapwqxnR-KLGLxz7ucA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_05,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190018
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 19 Aug 2026 02:42:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20277

Updated the value(s) for:
  u-boot-ti-staging_2025.01: SRCREV_uboot
  u-boot-ti-staging_2026.01: SRCREV_uboot
  linux-ti-staging-rt_6.12: SRCREV_ARM32
  linux-ti-staging_6.12: SRCREV
  linux-ti-staging_6.18: SRCREV
  ti-rpmsg-char: SRCREV
  ltp-ddt: SRCREV

Changelogs:
  u-boot-ti-staging_2025.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=1612e4d1deb11d49304c715576854b28cc10e34d..4ca322ca563a21cccad8c9ba65e386b9fd34dd16
  u-boot-ti-staging_2026.01: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/log/?qt=range&q=5fb29434232110fb5a176136086d26ecb299932e..8a78938c2d8a270d851c66abc2cb9d8fcf77c690
  linux-ti-staging-rt_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=c6cc0cab5b8575a2a70f0c4f9dbc9981f367d8e3..f8d2733e4654420b73fe3e17cb83a30a4763862c
  linux-ti-staging_6.12: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=5ae038766eda6647bee6dc52c88308a0a280878d..ca77f7291a4f1c5f6927fee4e47282b03a39ebfd
  linux-ti-staging_6.18: https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/log/?qt=range&q=9098671a2d2ce1876543f6d6fd576285a184f5a4..66c3ddf05d9d378cc4f8f43fd2a7cd491e9265cc
  ti-rpmsg-char: https://git.ti.com/cgit/rpmsg/ti-rpmsg-char/log/?qt=range&q=e36103aac7d9f6d64125eb917d3c69022cb86e0b..b1e4d172f39081db81305fa50ccaafd3ef8ae3a6
  ltp-ddt: https://git.ti.com/cgit/test-automation/ltp-ddt/log/?qt=range&q=7b143203fef1c7b774a49b459c092eaf0b2718e9..76fe5cfa8d2eb4ae1681d49f8313bf02a68e38b2

Signed-off-by: LCPD Automation Script <lcpdbld@list.ti.com>
---
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb  | 2 +-
 meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb  | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb    | 2 +-
 meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb    | 2 +-
 meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb    | 2 +-
 meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb    | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
index bb841fc3..f7475c2b 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2025.01.bb
@@ -4,6 +4,6 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2025.01"
 
-SRCREV_uboot = "1612e4d1deb11d49304c715576854b28cc10e34d"
+SRCREV_uboot = "4ca322ca563a21cccad8c9ba65e386b9fd34dd16"
 
 SRC_URI += "file://0001-binman-migrate-form-pkg_resources-to-importlib.patch"
diff --git a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
index da7fc0b2..58d335a3 100644
--- a/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
+++ b/meta-ti-bsp/recipes-bsp/u-boot/u-boot-ti-staging_2026.01.bb
@@ -4,4 +4,4 @@ PR = "r0"
 
 BRANCH = "ti-u-boot-2026.01"
 
-SRCREV_uboot = "5fb29434232110fb5a176136086d26ecb299932e"
+SRCREV_uboot = "8a78938c2d8a270d851c66abc2cb9d8fcf77c690"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
index 64a5e0d1..90811c9f 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging-rt_6.12.bb
@@ -10,7 +10,7 @@ BRANCH_ARM64 = "ti-linux-6.12.y"
 BRANCH = "${BRANCH_ARM64}"
 
 BRANCH_ARM32 = "ti-rt-linux-6.12.y-arm32"
-SRCREV_ARM32 = "c6cc0cab5b8575a2a70f0c4f9dbc9981f367d8e3"
+SRCREV_ARM32 = "f8d2733e4654420b73fe3e17cb83a30a4763862c"
 PV_ARM32 = "6.12.57+git"
 
 BRANCH:ti33x = "${BRANCH_ARM32}"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
index 5e7e8cd2..b39b4511 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.12.bb
@@ -21,7 +21,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.12.y"
 
-SRCREV ?= "5ae038766eda6647bee6dc52c88308a0a280878d"
+SRCREV ?= "ca77f7291a4f1c5f6927fee4e47282b03a39ebfd"
 PV = "6.12.57+git"
 
 SRC_URI += "file://0001-libbpf-Fix-Wdiscarded-qualifiers-under-C23.patch"
diff --git a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
index 57589c01..fc27e7b2 100644
--- a/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
+++ b/meta-ti-bsp/recipes-kernel/linux/linux-ti-staging_6.18.bb
@@ -22,7 +22,7 @@ S = "${UNPACKDIR}/${BB_GIT_DEFAULT_DESTSUFFIX}"
 
 BRANCH ?= "ti-linux-6.18.y"
 
-SRCREV ?= "9098671a2d2ce1876543f6d6fd576285a184f5a4"
+SRCREV ?= "66c3ddf05d9d378cc4f8f43fd2a7cd491e9265cc"
 PV = "6.18.38+git"
 
 KERNEL_REPRODUCIBILITY_PATCHES = " \
diff --git a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
index a0043caf..15fe8062 100644
--- a/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
+++ b/meta-ti-bsp/recipes-ti/ti-rpmsg-char/ti-rpmsg-char_git.bb
@@ -8,7 +8,7 @@ BRANCH = "master"
 SRC_URI = "git://git.ti.com/git/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
 
 # 0.6.11 release
-SRCREV = "e36103aac7d9f6d64125eb917d3c69022cb86e0b"
+SRCREV = "b1e4d172f39081db81305fa50ccaafd3ef8ae3a6"
 
 PV = "0.6.11+git"
 PR = "r0"
diff --git a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
index cdfc185e..6f4728ef 100644
--- a/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
+++ b/meta-ti-test/recipes-devtools/ltp-ddt/ltp-ddt_20260130.bb
@@ -11,7 +11,7 @@ PE = "1"
 PR = "r1"
 PV:append = "+git"
 
-SRCREV = "7b143203fef1c7b774a49b459c092eaf0b2718e9"
+SRCREV = "76fe5cfa8d2eb4ae1681d49f8313bf02a68e38b2"
 BRANCH ?= "master"
 
 SRC_URI:remove = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https"
-- 
2.43.5


