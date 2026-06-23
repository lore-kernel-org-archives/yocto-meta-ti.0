Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B76D5CDB471
	for <webhook@archiver.kernel.org>; Tue, 23 Jun 2026 15:46:01 +0000 (UTC)
Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24163.1782229552857491276
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 23 Jun 2026 08:45:53 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=mSwBI9d/;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=nfJ5OxIg;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: a-christidis@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65NCkcKE1749250;
	Tue, 23 Jun 2026 10:45:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yrcvW2LVQu5L0hTqS6BmuQqhJ6t155AbT9wSoyJVL
	Og=; b=mSwBI9d/HB+WegwDJhS8aR+c01RNmFV+h+Tvy2FD0U/a5u2UUj6EeJvX3
	9kuv8btVpzqMHe1TPlBevxwXRQ2j3Q0GIpdPNzTB4+2d/owjOdZBpweCnHZRZELX
	Me82SB8CVMie2JA51ndubeHXMFaWzxhnHsK0IoaCmwaBdUCpR6nZI8PjK6MyvmEY
	v1b6YIqPGI8qfGabHKrvUzFRluFNYP4uVnx2QOiqrVGMO1IzCQQ957Spyv2/O5un
	Jcws+h1LLhXIKXC09SDWxotQ/WRWW/SXOgRF4xA7j1+KPaP7VEIEtbfH+9ChKEGL
	VfCw4PMBu1e3AVoBd92amLGlwq92A==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4eyten1935-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 23 Jun 2026 10:45:50 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ye0q/5RPF9WCTVywP9Bb4t2+yZqqdWT2Rw7HjFiSrohBhL9MV6ZPZojI96J6H3D2TmSDctYpkxOaw1mndlP3iNjTFOyr3oR2jnFe+CQAI7r6GM07WLDL3u147lFC7mMwgvYttgXqpP+AGfIQng18JOjDWPGlCZNEvreG65c+hQMnEOoz1xt99Dng0FxYcjfLMlXT/1Mqp5ZZ0iUMSYHPXLNjaRUZF9EQqGocC9d1556bifiESVyV5ze6LMxBhSv3z3R8dgncgKM2vdNUvbXqn10Fyc0ff0pBVo78uiUAtMV/SzAFG8JzfkxbY76vTwh+gD8Tw6AbT3q7xFFs1Ui5tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yrcvW2LVQu5L0hTqS6BmuQqhJ6t155AbT9wSoyJVLOg=;
 b=NU5NDgQ903vR+AsYVYkUNJASAt647yx+KKN1tNV9tTp6El5lJ6xoDTZESyU1pLKrbppyrJmFe/XtYQoFVY5xEau7rVZYfdwL1lrjZuaj8H55VkqXbAWrthasdkXEqDTXoW3t3WJ5e5pWZk2n8VDXuY3FrsElxkn1leWu1ze69L6PJaPF5mWOAY9qV+M1+ffOx8/1UuwfJ+X3Qf2GHs5LdICkanGiKfgMWeQJBljaX7OPVUK3Q65PDo5nZRqgmy3JE7JqUjUPybuDDqN6X79CrFWvFUMpv5DbalBWRwyORapbfH7w/EsXVgbgZQqUlovIZZENCDHud21qEH21QAWRPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yrcvW2LVQu5L0hTqS6BmuQqhJ6t155AbT9wSoyJVLOg=;
 b=nfJ5OxIgjunsAO6scm0d7F6NrGCbOx5792sDDYdUCeRfAVTcwaEJFg3jZYG+QC/fNSh9uQSwft7I7BUxUxbBbXTuj4joh2pOYVlYH7vq5iDedjM+D4UfhNo6A1KTILeOY8zGNK6tO2IW16pNI1hOdjVX7WyvDxtaVQx1fcaDMac=
Received: from CH0PR04CA0105.namprd04.prod.outlook.com (2603:10b6:610:75::20)
 by BLAPR10MB5043.namprd10.prod.outlook.com (2603:10b6:208:332::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 15:45:46 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:75:cafe::2d) by CH0PR04CA0105.outlook.office365.com
 (2603:10b6:610:75::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.12 via Frontend Transport; Tue,
 23 Jun 2026 15:45:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 15:45:46 +0000
Received: from DLEE212.ent.ti.com (157.170.170.114) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 10:45:45 -0500
Received: from DLEE214.ent.ti.com (157.170.170.117) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 23 Jun
 2026 10:45:45 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 23 Jun 2026 10:45:45 -0500
Received: from [128.247.75.243] (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.75.243])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 65NFjjDA3186791;
	Tue, 23 Jun 2026 10:45:45 -0500
Message-ID: <32b1097c-3662-471f-bd85-8a2c8ff9deeb@ti.com>
Date: Tue, 23 Jun 2026 10:45:45 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master/wrynose][PATCH v3 1/2] mesa-pvr: Add versioned
 mesa.inc copies from oe-core
To: Andrew Davis <afd@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-ti@lists.yoctoproject.org>
References: <20260623150317.1127756-1-a-christidis@ti.com>
 <20260623150317.1127756-2-a-christidis@ti.com>
 <275ad764-f9c8-48f5-81f6-2b8559810837@ti.com>
