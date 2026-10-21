Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8909.1792581196609316104
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2026 04:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=KmCXu4Ct;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=QISqSU9c;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69LA5boa4154034
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 06:13:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=
	content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=gooTBWwHyjIshDh
	exj+EQGjFot2rlgV+fB7e5sCf5E4=; b=KmCXu4CtX0UTo7CMIzB998MBQx4BrzI
	DACbRkZo8Ntd6yFzv+kkGMh0BSTMg+i8dbPuHVsinHvMs/h+1Go5jT9aSVEGs3uI
	B3V0q1lr0oJoPwlNDOa2rrsNgXUrGTwiSZY7ZB/dWY/kqC5tvFeJNlsoRXNmYFwC
	3naRC6QuxaKVxse/xn45SrhQNTWblVADpo5zSa84x+jVZ6fwmUm/k1Ll39QzhBMP
	E+DwG1TDakEvkydc7x39ZKq0oO5FK02cG11/uLwdzsIxGtNQQ6JaNokEL9M2SsxS
	OOrxOmcBROEynfguX8hUaUYvZyCw+x0U8ywOeC01i5uXrhaxvR0fRag==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010008.outbound.protection.outlook.com [40.93.198.8])
	by m0384305.ppops.net (PPS) with ESMTPS id 4hek20aurt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 06:13:15 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NRybE4qkSBhRa4F986xt5+TfhKrU6y8w90vyOmnB48PW3AVseqTZfpMywlWOtQhHzSM2DJoDj1zmErNYTN84nNtqZvk/7ZIlgijA3KSHQnfUAwvI3EZekD5nAIeC2yBG8o/+09sXAz3agVkdhgXEnW8YCFm1qcGpDe7nlVJ43g21kwy7GLNPHWsd2rWKcnNJEWXqQJeSM1MkzqdFqtM66nH4jtG730CY/g6EbdFcKiYTefQZJUdIXCQZSSkwrZMzjK7GKh0RCL72dBQE6b1iB/dcwV+qGDceqPyfM1wIjnx1iJ9dhxpbxZ2RXRjWVC2PHP2YOh9EsyT6Qjjhz7XOmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gooTBWwHyjIshDhexj+EQGjFot2rlgV+fB7e5sCf5E4=;
 b=X1fvApq3n1z7epStkHEtDilcJlg/PS7qlVPsnxAwe07iHQC0bVECCWmThGa+GaAhqx2fidBzSr1uVh3giDIoa5QQjJItMLuN/RIh1jUtzvDWsUN+Vp2hD2nO6r2z22fP0bBZf+stCET2g0SU3xK2zgP6c9ms4NXz890L4ZF4FM5Zg8rPyZJisLDQQR3dTwHHLOpuZ7d6mUpVVKXukgY7fWf32marwYyl7TDYuSP2bkE7tRBfNGtaHFsLDC4G/JqnmVIty3q+6p0o9g9FCn+YPsxm5YOdTQzzV2xYUxLA9o8+fKQ3RhqkTW6ZMoSscK+7e8NEEsACKSnrlfFcM/R6UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gooTBWwHyjIshDhexj+EQGjFot2rlgV+fB7e5sCf5E4=;
 b=QISqSU9cFjIKShWmTUdIb3FI6QotQzlJNiOHFbg7aSgJV6mxNYLBj4gDaznnuzBchyDqQwS+zdHCdt21+p8gxstvA4TjBD1lwdsxc0A4Out4zwZPB6/LV0SpVC/tsbONxxaZ58r1EQZcWd4ez2kZlx5FPqaa05nn6pw16w4J4og=
