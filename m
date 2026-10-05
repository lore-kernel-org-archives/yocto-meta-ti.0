Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8725ECA5FF0
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 12:16:29 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18592.1791202587776204210
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 05 Oct 2026 05:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=QmHykJNO;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=WvU4uvUB;
 spf=pass (domain: list.ti.com, ip: 148.163.154.28, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695BSujY4034266;
	Mon, 5 Oct 2026 07:16:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=0kmR/tWBuYwZEbUY0bdww57llDhNn+S6zPT3IKTjm
	Rg=; b=QmHykJNOX+4rf8IadwufdunUwW4soEDOG+9TtuTWD1NIdxlM03t2/MMSS
	IQg7H3/yRSH5o+W844IBHd0LKsTpz85iB8So0RjuTNjr0rtVtajolgZAB/kd6n2S
	wYOcSSXmXInPhW130JUN3WS6iRCrchlQ8XCRAVsSqY/eRyvwv1cfaOUXLz0RslUG
	XJ0e1lZzLODpylByirgjtc0YpyFhJ0PAIRbhK14jo64kUnKNOi+IqrcedBRRdJim
	+TgsTO7u1zIvBhauxtUog0zN6xq6RE1W4f+9gebvq5o5Gx15amA9x0QqP3IpLdh+
	90JwV5ucRDicqCUrAFoG7fRlG8zBw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012053.outbound.protection.outlook.com [40.107.200.53])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4h3h335603-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 05 Oct 2026 07:16:25 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d0WOLWHCu+eEJ/t6P/IokKuqOGjZwsiwFZM+ciTzrh4laQnoxbac/byZR5kELCEW7MnBhzstqj468k6sciVdQ6k+qT3rE/ToN6MxIgHvrgIV+1TKpa78+fjFhgYe1cmrBAYzbezK0h/9KoKXOEWWyxzb4ve//mfxvlziuDT2jvhvsHEoovoPo1pz/utGzUIh3+Ioag7YMS8p2jGqtud9wlkHmyBFQVnhuUnLJEtvki8f38Qxnm1fFQ3XEU5NopZ0qcDkvCH0uSJ97W51KomrDxib13nt1i+BB4Aq7K1EKsCnPcoSHS83hi+A+bAWDfqG5rckr0j3PcKqZJ2MFhs9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0kmR/tWBuYwZEbUY0bdww57llDhNn+S6zPT3IKTjmRg=;
 b=PaIRnX1yWRY9lxEpzLHHmShOfb/vO8hKUYfkRW4ycZC7/MarhoNvDhuaO3vmhDHBwqB6k/FzLlozfGO8vYjkQGAQZzACqLF3a9E3z6c/VDVlle5QF4P57UO7LlyX7LsHKSg6SrSSpZ3L7+O660VBdBbXtjbmFazA/IXXBj/BxZsW1JYvGp4IN5kOW9vCNd6tWSAbUa2pwMIzplOlVvPIJNT/JJmrQ8p8p0zcer6QsB5qguGlfT8Z3kwWK/UPsmH0TOa+cpdsnrKv5BSwQeC4EYFclCyJafClZ4wClSgY3GoxzlKiKyZtwHX67SDTvgQaORsgH5EI3DF6j+E6LfXB3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0kmR/tWBuYwZEbUY0bdww57llDhNn+S6zPT3IKTjmRg=;
 b=WvU4uvUBpOVJS0ujCvqoBoDemrSVtj6A787WrEa2Xq2q1C6ZusL779BsiGi7yXa1+yfVLywI6Qo175ljE1f9w6TI5IeP9xdBFVGl/2MpxrPEy5xOE5GPjTrmg5iLxdfXpTFuV5bEk2sOaHJ8LTSm6JM3vzoaDozXcShpanyq8R4fY49KS+W3RkiPct5MYeJRgeL/6HVqlRrTpafu7ru7Z3EajBpNIIZTsygeMcVUsXaPS/VIaCVsOwnzlvB9GZEsQAEKCIFPgg0zUeobJvfv2NpQxXtWeaSYftS77qiLXtjcBJLgWQJ0apFwoHHgNoUtV8IMqBVAxrz0H1eyOOjZGA==