Content-Language: en-US
From: Antonios Christidis <a-christidis@ti.com>
In-Reply-To: <275ad764-f9c8-48f5-81f6-2b8559810837@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|BLAPR10MB5043:EE_
X-MS-Office365-Filtering-Correlation-Id: e39b9eaf-860c-4528-e17b-08ded13e7dcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|23010399003|36860700016|376014|4022899009|82310400026|20052099010|22082099003|18002099003|12006099003|3023799007|4143699003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: 
	yVEm3aRMj75l7JGmwq22g+jbWvyxlVbU+H92czXAfX1nIW3YjwpNjgHRjdQNezjQanHFLby1Vx7axA+9LBuULerDnjOfDyX1iNGWJlJtpqP8Bov/UASfDQrw6s3u1FOze756kP3wMyc/F3Xw8RiN1dBC70x5iotXgG6DU1pwzFgiaQ2ehmr1Jjn2l6GRNrnVX/8Jrc0fWz7guuCOAkEF7MtfNrAHHPGVJgC2bNhGdvK9F4Hb5SyJ7jlMkEBz8W3VgzOEuIhwXg21mQHggp7pRgvZUgkjt0h+gND/f8HxeaHwMQ4IyVzLBhLQEZV71mZ5El238U0HCz+SDDnp1qJbS3MCVmf+sIMcyr92757Pu5FWoFUiowkz41fQejviBSXctlgpEyFswPKWRgE/U4iaNCLdOzX9Aolo9+02EuM4yrf5tNhIp4cMPIim68kFthSb4iFTwUsC0QJhkWSM25D55XmtPBhMc7oEbQDHxCnVqMP0Ry5qqS2SLf0wvRus5+WkVAVdj/MFnUnQvrVBIO//wgMYEfaZXfnPb0iYGBgwTvzAuKWo/rihKDXU14WDtnht2pGiNeCaew06pSWTmmJyJxZ6hBeBsxA0LeUVuHl6MwBMpHzVh5RPzuVFFm+azFAep9Rt7xcwPHAWFQIE+VyovA==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(36860700016)(376014)(4022899009)(82310400026)(20052099010)(22082099003)(18002099003)(12006099003)(3023799007)(4143699003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	oyb5FUJeHmPTOSvBxgQhGW8ZAobuKtk3l37eF9w46xx7+B2Gczv/AlhnkwOKajX18oO2B8w6u1hf1zIbmvZMDWrdm8+Yjb6T8iNq7yjYyT1vufDW9VXtZ03/xkV19GHjaqr378ZHbIXDnO0VfRM9G+KXCBRu/LqduEqzDqqzzAuSaE2Rcn9VH1tW3wNPgjBWce1WiGLTX4Zs32tnT39GlQ0OwmNLBDyT4qHzgNNfsd85vJljiF+yvi6QqbBv7wzgRAo/s52CG4XEH7A77BtHAl9DxJ8Bci3akJlFTYQ0d4V4WCWA9tYykeCsZWlwJYxHFyobQILnXblfmAYFtCjprA4vUvjRHkjfQmSxQXF0TpPbTKojH2T9sqB3ybaeKdZYQ7R9zGtDOE9nEkbZB122LqjpiNus6SF95OR/5klf6sKa3hl9JyXK/4GXGxrzIWGV
X-Exchange-RoutingPolicyChecked: 
	BsVUvrZSIhbNLu/KoQ/aozODotvI/pyMKZLqp6IWogd3L5pMQmSwOy+Nosg+fQMGP4Uyj1dI3ykyyQYNUXxJfWSReaVKlNETBj2Y6mTz9bTrkbVJnWcS7OWU5QikYMAbxMX+Shwf53z4FI5nNzjf1LsrkNtq/ko3d5fvWFtmnl9GUGodal7u+OnVy6drD5a3zC13KypZYhjoJ7Ne5zqPI2Yunni9gvWZ52j9BzIHPsuAdYU4k2kj63lVAmEsZT4OsFca32G8Uli8ube500Q/RMrqAmbjJ+A/lM1Oi6yce1FrRTf1WHeYgGlPO1+xNN/dw/i8ilLqFM1MOda88Wkrxg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 15:45:46.1228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e39b9eaf-860c-4528-e17b-08ded13e7dcf
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5043
X-Authority-Analysis: v=2.4 cv=eO4jSnp1 c=1 sm=1 tr=0 ts=6a3aaa2f cx=c_pps
 a=VZSJMqPseUw/+4g/T0Awdw==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=jwouBfj2j3NM8CExmVVE:22 a=ZpVaWaFtAAAA:8
 a=e5mUnYsNAAAA:8 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=EkUhQDg_C5rFDHqjNMEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=5tn4MO8azEBWFjlAA-rn:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: agh28WpDW4OfpdBYfUORQfvtLQSZnCyu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDEyOSBTYWx0ZWRfX5S2NcdBKIBP+
 sDIrxtFE6/3sAk9ISEUvbyxBMZ0UtEnXfFxJWzK8K9p5TUjXJw9c+jKL9VFlqpoBNxCIpVfaS6Z
 FinSgDQA+pKhndM6TZLb8e6PesOFnA5Nd/9aR3SbDaYzcRGRAV2H3TIP72MbADZXFvX4r8lwgk2
 roiP0R2uEWmllckbLCmi5/v8LCJrLosqJG9YJhB5XAnJk/dEfv24828ZBKW7XmF5xmnSgzNAxLW
 WNbECKUtk3iqOTM+TKhrAR6RbMeSHe7HY/mDaHoh3u4DU1tTSraTBrGk2TeJCm/QdqhlDah4zl3
 /hw1ohrlVkyNDIRVoy+PHN8rBQXoSEXqBwftubYvPkqcHl8ppB52iYl9omhSyP2jeOmNnA48LYs
 8rU45S0WXdNaiqdpRYxGh01k2h0eZ5VrnzXY+Bt0ohWyqbNRwK1ESybSlJtIdVZSLn9r7PrYUwz
 aZ90eh+7E44YaxqkuiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDEyOSBTYWx0ZWRfX6UybbOBHWT5f
 DvNOY/s5MqNSNly1g2RdA4QOQIqtILscQmiDTF6g7QR12r0YzTErZPTpR46hfOXmvLlvxv8Qpt3
 F206E7sL/RYmQbYZALhvaorTIxmcrQE=
X-Proofpoint-ORIG-GUID: agh28WpDW4OfpdBYfUORQfvtLQSZnCyu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_03,2026-06-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606230129
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 65NCkcKE1749250
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 23 Jun 2026 15:46:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20059


On 6/23/26 10:43 AM, Andrew Davis wrote:
> On 6/23/26 10:03 AM, Antonios Christidis via lists.yoctoproject.org=20
> wrote:
>> From: Antonios Christidis <a-christidis@ti.com>
>>
>> Add local copies of mesa.inc from oe-core, renamed with version suffix=
es
>> to avoid conflicts:
>>
>> - mesa-pvr-24.inc: verbatim copy for v24.0.1 (existing content, rename=
d)
>
> Why do this at all? You delete this file in the very next patch. And yo=
u
> also make additional modifications to mesa-pvr-25.inc in the next patch
> when you first make use of it. Why not just merge these two patches and
> skip all this in-the-middle state?
>
> Andrew
>
Denys wanted to track the copy and paste from oe-core on a individual=20
patch.

Rather than my previous approach where everything was done in 1 patch.


