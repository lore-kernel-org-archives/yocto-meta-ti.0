Return-Path: <prc@list.ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE9FEC4452B
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 18:03:28 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29574.1784656998486466599
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 11:03:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=Z4Z8qsvs;
 dkim=pass header.i=@list.ti.com header.s=selector1 header.b=C0AeP9yn;
 spf=pass (domain: list.ti.com, ip: 148.163.150.75, mailfrom: prc@list.ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 66LH5sUH3627227;
	Tue, 21 Jul 2026 13:03:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=2yY3EgZ6fSFjlTFO8KZr6xa7gYbWts1x3USBLGXNO
	HQ=; b=Z4Z8qsvsnQV1BEprIPmLtggouFCFM4Eu2Gu3Hv/j2lD92u4g3LvnRoZjj
	0PaSdEpp8HvYUrHKNzag3eEtwsXozwmSSFGye9BRVVM8ooIsm9eh0SDLePW3BMwI
	08BqtgsbwBsJZ/aOmMlN2Ly+/ck+xvXnXVm0hzwyaLvyy1Zq40s8a+UwqS1T0WAt
	ZvETX/ahPvZTa/b/RYsP8vhf4f8yc+HJ1kxdqfavyn4cGopgaoDcL5KbcBHxPk6c
	YjU25SaKthoIvnPK4GrQ4flEVFAp0dxphGNfHrigNufkdUcEo23kNryUwz3XwVa/
	8GRnSkLSEJNVciLA6LZvYniRaq1vw==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013052.outbound.protection.outlook.com [40.93.196.52])
	by m0384305.ppops.net (PPS) with ESMTPS id 4fj869jc9f-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 13:03:13 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dqD2lz45pRvQ91fYDsQEkvYRbn2pXfQsLhkNUDsr3sYgGItES7sruruMQ0dlmQSCWPSRqf4WWiOIuOjZJ9/SgthMWlL8l54FxuuCvco1MkMsA56FMVGTzb73ea9yysoCYCD9rMzy6Q1Boq7g9W2p30QoXM25fWWvgWPRel6aeHa7YkfhKtQIN1GtvzD1oLh473hTUAxOnUviYNGOQzHSqmBEmnJV13NnpNOOKc63JuTFK9pSIiAOgqNHKIW+RG+16zzy7mLYVDvam5pePFRFQt4KyxOnS8ANneM7k3Med3ZM7Si8KtNda9BS7vSOf3jjlQ3wm/MxsAGhefNsfTeZww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2yY3EgZ6fSFjlTFO8KZr6xa7gYbWts1x3USBLGXNOHQ=;
 b=GDTGob2RuzMB+1uxaI+0d+bKHYsQw/R0unTygiyyuXIO8x6YApRwN01xn7WKVIP74VLCPIVem998Jmaf5zLij8xChV1C0iOJdXQnIJGagogFo76CEg14xlCAKrOQuvJ2h7ZwPaCfsqUz7jGMZTtZPrpKAVnvxHQAZnKygl04yLSkZs143g6Nq3WhEyYSk0Jwb5ova5APnRA58LSykTK3KusiXFq5TllFgIjIyc89XYAwsrRBp3SfdmHuldI/Z3PsewowqbnPEQfxLrsQi1RiNSxpOyJHAYFmdQI+WGcU0mvTsjcPn8PJ/KjkPMsb/rnZECoKgBdmrOdLK8xQv/eL7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org
 smtp.mailfrom=list.ti.com; dmarc=pass (p=quarantine sp=none pct=100)
 action=none header.from=list.ti.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=list.ti.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2yY3EgZ6fSFjlTFO8KZr6xa7gYbWts1x3USBLGXNOHQ=;
 b=C0AeP9ynsm8BvpMTuws45oQ19A4JE66p8XehHVBQ8pKbdLhZo6Q+q38PSljVjxpd3wYicSQlk74dZBwm4ltRpqUGPcI+Ye+k4OYKDrTmn1uFxgQWFOoPvuZU79boX1xxl4nc34blN7T4HrAKRgsGwF80NlHif/CkMLzfpgJlhvTm1bfMQJbdx/43IbrHie7kg2Mv5jtsJ+gcaYo/K+POF1ZNTVOGD22uxBiBkqnTawIU+LDRJPKvGUmHifeQKWAuDuhnCN5g1BoUmGYI6VL/4gBx9W9XJxbu8sgVnaflKVXxnjWkwTl5begOJryKGx23Mnr6vXA5xm+ev+pK8rh9BA==
