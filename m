Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E22B2CDB47F
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 18:56:52 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14874.1782327409150960308
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Jun 2026 11:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=proofpoint-05-2026 header.b=fXqoaDU0;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=N+Pe5fqz;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 65OF2icE483780;
	Wed, 24 Jun 2026 13:56:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=Byq3c5RWlEyb0ONWkt0bKSfSic9CDeAm6L/pRZo1F
	7Q=; b=fXqoaDU05gL/Y7MEnzuDGtbQpN9w2yzT1O6RRb9zlS5qyjUZi4dTo0Rqr
	sFxRkHA4OyVgdjdsErvgWv0Kqsr7FsRUmk48XXZTGDfZUuguYbgFhMFVIUnTHgcM
	KSL5dcNgK3krlGNIMrFg6w+Lo4zBlN8yhFCj9MBjukMYNs/h0hjedYtquxsgouET
	eBHc3Cl0KVnZ3nrYxjq6pkLWGquyTK5cUOv/6k7iCP0juDuV4Q2Mjd0beSBgIkYh
	Br51fzH4l3JeCABu1TuW645XXQviCmK1+RaBIZ40mo8Ys4MPPI/myi0/56uANAex
	OYfeaifiGyL+syVpgPoEeYIhkQ8xQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
	by m0380145.ppops.net (PPS) with ESMTPS id 4f0e5yb0e5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 24 Jun 2026 13:56:47 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=veOL12hF6zmgzLBpul46I36QXmf/99oQLzuRB5KO6c60F6eT4RCgMkQuMTZgj3ik3sQ7xK/VUq9rc0sLTabxGnzVuh/PuFB+KNJzV/vUjQC1jXo8CsOqWo6oRyoSxx9fxJ1HYBY19d5fGOhU2dr8qk3MsGvyBjhOkV5A/Lsj4+FbApQjv7OL5E4NOZXB38qZBQ34xmSNnnnwucBLEfatrjOUbSawqjwvmvqunbj5yeaIBBBiy9JgfGOMT/HgPDhKa/x81iKQsfjaAxLhaeY2TIjOlWJqt7tYo9mX7bCgZKNUInYpMwDQeUFOFZ0XTxCXJo6IzugklnB/8WW8qv9nXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Byq3c5RWlEyb0ONWkt0bKSfSic9CDeAm6L/pRZo1F7Q=;
 b=mgctuTsAp5o9y3THVrrsQ7vJwh4essWoUbr7JJfDCpfnypLgmTFWUqEU//EXqJLBE1afOetWuPCfMy3gVRMa5lOW0W5fJPxBXwG+xuUKqIRPE1Rh2/NlW84PhEEE/jxI8eiBOyippwNH56x7zbizr5y4PLvcz/MsZnRU+kCMA3ktxMEAjvBOI+JezvDf4mJk3D62PQ1FVGsCeiOiYnR0+55cQiuMENDrhg12y/eYppbS004RExtaPM8eNiPA6MHh9xsPPQ/gvLURZHaRicl+3E0IT3VkscPH0SU6IJVB4ot9zgpXGLqdPSDlz84weWxufR5BizYRUnd0qNZ3BVnvIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Byq3c5RWlEyb0ONWkt0bKSfSic9CDeAm6L/pRZo1F7Q=;
 b=N+Pe5fqzf5ZhM+NufnXK4owue/fOYgfJfEMS5JhdyzdWcq+KdCvPygCm4Ew1tJ7uF0t0TVjceRI/aBGcmM7CHAJcthD0e3LiYAgFfnqXNY/LGmhecDwPjOF6B5g4kdb8wlu/wAnFNJYlMQt2q5BYSNz/2Ah+ah2WIZ2vcaqG+2U=