>> - mesa-pvr-25.inc: verbatim copy for v25.2.8 (new)
>>
>> The "-pvr" suffix follows the v24 naming convention. Major version=20
>> numbers
>> are appended to distinguish between the two.
>>
>> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
>> ---
>> =C2=A0 .../mesa/{mesa-pvr.inc =3D> mesa-pvr-24.inc}=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 0
>> =C2=A0 .../mesa/{mesa-pvr.inc =3D> mesa-pvr-25.inc}=C2=A0=C2=A0=C2=A0 =
| 353 +++++++++---------
>> =C2=A0 .../recipes-graphics/mesa/mesa-pvr_24.0.1.bb=C2=A0 |=C2=A0=C2=A0=
 2 +-
>> =C2=A0 3 files changed, 168 insertions(+), 187 deletions(-)
>> =C2=A0 copy meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr.inc =3D>=20
>> mesa-pvr-24.inc} (100%)
>> =C2=A0 rename meta-ti-bsp/recipes-graphics/mesa/{mesa-pvr.inc =3D>=20
>> mesa-pvr-25.inc} (50%)
>>
>> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc=20
>> b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
>> similarity index 100%
>> copy from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
>> copy to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-24.inc
>> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc=20
>> b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
>> similarity index 50%
>> rename from meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
>> rename to meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
>> index 5ce93d27..af674c83 100644
>> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr.inc
>> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr-25.inc
>> @@ -1,5 +1,4 @@
>> -# Copy of mesa.inc from OE-core before commit f9eb0468e45e ("mesa:=20
>> upgrade 24.0.7 -> 25.0.2")
>> -
>> +# Verbatim copy of mesa.inc file from commit 2c0c7c3e5b71
>> =C2=A0 SUMMARY =3D "A free implementation of the OpenGL API"
>> =C2=A0 DESCRIPTION =3D "Mesa is an open-source implementation of the O=
penGL=20
>> specification - \
>> =C2=A0 a system for rendering interactive 3D graphics.=C2=A0 \
>> @@ -12,24 +11,22 @@ HOMEPAGE =3D "http://mesa3d.org"
>> =C2=A0 BUGTRACKER =3D "https://bugs.freedesktop.org"
>> =C2=A0 SECTION =3D "x11"
>> =C2=A0 LICENSE =3D "MIT"
>> -LIC_FILES_CHKSUM =3D=20
>> "file://docs/license.rst;md5=3D63779ec98d78d823a9dc533a0735ef10"
>> +LIC_FILES_CHKSUM =3D=20
>> "file://docs/license.rst;md5=3Dffe678546d4337b732cfd12262e6af11"
>> =C2=A0 =C2=A0 PE =3D "2"
>> =C2=A0 =C2=A0 SRC_URI =3D "https://archive.mesa3d.org/mesa-${PV}.tar.x=
z \
>> file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0=
001-drisw-fix-build-without-dri3.patch \
>> - file://0002-glxext-don-t-try-zink-if-not-enabled-in-mesa.patch \
>> - file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
>> - file://0001-amd-Include-missing-llvm-IR-header-Module.h.patch \
>> - file://0001-freedreno-don-t-encode-build-path-into-binaries.patch\
>> + file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
>> =C2=A0 "
>> =C2=A0 -SRC_URI[sha256sum] =3D=20
>> "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
>> -PV =3D "24.0.7"
>> +SRC_URI[sha256sum] =3D=20
>> "097842f3e49d996868b38688db87b006f7d4541e93ce86d2f341d8b3e7be7c93"
>> +PV =3D "25.2.8"
>> =C2=A0 =C2=A0 UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)=
+)"
>> =C2=A0 +S =3D "${UNPACKDIR}/mesa-${PV}"
>> +
>> =C2=A0 #because we cannot rely on the fact that all apps will use pkgc=
onfig,
>> =C2=A0 #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
>> =C2=A0 do_install:append() {
>> @@ -38,25 +35,18 @@ do_install:append() {
>> =C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'tr=
ue', 'false',=20
>> d)} && [ -f ${D}${includedir}/EGL/eglplatform.h ]; then
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sed -i -e 's/^#elif defined=
(__unix__) &&=20
>> defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11)=20
>> || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/'=20
>> ${D}${includedir}/EGL/eglplatform.h
>> =C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0 # These are ICDs, apps are not supposed to link against them
>> +=C2=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'true', 'fal=
se',=20
>> d)} ; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f ${D}${libdir}/libEGL_mesa.so ${D=
}${libdir}/libGLX_mesa.so
>> +=C2=A0 fi
>> =C2=A0 }
>> =C2=A0 -DEPENDS =3D "expat makedepend-native flex-native bison-native=20
>> libxml2-native zlib chrpath-replacement-native python3-mako-native=20
>> gettext-native"
>> -DEPENDS:append:class-target =3D "=20
>> ${@bb.utils.contains('PACKAGECONFIG', 'opencl', 'mesa-native', '', d)}=
"
>> +DEPENDS =3D "expat makedepend-native flex-native bison-native=20
>> libxml2-native zlib chrpath-replacement-native python3-mako-native=20
>> gettext-native python3-pyyaml-native"
>> =C2=A0 EXTRANATIVEPATH +=3D "chrpath-native"
>> -PROVIDES =3D " \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'v=
irtual/libgl',=20
>> '', d)} \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('PACKAGECONFIG', 'glvnd', 'vi=
rtual/libglx',=20
>> '', d)} \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'vir=
tual/libgles1=20
>> virtual/libgles2 virtual/libgles3', '', d)} \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virt=
ual/egl', '',=20
>> d)} \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virt=
ual/libgbm',=20
>> '', d)} \
>> -=C2=A0=C2=A0=C2=A0 virtual/mesa \
>> -=C2=A0=C2=A0=C2=A0 "
>> =C2=A0 -inherit meson pkgconfig python3native gettext features_check
>> +inherit meson pkgconfig python3native gettext features_check rust
>> =C2=A0 -BBCLASSEXTEND =3D "native nativesdk"
>> -
>> -ANY_OF_DISTRO_FEATURES =3D "opengl vulkan"
>> +ANY_OF_DISTRO_FEATURES =3D "opencl opengl vulkan"
>> =C2=A0 =C2=A0 PLATFORMS ??=3D "${@bb.utils.filter('PACKAGECONFIG', 'x1=
1 wayland',=20
>> d)}"
>> =C2=A0 @@ -74,141 +64,141 @@ def check_buildtype(d):
>> =C2=A0 MESON_BUILDTYPE =3D "${@check_buildtype(d)}"
>> =C2=A0 =C2=A0 EXTRA_OEMESON =3D " \
>> -=C2=A0=C2=A0=C2=A0 -Dshared-glapi=3Denabled \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dglx-read-only-text=3Dtrue \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Dplatforms=3D'${@",".join("${PLATFORMS=
}".split())}' \
>> =C2=A0 "
>> =C2=A0 -EXTRA_OEMESON:append:class-target =3D "=20
>> ${@bb.utils.contains('PACKAGECONFIG', 'opencl', '-Dintel-clc=3Dsystem'=
,=20
>> '', d)}"
>> -EXTRA_OEMESON:append:class-native =3D "=20
>> ${@bb.utils.contains('PACKAGECONFIG', 'opencl',=20
>> '-Dintel-clc=3Denabled', '', d)}"
>> -
>> =C2=A0 def strip_comma(s):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return s.strip(',')
>> =C2=A0 -PACKAGECONFIG =3D " \
>> -=C2=A0=C2=A0=C2=A0 gallium \
>> -=C2=A0=C2=A0=C2=A0 video-codecs \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan =
wayland', d)} \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', =
'opengl egl=20
>> gles gbm virgl', '', d)} \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'x11 openg=
l', 'dri3',=20
>> '', d)} \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulka=
n', 'dri3',=20
>> '', d)} \
>> -=C2=A0=C2=A0=C2=A0 ${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', =
'zink', '', d)} \
>> -"
>> +# skip all Rust dependencies if we are not building OpenCL"
>> +INHIBIT_DEFAULT_RUST_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'opencl', '', '1', d)}"
>> =C2=A0 -PACKAGECONFIG:append:class-native =3D " gallium-llvm r600"
>> +# "egl" requires "opengl"
>> +PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
>> =C2=A0 =C2=A0 # "gbm" requires "opengl"
>> =C2=A0 PACKAGECONFIG[gbm] =3D "-Dgbm=3Denabled,-Dgbm=3Ddisabled"
>> =C2=A0 -X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libx=
damage=20
>> libxfixes xrandr"
>> +# "gles" requires "opengl"
>> +PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled,=20
>> -Dgles1=3Ddisabled -Dgles2=3Ddisabled"
>> +
>> +PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Denabled, -Dglvnd=3Ddisabled, libg=
lvnd"
>> +
>> +PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
>> +
>> +# "opencl" also requires libclc and gallium-llvm to be present in=20
>> PKGCONFIG!
>> +# Be sure to enable them both for the target and for the native build.
>> +PACKAGECONFIG[opencl] =3D "-Dgallium-rusticl=3Dtrue=20
>> -Dmesa-clc-bundle-headers=3Denabled, -Dgallium-rusticl=3Dfalse,=20
>> bindgen-cli-native clang"
>> +
>> +X11_DEPS =3D "xorgproto virtual/libx11 libxext libxxf86vm libxdamage=20
>> libxfixes xrandr xorgproto libxshmfence"
>> =C2=A0 # "x11" requires "opengl"
>> =C2=A0 PACKAGECONFIG[x11] =3D ",-Dglx=3Ddisabled,${X11_DEPS}"
>> =C2=A0 PACKAGECONFIG[wayland] =3D ",,wayland-native wayland libdrm=20
>> wayland-protocols"
>> =C2=A0 -PACKAGECONFIG[dri3] =3D "-Ddri3=3Denabled, -Ddri3=3Ddisabled, =
xorgproto=20
>> libxshmfence"
>> +# Entries for GPU vendors.
>> +# Some of the drivers might have extra dependencies (libclc,=20
>> gallium-llvm).
>> +# Check them in the individual driver settings in VULKAN_DRIVERS and
>> +# GALLIUMDRIVERS.
>> +PACKAGECONFIG[amd] =3D ""
>> +PACKAGECONFIG[asahi] =3D ""
>> +PACKAGECONFIG[broadcom] =3D ""
>> +PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
>> +PACKAGECONFIG[freedreno] =3D ""
>> +PACKAGECONFIG[imagination] =3D=20
>> "-Dimagination-srv=3Dtrue,-Dimagination-srv=3Dfalse"
>> +PACKAGECONFIG[intel] =3D ""
>> +PACKAGECONFIG[lima] =3D ""
>> +PACKAGECONFIG[nouveau] =3D ""
>> +PACKAGECONFIG[panfrost] =3D ""
>> +PACKAGECONFIG[svga] =3D ""
>> +PACKAGECONFIG[tegra] =3D ""
>> +PACKAGECONFIG[v3d] =3D ""
>> +PACKAGECONFIG[vc4] =3D ""
>> +PACKAGECONFIG[virgl] =3D ""
>> +PACKAGECONFIG[zink] =3D ""
>> +
>> +
>> +VULKAN_DRIVERS_SWRAST =3D ",swrast"
>> +# Crashes on x32
>> +VULKAN_DRIVERS_SWRAST:x86-x32 =3D ""
>> =C2=A0 -# Vulkan drivers need dri3 enabled
>> -# amd could be enabled as well but requires gallium-llvm with llvm=20
>> >=3D 3.9
>> +# keep sorted by the driver name (rather than PKGCONFIG)
>> =C2=A0 VULKAN_DRIVERS =3D ""
>> -VULKAN_DRIVERS:append:x86 =3D ",intel,amd"
>> -VULKAN_DRIVERS:append:x86-64 =3D ",intel,amd"
>> -# i686 is a 32 bit override for mesa-native
>> -VULKAN_DRIVERS:append:i686 =3D ",intel,amd"
>> -VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'freedreno', ',freedreno', '', d)}"
>> -VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'broadcom', ',broadcom', '', d)}"
>> -VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'gallium-llvm', ',swrast', '', d)}"
>> -VULKAN_DRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'imagination', ',imagination-experimental', '', d)}"
>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd=20
>> gallium-llvm', ',amd', '', d)}"
>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi=20
>> libclc gallium-llvm', ',asahi', '', d)}"
>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'broadcom'=
,=20
>> ',broadcom', '', d)}"
>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'freedreno', ',freedreno', '', d)}"
>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'imagination', ',imagination-experimental', '', d)}"
>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel=20
>> libclc gallium-llvm', ',intel', '', d)}"
>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'gallium-llvm', '${VULKAN_DRIVERS_SWRAST}', '', d)}"
>> +VULKAN_DRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost=20
>> libclc', ',panfrost', '', d)}"
>> +
>> =C2=A0 PACKAGECONFIG[vulkan] =3D=20
>> "-Dvulkan-drivers=3D${@strip_comma('${VULKAN_DRIVERS}')},=20
>> -Dvulkan-drivers=3D'',glslang-native vulkan-loader vulkan-headers"
>> +PACKAGECONFIG[vulkan-beta] =3D "-Dvulkan-beta=3Dtrue,-Dvulkan-beta=3D=
false"
>> =C2=A0 =C2=A0 # mesa development and testing tools support, per driver
>> +
>> +# keep sorted by the driver name (rather than PKGCONFIG)
>> =C2=A0 TOOLS =3D ""
>> -TOOLS_DEPS =3D ""
>> -TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv',=20
>> ',etnaviv', '', d)}"
>> -TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno',=20
>> ',freedreno', '', d)}"
>> -TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'lima',=20
>> ',lima', '', d)}"
>> -TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost',=20
>> ',panfrost', '', d)}"
>> -TOOLS:append =3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination'=
,=20
>> ',imagination', '', d)}"
>> +TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi', ',asahi',=20
>> '', d)}"
>> +TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv',=20
>> ',etnaviv', '', d)}"
>> +TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno',=20
>> ',freedreno', '', d)}"
>> +TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'imagination',=20
>> ',imagination', '', d)}"
>> +TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', ''=
,=20
>> d)}"
>> +TOOLS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost',=20
>> ',panfrost', '', d)}"
>> =C2=A0 =C2=A0 # dependencies for tools.
>> -TOOLS_DEPS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'freedreno', ' ncurses libxml2 ', '', d)}"
>> +TOOLS_DEPS =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno', '=20
>> ncurses libxml2 ', '', d)}"
>> =C2=A0 =C2=A0 # the fdperf tool requires libconfig (a part of meta-oe)=
 so it=20
>> needs special
>> =C2=A0 # treatment in addition to the usual 'freedreno tools'.
>> =C2=A0 PACKAGECONFIG[freedreno-fdperf] =3D ",,libconfig"
>> =C2=A0 =C2=A0 PACKAGECONFIG[tools] =3D "-Dtools=3D${@strip_comma('${TO=
OLS}')},=20
>> -Dtools=3D'', ${TOOLS_DEPS}"
>> -
>> -PACKAGECONFIG[opengl] =3D "-Dopengl=3Dtrue, -Dopengl=3Dfalse"
>> -PACKAGECONFIG[glvnd] =3D "-Dglvnd=3Dtrue, -Dglvnd=3Dfalse, libglvnd"
>> -
>> -# "gles" requires "opengl"
>> -PACKAGECONFIG[gles] =3D "-Dgles1=3Denabled -Dgles2=3Denabled,=20
>> -Dgles1=3Ddisabled -Dgles2=3Ddisabled"
>> -
>> -# "egl" requires "opengl"
>> -PACKAGECONFIG[egl] =3D "-Degl=3Denabled, -Degl=3Ddisabled"
>> -
>> -# "opencl" requires libclc from meta-clang and spirv-tools from OE-Co=
re
>> -OPENCL_NATIVE =3D "${@bb.utils.contains('PACKAGECONFIG', 'freedreno',=
=20
>> '-Dopencl-native=3Dtrue', '', d)}"
>> -PACKAGECONFIG[opencl] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtr=
ue=20
>> ${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled=20
>> -Dopencl-spirv=3Dfalse,libclc spirv-tools python3-ply-native"
>> -
>> -PACKAGECONFIG[broadcom] =3D ""
>> -PACKAGECONFIG[etnaviv] =3D ",,python3-pycparser-native"
>> -PACKAGECONFIG[freedreno] =3D ""
>> -PACKAGECONFIG[kmsro] =3D ""
>> -PACKAGECONFIG[vc4] =3D ""
>> -PACKAGECONFIG[v3d] =3D ""
>> -PACKAGECONFIG[zink] =3D ""
>> -
>> -GALLIUMDRIVERS =3D "swrast"
>> -# gallium swrast was found to crash Xorg on startup in x32 qemu
>> -GALLIUMDRIVERS:x86-x32 =3D ""
>> -GALLIUMDRIVERS:append:x86 =3D ",i915,iris,crocus"
>> -GALLIUMDRIVERS:append:x86-64 =3D ",i915,iris,crocus"
>> -# i686 is a 32 bit override for mesa-native
>> -GALLIUMDRIVERS:append:i686 =3D ",i915,iris,crocus"
>> -
>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'etnaviv', ',etnaviv', '', d)}"
>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'freedreno', ',freedreno', '', d)}"
>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'kmsro', ',kmsro', '', d)}"
>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'vc4', ',vc4', '', d)}"
>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'v3d', ',v3d', '', d)}"
>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'zink', ',zink', '', d)}"
>> -
>> -# radeonsi requires LLVM
>> -GALLIUMDRIVERS_RADEONSI =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'r600', ',radeonsi', '', d)}"
>> -GALLIUMDRIVERS_LLVM =3D ",r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
>> -GALLIUMDRIVERS_LLVM:append:x86 =3D ",svga"
>> -GALLIUMDRIVERS_LLVM:append:x86-64 =3D ",svga"
>> -# i686 is a 32 bit override for mesa-native
>> -GALLIUMDRIVERS_LLVM:append:i686 =3D ",svga"
>> -
>> -PACKAGECONFIG[r600] =3D ""
>> -PACKAGECONFIG[virgl] =3D ""
>> -
>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'gallium-llvm', '${GALLIUMDRIVERS_LLVM}', '', d)}"
>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'r600', ',r600', '', d)}"
>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'virgl', ',virgl', '', d)}"
>> +PACKAGECONFIG[xmlconfig] =3D "-Dxmlconfig=3Denabled,=20
>> -Dxmlconfig=3Ddisabled, expat"
>> +
>> +GALLIUMDRIVERS_LLVMPIPE =3D ",llvmpipe"
>> +GALLIUMDRIVERS_SOFTPIPE =3D ",softpipe"
>> +# gallium softpipe and llvmpipe was found to crash Xorg on startup=20
>> in x32 qemu
>> +GALLIUMDRIVERS_LLVMPIPE:x86-x32 =3D ""
>> +GALLIUMDRIVERS_SOFTPIPE:x86-x32 =3D ""
>> +
>> +# keep sorted by the driver name (rather than PKGCONFIG)
>> +GALLIUMDRIVERS =3D ""
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'asahi=20
>> libclc gallium-llvm', ',asahi', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel',=20
>> ',crocus', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'etnaviv',=
=20
>> ',etnaviv', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'freedreno', ',freedreno', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel',=20
>> ',i915', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'intel=20
>> libclc gallium-llvm', ',iris', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'lima',=20
>> ',lima', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'gallium-llvm', '${GALLIUMDRIVERS_LLVMPIPE}', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'nouveau=20
>> gallium-llvm', ',nouveau', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'panfrost=20
>> libclc', ',panfrost', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd=20
>> gallium-llvm', ',r300', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd',=20
>> ',r600', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'amd=20
>> gallium-llvm', ',radeonsi', '', d)}"
>> +GALLIUMDRIVERS .=3D "${GALLIUMDRIVERS_SOFTPIPE}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'svga=20
>> gallium-llvm', ',svga', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'tegra',=20
>> ',tegra', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'virgl',=20
>> ',virgl', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'vc4',=20
>> ',vc4', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'v3d',=20
>> ',v3d', '', d)}"
>> +GALLIUMDRIVERS .=3D "${@bb.utils.contains('PACKAGECONFIG', 'zink',=20
>> ',zink', '', d)}"
>> =C2=A0 =C2=A0 PACKAGECONFIG[gallium] =3D=20
>> "-Dgallium-drivers=3D${@strip_comma('${GALLIUMDRIVERS}')},=20
>> -Dgallium-drivers=3D'', libdrm"
>> =C2=A0 PACKAGECONFIG[gallium-llvm] =3D "-Dllvm=3Denabled=20
>> -Dshared-llvm=3Denabled, -Dllvm=3Ddisabled, llvm llvm-native elfutils"
>> -PACKAGECONFIG[xa]=C2=A0 =3D "-Dgallium-xa=3Denabled, -Dgallium-xa=3Dd=
isabled"
>> -PACKAGECONFIG[va] =3D=20
>> "-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled,libva-initial"
>> -PACKAGECONFIG[vdpau] =3D=20
>> "-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=3Ddisabled,libvdpau"
>> -
>> -PACKAGECONFIG[imagination] =3D=20
>> "-Dimagination-srv=3Dtrue,-Dimagination-srv=3Dfalse"
>> -
>> -PACKAGECONFIG[lima] =3D ""
>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'lima', ',lima', '', d)}"
>> =C2=A0 -PACKAGECONFIG[panfrost] =3D ""
>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'panfrost', ',panfrost', '', d)}"
>> +MESA_CLC =3D "system"
>> +MESA_CLC:class-native =3D "enabled"
>> +INSTALL_MESA_CLC =3D "false"
>> +INSTALL_MESA_CLC:class-native =3D "true"
>> +MESA_NATIVE =3D "mesa-native"
>> +MESA_NATIVE:class-native =3D ""
>> =C2=A0 -PACKAGECONFIG[tegra] =3D ""
>> -GALLIUMDRIVERS:append =3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'tegra', ',tegra,nouveau', '', d)}"
>> -
>> -PACKAGECONFIG[vulkan-beta] =3D "-Dvulkan-beta=3Dtrue,-Dvulkan-beta=3D=
false"
>> -
>> -PACKAGECONFIG[osmesa] =3D "-Dosmesa=3Dtrue,-Dosmesa=3Dfalse"
>> +PACKAGECONFIG[libclc] =3D "-Dmesa-clc=3D${MESA_CLC}=20
>> -Dinstall-mesa-clc=3D${INSTALL_MESA_CLC}=20
>> -Dmesa-clc-bundle-headers=3Denabled,,libclc spirv-tools=20
>> spirv-llvm-translator ${MESA_NATIVE}"
>> +PACKAGECONFIG[va] =3D=20
>> "-Dgallium-va=3Denabled,-Dgallium-va=3Ddisabled,libva-initial"
>> +PACKAGECONFIG[vdpau] =3D=20
>> "-Dgallium-vdpau=3Denabled,-Dgallium-vdpau=3Ddisabled,libvdpau"
>> =C2=A0 =C2=A0 PACKAGECONFIG[perfetto] =3D=20
>> "-Dperfetto=3Dtrue,-Dperfetto=3Dfalse,libperfetto"
>> =C2=A0 @@ -219,6 +209,8 @@ PACKAGECONFIG[lmsensors] =3D=20
>> "-Dlmsensors=3Denabled,-Dlmsensors=3Ddisabled,lmsensors"
>> =C2=A0 VIDEO_CODECS ?=3D "${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED=
',=20
>> 'commercial', 'all', 'all_free', d)}"
>> =C2=A0 PACKAGECONFIG[video-codecs] =3D "-Dvideo-codecs=3D${VIDEO_CODEC=
S},=20
>> -Dvideo-codecs=3D''"
>> =C2=A0 +PACKAGECONFIG[teflon] =3D "-Dteflon=3Dtrue, -Dteflon=3Dfalse"
>> +
>> =C2=A0 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. =
-O2)
>> =C2=A0 FULL_OPTIMIZATION:append =3D " -fno-omit-frame-pointer"
>> =C2=A0 @@ -237,75 +229,63 @@ RPROVIDES:libopencl-mesa +=3D "virtual-op=
encl-icd"
>> =C2=A0 RPROVIDES:libgles2-mesa +=3D "libgles3-mesa"
>> =C2=A0 RPROVIDES:libgles2-mesa-dev +=3D "libgles3-mesa-dev"
>> =C2=A0 -RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECON=
FIG',=20
>> 'opencl', 'libclc spirv-tools', '', d)}"
>> +RDEPENDS:libopencl-mesa +=3D "${@bb.utils.contains('PACKAGECONFIG',=20
>> 'opencl', 'libclc', '', d)}"
>> =C2=A0 =C2=A0 PACKAGES =3D+ "libegl-mesa libegl-mesa-dev \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 libosmesa libosmesa-dev \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 libgallium \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 libgl-mesa libgl-mesa-dev \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 libglx-mesa libglx-mesa-dev \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 libglapi libglapi-dev \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 libgbm libgbm-dev \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 libgles1-mesa libgles1-mesa-dev \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 libgles2-mesa libgles2-mesa-dev \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 libopencl-mesa libopencl-mesa-dev \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 libxatracker libxatracker-dev \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 libopencl-mesa \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 libteflon \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mesa-megadriver mesa-vulkan-drivers \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 mesa-vdpau-drivers mesa-tools \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 "
>> =C2=A0 -do_install:append () {
>> -=C2=A0=C2=A0=C2=A0 # Drivers never need libtool .la files
>> -=C2=A0=C2=A0=C2=A0 rm -f ${D}${libdir}/dri/*.la
>> -=C2=A0=C2=A0=C2=A0 rm -f ${D}${libdir}/egl/*.la
>> -=C2=A0=C2=A0=C2=A0 rm -f ${D}${libdir}/gallium-pipe/*.la
>> -=C2=A0=C2=A0=C2=A0 rm -f ${D}${libdir}/gbm/*.la
>> -
>> -=C2=A0=C2=A0=C2=A0 # libwayland-egl has been moved to wayland 1.15+
>> -=C2=A0=C2=A0=C2=A0 rm -f ${D}${libdir}/libwayland-egl*
>> -=C2=A0=C2=A0=C2=A0 rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
>> -}
>> -
>> -do_install:append:class-native () {
>> -=C2=A0=C2=A0=C2=A0 if ${@bb.utils.contains('PACKAGECONFIG', 'opencl',=
 'true',=20
>> 'false', d)}; then
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${bindir}
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m0755 ${B}/src/in=
tel/compiler/intel_clc ${D}${bindir}
>> -=C2=A0=C2=A0=C2=A0 fi
>> -}
>> -
>> =C2=A0 # For the packages that make up the OpenGL interfaces, inject=20
>> variables so that
>> =C2=A0 # they don't get Debian-renamed (which would remove the -mesa=20
>> suffix), and
>> =C2=A0 # RPROVIDEs/RCONFLICTs on the generic libgl name.
>> =C2=A0 python __anonymous() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgconfig =3D (d.getVar('PACKAGECONFIG'=
) or "").split()
>> +=C2=A0=C2=A0=C2=A0 mlprefix =3D d.getVar("MLPREFIX")
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 suffix =3D ""
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if "-native" in d.getVar("PN"):
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 suffix =3D "-na=
tive"
>> -=C2=A0=C2=A0=C2=A0 for p in (("egl", "libegl", "libegl1"),
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ("opengl", "libgl", "libgl1"),
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ("glvnd", "libglx",),
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ("gles", "libgles1", "libglesv1-cm1"),
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ("gles", "libgles2", "libglesv2-2", "libgles3"),
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 ("opencl", "libopencl",)):
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if not p[0] in pkgconfig:
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 co=
ntinue
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mlprefix =3D d.getVar("MLP=
REFIX")
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fullp =3D mlprefix + p[1] =
+ "-mesa" + suffix
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mlprefix =3D d.getVar("MLP=
REFIX")
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgs =3D " " + " ".join(ml=
prefix + x + suffix for x in p[1:])
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("DEBIAN_NOAUTONAM=
E:" + fullp, "1")
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RREPLACES:" +=
 fullp, pkgs)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RPROVIDES:" +=
 fullp, pkgs)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RCONFLICTS:" =
+ fullp, pkgs)
>> =C2=A0 +=C2=A0=C2=A0=C2=A0 for p in ("libegl", "libgl", "libglx", "lib=
gles1", "libgles2",=20
>> "libgles3", "libopencl"):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fullp =3D mlprefix + p + "=
-mesa" + suffix
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RR=
ECOMMENDS:" + fullp, "=20
>> ${MLPREFIX}mesa-megadriver" + suffix)
>> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # For -dev, the fir=
st element is both the Debian and=20
>> original name
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fullp =3D mlprefix + p[1] =
+ "-mesa-dev" + suffix
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkgs =3D " " + mlprefix + =
p[1] + "-dev" + suffix
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar("DEBIAN_NOAUTONAM=
E:" + fullp, "1")
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RREPLACES:" +=
 fullp, pkgs)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RPROVIDES:" +=
 fullp, pkgs)
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RCONFLICTS:" =
+ fullp, pkgs)
>> +=C2=A0=C2=A0=C2=A0 d.setVar("DEBIAN_NOAUTONAME:%slibopencl-mesa%s" % =
(mlprefix,=20
>> suffix), "1")
>> +
>> +=C2=A0=C2=A0=C2=A0 if 'glvnd' in pkgconfig:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for p in ("libegl", "libgl=
x"):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fu=
llp =3D mlprefix + p + "-mesa" + suffix
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.=
appendVar("RPROVIDES:" + fullp, ' virtual-%s-icd' % p)
>> +=C2=A0=C2=A0=C2=A0 else:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for p in (("egl", "libegl"=
, "libegl1"),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ("opengl", "libgl", "libgl1"),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ("gles", "libgles1", "libglesv1-cm1"),
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ("gles", "libgles2", "libglesv2-2", "li=
bgles3")):
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if=
 not p[0] in pkgconfig:
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 continue
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fu=
llp =3D mlprefix + p[1] + "-mesa" + suffix
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pk=
gs =3D " " + " ".join(mlprefix + x + suffix for x in p[1:])
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.=
setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.=
appendVar("RREPLACES:" + fullp, pkgs)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.=
appendVar("RPROVIDES:" + fullp, pkgs)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.=
appendVar("RCONFLICTS:" + fullp, pkgs)
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # =
For -dev, the first element is both the Debian and=20
>> original name
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fu=
llp =3D mlprefix + p[1] + "-mesa-dev" + suffix
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pk=
gs =3D " " + mlprefix + p[1] + "-dev" + suffix
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.=
setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.=
appendVar("RREPLACES:" + fullp, pkgs)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.=
appendVar("RPROVIDES:" + fullp, pkgs)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.=
appendVar("RCONFLICTS:" + fullp, pkgs)
>> =C2=A0 }
>> =C2=A0 =C2=A0 python mesa_populate_packages() {
>> @@ -327,9 +307,6 @@ python mesa_populate_packages() {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RPROVIDES:%s" % lib_name, pkg=
_name)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RCONFLICTS:%s" % lib_name, pk=
g_name)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar("RREPLACES:%s" % lib_name, pkg=
_name)
>> -
>> -=C2=A0=C2=A0=C2=A0 pipe_drivers_root =3D os.path.join(d.getVar('libdi=
r'),=20
>> "gallium-pipe")
>> -=C2=A0=C2=A0=C2=A0 do_split_packages(d, pipe_drivers_root, r'^pipe_(.=
*)\.so$',=20
>> 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends=3D'')
>> =C2=A0 }
>> =C2=A0 =C2=A0 PACKAGESPLITFUNCS =3D+ "mesa_populate_packages"
>> @@ -341,34 +318,38 @@ FILES:mesa-megadriver =3D "${libdir}/dri/*=20
>> ${datadir}/drirc.d"
>> =C2=A0 FILES:mesa-vulkan-drivers =3D "${libdir}/libvulkan_*.so=20
>> ${libdir}/libpowervr_rogue.so ${datadir}/vulkan"
>> =C2=A0 FILES:${PN}-vdpau-drivers =3D "${libdir}/vdpau/*.so.*"
>> =C2=A0 FILES:libegl-mesa =3D "${libdir}/libEGL*.so.*=20
>> ${datadir}/glvnd/egl_vendor.d"
>> -FILES:libgbm =3D "${libdir}/libgbm.so.*"
>> +FILES:libgbm =3D "${libdir}/libgbm.so.* ${libdir}/gbm/*_gbm.so"
>> +FILES:libgallium =3D "${libdir}/libgallium-*.so"
>> =C2=A0 FILES:libgles1-mesa =3D "${libdir}/libGLESv1*.so.*"
>> =C2=A0 FILES:libgles2-mesa =3D "${libdir}/libGLESv2.so.*"
>> =C2=A0 FILES:libgl-mesa =3D "${libdir}/libGL.so.*"
>> =C2=A0 FILES:libglx-mesa =3D "${libdir}/libGLX*.so.*"
>> -FILES:libopencl-mesa =3D "${libdir}/libMesaOpenCL.so.*=20
>> ${libdir}/gallium-pipe/*.so ${sysconfdir}/OpenCL/vendors/mesa.icd"
>> +FILES:libopencl-mesa =3D "${libdir}/lib*OpenCL.so*=20
>> ${sysconfdir}/OpenCL/vendors/*.icd"
>> =C2=A0 FILES:libglapi =3D "${libdir}/libglapi.so.*"
>> -FILES:libosmesa =3D "${libdir}/libOSMesa.so.*"
>> -FILES:libxatracker =3D "${libdir}/libxatracker.so.*"
>> =C2=A0 -FILES:${PN}-dev =3D "${libdir}/pkgconfig/dri.pc ${includedir}/=
vulkan=20
>> ${libdir}/vdpau/*.so"
>> +FILES:${PN}-dev =3D "${libdir}/pkgconfig/dri.pc=20
>> ${includedir}/GL/internal/dri_interface.h ${includedir}/vulkan=20
>> ${libdir}/vdpau/*.so"
>> =C2=A0 FILES:libegl-mesa-dev =3D "${libdir}/libEGL*.* ${includedir}/EG=
L=20
>> ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
>> -FILES:libgbm-dev =3D "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc=20
>> ${includedir}/gbm.h"
>> -FILES:libgl-mesa-dev =3D "${libdir}/libGL.* ${includedir}/GL=20
>> ${libdir}/pkgconfig/gl.pc"
>> -FILES:libglx-mesa-dev =3D "${libdir}/libGLX*.*"
>> +FILES:libgbm-dev =3D "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc=20
>> ${includedir}/gbm.h ${includedir}/gbm_backend_abi.h"
>> +FILES:libgl-mesa-dev =3D "${libdir}/libGL.* ${includedir}/GL/*.h=20
>> ${libdir}/pkgconfig/gl.pc ${libdir}/pkgconfig/glx.pc"
>> =C2=A0 FILES:libglapi-dev =3D "${libdir}/libglapi.*"
>> =C2=A0 FILES:libgles1-mesa-dev =3D "${libdir}/libGLESv1*.*=20
>> ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
>> =C2=A0 FILES:libgles2-mesa-dev =3D "${libdir}/libGLESv2.*=20
>> ${includedir}/GLES2 ${includedir}/GLES3 ${libdir}/pkgconfig/glesv2.pc"
>> -FILES:libopencl-mesa-dev =3D "${libdir}/libMesaOpenCL.so"
>> -FILES:libosmesa-dev =3D "${libdir}/libOSMesa.*=20
>> ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
>> -FILES:libxatracker-dev =3D "${libdir}/libxatracker.so=20
>> ${libdir}/libxatracker.la \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ${includedir}/xa_tracker.h=20
>> ${includedir}/xa_composite.h ${includedir}/xa_context.h \
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 ${libdir}/pkgconfig/xatracker.pc"
>> +FILES:libteflon =3D "${libdir}/libteflon.so"
>> =C2=A0 # catch all to get all the tools and data
>> =C2=A0 FILES:${PN}-tools =3D "${bindir} ${datadir}"
>> =C2=A0 ALLOW_EMPTY:${PN}-tools =3D "1"
>> =C2=A0 +# All DRI drivers are symlinks to libdril_dri.so
>> +INSANE_SKIP:${PN}-megadriver +=3D "dev-so"
>> +
>> +# OpenCL ICDs package also ship correspondig .so files, there is no=20
>> -dev package
>> +INSANE_SKIP:libopencl-mesa +=3D "dev-so"
>> +
>> =C2=A0 # Fix upgrade path from mesa to mesa-megadriver
>> =C2=A0 RREPLACES:mesa-megadriver =3D "mesa"
>> =C2=A0 RCONFLICTS:mesa-megadriver =3D "mesa"
>> =C2=A0 RPROVIDES:mesa-megadriver =3D "mesa"
>> +
>> +# As of May 2025 it is known that LTO breaks Mesa, for example:
>> +# https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/34318
>> +LTO =3D ""
>> diff --git a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb=20
>> b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
>> index 8ec06800..2c20a538 100644
>> --- a/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
>> +++ b/meta-ti-bsp/recipes-graphics/mesa/mesa-pvr_24.0.1.bb
>> @@ -2,7 +2,7 @@
>> =C2=A0 # upstream yet. This allows us to build the shims we need witho=
ut=20
>> completely
>> =C2=A0 # clobbering mesa.
>> =C2=A0 -require recipes-graphics/mesa/mesa-pvr.inc
>> +require recipes-graphics/mesa/mesa-pvr-24.inc
>> =C2=A0 =C2=A0 SUMMARY +=3D " (with PowerVR for TI parts)"
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#20055):=20
>> https://lists.yoctoproject.org/g/meta-ti/message/20055
>> Mute This Topic: https://lists.yoctoproject.org/mt/119942303/3619733
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.co=
m]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>

