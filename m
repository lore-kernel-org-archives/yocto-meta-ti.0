Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612F3C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 16:18:48 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20336.1785860321916453268
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Aug 2026 09:18:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Rc+G1Fmc;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=kI53vkJJ;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 674FeqGG4038274;
	Tue, 4 Aug 2026 11:18:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Yw4B4j4smDKDPZ5hSTYVx9tZl6BHyQ/KPrNZ53WUV
	1E=; b=Rc+G1FmcaJ2TT7pk9rQ8ifZGwPwGyH9cDt7KWeHowK73eT6+G5t5KvkiQ
	9FuNp1XreTAtwpI1wl8T2taSsqxQkpBzEYRzoH5dF3LjcUvqWSYuCDa8mmsm7+NY
	eUQF7RlCCQ9eI9WhhTGz3y7thjg8BLTlAw6nqj0/GFPAJ+fIFMLUEjqH/1VhDzVL
	C0o/uFIBbXaQpuJgoeLaHtD6pH2b9e3PJ9ZLz9y7/tGrKYmW3UBpjSw1AQ8oTsvC
	Id/Qq23yUHvd+AVcRshs5vtjKSXgW7HtGVq8oEN5ufDgEzBd45uMrAKdlPtD8R4a
	4VTP60GhAkiuLKL62cRx8Q9DkTn4Q==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013045.outbound.protection.outlook.com [40.93.196.45])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fubus3exx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 04 Aug 2026 11:18:40 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OhfNauSCGFon2IeyE1JwSnpCf25qox06uvW/L45VbWUYmRwUQYCoQNBay3mp9FyDfUjbAHTgYpxwMdLQ1zyeutB02HNjJKo9ILiqHJyLJslhq9UVywuqZ8yZMpgYV2SBrl7Ab6D6kFOa8TJhQJIqIs6RjAmo6uA/fLMg6vSoqRFFXNNW/PxakXh22J0FtSFLzvgHXuic5HgDMm53cZARvARpOIy5g6nN31V4CKtIX78u17i9nPOkXUoqi+4O45Xo9Jsav9QIkEHXLzqBDBeZz1tf2dM4vHfWXhWvL4qD8GmXgGwuzplsa4GF5W8xhEC72f1tEtErtqOUCKe5wQRzpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yw4B4j4smDKDPZ5hSTYVx9tZl6BHyQ/KPrNZ53WUV1E=;
 b=U3uouk/kFo0E6s+zuT5wYNZeOo1Tmp7Nk1RA+QTjvuQjYbFMC82o2BkD8LYFuyovhNt/MJm8xVyZLbZW550DZVk45fJ5DCKN9R8zoz+I6HfV6VGppac922y+r1yWHDEYxN5htZkYn1ukdN6p9uTz4CqaQRXLsCNv4WwyOvGvqNlhjMfzDQDHtZt6IECQp+20Rj7d4yZNsLTHBdfNPrNzEl21MaWMd644dCeZmPpszcYr8mETm7YaruC+f4ioQH8SCKL5Wve6UkW5SOGQ+PUx4lbNpJJpD/IdyhEq0DnNzfZeAT4yUfWS5xP+dBjTuGMzSJ8o2Pr3wodbYTLNWQeizg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yw4B4j4smDKDPZ5hSTYVx9tZl6BHyQ/KPrNZ53WUV1E=;
 b=kI53vkJJ7BEzEF6wvaXLjyMrvtMDb/SYlMCR23EoIX2oXoJ2OdK3RkCaZeiqUGtr7oM1qQa/8OtlT8gDTboIzJ8SmJ1R1BQWLMZlwlYnGtGEDiU+npCautTsu3C5aqWX512FKKlId07c6baqZpO2/+/8mT7JAtUWkwQjKm66iILRAUS+y9T+9fW8fwmjlnYedq8NtzCRBYvXkIuLyxsWpuc5KtUhKoP67U3OJsmNMwJurOlPHEqHi0IqGxDn2Fv07T67Gl+XMWhzUcLHymWxKrGTkHA10V+W635LwrC9CKtI6tueSO6sJAHgxqnDlI3z6f6e8BKSz9Gxy0iiep7Eig==