Received: from CYXPR03CA0038.namprd03.prod.outlook.com (2603:10b6:930:d2::23)
 by PH0PR10MB7008.namprd10.prod.outlook.com (2603:10b6:510:287::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Wed, 24 Jun
 2026 18:56:39 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:930:d2:cafe::43) by CYXPR03CA0038.outlook.office365.com
 (2603:10b6:930:d2::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.15 via Frontend Transport; Wed,
 24 Jun 2026 18:56:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Wed, 24 Jun 2026 18:56:37 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 13:56:37 -0500
Received: from DLEE211.ent.ti.com (157.170.170.113) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Wed, 24 Jun
 2026 13:56:37 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Wed, 24 Jun 2026 13:56:37 -0500
Received: from [10.249.65.70] ([10.249.65.70])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65OIua4Y1633805;
	Wed, 24 Jun 2026 13:56:37 -0500
Message-ID: <d495fb5f-0cd5-4830-b79b-1d74f68a4b0b@ti.com>
Date: Wed, 24 Jun 2026 13:56:36 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH 1/3] ti-librpmsg-dma: Move this
 recipe to its own directory
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denys@konsulko.com>, <meta-ti@lists.yoctoproject.org>
References: <20260624183253.1130737-1-afd@ti.com>
 <20260624183549.1360252-1-prc@list.ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20260624183549.1360252-1-prc@list.ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|PH0PR10MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e23bc2-338f-4cf3-1638-08ded22251e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|22082099003|18002099003|3023799007|4143699003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	1DEztlh7zBdRJlb1ATL9kCt1u3yVQHJ13poVVfG6+y5olFK9wplAamFIxLemeFxGv7Ls1SO/iLZyemKwxajGExgknRb+bHRq0SaPUwMnyX86WXGGH0ITFY8mEz79+ta8O05F+gtDyXDFYs1SCOzaq7j94sYSY01uZXKQPhaQPNG0WJbqYqecWGxJf++vRQEVv8/3ANnu6FytSH0MsKliq7jLia2YBqZU4Dx5MEFEcoYwEAqFnlOM+T1ZBpQ7qcUkDBoypiWgqG6BcNvXx9sy/iIBgOryhX6QD5jhrPxch2FKEcnqqyd0fiaC8uHoVQ/nIB9CRX7vQrJ5p5BP6l9mvksiHDgiNdp2V9lyq4amErAO8F7jkVPCfcrC9/fcK8yjN3Y44/4rcDFLRTn270aSVMlIzPBCVZG9hxGMH421otDMS2+7j0Dg0ta9nKh2orOhbmLfRExxL5GSARx3daabgY5FpV56pi4ua1XRWFgj+krjS5wuiUErdp5KIbiuf5bbuZ/r3d3dVC1j0EgEd0G2aBjt8F1wv6f6Gf2fzeOZYLcTRXLYDtSblmT1d93AefYCF+0sE54PRZqq7fdoXziO0+hPMNr0R3O3Lg0aTJpQjHZFatXpiZy6Qm9AKot/aGPKrsOQluVevBMx8VXhClMTbMv5vLkisyU5Ey+YkjMpGvMrAJ7QZlGmJ+jhq2JVpUCuKKZllBenXar9sUNLejBUkA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(22082099003)(18002099003)(3023799007)(4143699003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	fyMclUs+ZXmosIkXAQC2CEV/jSzhGPKM3C5D1QLspd3oKoF1ncOC9884+ci8TXaHnD3qii5VrhnDcAnleNwX/pjpZ/CjNKbihgtp1UzdIXe8HS+b+b/ExyeqNNAGpVd0rgw/e2UZXzU39vRoYFCnK2JETBILYSQmZI2xPcJQqCuTDn7oq/SISjErPbZ+Vj1ArobGvn5EmVNMEFbIZ0f3cyLH3LndlhdDfbYAe9lRITo6kcjjPyPkFIP88HMq1GEOWqQP+e/p8c2wHP2I4X55hZTV8q5gouNlXsMr6Wsqgan+jG3ih8i97XHbIGaBraufp7oumLhq18YvZhRP74lz750ujs3bZV1xvSmdIFJ5enZygdMnh8+yTYFiKumaEdScROYxsHXhL6uAqNiMOj87gYNVPvXroU0R+yrLBolnLAwLxUMmUwFwH3X0Q4YovtM+
X-Exchange-RoutingPolicyChecked: 
	g1D6xsmfm1qxkLw2zr597d3w/GgdfUhNeyNcmP+P+IpX23wRGT9sn0AAyMpH5lY3tBzYb87Y8crvLKtNG992lURpmUY8hnGXMC0sa+ZUZa0O6cW60eFs6s7cjKEs4gDUzfkuSt4UhdoafG/T5A6Vj2L3lzp7VRL8uyF0v154quegWa6CbbBxFInuI1o1cY01tPic1Yv4OMqf4TU8ctn/1U1A6O0ATHVxMSw95+6CJ7O/HzJpB42OMnUZ96t3vXQsCKX9KximJ6Qf2zV6tYSppUs19P8iNjZKXxSbyptnFWf/67/+xB4OiByxUCrGVx6fQsGJX2w52QsEEyosgJ7kYw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 18:56:37.6931
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e23bc2-338f-4cf3-1638-08ded22251e6
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7008
X-Authority-Analysis: v=2.4 cv=R6cz39RX c=1 sm=1 tr=0 ts=6a3c286f cx=c_pps
 a=E7iPWXAsOYqR18yzHj3E3w==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=iGHA9ds3AAAA:8
 a=sozttTNsAAAA:8 a=L2yuZWqsS41he81cBz0A:9 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: c12dmO14l1xvgg2wpZDNfxp7ve6_ziBe
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI0MDE1OCBTYWx0ZWRfX/TsMNt6AE2a+
 79njA+goFKlFxfUJZBT55CsTreHz0RCc6d+MFRoJIIVX2qUC0S1v0Uy7lYRczCEwxRZ8W8lfQCM
 REBCvdactlydAM7JWZY5XjVnB+l+5Gc=
X-Proofpoint-GUID: c12dmO14l1xvgg2wpZDNfxp7ve6_ziBe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI0MDE1OCBTYWx0ZWRfX9cUlZDEQ7TqL
 7MvUQlrQ30MoH0deOvbB0e0tiDVM1C1VClhmxDCX8SCb/Ah1+E/+tUYXVZBu2StT7paoWANa/ir
 m/bslnn7lLetTy3vkxPI3FDIkilBsqIw2/WY97uHQI7LUwR/KcAReJAKsEONShR6nLau/eq2YZ+
 Y/uXC6fWqzgx47O9Q/i+reKj2Us2mxNlrEnzz1I2cA65p1PSdUKp9gGVXDiEgmigUBmvmM8XKqj
 fo+gDp9EEhasZKbbPiQ2OSOB+q0fJvLiJ/wn4Gge+1wj00cfRVC/M5pyu95sww47QONz2cAwEk4
 PfbUrIJZ8O4+ms7L0rwyHKZwBXVzqQjmaA2gFsZyzLDo1AfHiwl5qTRcqNtEAW9wC5zoIEuBuUN
 IIU7XwNdnNbgMBI4+b+vlaBNBEs8p8hrt6Rla65X+NGaqEcZfAf3OhUGzgF+smrogDMhGHl/zm+
 ADtso3xFkTGEq1uaUPg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-24_03,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606240158
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 24 Jun 2026 18:56:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20070



On 6/24/2026 1:35 PM, PRC Automation wrote:
> meta-ti / na / 20260624183253.1130737-1-afd
> 
> PRC Results: FAIL
> 
> =========================================================
>    check-yocto-patches: FAIL
> =========================================================
> Patches
> ----------------------------------------
> WARN - [meta-ti][master/wrynose][PATCH 1/3] ti-librpmsg-dma: Move this recipe to its own directory
>      WARN: Commit message does not include file/recipe name: ti-librpmsg-dma: Move this recipe to its own directory. (COMMIT-MESSAGE-2)
>          patch
>      
>      For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
> WARN - [meta-ti][master/wrynose][PATCH 2/3] ti-rpmsg-char: Move this recipe to its own directory
>      WARN: Commit message does not include file/recipe name: ti-rpmsg-char: Move this recipe to its own directory. (COMMIT-MESSAGE-2)
>          patch
>      
>      For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
> FAIL - [meta-ti][master/wrynose][PATCH 3/3] ti-rpmsg-char: Update to latest with CMake support
>      ERROR: Missing License-Update for change in LIC_FILES_CHKSUM. (LICENSE-UPDATE-1)
>          patch
>      
>      ERROR: Missing License-Update for change in LICENSE. (LICENSE-UPDATE-2)
>          patch
>      
>      For details on the above errors/warnings visit: https://lists.yoctoproject.org/g/meta-ti/wiki/40887
> 
> 
> 

You can ignore this.  My script does not grok moving licensing settings 
from a .inc file into a .bb file.  It thinks you just removed the line 
without documenting it.   It looks fine.


-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