Received: from CH2PR14CA0019.namprd14.prod.outlook.com (2603:10b6:610:60::29)
 by IA4PR10MB015118.namprd10.prod.outlook.com (2603:10b6:207:112::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 11:13:13 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:610:60:cafe::63) by CH2PR14CA0019.outlook.office365.com
 (2603:10b6:610:60::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.15 via Frontend Transport; Wed,
 21 Oct 2026 11:13:13 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.546.15 via Frontend Transport; Wed, 21 Oct 2026 11:13:12 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 06:12:56 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 06:12:56 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 21 Oct 2026 06:12:56 -0500
Received: from [10.24.50.31] (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69LBCtQG3426486
	for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 06:12:55 -0500
Content-Type: multipart/alternative;
	boundary="------------Po9qAcAKWevyJPc3HccFOc4Y"
Message-ID: <87e161aa-5f44-4697-a155-f72faaef9844@ti.com>
Date: Wed, 21 Oct 2026 16:42:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti][master][PATCH v5 2/3] linux-ti-staging: Add
 dm-verity kernel config
To: <meta-ti@lists.yoctoproject.org>
References: <20261005121218.844998-1-a-dubey@ti.com>
 <18DBA11102702795.1881882@lists.yoctoproject.org>
Content-Language: en-US
From: Atharv Dubey <a-dubey@ti.com>
In-Reply-To: <18DBA11102702795.1881882@lists.yoctoproject.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|IA4PR10MB015118:EE_
X-MS-Office365-Filtering-Correlation-Id: 486af96a-b369-4687-d580-08df2f644c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|4022899009|82310400026|13003099007|56012099006|261019141927099003|4143699003|261019150727099003|261019143827099003|261009223027099003|261019132127099003|10067099003|18002099003|22082099003|8096899003|4133799003|3023799007;
X-Microsoft-Antispam-Message-Info: arj/URuj8nrZurTkySH6I3OAFjGSpuJcfAGer2O5NBUsjIKhlPXGeeioptmqoq6f+pVJaFGco7994qCCVvaarthaS9rWrWVtHQqOxwvb5LhyHBcjMUOGKngF9H3ztNlhlycfT2pNUYTeyXqP4dae9DeM1iQxT/E1gAPWlGPJG2+iZ5oN9+xMpYr3/OkBVxoyWmhvhnEhLw3De+J/r9Qfx/8o12DYECoEmnZFdzBMWlVk0dPhoWv4+wudngnc8IDOMfpvR8/RS1vySZCK0UMyWNLq5f0PMZkAFO7d0kJ5xmR03nLQjpUP9sFmaNpYtsw1OBGJbNJLQPosuW+muyQpl0cipwzbddsnhzJWN1+CCErTyu+ELHfI9K94zcN2Kax//GiCobbCYIBYpgWrHzFBxUMTxowyBHNDOXK9w1/GrkI6Aua0nNfKrhAo2NC3cIwq0KHsSpTbHUJwGaVVvgfgSBd8w1fBmy7JkGti/+cdLbLeZMLy0eWRQB+aBXdpXAx3SBm85Z5N5lsjtOqn2ZnCccf9WqxgmeTscnH9xBNFBLHDCE15lIV7JvxPnpYcVtJxDiYDh8+EER3yFru67hJZyghWldL4OErfnuJPxrhYMnNDLElrU8Vi1iijfy33Sve7kleg5ABhdmVDs/FYA/HWAg==
X-Forefront-Antispam-Report: CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(4022899009)(82310400026)(13003099007)(56012099006)(261019141927099003)(4143699003)(261019150727099003)(261019143827099003)(261009223027099003)(261019132127099003)(10067099003)(18002099003)(22082099003)(8096899003)(4133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: G2eVdemBpAfi92IXnWs+6BeNkwA8DXUaKZBTV9DhS1RlDrpFgrO1n2dAM5xVkX14/rpw/+rZs636hMl61p6N3fE8oduxWbFVQK5ZIXJ4TU3zjPMpOabnHPeFuZxeXf4sPAUic0mo+OumPRvky/bZSpnPY8zMcqdNfZhPEUouedWDIRowyqljFCPKHlFzjYT7CoWFzchZA2fifYgiSDjFLWqfgEyDthZQOWzFg++nQIGmNfN4sPOKJMWO7y7898mgdw++I3Yx+H1qonTyMGo5TUC6wg+fjMARBdo4+qaNxSBdT5sgUjhVX7q3uqXPcF6FMj8zJqv2kjiJ8wml+tSqXkUyWeW90pjeENRvP9iHWBCRkaAUlgEp5oL/UOBokKiixkiZoeP/TNkh+HEsBspLk1k78rFL92lM9IIm5QMM+guGcDv4rFL898cDkxOoHSHT
X-Exchange-RoutingPolicyChecked: FqJErnVaDSGz3VnYWuH8FpidV7yZBSV/dog+DbHPuGepKLIJlxr2u1ZjbrU8R5oqhGv60Z+7aNYd9AZhUnIHD5SL/gVleoe3qBufXyzhHjrm+M8MiwpmBF0xeUjxORsF3K11gzFDB89gXdrV4CYBVAuYhdkZELbghe1kHoTRv32v6E1BA+Oi0td+v8O4rXP87gybp8Lcc3BzVPaISLWZ1oYQpaK9XON//HSdEsXxR3LBEN6v/mNv1YsHDvaVOVxA25TmufyL2Fo22/gjUzX7sqZG9pON5m3AfVkaaKhb7SE4CpHXnAJA76fjSxSvGCsVDTUAfapQkjN2IWMwYrCgPA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 11:13:12.8860
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 486af96a-b369-4687-d580-08df2f644c1c
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR10MB015118
X-Proofpoint-ORIG-GUID: EOjwY5DN7gZsy4JtZbRZ5KM12KZOG19b
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NCBTYWx0ZWRfX49Le7S1dKm9n
 GLAhH/0jVexSUH1k6sZCASoE9HFrXpfp+UVjFh7Tmkdf3R8TPKNQMliBsNkS4FQMti9J8uumVBg
 ij90u8HERMOHqPe5THyBrlein1Kn2wg=
X-Proofpoint-GUID: EOjwY5DN7gZsy4JtZbRZ5KM12KZOG19b
X-Authority-Analysis: v=2.4 cv=B98sQ+tM c=1 sm=1 tr=0 ts=6ad89e4b cx=c_pps
 a=ugQZG2M6WJJQC2vHgpB33g==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=s63m1ICgrNkA:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=RpNjiQI2AAAA:8 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8
 a=l-FpZsfA8ci2J97Nj-8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GxsqYsRrw6v5Xmy0H-UA:9 a=tqdMzFhGG8mD8GCBlf4leDhY3gs=:19
 a=sTxRpBpiy98KL1WkT8X2XIWo+SM=:19 a=XGRjkYF-ilSHXA6U:21 a=_W_S_7VecoQA:10
 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NCBTYWx0ZWRfX8ch7IYvUmEcD
 H9SgL0vaPal5bcf7LXIpdqIan61uLev6P8pAfWuszSbarHk1yYzYZNcZizCIs3h6KZAKM5H2v5W
 7+wpuAwGLhVmwD/VzYoV3XOoKr21dk+qFWMMrWB7MnuO/o4o53QxG72XOPm7stLJKoHT8IQxyuu
 o8N4frc10kt2PYoFfh4FTX2S9xbzUJ52FPn96ItnbrtHypIvt8XEjlwDAF7boY1i8jeDPVcjvkd
 n5w4IvPkhBIHq/dDW14sWnqbnRTgovYkrg+dzqI8QyZ2OYM9JkMPnJyu5dGT3szZyf3NTbMdTlZ
 +/CupzfQE6QFnx/rd+kp4SZIO0VJ+AlKbJDh5eyUEx/4w13EclYF5KYIMqBLIufnaYgy4zVNcyV
 WJkfJjWLDR/kbooAUnx5ZWxMvFTB+9YnJUYsnrLqbTinenu3KZMeIBBW87GP5sUoTdalut8VIUv
 OrAssjKIbsq6/xT+lqQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210044
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-ti@lists.yoctoproject.org>; Wed, 21 Oct 2026 11:13:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20468

--------------Po9qAcAKWevyJPc3HccFOc4Y
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0384305.ppops.net id 69LA5boa4154034

Hello Ryan & Denys,

I actually forgot to label this patch series for both master & wrynose,=20
Should i send

another patch with the wrynose respin tag ?

Regards,
Atharv

On 05/10/26 17:42, Atharv Dubey via lists.yoctoproject.org wrote:
> Add a kernel config fragment enabling dm-verity and its crypto=20
> dependencies (CONFIG_DM_VERITY, CONFIG_DM_CRYPT, CONFIG_BLK_DEV_DM).=20
> Applied via KERNEL_CONFIG_FRAGMENTS, which setup-defconfig.=E2=80=8Ainc=
 reads=20
> and merges directly through merge_config.=E2=80=8Ash.=E2=80=8A
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!updqPBkBOE07CiZkf=
DODnCz6u-4MvaREVsGIjhhknYZvmYsDHbx0NH2GOz2a703St6SM9xKdTJno3ZkWIzMynIop8_=
VDlYE$>=20
>
> ZjQcmQRYFpfptBannerEnd
> Add a kernel config fragment enabling dm-verity and its crypto
> dependencies (CONFIG_DM_VERITY, CONFIG_DM_CRYPT, CONFIG_BLK_DEV_DM).
> Applied via KERNEL_CONFIG_FRAGMENTS, which setup-defconfig.inc reads
> and merges directly through merge_config.sh.
>
> Gated on DM_VERITY_IMAGE being set, matching the rest of the dm-verity
> dynamic layer.
>
> Signed-off-by: Atharv Dubey<a-dubey@ti.com>
> ---
>   .../security-layer/recipes-kernel/linux/files/dm-verity.cfg  | 5 ++++=
+
>   .../recipes-kernel/linux/linux-ti-staging_%.bbappend         | 5 ++++=
+
>   2 files changed, 10 insertions(+)
>   create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-=
kernel/linux/files/dm-verity.cfg
>   create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-=
kernel/linux/linux-ti-staging_%.bbappend
>
> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/l=
inux/files/dm-verity.cfg b/meta-ti-bsp/dynamic-layers/security-layer/reci=
pes-kernel/linux/files/dm-verity.cfg
> new file mode 100644
> index 00000000..c50ce403
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/fi=
les/dm-verity.cfg
> @@ -0,0 +1,5 @@
> +CONFIG_MD=3Dy
> +CONFIG_BLK_DEV_DM=3Dy
> +CONFIG_DM_CRYPT=3Dy
> +CONFIG_DM_VERITY=3Dy
> +CONFIG_CRYPTO_SHA256=3Dy
> diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/l=
inux/linux-ti-staging_%.bbappend b/meta-ti-bsp/dynamic-layers/security-la=
yer/recipes-kernel/linux/linux-ti-staging_%.bbappend
> new file mode 100644
> index 00000000..9a380cf6
> --- /dev/null
> +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/li=
nux-ti-staging_%.bbappend
> @@ -0,0 +1,5 @@
> +# Enable the dm-verity kernel config fragment via KERNEL_CONFIG_FRAGME=
NTS.
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
> +
> +SRC_URI +=3D"${@'file://dm-verity.cfg' if d.getVar('DM_VERITY_IMAGE') =
else ''}"
> +KERNEL_CONFIG_FRAGMENTS +=3D"${@'${UNPACKDIR}/dm-verity.cfg' if d.getV=
ar('DM_VERITY_IMAGE') else ''}"
> --=20
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#20433):https://urldefense.com/v3/__https://lists.yo=
ctoproject.org/g/meta-ti/message/20433__;!!G3vK!TUzKwpPbPsnuozBIxf9XIbdo_=
pRqSEA1VS7CG6AbY8HsovuLTFbzgGB9dHI9dZojHMn26Ns6AsKV3tiu5vymX2htRJAjDvJp$=20
> Mute This Topic:https://urldefense.com/v3/__https://lists.yoctoproject.=
org/mt/121589866/10595936__;!!G3vK!TUzKwpPbPsnuozBIxf9XIbdo_pRqSEA1VS7CG6=
AbY8HsovuLTFbzgGB9dHI9dZojHMn26Ns6AsKV3tiu5vymX2htRFkKduO3$=20
> Group Owner:meta-ti+owner@lists.yoctoproject.org
> Unsubscribe:https://urldefense.com/v3/__https://lists.yoctoproject.org/=
g/meta-ti/unsub__;!!G3vK!TUzKwpPbPsnuozBIxf9XIbdo_pRqSEA1VS7CG6AbY8HsovuL=
TFbzgGB9dHI9dZojHMn26Ns6AsKV3tiu5vymX2htRIMmVjE0$  [a-dubey@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------Po9qAcAKWevyJPc3HccFOc4Y
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0384305.ppops.net id 69LA5boa4154034

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
    <title>Re: [EXTERNAL] [meta-ti][master][PATCH v5 2/3]
      linux-ti-staging: Add dm-verity kernel config</title>
  </head>
  <body>
    <p>Hello Ryan &amp; Denys,=C2=A0=C2=A0<br>
      <br>
      I actually forgot to label this patch series for both master &amp;
      wrynose, Should i send=C2=A0</p>
    <p>another patch with the wrynose respin tag ?=C2=A0=C2=A0<br>
      <br>
      Regards,=C2=A0<br>
      Atharv</p>
    <div class=3D"moz-cite-prefix">On 05/10/26 17:42, Atharv Dubey via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:18DBA11102702795.1881882@lists.yoctoproject.org">
      <!-- BaNnErBlUrFlE-BoDy-start -->
      <!-- Preheader Text : BEGIN -->
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;max-height:0px;opacity:0;=
overflow:hidden;">
        Add a kernel config fragment enabling dm-verity and its crypto
        dependencies (CONFIG_DM_VERITY, CONFIG_DM_CRYPT,
        CONFIG_BLK_DEV_DM). Applied via KERNEL_CONFIG_FRAGMENTS, which
        setup-defconfig.=E2=80=8Ainc reads and merges directly through
        merge_config.=E2=80=8Ash.=E2=80=8A</div>
      <!-- Preheader Text : END -->
      <!-- Email Banner : BEGIN -->
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;max-height:0px;opacity:0;=
overflow:hidden;">ZjQcmQRYFpfptBannerStart</div>
      <!--[if ((ie)|(mso))]>
  <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" width=3D"100%" =
style=3D"padding: 0px 0px 10px 0px; direction: ltr" lang=3D"en"><tr><td>
    <table border=3D"0" cellspacing=3D"0" cellpadding=3D"0" style=3D"padd=
ing: 0px 8px 6px 8px; width: 100%; border-radius:4px; border-top:4px soli=
d #90a4ae;background-color:#d0d8dc;"><tr><td valign=3D"top">
      <table align=3D"left" border=3D"0" cellspacing=3D"0" cellpadding=3D=
"0" style=3D"padding: 0px 8px 4px 8px; font-size: 12px; line-height: 16px=
">
	<tr><td style=3D"color:#000000; font-family: 'Arial', sans-serif; font-w=
eight:bold; font-size:14px; line-height: 20px; direction: ltr">
	  This message was sent from outside of Texas Instruments.
	</td></tr>
	<tr><td style=3D"color:#000000; font-weight:normal; font-family: 'Arial'=
, sans-serif; font-size:12px; direction: ltr">
          Do not click links or open attachments unless you recognize the=
 source of this email and know the content is safe.
	</td></tr>

      </table>
      <![if ie]><br clear=3D"all"><![endif]>
      <table align=3D"right" border=3D"0" cellspacing=3D"0" cellpadding=3D=
"0" style=3D"padding: 0px 0px 4px 0px; font-size: 14px; line-height: 36px=
"><tr>
	<td style=3D"direction: ltr">&nbsp;&nbsp;<a target=3D"_blank" href=3D"ht=
tps://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!updqPBkBOE07CiZkfDODnC=
z6u-4MvaREVsGIjhhknYZvmYsDHbx0NH2GOz2a703St6SM9xKdTJno3ZkWIzMynIop8_VDlYE=
$" style=3D"mso-padding-alt: 7px; padding: 7px; border-radius: 2px; borde=
r: 1px solid #666666; "><strong style=3D"font-weight: normal; color: #000=
000; text-decoration: none; font-family: 'Arial', sans-serif; font-size: =
14px;">&nbsp;&nbsp;Report&nbsp;Suspicious&nbsp;&nbsp;</strong></a>&nbsp;&=
nbsp;&zwnj; </td>
      </tr></table>
    </td></tr></table>
  </td></tr></table>
<![endif]-->
      <!--[if !((ie)|(mso))]-->
      <div dir=3D"ltr" lang=3D"en" id=3D"pfptBannerlt9wnjr"
style=3D"all: revert !important; display:block !important; text-align: le=
ft !important; margin: 0 0 10px 0 !important; padding:7px 16px 8px 16px !=
important; border-radius: 4px !important; min-width: 200px !important; ba=
ckground-color: #d0d8dc !important; background-color: #d0d8dc; border-top=
: 4px solid #90a4ae !important; border-top: 4px solid #90a4ae;">
        <div id=3D"pfptBannerlt9wnjr"
style=3D"all: unset !important; float:left !important; display:block !imp=
ortant; margin: 1px 0 1px 0 !important; max-width: 600px !important;">
          <div id=3D"pfptBannerlt9wnjr"
style=3D"all: unset !important; display:block !important; visibility: vis=
ible !important; background-color: #d0d8dc !important; color:#000000 !imp=
ortant; color:#000000; font-family: 'Arial', sans-serif !important; font-=
family: 'Arial', sans-serif; font-weight:bold !important; font-weight:bol=
d; font-size:14px !important; line-height:1.29 !important; line-height:1.=
29">
            This message was sent from outside of Texas Instruments. </di=
v>
          <div id=3D"pfptBannerlt9wnjr"
style=3D"all: unset !important; display:block !important; visibility: vis=
ible !important; background-color: #d0d8dc !important; color:#000000 !imp=
ortant; color:#000000; font-weight:normal; font-family: 'Arial', sans-ser=
if !important; font-family: 'Arial', sans-serif; font-size:12px !importan=
t; line-height:1.5 !important; line-height:1.5; margin-top:2px !important=
;">
            Do not click links or open attachments unless you recognize
            the source of this email and know the content is safe. </div>
        </div>
        <div id=3D"pfptBannerlt9wnjr"
style=3D"all: unset !important; float: right !important; display: block !=
important; display: block; margin-left: 16px !important; margin-top: 1px =
!important; text-align: right !important; width: fit-content !important; =
font-size: 12px !important">
          <a id=3D"pfptBannerlt9wnjr"
href=3D"https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!updqPBkBOE07=
CiZkfDODnCz6u-4MvaREVsGIjhhknYZvmYsDHbx0NH2GOz2a703St6SM9xKdTJno3ZkWIzMyn=
Iop8_VDlYE$"
style=3D"all: unset !important; display: inline-block !important; text-de=
coration: none"
            moz-do-not-send=3D"true">
            <div class=3D"pfptPrimaryButtonlt9wnjr"
style=3D"display: inline-block !important; display: inline-block; visibil=
ity: visible !important; opacity: 1 !important; color: #000000 !important=
; color: #000000; font-family: 'Arial', sans-serif !important; font-famil=
y: 'Arial', sans-serif; font-size: 14px !important;  font-weight: normal =
!important; text-decoration: none !important; border-radius: 2px !importa=
nt; margin-top: 3px !important; margin-bottom: 3px !important; margin-lef=
t: 16px !important; padding: 7.5px 16px !important; white-space: nowrap !=
important; width: fit-content !important;
	border: 1px solid #666666"> Report=C2=A0Suspicious </div>
          </a> </div>
        <div
style=3D"clear: both !important; display: block !important; visibility: h=
idden !important; line-height: 0 !important; font-size: 0.01px !important=
; height: 0px">=C2=A0</div>
      </div>
      <!--[endif]-->
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;max-height:0px;opacity:0;=
overflow:hidden;">ZjQcmQRYFpfptBannerEnd</div>
      <!-- Email Banner : END -->
      <!-- BaNnErBlUrFlE-BoDy-end -->
      <!-- BaNnErBlUrFlE-HeAdEr-start -->
      <style>#pfptBannerlt9wnjr { all: revert !important; display: block =
!important;
    visibility: visible !important; opacity: 1 !important;
    background-color: #d0d8dc !important;
    max-width: none !important; max-height: none !important }.pfptPrimary=
