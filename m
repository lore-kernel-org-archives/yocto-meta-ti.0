Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1763.1792597115418624845
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 08:38:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=C9xTeRez;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=sGUNvg21;
 spf=pass (domain: ti.com, ip: 148.163.154.28, mailfrom: reatmon@ti.com)
Received: from pps.filterd (m0374956.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFSeDs1468327
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 10:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=9q785saJuiNvF1MqG1jWlNsDBboXtG8icusKOgEmZ
	rw=; b=C9xTeRezGYfKFWmQt2H4v5uq2rM7+iQ0WnF6IYnYf3mi/bdVQy8yChoHn
	ypVnCMsbwLz+fyJAHfyxLT4n87bOL2yKsY3FuPuKFK5X3PKSXmRbMdxEZUFJCa7G
	mTXFFwQjVW8+L8bgU0EpkZOhmWXF/qNZmhcAGuNjAQND+INxnLttzIKlWG2yD6Qx
	/3W9mOTWXR76f5B8RilOdXLLK/cnsZNl3VemgJaFqxEJoK9SM6qdEUGa4i3kkbhC
	cD2ihfJlrbfeKq9BdFe2Bn2Ezm1ppyExi6r7j2vL93/hyNl8+IAC+SukbKbqzWUH
	SmGMqzbsrVfmfiw3q8Hz+wVwSPsbQ==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4hecukegeg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 10:38:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MtkhhpYVo/1vhke+9RZxwsbY8jvwL6aFJm2wtAQuMLUDCfwnoU7Dq/h+UFcdfF/FAOAs8MZBD6Xe6K9AOXjK1tlogQmpi9rM8w3sKTsNbDcqHWgpt5yCCn3f+MlyvPYetPq/Xmq/tBQyeggQIEr1dsqBaEutV0fq7jodMIplOdo4nTNmkO0HHBggzavoHP275Y7VZwLk6RyztVnfF8b5X/EDNiU0c2M2Ez2rKBbZLqYMNKFEn/PT7BiJr35FuO8RfPsBBVg/ies+kDZUuigJZSq1oatfCqpe1KT8+Ax70nGoqrnBYmbiOjQ1YcFkF3RkqGedkPIaqElyPckjnJUtTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9q785saJuiNvF1MqG1jWlNsDBboXtG8icusKOgEmZrw=;
 b=X3uTrcytp4C4IDGUFvLM0ITro+5iRM+yWBOxPXSUURfZPevehFUDB7v9oD0ayZV0ShNyGSkjly87I8WqmHYpTTcoKzqDmH3OKp9V+RKq5HDKdO/oS86xG/6xf3nnoPtMMiu7M3vE0zzrQ44kupWR92zhAh9gWQ9q9GROvZYrc/Ab3ru+nID4PObRTiQuzRj4ijuxF3oahqqixXZ1V/HYFt/iBT5UcBSGafFyT3jBKyeucHG8heC3XR3OUIXPrf3HSk8saHMDbIw9wWks9U3R0GZhBQal/BbkG+NzJ6TXQVKXY2AE2oQ/esulrzZL75vJo208kLCEpzuaPTnvsXzVFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9q785saJuiNvF1MqG1jWlNsDBboXtG8icusKOgEmZrw=;
 b=sGUNvg21tAPXAgnEqyMSMI2IZLIVj7WRUCV2Q6o/z81RGsgCXJK1nmRWb8bFv5pm8iqMVw5eAJ7Ea3OA1e14GhF5Zs1C7pJDhTC59w5GFH9WCQmdTovfRIaZjAq45w8Uw1Kl6oPx6CAzeaM9nIhEb3eQo4yWL9BEaDgms8ai0+k=
Received: from PH7PR13CA0009.namprd13.prod.outlook.com (2603:10b6:510:174::12)
 by DS0PR10MB7247.namprd10.prod.outlook.com (2603:10b6:8:fb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 15:38:08 +0000
Received: from BY1PEPF0002695C.namprd05.prod.outlook.com
 (2603:10b6:510:174:cafe::49) by PH7PR13CA0009.outlook.office365.com
 (2603:10b6:510:174::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.16 via Frontend Transport; Wed,
 21 Oct 2026 15:38:08 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BY1PEPF0002695C.mail.protection.outlook.com (10.167.244.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 15:38:07 +0000
Received: from DFLE215.ent.ti.com (10.64.6.73) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 10:37:20 -0500
Received: from DFLE213.ent.ti.com (10.64.6.71) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 10:37:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE213.ent.ti.com
 (10.64.6.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 10:37:20 -0500
Received: from [10.249.66.236] ([10.249.66.236])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LFbKta3807888;
	Wed, 21 Oct 2026 10:37:20 -0500
Message-ID: <f22b4089-491c-49f2-914c-1b9fceeed1ca@ti.com>
Date: Wed, 21 Oct 2026 10:37:20 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v5 2/3] linux-ti-staging: Add dm-verity
 kernel config
To: <a-dubey@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20261005121218.844998-1-a-dubey@ti.com>
 <18DBA11102702795.1881882@lists.yoctoproject.org>
 <87e161aa-5f44-4697-a155-f72faaef9844@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <87e161aa-5f44-4697-a155-f72faaef9844@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0002695C:EE_|DS0PR10MB7247:EE_
X-MS-Office365-Filtering-Correlation-Id: 3adff6a1-421a-49c1-95ae-08df2f894e1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|4022899009|82310400026|1800799024|376014|36860700016|23010399003|10067099003|18002099003|22082099003|13003099007|4133799003|3023799007|4143699003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: USeDQ801L16Uq5CirFsUijzUbnf8+DtT7oku46B2/J9s9m8O29QgP9ap0UM/irMsc6Chm3Tv+n+1w4YW1hLgBtazXy6rM/kF5yFsjFF7dk+gVRlNmP6jxwlNo6KDSnSZiLKlpH/DB8s3BPawtTaryQ0XQ1Qv9eT1Kw4F/1DV57c+i8BZcAmrvywurO+xFDyN5oOwn86R/ZpOiT53bvBbZnxSPk6JFcZ7RKl8Lm1s5pYxSppxQLzrcd9f8l9dfkt61aTUNcjFbzGU7bmTVdDUFnMi0IzExVDG8zlcXl+lHbrwNXMQ97EsGbCDjBb3Ez5Hiomt1T7xgp4MYeDwofjkqd9VSkvYOPU1XoQzJp81ZMWwoIvR2kGGpfQdXANhsioq/2jKwKY8vAH+wEXHYstJ1C3qSVzt6RVtdHi5F7SRVd2yBj1PgYVdONGohgQgkfQGabmwh6Wh5QwacD6smaZ8UaX0EZjErfHLte+viS/zGKT7ikNAMnJl8J3ZSE06hjM/yMTZfrTVlwmpbjVPGayibD4IjD9shQBwi3pSXITaaegTtzZowZ7O1L9b/X0N8XfJuS7LlYQR8pbtg+ROldcB4YVReI5UjtUAMmwDkd3RVZlqXkAT2lczH55LBD4+5D2EZ5GIzanofX7T3kDgB3BVlw==
X-Forefront-Antispam-Report: CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(4022899009)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(10067099003)(18002099003)(22082099003)(13003099007)(4133799003)(3023799007)(4143699003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: JwiPPedxEn45t70aH7GIAgJ9nJ5BO3yo2AmRISZSwCFsoLGwul6qOCb5EBwFlWyPp9MLRxjHOeVJNKQxsCnOPDjiq/jYLVadXkr2JvmsyMEkU7NBzfcsRmbUcLB3RE3DAOxsc+swRsYMHz5Yo3iWhbMaqW6/gDPKipoUVCuAvrxFvgL3DZtWIS/LEbf+iJlH+gjSDf0OyYLDVkdiP9vZq+YlDSlINMwFbS+EhFuxKparugiSUqA8xKoyKDDysm2kF8qmPGCz7x/sHDM9CRMT6CK/tLygN4PKPbFn1z19sE4ZU+qJBSfxdncjRqCNSEliitLgd9kzX5CcpgDqrYiQmwUdgY3EUPs2YQIM7zn/9Lhn+NKk1+EizVcVG9v/LTMsdwjvX+z1fUFYh1pw65wVSvZKil40+QN6f5dnuBF0lVOla+HLOOBnsUcaLDcIhWhS
X-Exchange-RoutingPolicyChecked: 2EHAmihxsq+63RRk44aVZDuR4TzK2F4c/2Z1TNdao18oPx97r6W+dnO5Z6t/ivmJFefK1LuO4BOPaoEJyJckxtQT/8m2Q8O50OSSLMksqdRPgEYqZtK7v/wLR/si1B3TrMxtO43J3ptoNmQC8gs89UBC6xT4dEkwvMVjiJF/EfzWO0TaSJuLQhqfwY6Mb89P0TcOsIDj+Ora6GVgoq13J45zscE/2Hz6xMOpsNqyeITCqfaThScFxL7cV2BH2SCWQDleVENxZBFNE8R/BTMnGuSE19IYyKC+fkzfVt1KMkPcgXMvMgQ7J48ATnDVgQLfqcaXMp4U8RvYUegdKrJHow==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 15:38:07.6156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3adff6a1-421a-49c1-95ae-08df2f894e1d
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0002695C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7247
X-Proofpoint-ORIG-GUID: yhZt0lUEdwDH3XIrhCFuT4Vv8-VuRhGD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MiBTYWx0ZWRfXztsBwdlmaGY7
 /Z6rpcERLOeUp73tnXk+fNCN0BDXjIfer8LwcScbpZEHSvnl9xXkLDHw7pjOHNpCZj3sRcyYYCS
 bF35q9DZOesxzXmRU31lBssuOK/8fCPPT1Lwu2WtLJbk3DAO9AO5WUHKWncO2Ari4hNNaUOpLDc
 0ns4iciFvdtW0JxDIBaXvxHMAv/BbMRonvspxK4SX6oWgvLAA1NbuuMAC9Vbr/wcLrjK2wJmqh0
 l4m6ikTtO7DbhGyosB+W+d7hh2Nt6NIisCl1htu/5l817r0R8RQedOs24fhrvMokJmM2/04sP8j
 +X6h9ziyBWF1UlFoSTO0inKptoK+LZrXwyEqmZjjh7OElTOX8x71FeU170148YIu2/6aU4G1GDS
 CaeJ7/gN/86PkaoK1anYVVCsSF+w7aCuDdha8/7fdBvL9fRuCdID46U62kC0/ekcV4dsoGKMax7
 W91Eh9GQ9G67oFigZJA==
X-Proofpoint-GUID: yhZt0lUEdwDH3XIrhCFuT4Vv8-VuRhGD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MiBTYWx0ZWRfX1eIKSRb0b0hy
 qXmLpfj91NvzB8wn1E8VdnwF5/+zQlx3fJ77/NRxO3kXwMSyr8VHIisjdR1CBwo7SsLcUrkQgFp
 42zr1l8oEjQn4Ks7BUxPw7iNPLsgr/k=
X-Authority-Analysis: v=2.4 cv=dfwVTnXe c=1 sm=1 tr=0 ts=6ad8dc79 cx=c_pps
 a=tYtg4CXWOAG754Cl0Lh34g==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=jwouBfj2j3NM8CExmVVE:22 a=RpNjiQI2AAAA:8 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=7xrci3E1FWPh1qRHYPwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210062
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0b-0002e601.pphosted.com id 69LFSeDs1468327
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 15:38:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20474



On 10/21/2026 6:12 AM, Atharv Dubey via lists.yoctoproject.org wrote:
> Hello Ryan & Denys,
>=20
> I actually forgot to label this patch series for both master & wrynose,=
=20
> Should i send
>=20
> another patch with the wrynose respin tag ?

No, I can apply them there.


> Regards,
> Atharv
>=20
> On 05/10/26 17:42, Atharv Dubey via lists.yoctoproject.org wrote:
>> Add a kernel config fragment enabling dm-verity and its crypto=20
>> dependencies (CONFIG_DM_VERITY, CONFIG_DM_CRYPT, CONFIG_BLK_DEV_DM).=20
>> Applied via KERNEL_CONFIG_FRAGMENTS, which setup-defconfig.=E2=80=8Ain=
c reads=20
>> and merges directly through merge_config.=E2=80=8Ash.=E2=80=8A
>> ZjQcmQRYFpfptBannerStart
>> This message was sent from outside of Texas Instruments.
>> Do not click links or open attachments unless you recognize the source=
=20
>> of this email and know the content is safe.
>> Report=C2=A0Suspicious
>> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!updqPBkBOE07CiZk=
fDODnCz6u-4MvaREVsGIjhhknYZvmYsDHbx0NH2GOz2a703St6SM9xKdTJno3ZkWIzMynIop8=
_VDlYE$>
>> ZjQcmQRYFpfptBannerEnd
>> Add a kernel config fragment enabling dm-verity and its crypto
>> dependencies (CONFIG_DM_VERITY, CONFIG_DM_CRYPT, CONFIG_BLK_DEV_DM).
>> Applied via KERNEL_CONFIG_FRAGMENTS, which setup-defconfig.inc reads
>> and merges directly through merge_config.sh.
>>
>> Gated on DM_VERITY_IMAGE being set, matching the rest of the dm-verity
>> dynamic layer.
>>
>> Signed-off-by: Atharv Dubey<a-dubey@ti.com>
>> ---
>>   .../security-layer/recipes-kernel/linux/files/dm-verity.cfg  | 5 +++=
++
>>   .../recipes-kernel/linux/linux-ti-staging_%.bbappend         | 5 +++=
++
>>   2 files changed, 10 insertions(+)
>>   create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes=
-kernel/linux/files/dm-verity.cfg
>>   create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes=
-kernel/linux/linux-ti-staging_%.bbappend
>>
>> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/=
linux/files/dm-verity.cfg b/meta-ti-bsp/dynamic-layers/security-layer/rec=
ipes-kernel/linux/files/dm-verity.cfg
>> new file mode 100644
>> index 00000000..c50ce403
>> --- /dev/null
>> +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/f=
iles/dm-verity.cfg
>> @@ -0,0 +1,5 @@
>> +CONFIG_MD=3Dy
>> +CONFIG_BLK_DEV_DM=3Dy
>> +CONFIG_DM_CRYPT=3Dy
>> +CONFIG_DM_VERITY=3Dy
>> +CONFIG_CRYPTO_SHA256=3Dy
>> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/=
linux/linux-ti-staging_%.bbappend b/meta-ti-bsp/dynamic-layers/security-l=
ayer/recipes-kernel/linux/linux-ti-staging_%.bbappend
>> new file mode 100644
>> index 00000000..9a380cf6
>> --- /dev/null
>> +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/l=
inux-ti-staging_%.bbappend
>> @@ -0,0 +1,5 @@
>> +# Enable the dm-verity kernel config fragment via KERNEL_CONFIG_FRAGM=
ENTS.
>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
>> +
>> +SRC_URI +=3D"${@'file://dm-verity.cfg' if d.getVar('DM_VERITY_IMAGE')=
 else ''}"
>> +KERNEL_CONFIG_FRAGMENTS +=3D"${@'${UNPACKDIR}/dm-verity.cfg' if d.get=
Var('DM_VERITY_IMAGE') else ''}"
>> --=20
>> 2.34.1
>>
>>
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20468): https://lists.yoctoproject.org/g/meta-ti/me=
ssage/20468
> Mute This Topic: https://lists.yoctoproject.org/mt/121864789/6551054
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [reatmon@ti=
.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS
