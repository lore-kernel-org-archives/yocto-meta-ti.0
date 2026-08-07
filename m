Return-Path: <m-shah@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A985DC5AC7A
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 06:22:45 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37115.1786083759458465100
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 23:22:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=AHOi6LiI;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=FadMQKxj;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: m-shah@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6776AGPb1309788;
	Fri, 7 Aug 2026 01:22:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=proofpoint-05-2026; bh=3vDp4KK0w3qRP
	L6IsBf0Q9OInPiyx1+JNrc/u/yhVaE=; b=AHOi6LiIFApisw71OFO/MdOVkoq7I
	E8HwDqoUFHm8vzQFQVuctBCyb1WcmPRyy/1FoYct1wRXVcdzESabsEyIJ21nAZIL
	h24GiFuERRwvx7og20Rb4JoL4vA6FTiZ+1/G3AllohYFeZAL/BpNK/K1WvAvEuVO
	xNPH5g/y3ztaQipfQN7IMelP73wNdqfJHqahXiD0MG1/F+5pRj+n+UO0cBTpxkFE
	mGQG22lG0wVUpovvT/CFPGJdJWB+OBmH1HBj/dTDzpLGpEITdpqSHEne07rA7Z32
	6L2Y33+V31LYM0JLmo8FRajRm5yK/dAO4CDzm7vL6Uq4U1adGWWo3nQRw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4fvs73fegv-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 01:22:37 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PNxD3nwC5yB3Yvyn6hslvShLkvQUHZUgy45NwUqKdS6Wrs6QNlOUtR/FUkaYzscohUARnpNVuVp2L3R4M6RdRj2gnscQb+W1OGcBhvlU611R03uL6PyNObk/ZlMpV15KlUAvOyf1CCpilcdju8vmu+Rzjir74Bsx3LFTxRHhsfAjSmQe0o3vD3uET4zjCUwf2gikqtwE1IuQkeJ712M5TTrFNu/VsacLAcVWH8garwG9Ims3g3+gD5MytYEtcuh+88wH/KsTOyDJSp3DKqKnbHuLdyYlr4NTLsnOQps7GystpDqtNqAusMRF6vRvIrQBrgOpgXvwKcixuGZhSSym7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vDp4KK0w3qRPL6IsBf0Q9OInPiyx1+JNrc/u/yhVaE=;
 b=n00WztEBn7GwpV0ctheq0iDw6E79Wv4i9r71EXR+wndzLEmYGBFoUxRSHllpzxP3HY/Ag0ZAeXm3mjlIZV5IiqqdTKGQWwZ0qKY/pmILoG2zqauOPLMBtqNZhWmPGjM4KTyQNjE+AlqUxwJIywAa3aT8LNAVKWG1sPZnBLF52IpE4RrC/9J05sOYvRcz4mzMZCpqLi9+srtsNLKBPXlQO5yLKQf3pn6pFxhFGKmzguUeYpoMRgp+wszqdoh6wTftNahfgkqxG5/MuPDoEU2S0AacWC1gGD3Fnz3kRp6IXh/he9IvXRX4vx+bNS0tKJH3ItcQ8mM1+L26Ezy3/7Hhig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vDp4KK0w3qRPL6IsBf0Q9OInPiyx1+JNrc/u/yhVaE=;
 b=FadMQKxjYt3NtuOUJ7COkmct9DxD8tUBEgfqR+vLRPqvsXcNTDnY4f9dikmGrxVGnH1HNOM1vVt6Rc+lmpatRvmrL7YRAH5h9KTx8ac91FzYScpFuXFlyWmLnwt8K8hu5g2vZzINxhtD+wOuZD7W5XXIDq71f6wcK5jY3L4W+kU=
