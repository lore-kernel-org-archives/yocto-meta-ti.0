Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5436C5AC7C
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 08:44:56 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.38434.1786092290790592603
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 07 Aug 2026 01:44:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=RkCSA45U;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=jYzeJ1xm;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6777bFtG2372720;
	Fri, 7 Aug 2026 02:42:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=mL5zzNmRXMos16MOOSOWnW0ZihWzs5/emln2F/Z/p
	QM=; b=RkCSA45UKvAziMqLojXAw+iwz0beeFfacjpIDECDy5yG7iLHrgQb5F4ch
	2AxiOFFGHTyBhJxUt2vlUP/QiBaDkc1iefx4BLqsUwYb1zXvaTgsXkol/bO6EdOT
	tB8qmfN2O9wfif0IetJNJvFszHQj/uHaCiqaHXfxvPu4WGe3pUGux4YJjmw52SiC
	vrImYnMGnLGfzq3LJqiDfLNNYaIFPqDdhaKOasAg5LrLE45XmJm8+zzhfDVVHfAw
	vmlpPFkbLHEr9WoyqR7fDgMxxbPoOVhVuINSVEXlnAF0AEOlZfwO3p+rEPG7ag/g
	QiN/FKVgkBwm4lYEcMLXFHF7EnJNw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012061.outbound.protection.outlook.com [52.101.48.61])
	by m0380145.ppops.net (PPS) with ESMTPS id 4fwb4rr12e-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 07 Aug 2026 02:42:59 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rfH45WW9+8Xa4sMDK6vUUgfvfsyw0FVMudJgMXX2UNJdcDqK2Zs7mfnGP4KSlXVxcM7Sy4q8Jr+OujrsGaGmih6xjAC1av0VXNutf7BQAz2YFpKFsSVHickOwgBCFxua47bF45uJHKtEM/lkCFzFoOdQBd/ukJM863wSLLaOecig1QfiTBD14CsdnTf3XVRB92kdgBq/kSmYqUfvwOkoyq8RFee1fG+FNJDLdZOsM6RaEkuw+dReii0sCd0ELKpyq/+QmNd5j2NfPBAlQuu9T5a6wq7Q1L3/5IR2pr/dQAiEkxFdEL21Kg11pNSbXZWO/egHFK+sPbSKzAWBFB17uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mL5zzNmRXMos16MOOSOWnW0ZihWzs5/emln2F/Z/pQM=;
 b=bihPd5DV+viRdcK5j8e5dI7gxC/RLEoo938ohKHhXlNHN862FZbxWFRLFsuo9y1fe/anivv+jnW6UDKoVupxi3wZu1FJ47OySm+EGKIATvE4JB1Pq48jGyZgUQrKeO03jzOTu74XwFA9vzLPE41WdW3K3hPTlC3IOLMqZQ1Ut8na2Y3R2P4JzHC0PvRwgVEhWjri4Gk8c1Rk1nxyVVddG18yCLi0bbymmfsD1kO9G6jDRy3Ks+E5OtFu/fzap+SrytV+i19OHtTgXTCWcEsw3RfrarNhs3P3mVrQ/6kR01/rjCavH9kJ+JN+3kD/78HkIWBjQ8ktok5dZPRqw2AerQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mL5zzNmRXMos16MOOSOWnW0ZihWzs5/emln2F/Z/pQM=;
 b=jYzeJ1xmmlwb9mHF/Ju9BxW8kjU0g1/q0BVSaKzu0wot8j6LulK2KttVYCnbhLGhsSktyic/Edu4oYoVffX2Lh6QMybUh28tx+sF2bMd54mK7D0h033au01A3lR3c97mzeO2Cauai81Gr7Ird/ajxOu9VkjMIzGuBLekb1JMMSXnMv5+C2Gw4yfQ+L3lfYs2iJNshM7fUU7Z95+NV2S7TEOhH5I0bwAkDMaFyKnTTiSnXJLp/TSn8iNIbgsIdtm/2g6/lNJdoOvyyssfR21xM/sOopq4IuFKh4lJ4jfqc8cwbD15OZ0bAM6oeo/sZp12DTkdve9VBaQA1PqWuJBj9Q==