Received: from MW4PR02CA0013.namprd02.prod.outlook.com (2603:10b6:303:16d::13)
 by PH3PPFB6E8A1B1E.namprd10.prod.outlook.com (2603:10b6:518:1::7c2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 16:18:37 +0000
Received: from SJ5PEPF000001D1.namprd05.prod.outlook.com
 (2603:10b6:303:16d:cafe::12) by MW4PR02CA0013.outlook.office365.com
 (2603:10b6:303:16d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.15 via Frontend Transport; Tue, 4
 Aug 2026 16:18:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 SJ5PEPF000001D1.mail.protection.outlook.com (10.167.242.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Tue, 4 Aug 2026 16:18:37 +0000
Received: from DLEE210.ent.ti.com (157.170.170.112) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 11:18:36 -0500
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 4 Aug
 2026 11:18:36 -0500
Received: from fllvem-mr08.itg.ti.com (10.64.41.88) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 4 Aug 2026 11:18:36 -0500
Received: from fllvdckhpci021.itg.ti.com (fllvdckhpci021.itg.ti.com [10.64.72.33])
	by fllvem-mr08.itg.ti.com (8.18.1/8.18.1) with ESMTP id 674GIa801962934;
	Tue, 4 Aug 2026 11:18:36 -0500
Received: by fllvdckhpci021.itg.ti.com (Postfix, from userid 60899)
	id E6C672C86; Tue,  4 Aug 2026 11:18:35 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Ryan Eatmon <reatmon@ti.com>
CC: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][master][PATCH] meta-ti-test: Add commercial_mpv license to LICENSE_FLAGS_ACCEPTED
Date: Tue, 4 Aug 2026 11:18:35 -0500
Message-ID: <20260804161835.1153919-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260804154012.2309012-1-reatmon@ti.com>
References: <20260804154012.2309012-1-reatmon@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D1:EE_|PH3PPFB6E8A1B1E:EE_
X-MS-Office365-Filtering-Correlation-Id: 67c98b56-d1ca-48c3-3c04-08def24409f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|13003099007|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	LUm38J4Dj2TWcmFaWzVVdbH3WHSyW+SWhJzFqqHV6Wil/h8ZUgRhrnwLXbHe1SJfBaQ84boZpwC6AvUi3rlFhW5oSpzwooVW1mFLmgkx4rwd6Pyn/ev7odWQNWK6n8MxR6tx3YlBxVHlS2aTrd1iB5z3uB7otwQJM89TxzDb6vcocInnUwCjJDdGkagqdkysggG32GPVxmUvhBjd0FIeW5PRtkoHsVXEYDO1G65d7PrprDSwJ60Vy5KeFqsa4rLN79twqnh9mOsom9duiuZd+ME25KN9Lj5MvsG9BsXwfvlwiqseiBA4y0+3NpWfTBuqYx4vqNTcvIyT9vZu+MSDDlRMkNGU89B77eDX7IrCXqU60PkHuf7lXNYqmKh1tnykLKjmxwWOZQqfE5YqJLgt/tZxV001mrAe3si2cPJkF+g26AtU33B5tOck2IB2FtOOUDBGqKxGaKlDrW9JYf0JiXkI3vEXKMq/vkrbs2gzmjDLDysUG+JGroi9k3IGdle37fNgJUGtNBazIik9WrZH6H85VXoFhXORT4MKbx8fVQ9Wwc5GBa0jqgYkld8Iyjpyvo402f2gZ9qCFblKzn3ovXLuYPjNDL6/2RyEZNvgvVzsXm+HegY77POwMlyyq8bocBJTmZbNf8YC6UiqFe0L6aby65v0Vdq7RNmD9wJu6DYXv4WDw7Tn5lSpbSCEAx7X+6k3BNGXEBxrjwoFzxG7Eg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(13003099007)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4pglcT6HPciPiXQjwcjvpRsv8sahOJctasa0/0wTj2GyfzUB1ioXQtjYIVmdO+svzKY5w0TtHH/0fXQbSuTrDNPVsTTihLSTuAIK6lEk3Z/Ur5hAE528p1+J0Q9vqAC2ZJHNY0qAvt4cIAE9VpxkNTgZIas226RtYVOvhtJIHbVNVVxTZSTfncNlIJMELfZaPdB03UUlNueIKWgnQxpgw+66gcDJFTyr7opTUj6EM5/iavEjlP/uLy/FfoFSmr29fxmj3HMYnbGkdvSM7QEgrgWzlxV6JbNwpUAFfkHMGInM7y8YressHVwJvpJt7gDQtvPLzlYD+psz8OupIR2cqunOCcTXm/JJQHVJiFsajb+azxj0wqrnWqw4fU+cVw/36gfGPLB+dtJ21h5w3sDvhQT1BwP+akqg+J+RO4Cimxge00BD7QpRXU+Ar1NKXYhs
X-Exchange-RoutingPolicyChecked: 
	BQ1U4go/DHeTK9blZrUCKLZrT6prG8vdBAKL8NAQWa6ZFvG8huN+yGlPZ/AYAZRppzPBlIZ1wr4MKbJJzh8U7/vYp1I6K0Efk2N698Q1p4as3KElaT5A8d84r0CJlK4DqhyfnsOq+jA2s3If93VB6AraFFNl9BQJCRlkOfpu6hPNm1/6W8cB4pYWwYA01svjIzuHHIZAIql7PKgh7Sojd6WAmhlXKvKdM1OOatSjv+qaBAaRmLpNsSd0jWER+MeiM1Nxq/aU1YKA2BSWcEkMKYvfZqjdiJQzx/VTvOr9JE5z8wUH/pfm4zyWHhJ1TRp/POKPEQapLBNCzsbHR8Blgw==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 16:18:37.0545
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67c98b56-d1ca-48c3-3c04-08def24409f4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001D1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFB6E8A1B1E
X-Authority-Analysis: v=2.4 cv=RaagzVtv c=1 sm=1 tr=0 ts=6a7210e0 cx=c_pps
 a=9wPeeuiWglyMylSd9qupQA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Sv0fKeRqtYgA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=6_VurOt8tbnhcGbomW8A:9 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: VjnjVLQ4H4G1NAgXWu-BshH6J7aSueyt
X-Proofpoint-GUID: VjnjVLQ4H4G1NAgXWu-BshH6J7aSueyt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEzMCBTYWx0ZWRfX9OfBKx75AV+L
 uP9VETZWtijNNllaObLFlIAT21RRB5Adh18VLOmDWI6QIFvd5VbOh0nZ1UmWssLrtYXJirJu9IP
 uflMLHgGvZTWKcw2mX3cJBaB8WnsizPxyH9oa0eVMK907QSypsT8sFAuQDtufnvqlQPCNILnUNU
 SIo6BkFznTRnRr3cagcMOeuymRHwJrAnV1+1/p3iVE77iChLoRNuAFHLb55G31bgqE4Y0GZ/5SB
 DS6GpCU4o7dM0hYcu3BMksDcsJVh30npllVBQcTvwSIlQ51Wywa6YOA2sIzimL7teJGA4KD/8N4
 zwkWjH9q8Ub7kqgo7nuQPBsEctjaS77n/Gog4Y5RWPw2k1giyXrURcDowpm44rYbjKuqbKFxgfX
 TbTNurbV/4iW8XyCqloPrx/isZIjrvdbvCz+49H5R6tSbX7k7N61O76CU4OvTC3hbsgOWIdCcDe
 ymfbSiuC1sglE4mF5zA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEzMCBTYWx0ZWRfX4iL7tNasbkOa
 34rzZ5dWlgate1xLO5gNCecqwMfPO0icGsKPdv0uh0Yp6SkNy0oyfw3RgurzY/yRDmnSA6B0M42
 gr19IjkBa8eay+UXp7oyoGWrQmny1oU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040130
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 04 Aug 2026 16:18:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20216

meta-ti / na / 20260804154012.2309012-1-reatmon

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [meta-ti][master][PATCH] meta-ti-test: Add commercial_mpv license to LICENSE_FLAGS_ACCEPTED
    WARN: Commit message does not include file/recipe name: meta-ti-test: Add commercial_mpv license to LICENSE_FLAGS_ACCEPTED. (COMMIT-MESSAGE-2)
        patch
    
    WARN: Commit message should not include directory path to recipe: meta-ti-test: Add commercial_mpv license to LICENSE_FLAGS_ACCEPTED.
              meta-ti-test (COMMIT-MESSAGE-3)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [meta-ti][master][PATCH] meta-ti-test: Add commercial_mpv license to LICENSE_FLAGS_ACCEPTED
- Submitter: From: Ryan Eatmon <reatmon@ti.com>
- Date: Date: Tue, 4 Aug 2026 10:40:12 -0500
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 98f898d4a992d5fbd5b77923d17d744bc382ecf1

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Ryan Eatmon <reatmon@ti.com>
- Commit Subject: meta-ti-test: Add commercial_mpv license to LICENSE_FLAGS_ACCEPTED
- Commit SHA: 7ba80e354fcafc1b351c5eea01d7aa0a0374fe13

Patches
----------------------------------------
All patches applied



=========================================================
  check-yocto-repo: PASS
=========================================================
master
=====================
PASS



=========================================================
  yocto-check-layers: PASS
=========================================================
master - PASS
=====================
All checks passed