Received: from SJ2P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::15)
 by SJ2PR10MB7599.namprd10.prod.outlook.com (2603:10b6:a03:541::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.23; Fri, 7 Aug
 2026 06:22:34 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:5da:cafe::82) by SJ2P220CA0011.outlook.office365.com
 (2603:10b6:a03:5da::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.24 via Frontend Transport; Fri, 7
 Aug 2026 06:22:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 06:22:29 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:21:58 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 01:21:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 01:21:58 -0500
Received: from aniket-z2-workstation.dhcp.ti.com (aniket-z2-workstation.dhcp.ti.com [10.24.53.43])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6776Ltro537827;
	Fri, 7 Aug 2026 01:21:55 -0500
From: Moteen Shah <m-shah@ti.com>
To: <meta-ti@lists.yoctoproject.org>
CC: <reatmon@ti.com>, <u-kumar1@ti.com>, <s-vadapalli@ti.com>,
        <a-limaye@ti.com>, <m-shah@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: [meta-ti][scarthgap][PATCH v2 0/4] Backport ti-core-initramfs to scarthgap for j722s NFS boot
Date: Fri, 7 Aug 2026 11:51:50 +0530
Message-ID: <20260807062154.1387339-1-m-shah@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|SJ2PR10MB7599:EE_
X-MS-Office365-Filtering-Correlation-Id: aaed585b-8ec6-4af7-19b3-08def44c423b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	YQ0KJon2y3wXXfVHC1Zf73zHc1L4NX08GINfOu8Yns6W5brYBhyiwGfOf1VNo4SnyBhhADK4I5Cm8aNhrmqS1nDOXIa+11DeNAWphU/cMZhj4ady4lqRyQBm9vQUqEyV6bbhLdYpLMlMev9vi2b06m821qTm3LVPdYT9OI40aviXmV/dnzDs+h4IZcOoj3i3X7otZTWpCm6TAP41iCeZPoOc8PVleYHa9rlBHvakNM1B67AsVk7HQ2NPRKlX4cp+Fa3lNAosRglIa/l17dBQh5hJHwSRw0Q5zdj+7hVWVhC1A9xPgFM4HRkoJ5ecersPltjXsbnThIWy50SIPLh4Pv91PxLZX72XZGfCP4NwoExAGNEgs9JB1K0E7xqzkIIzrLFQGRJLnsoAMakZHM7yQaybi14x1iTmmTHbMkFsQb8uc/ZNote2y7gW2R/jGcFIWl7XoAAGAzuN2sc2HFW4aNFhB/0MaMmVvRxGrA70zekTVoZEpDoNMz+Qyem2F6F2Y09dvxV3SMXESV2s/c4rtx0iO3qXv1IzXRmtAlkKnhMuYz5X0646KiRwKB7OoDzwkQVS70lG0a2IEyahE8jSngfGfOlN09k4N2A0zQM6Vi+oBrULvenPEKzVhqLXR9DonwUDlqtgUsYpqUmXKxFQsmTLq2emuWWNc9T5ZpAgPhKdNzuom2rbigZoiftABfPtvHwjc+jeUWGoRBB/UiYQIg==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	MkiGBCx1X9wP9idm/lq0aq8BkdT5Jo1BfrZnoXuHa/z0R3qv1hoQITRYq7odud9Yhhd5iAsf8LjXlSG1quNqdhIYeYb7eMCxOufBiDniXsSihKWlNYdAum6dIADoAYthJYBoQ10jkWtQ03Ptjwff/MT7MVCED3T1zAxXqpDm2jG5U6JgoKlIcOP4aNzXUW2YEKcKcQ3hgE/GgaGRf4I4mHcprAjT44Y8dk9UY+Ck2RRqPrJg+1PJCcgJ8xbfw7fHwysqt2Fxz+PzlROxqLR8+yR413ZXsONBhkpH5ZY5UrI7TRIquHPbHTkJ0KJ2FEcnSB+bK1tWc7DKYkTuwZyaRfqmtfzQQzYNdjTOcF18CEIG1I5x26E4WMxn2cayGapx2+ER7EPq1HQKM3gEFfq6AJU8ehPrtZmsnCn/F4Zb7L3mf3UxUcPGgUThYKcYzzPP
X-Exchange-RoutingPolicyChecked: 
	bA4teNE1y1D2+XZyHgkddsmrcNt3dMIgjCSBVHEqWUIaKpcaJxovtFwyKn7wBwpN236282FEeHShVCsm41fB7zldr6YrfWNochfyLCgnI6+OK5JbRoT0pefTMTV13cG05WQMZ0bs6WrdLbt08RbfZDldWtDAy7GaSeCq173O5eA5I7LVQ7VdTfr53BiMaETJ2qutEEjh3xj2EnE27zKZ9aDEG4hgySTG4Fk2K/UO2lG8ufTlwnI7EFyOaj6kytAE2JOMRAvRrRQgyHDmFpBNWWaHso/3HouIXzrebxdLN/0BqlxVzM9eS0B+byMDieFwcIBtv8yADEDz/qNV3VRuuA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 06:22:29.7672
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aaed585b-8ec6-4af7-19b3-08def44c423b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7599
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA0NSBTYWx0ZWRfXza4aldwlQO6l
 szH0MhrzPvQug96llubsHVqJEDjmqJu2I9XjFpZsn18sH03zc9VCcbjiB2e71r/iamQX7xZkx0F
 I7c65dqmKn4j60mpnkmcnqrx0IguJC+1G8ti3lHNaSykx5f4tUE8FrC6SxRpiNr0p6Pd49jJrL4
 e54IgPh2rggLDzwbfU/l9HxYRcP9qbN2SK+pwxOFArFF28OFlNkUvLmX3h8IiB0SQ17NN3oue9J
 vJ9ODTBypCX8yeX2mjijRY2DUfGXkkDd8OhpiH5/gAaAutd7nzGljqQb1fyM4TGmrbTBiccDsp+
 7iYIyeU5O8S/i9/l0ofNiF5yHHsEPkVUNOVzjqEMUIU40eB/4RY0BqSv0hyKrSKf/BWhFLXgMI8
 WXfv1TvvEXol2G6oAo+WXRSwJK69RMCCmR6tKsHE79XuwiDS1WMIbFVAUOv5NiorHv7ttsekp4v
 z2AnmfQ3XpCfSa41ycg==
X-Proofpoint-ORIG-GUID: 5bYjKqA8Be67xsXhwz2TNwEUyrEkVKn6
X-Proofpoint-GUID: 5bYjKqA8Be67xsXhwz2TNwEUyrEkVKn6
X-Authority-Analysis: v=2.4 cv=dtfrzVg4 c=1 sm=1 tr=0 ts=6a7579ad cx=c_pps
 a=j8kfsx1CyBm2fJFf+vs0Eg==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=V5UXEbMT0ywA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22
 a=Fbz_sESmP8aA6jJkymsA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA0NSBTYWx0ZWRfX7TC+sBaNpyzM
 +uIJNCZrkTmAucePgcDI911jdepAOKXJinn2bPz688NZA8//w60LBk+uJu/1rW9PNHCtxi2QHNq
 u+WXNGNU6NEd90yFApyu2uF25X2nG1k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070045
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 06:22:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20231

Backport of the ti-core-initramfs + initramfs-module-netsetup
infrastructure (originally developed on wrynose/master-next) to
scarthgap, scoped to what j722s NFS boot actually needs.

Changes since v1:
  - Dropped directory-path prefixes from commit subjects (recipes-ti:,
    conf: machine:) per check-yocto-patches COMMIT-MESSAGE-3.
  - Shortened patch 3's subject to fit under 80 chars
    (COMMIT-MESSAGE-1).
  - Fix Signed-off-by in Patch 2

Moteen Shah (3):
  initramfs: add ti-core-initramfs image and packagegroup
  initramfs-module-netsetup: add recipe for DHCP before NFS root mount
  initramfs-module-netsetup: add j722s CPSW proxy-client kernel modules

Ryan Eatmon (1):
  k3: fix weak IMAGE_BOOT_FILES assignment

 meta-ti-bsp/conf/machine/include/k3.inc       |  2 +-
 .../machine/include/ti-core-initramfs.inc     | 23 ++++++++
 meta-ti-bsp/conf/machine/include/ti-soc.inc   |  1 +
 .../initramfs-module-netsetup/83-netsetup     | 54 +++++++++++++++++++
 .../initramfs-module-netsetup_1.0.bb          | 45 ++++++++++++++++
 .../packagegroup-ti-core-initramfs.bb         | 28 ++++++++++
 .../recipes-ti/initramfs/ti-core-initramfs.bb | 37 +++++++++++++
 7 files changed, 189 insertions(+), 1 deletion(-)
 create mode 100644 meta-ti-bsp/conf/machine/include/ti-core-initramfs.inc
 create mode 100755 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup/83-netsetup
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-module-netsetup_1.0.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb
 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-core-initramfs.bb

--
2.34.1