Received: from MN2PR11CA0026.namprd11.prod.outlook.com (2603:10b6:208:23b::31)
 by DM3PR10MB7945.namprd10.prod.outlook.com (2603:10b6:0:47::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 18:03:07 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:23b:cafe::90) by MN2PR11CA0026.outlook.office365.com
 (2603:10b6:208:23b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 18:03:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=list.ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=list.ti.com;
Received-SPF: Pass (protection.outlook.com: domain of list.ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 18:03:06 +0000
Received: from DLEE209.ent.ti.com (157.170.170.98) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 13:03:06 -0500
Received: from DLEE202.ent.ti.com (157.170.170.77) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Jul
 2026 13:03:06 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 21 Jul 2026 13:03:06 -0500
Received: from fllvdckhpci031.itg.ti.com (fllvdckhpci031.itg.ti.com [10.64.72.41])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 66LI35PS1923683;
	Tue, 21 Jul 2026 13:03:05 -0500
Received: by fllvdckhpci031.itg.ti.com (Postfix, from userid 60899)
	id C09229ACF4; Tue, 21 Jul 2026 13:03:05 -0500 (CDT)
From: PRC Automation <prc@list.ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>,
        "Denys Dmytriyenko (TI)"
	<denys@konsulko.com>
Subject: Re: [master][PATCH 1/3] ti-cgt470: remove
Date: Tue, 21 Jul 2026 13:03:05 -0500
Message-ID: <20260721180305.3737666-1-prc@list.ti.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20260721174311.7581-1-denis@denix.org>
References: <20260721174311.7581-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|DM3PR10MB7945:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a1a451-1617-4eb6-1ab7-08dee7525139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|23010399003|36860700016|376014|1800799024|56012099006|10067099003|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	rFQbz1OFyOqxIo/fSk/Vfzu1sxzeUfUzL94Fwf+FKu6xbtK+JozSg0nRtyYZ025N8hS2OszX2AFqypOD27TJbUFmof/f/WMIKgmsTEUlWE8IgF+VxQY/EXT4kdWqMezLsrxQ+OmBrfVN7x0VrLDuuM6CkZVwV6nfCOrZaRS+WEFLaXDkwLY0dqtF48zBkCSDiSjErGa+YxZnzn1AY27+NcUUW/dMo+YJJe5opPjBYmZSD5deXenp3c4VDQeCaICvD7b7iJaFQXs7to/lup8MpJ4QyM8xn8Gtu/r3VmudKxllNNpgYBhnctlWx7NmLEvtTNXo4f2JQKi6U0tSnMuPoOoLudCV2IH5lEF7dKp8Z7f1nNqF+pu2x+qsDPo8DPpEvrPQtvE4VaFrS3sYeKzNqiNDQGOroL7+XUHsVljqXjHHas9vKjVDchMsqZu1I2Se0euPmiW8LQROSgUNR/01tKmH0i+8+EVJGAlUeUwb0hp/R11qZLuelakjUxXkJC5xEUUkw/dlGofSmGvs6oaaPl7IcJAyeZtHUqO2s8YU84lKw5WNcrNZiXlB88vzPyrVrTbd+xt7Yz9XuKF9uJxJ47gn5go6Q24CiJGYDw9O/gIwQp6V+qprIaskUFUOIpoJ4yRXYuFnXNcbaULn0l7hxUAMgIdkpCIoiEzxWvYMMIbsm4VWGZYNIiedR6efmtTtS+SLrAri4uBQIMpkBCP5TQ==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(36860700016)(376014)(1800799024)(56012099006)(10067099003)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	BH3ZaWjhp+r2U4ndVuWBiyqWKbV3ka14ZOw0+2IqJPDw3Yaw2dIQULDhqZ8oIEXtpogxYmxGME4ky6Nf6GAn+/143gYb1S2rmlYBxRHUa3sPGIP5eJ+qWHMMvuRuZfKD/WRNUTYNd1emMF+f6QL+ms+2s9VaE7aEG4E/Gew455qZ33WcJBS/waX1KqmtAVJQheU2lYN9gEcL/Db4Jy3YK3y2UZW4FxPwZrvW5pSSx9wx7zfUF3+AbmrCZb4D3Ar8yoSt84q6MeQZINtl16XNA0b0KsjXpWhui8NxBL9X6xoNMFADE6FAXwBUBzOPu3h/Rrzro3R+3NtkN43/KtPocZGCgmkoXkjk80DKrzC2GVXIxOB3j2oJWcgpeSGMN66CLlInQ07J+KprAMrAAVqD9dfsQzE+6r4LHhz3/Y8QJYUHQrF36PjTh+zgMs+mO1rK
X-Exchange-RoutingPolicyChecked: 
	bYU0Kvy2Z3AsSOR6QjBVH0j6SrJa0t91xm6SYMvr+CriIkoXFw3VP+3HWiNI4WAHRK+RyQ8KJ3jaDcLLa9rFizFb6CFs5H6kq2QDoyKh2WdAVt1/gi9H/RcjGU4PueskwVxhRgWEHGC4SCyL4oPrBHkJfzpLRUxTdHq8JlF1P9YztwUWcEYB5n8MjnM0grHJQZAi+OsgW/6SggHsyIgENyZtv4cySC3ZBWS5mRVgmd8CUNUz6L2Xa4o6wHJjZ6lc2ZLkuQV2Uf8gDQBwOqnX/zHBiyhskt87Z3Od1EdrU1fCKsSMpa8zKRmaN0MI1aBlwp1C9AKfKNLADvkDo93K5w==
X-OriginatorOrg: list.ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 18:03:06.8009
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a1a451-1617-4eb6-1ab7-08dee7525139
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR10MB7945
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE4OSBTYWx0ZWRfXzmmpekfU9FGz
 wLUnmtzGIae7qfE5WMXzKgvWzA4nWDk12tK2sUu1T1XCaYkoUDME4q8usV+0TbAlmi8tLHHN3qz
 BquFQ4lpv7nzi9zt4IlaARjXkIyK3RmxDjwC2LgBCryi2UqSVF+ODUXgp3Pfb+XZOhC4Aj+Ib01
 Te6Dy9KBDVGRNy1CRhDLY6/T4dq1UeZZqdaD7I6lxpRO0euzCa060yooXkouXyiLE2jY8TTIobP
 +RR0EPm+GUnBmKYIlioSqb5zw5lPDN0SFTFL/O4DKTLagYLbVanRyFEsnnKSnDi3rfamhhJ0QEP
 SZU/wmaTyrw5hrIwf/IMPGQiQ02udoswA+rlck3DggnEPjdhGF465U3pzkSmKtKfLcbMo56stm5
 dORM90P7xHEZLUECqgNwWUzTfeLy7aqb5HOwuaI2cSK/MzEJpQ17nHi9h7PF1Iud6QmTiCbk54N
 GYC03xMbrQ2OvHL8XEA==
X-Authority-Analysis: v=2.4 cv=WbI8rUhX c=1 sm=1 tr=0 ts=6a5fb461 cx=c_pps
 a=6cA/pxPA0XCUgbB+gUSklg==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10
 a=Vs-ZokuVWRQA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=iGHA9ds3AAAA:8 a=0gcC27t9AAAA:8 a=k-42gJp3AAAA:8
 a=sozttTNsAAAA:8 a=T1YAac3xbblVUUBQCcgA:9 a=nM-MV4yxpKKO9kiQg6Ot:22
 a=f5sM90hAhNS9OGT-JDKn:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-ORIG-GUID: xsp3jY4xwDLB3J-L4yABVg0MPlVAV-H9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE4OSBTYWx0ZWRfX4jEBcu3MFbKk
 CEjQBbly6ZD4re6EmHaFkEXuCvgXHKSEDUHOqMlsrOtnJjHcERRpNXGkj8Ztxy8/sieIYitOBkm
 4GmL/YwPdzRVTQ4I0Wl+c2yOG/dptk8=
X-Proofpoint-GUID: xsp3jY4xwDLB3J-L4yABVg0MPlVAV-H9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210189
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 21 Jul 2026 18:03:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20176

meta-ti / na / 20260721174311.7581-1-denis

PRC Results: PASS

=========================================================
  check-yocto-patches: PASS
=========================================================
Patches
----------------------------------------
WARN - [master][PATCH 1/3] ti-cgt470: remove
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [master][PATCH 2/3] ti-cgt6x-7: remove
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
WARN - [master][PATCH 3/3] layer.conf: remove remnant METATIBASE
    WARN: Missing Signed-off-by by sender in commit message. (SIGNED-OFF-BY-2)
        patch
    
    For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887



=========================================================
  apply-yocto-patch: PASS
=========================================================
master
=====================
Summary:
- Patch Series: [master][PATCH 1/3] ti-cgt470: remove
- Submitter: From: Denys Dmytriyenko <denis@denix.org>
From: "Denys Dmytriyenko (TI)" <denys@konsulko.com>
- Date: Date: Tue, 21 Jul 2026 13:43:09 -0400
- Num Patches: 3
- Mailing List (public inbox) Commit SHA: d0bef1d1f1ffcb6e0a744d75632038edf91ae199

Applied to:
- Repository: lcpd-prc-meta-ti
- Base Branch: master-wip
- Commit Author: Brandon Brnich <b-brnich@ti.com>
- Commit Subject: ti-bsp: ti-img-encode-decode: Update SRCREV
- Commit SHA: 5cd27a07e2b4c4480ac75479965df7448e6eb1ba

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