Buttonlt9wnjr:hover, .pfptPrimaryButtonlt9wnjr:focus {
    background-color: #b4c1c7 !important; }.pfptPrimaryButtonlt9wnjr:acti=
ve {
    background-color: #90a4ae !important; }html:root, html:root>body { al=
l: revert !important; display: block !important;
    visibility: visible !important; opacity: 1 !important; }</style>
      <!-- BaNnErBlUrFlE-HeAdEr-end -->
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">Add a kernel config fragment enabling dm-verity a=
nd its crypto
dependencies (CONFIG_DM_VERITY, CONFIG_DM_CRYPT, CONFIG_BLK_DEV_DM).
Applied via KERNEL_CONFIG_FRAGMENTS, which setup-defconfig.inc reads
and merges directly through merge_config.sh.

Gated on DM_VERITY_IMAGE being set, matching the rest of the dm-verity
dynamic layer.

Signed-off-by: Atharv Dubey <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:a-dubey@ti.com">&lt;a-dubey@ti.com&gt;</a>
---
 .../security-layer/recipes-kernel/linux/files/dm-verity.cfg  | 5 +++++
 .../recipes-kernel/linux/linux-ti-staging_%.bbappend         | 5 +++++
 2 files changed, 10 insertions(+)
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-ker=
nel/linux/files/dm-verity.cfg
 create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes-ker=
nel/linux/linux-ti-staging_%.bbappend

diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/lin=
ux/files/dm-verity.cfg b/meta-ti-bsp/dynamic-layers/security-layer/recipe=
s-kernel/linux/files/dm-verity.cfg
new file mode 100644
index 00000000..c50ce403
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/file=
s/dm-verity.cfg
@@ -0,0 +1,5 @@
+CONFIG_MD=3Dy
+CONFIG_BLK_DEV_DM=3Dy
+CONFIG_DM_CRYPT=3Dy
+CONFIG_DM_VERITY=3Dy
+CONFIG_CRYPTO_SHA256=3Dy
diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/lin=
ux/linux-ti-staging_%.bbappend b/meta-ti-bsp/dynamic-layers/security-laye=
r/recipes-kernel/linux/linux-ti-staging_%.bbappend
new file mode 100644
index 00000000..9a380cf6
--- /dev/null
+++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-kernel/linux/linu=
x-ti-staging_%.bbappend
@@ -0,0 +1,5 @@
+# Enable the dm-verity kernel config fragment via KERNEL_CONFIG_FRAGMENT=
S.
+FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+
+SRC_URI +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:${@'file:=
//dm-verity.cfg'ifd.getVar('DM_VERITY_IMAGE')else''}">"${@'file://dm-veri=
ty.cfg' if d.getVar('DM_VERITY_IMAGE') else ''}"</a>
+KERNEL_CONFIG_FRAGMENTS +=3D <a class=3D"moz-txt-link-rfc2396E" href=3D"=
mailto:${@'${UNPACKDIR}/dm-verity.cfg'ifd.getVar('DM_VERITY_IMAGE')else''=
}">"${@'${UNPACKDIR}/dm-verity.cfg' if d.getVar('DM_VERITY_IMAGE') else '=
'}"</a>
--=20
2.34.1

</pre>
      <br>
      <fieldset class=3D"moz-mime-attachment-header"></fieldset>
      <pre wrap=3D"" class=3D"moz-quote-pre">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#20433): <a class=3D"moz-txt-link-freetext" href=3D"ht=
tps://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti/messag=
e/20433__;!!G3vK!TUzKwpPbPsnuozBIxf9XIbdo_pRqSEA1VS7CG6AbY8HsovuLTFbzgGB9=
dHI9dZojHMn26Ns6AsKV3tiu5vymX2htRJAjDvJp$">https://urldefense.com/v3/__ht=
tps://lists.yoctoproject.org/g/meta-ti/message/20433__;!!G3vK!TUzKwpPbPsn=
uozBIxf9XIbdo_pRqSEA1VS7CG6AbY8HsovuLTFbzgGB9dHI9dZojHMn26Ns6AsKV3tiu5vym=
X2htRJAjDvJp$</a>=20
Mute This Topic: <a class=3D"moz-txt-link-freetext" href=3D"https://urlde=
fense.com/v3/__https://lists.yoctoproject.org/mt/121589866/10595936__;!!G=
3vK!TUzKwpPbPsnuozBIxf9XIbdo_pRqSEA1VS7CG6AbY8HsovuLTFbzgGB9dHI9dZojHMn26=
Ns6AsKV3tiu5vymX2htRFkKduO3$">https://urldefense.com/v3/__https://lists.y=
octoproject.org/mt/121589866/10595936__;!!G3vK!TUzKwpPbPsnuozBIxf9XIbdo_p=
RqSEA1VS7CG6AbY8HsovuLTFbzgGB9dHI9dZojHMn26Ns6AsKV3tiu5vymX2htRFkKduO3$</=
a>=20
Group Owner: <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:meta-ti=
+owner@lists.yoctoproject.org">meta-ti+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class=3D"moz-txt-link-freetext" href=3D"https://urldefens=
e.com/v3/__https://lists.yoctoproject.org/g/meta-ti/unsub__;!!G3vK!TUzKwp=
PbPsnuozBIxf9XIbdo_pRqSEA1VS7CG6AbY8HsovuLTFbzgGB9dHI9dZojHMn26Ns6AsKV3ti=
u5vymX2htRIMmVjE0$">https://urldefense.com/v3/__https://lists.yoctoprojec=
t.org/g/meta-ti/unsub__;!!G3vK!TUzKwpPbPsnuozBIxf9XIbdo_pRqSEA1VS7CG6AbY8=
HsovuLTFbzgGB9dHI9dZojHMn26Ns6AsKV3tiu5vymX2htRIMmVjE0$</a>  [<a class=3D=
"moz-txt-link-abbreviated" href=3D"mailto:a-dubey@ti.com">a-dubey@ti.com<=
/a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
    </blockquote>
  </body>
</html>

--------------Po9qAcAKWevyJPc3HccFOc4Y--