Received: from DS1PR04CA0018.namprd04.prod.outlook.com (2603:10b6:8:243::15)
 by DS4PPF4EE72D997.namprd10.prod.outlook.com (2603:10b6:f:fc00::d1b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Fri, 7 Aug
 2026 07:42:54 +0000
Received: from DS3PEPF0000C380.namprd04.prod.outlook.com
 (2603:10b6:8:243:cafe::78) by DS1PR04CA0018.outlook.office365.com
 (2603:10b6:8:243::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.24 via Frontend Transport; Fri, 7
 Aug 2026 07:42:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS3PEPF0000C380.mail.protection.outlook.com (10.167.23.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 07:42:54 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 02:42:53 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Fri, 7 Aug
 2026 02:42:53 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Fri, 7 Aug 2026 02:42:53 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6777gr81912584;
	Fri, 7 Aug 2026 02:42:53 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id A18049ACF4; Fri,  7 Aug 2026 02:42:53 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Moteen Shah <m-shah@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <u-kumar1@ti.com>,
        <s-vadapalli@ti.com>, <a-limaye@ti.com>, <gehariprasath@ti.com>,
        <denys@konsulko.com>
Subject: Re: [meta-ti][scarthgap][PATCH v3 0/4] Backport ti-core-initramfs to scarthgap for j722s NFS boot
Date: Fri, 7 Aug 2026 02:42:53 -0500
Message-ID: <20260807074253.2214683-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260807073837.1394655-1-m-shah@ti.com>
References: <20260807073837.1394655-1-m-shah@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C380:EE_|DS4PPF4EE72D997:EE_
X-MS-Office365-Filtering-Correlation-Id: e6eceb01-3612-42db-2434-08def4577dce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|13003099007|22082099003|18002099003|56012099006|5023799004|10067099003;
X-Microsoft-Antispam-Message-Info: 
	O23SE0g4PJQ7ta2wsVVNbnn61snXr3HbfxBuWwcnl7Usyeb4wZqteMtnMyzy5cpn0lrH+mHXcmikiD7FDlii262xCoyDbC5z26TY5fcFfzy6RzyNqHcBV4+cH5vmcwfzoiDKek5kpsK/A8Pr5XOmKm5t96YoliYxTVLw1cGELcGvJSqnMibMvx94pySg7agqHilZFKTtQaWRlZ645uzmVnh8kBOODyQaqWM338yWTwWduM1klnoB8QxYFtIiNxsTZgxwxMOcgnG96TNKcQQs/SU/2lxSDYP5phNhgkiWz/Z2e/MWXPdEc8lcRh3qTItwbgtiorao73CJd1twzA9TExqxFmH/fOoFB3mTkGd+6/HUvA0hzyJifU3x/s1//S7fH1epC1rMdNsRn1pXjEPDZZym+aS3nsmkHn3APffS2N+DAgByyn/81sGVhYCSNaTaJ/2LqAtIiynEpjqHPGMNQb5XEPFzBrREc19X6qKQXpkdrI6t5Pt7kaB72+IZ+dVQ4RX1ZluuK43YTDj6oixe1d9fHZRRb9kD05w4Z5wghXbAJBJjFijnXV3RW1P4LiewT5Oa2Y/y3Xj3ba3p/rrKF0jaB9mmeHbtdeKafcMFd0/NLAM7cIxu5ZYnkYBV9WkPlrNQ8K/ZJG1z3oPDyaNB8V0iv9ezvp46iVlqmE4XuL1jiArtMYxnvy0x8BBv4lNOGW++6vxJXVSdsDqgBWXlnA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(13003099007)(22082099003)(18002099003)(56012099006)(5023799004)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	eOh999oVSOFPyB7gnvIgWhgoW/Nu0iNo3DskH8ujvBkr19KglgLaNaEhCN7yo6wDecjXyyma4jCLLSu4aSMGXN0QAq/RoLK2FGiYJdyjWk0sNOAQgKJjqLPQ5xq1t6SG8O6NWiOqMizyQ0ZY68xqeurZB+yHmPalWDiB9IU08EUGUq/mtfzpU2dgUImHd3ZO87DuLgdkMnxbiqj/HdFPKuMUssUYe+pLbmKI3twAaBKIPchACbJ7ezPlnEH/WkmBkA5+x9E8lLdir4GQvfVIpNMiIQme5SSSu78WK1Edmxyz6MuJjWAkyTFaOo86zKLbIlh5jRYx2vYD18ZdzH+s+JTVnwldfpyOYrq7l3ODBNQjFIc+GaXd/NrRwb3KHaVlktBv8Z3G4AMfidK8DByxZ1yVRuWEVwPAzqt2YNTcXM3HXGkpDN9VDvoYsQ34VagD
X-Exchange-RoutingPolicyChecked: 
	goQIzaPu8Rwnjp/9+wSJ6EQhsKSUiQVKlcIDhYqYgKlM/A4AyEZXDtV/azA9J8iK8vU1dAo9hW5Z8zulMD256OGfPKRUaD0kMcmhaecfGdkViaiR8ZLy14PyEKtZz83pikJaBQrJ2PgwJUWkuqmYaB0RAaEhZVqV4e3ikrb/m8Wz2uwW6oFi17LlIe9oQtF9jGR2VYFqFa4jijNotnSpVqDicytKc1UIZvCIpfM57FaHn6FrBSyccbyYIlbU4s5yrqsCIrmfICgnYtqzL8xHVhCQrt7M+FmraAMtwc19YUYAtVfWuJFiCnSvAaN1Fx07ZbRfW8j4dCHCTYlA4RESxQ==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 07:42:54.2389
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6eceb01-3612-42db-2434-08def4577dce
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS3PEPF0000C380.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF4EE72D997
X-Authority-Analysis: v=2.4 cv=LI9WhpW9 c=1 sm=1 tr=0 ts=6a758c83 cx=c_pps
 a=kfEGYAivpUbBRfgbjfv6iA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=k-42gJp3AAAA:8
 a=cN9th1_XAAAA:8 a=XCktzniVQbRvQybRQRsA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=uCSXFHLys93vLW5PjgO_:22 a=5HybKBhn8h5UT_hmDMpx:22
X-Proofpoint-GUID: Gt9xjgox5Uz4FhGA97XhyDkkZR2odRPp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1NSBTYWx0ZWRfXwn2t+o6muJRJ
 /VpKy9zaa8p+j3ql9XB4NH/sWmW2PQkltIn184LCCeO6ua2TC/FQwCzMKGuxccBa3CWmsVJodua
 7ScC7mlORdEfRfOwnLoev/pMncs6mbP1yxSD8jVQX6rd9FpwEFklrcfaXbnhHxJFdHm/KpotoH6
 ubdzEIFIiPRlg66tEpGvspZZeUjEso4ADVV9vJIBckLPIOUyAHEH6CkJ9joqOcSmtgWpSZMKKWV
 LNTZHE637W96e9RIXOppbdbPVxQltTkW6TetOoMxW+xuq7/4yHNKVc7Flzk37BBt/7lk6rnISAo
 Lkd9bf89RQg/obxaz6Gl1Mei3xkIv4x6fO220NtBBoIcf0FlvKMGuThSMwoP7OU4MHc1vog3auo
 sCJyv59TNogo7sdez0AUcT71QjER2C+v3mWygtRYNn/kVZZcSL6AozSiBKxgYR/Oe5BXwkheYm9
 oAV02n/4x0SpTm/PHDQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1NSBTYWx0ZWRfX5aH72OeclqDk
 /N4bB99i8T5CyeaW4DsAdbvfRxa1t5+w48JUymoFd/kkEvjKH5Jq66/V0JP6ww7OzDZt33HAZ6S
 fQDFw3sOCKF6XSzqdhi4F4lAnffmAeM=
X-Proofpoint-ORIG-GUID: Gt9xjgox5Uz4FhGA97XhyDkkZR2odRPp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070055
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 07 Aug 2026 08:44:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20240

meta-ti / na / 20260807073837.1394655-1-m-shah

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][scarthgap][PATCH v3 2/4] k3: fix weak IMAGE_BOOT_FILES assignment
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][scarthgap][PATCH v3 3/4] initramfs-module-netsetup: add recipe for DHCP before NFS root mount
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][scarthgap][PATCH v3 4/4] initramfs-module-netsetup: add j722s CPSW proxy-client kernel modules
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
scarthgap
=====================
Summary:
- Patch Series: [meta-ti][scarthgap][PATCH v3 0/4] Backport ti-core-initramfs to scarthgap for j722s NFS boot
- Submitter: From: Moteen Shah <m-shah@ti.com>
- Date: Date: Fri, 7 Aug 2026 13:08:33 +0530
- Num Patches: 4
- Mailing List (public inbox) Commit SHA: 302eea507c00c061dfcbf75fea1e6f4d22c77b5a

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: scarthgap-wip
- Commit Author: Denys Dmytriyenko (TI) <denys@konsulko.com>
- Commit Subject: meta-beagle: linux-bb.org: upgrade 6.12.43 -> 6.12.57
- Commit SHA: 7ff810824442c56ef59fa2d705d64a03ade5f5f7

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
scarthgap
=====================
PASS



=========================================================
  yocto-check-layers: FAIL
=========================================================
scarthgap - FAIL
=====================
ERROR: Nothing RPROVIDES '${VIRTUAL-RUNTIME_dev_manager}' (but <build-dir>/sources/meta-ti/meta-ti-bsp/recipes-ti/initramfs/packagegroup-ti-core-initramfs.bb RDEPENDS on or otherwise requires it)
ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.