Received: from CH0P221CA0019.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11c::8)
 by MW6PR10MB7686.namprd10.prod.outlook.com (2603:10b6:303:24a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.14; Mon, 5 Oct
 2026 12:16:17 +0000
Received: from DM2PEPF00003FC6.namprd04.prod.outlook.com
 (2603:10b6:610:11c:cafe::85) by CH0P221CA0019.outlook.office365.com
 (2603:10b6:610:11c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Mon, 5
 Oct 2026 12:16:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 DM2PEPF00003FC6.mail.protection.outlook.com (10.167.23.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 5 Oct 2026 12:16:17 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:15:57 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 5 Oct
 2026 07:15:56 -0500
Received: from fllvem-mr07.itg.ti.com (10.64.41.89) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Mon, 5 Oct 2026 07:15:56 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by fllvem-mr07.itg.ti.com (8.18.1/8.18.1) with ESMTP id 695CFuwc299061;
	Mon, 5 Oct 2026 07:15:56 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id 075AD9A9C2; Mon,  5 Oct 2026 07:15:56 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Atharv Dubey <a-dubey@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>,
        <a-limaye@ti.com>, <u-kumar1@ti.com>, <m-chawdhry@ti.com>
Subject: Re: [meta-ti][master][PATCH v5 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
Date: Mon, 5 Oct 2026 07:15:56 -0500
Message-ID: <20261005121556.2470076-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20261005121218.844998-1-a-dubey@ti.com>
References: <20261005121218.844998-1-a-dubey@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC6:EE_|MW6PR10MB7686:EE_
X-MS-Office365-Filtering-Correlation-Id: bcf74872-8460-4a77-2ff3-08df22da7534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|56012099006|10067099003|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	rBi6KVDWcgLR7eyCqu2V06aeXXSetrwkeY/lJITCRtYIzT9obddQHSoyUlwUELpwzm+gj7TqXjAJUAMSVUp+98/vkgkXokqEKcflC463DvIkuUxNId8ZeqjKOVAaMf8WqzP1YmeuG4FzrXqqHV3vtgbazmRf1iRqz6WZ0Kf9t2CJ8sg8WiUhRPGiYEPz0HVhFa4Ez+c9Y9WfWKMou/UALiFPWxDpVnkN/kSNdmqys8CE01Dtlw2FckDygVmj3X2wC1GYBNE3mLTanI6O7qqnyBW1tS85p3lasRXaSqd2NHNdBlyNKUKUpMFg0zySKGpjW7LIPSQ1MsZ9fJfT4li/uK245UFpGZkhHjbclnmGmH6gC/xbtT7W84sJTWbkSrWk9JcVTV7+PJZrnlebxtclvbqOlgvEfDq2N1BV5FDNd5V9PAWH6VlCyxKQAXqPBDM/fPni/w/fQV4klSPeFm61UxjmLxL6cC8PJCi5DXNeaBb2IUjHH5gl7VAPVfaKIJmgOHAawIVBFaCV5lh8MYMj3AplHaAFWJae9PsqWBe2YgQQfy6qjm5n+BtgVs8w1CI4tBQejSsGzw5WnWPrAYLF5kez/0j9uBjqRG2wXoPgsRZye/caZyEWAwkNjifdWslLnLMuu8bgJzHV27MMG4+HWQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(56012099006)(10067099003)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	0X+cCWkMHf/79fsCSEn7+ycCbEOoMVH3CyCHA8z0+glrpK42qd6l7yYZxcAHV05+RBmMkzM7MuK72yZPRVZIPs+rPacSY3dQkUCVko5Q+INoa20ybk2TUtgUOP4h/WKR1uh4jdjepU5H4hBl2FPMihjq9m2dUQdIPEFpGrbck/fsgR+H0jPuQLn0lzvWkKWqzyESSH/RghkuGDeha5fVjBZkKTwbHGArTXOKPFn95RPmk2jChcu9K4JzbL92v7lETyaGghPsdW2GdtfZio0h1CF6gewVucxVE84cto7jOyr46GyfOnWRY9ek+7y3VdgA4QOu98qfyFDmM+Gp0dgDHricqrKZiSi0x4+LDPLPhRN1ZC7sR/6nh8+oF6ZFM2tmjX/mJD9DdPToKjrvI+w7O4O7biag8RG015aekeFDCz3VQAL+zklLswE+HKc2IhAT
X-Exchange-RoutingPolicyChecked: 
	ELb3/x7DMSmC26XG0GcMrNjTjukv3ayTLw3zOZqQoj1jZz7T9vH3TMlGyzu8Gx9Rh/i1j/NdTk9R4GwbqcA1VGDROSosIwbEp90t6xekUZo0jXXZcmoWUZEvMGTH9X9vRQMLLt1tC0pAWf3ibO0Jiq4CSadOKYxo9N1MgXV4ljJhqhzP/lYp59HL5DC6C7TzuTBRNEX36V6jMw4YIYoTuTXvpiAkp0pGJvPaOo3hP7mzOCz6Owyh6CDouubzFoLahC/q9W29NrEgHyF2N+DEkphj2Vjn66pitqkg/QKUr7sNyRBCN3nZdVC5P9eqTVUH/A5xYiduPnipTxwrIbA0Gg==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 12:16:17.3506
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcf74872-8460-4a77-2ff3-08df22da7534
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7686
X-Proofpoint-ORIG-GUID: fs-pEzZSsrCsFnoFFUOauSbLYRg44ro9
X-Proofpoint-GUID: fs-pEzZSsrCsFnoFFUOauSbLYRg44ro9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0NyBTYWx0ZWRfXzXaNeyLDGxUT
 YLptHeaB3nUQiPufIPzfWd6cYh5LXSb5tHzBUSqrUHlECS3M8SXSeC+/YBBMfphW5Ys0ubVQpwz
 b+2qN8jj8gMcagS6YlCRPRAbmVo89XY=
X-Authority-Analysis: v=2.4 cv=QJX91QLL c=1 sm=1 tr=0 ts=6ac39519 cx=c_pps
 a=EGpQrqTzv4Kwq1gVXkqNKQ==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=fPAWb5peG099m5CrUpKH:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=0Qj9ofRoX9efyBQDLVAA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0NyBTYWx0ZWRfX1T/tunVbXImi
 a0vTkYXHo7j+ugLagKgHLAA02ZfJQ+btJzOuxGx0sPLGk2In23PCCEBCrVlbNH8tCyN1+axp7yn
 EmCZc2gmKtQ1WcZ43lH55CiDoYzP6NkFf0J97GPvqAxBk7W0cZoS7/+emyLJAyJyR4Mhw0Czht2
 vhCAWfS/D6LoOPZkrdr51eVL1AORaQdhRucufH3ywApG6R5y3vzKnT9RLASQbxX/cwsIjA+0E7o
 g0SZu7YHpxlikzBVY7rDBZMJYJ7ixh6d3cwgQls84De44Ixlo5rcm1dt+NCIsv5ZUC1/OlvvPKu
 AFzBURg6pQSErhAJZ+6z3yL3BkzNHpMXV8g3MtwUv21t71nHrnfKvgLmV8LXWQKYnahMEWdq3YB
 BB3ppWz6jcYy7Rb525r6ftLYAZeHTlcWq/BiG1viaLS90kGU+xQbpLJFng2X8pjPVUGI30SU2MT
 OLO+9DZ9BTqp068EXWg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050047
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 05 Oct 2026 12:16:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20435

meta-ti / na / 20261005121218.844998-1-a-dubey

PRC Results: FAIL

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH v5 2/3] linux-ti-staging: Add dm-verity kernel config
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [meta-ti][master][PATCH v5 3/3] ti-core-initramfs: Extend with dm-verity support
    WARN: Revised patch missing a comment. (REVISION-1)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: FAIL
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH v5 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
- Submitter: From: Atharv Dubey <a-dubey@ti.com>
- Date: Date: Mon, 5 Oct 2026 17:42:16 +0530
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: 6bfeb0fa5fcac6b3358c309aea755c4242d896df

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202609251030
- Commit SHA: 9a970370942d7ff753a64b31bc367e1e27aa3048

Patches
----------------------------------------
FAIL - [meta-ti][master][PATCH v5 1/3] dm-verity-upstream: Add dynamic layer for meta-security dm-verity
    error: patch failed: meta-ti-bsp/conf/layer.conf:20
    error: meta-ti-bsp/conf/layer.conf: patch does not apply
    Applying: dm-verity-upstream: Add dynamic layer for meta-security dm-verity
    Patch failed at 0001 dm-verity-upstream: Add dynamic layer for meta-security dm-verity




