Return-Path: <a-dubey@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1EACA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 08:07:14 +0000 (UTC)
Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6327.1790842031758209337
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 01 Oct 2026 01:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=proofpoint-05-2026 header.b=U0xFm72D;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ticloud.onmicrosoft.com header.s=selector1-ticloud-onmicrosoft-com header.b=a3S+tDQG;
 spf=pass (domain: ti.com, ip: 148.163.150.75, mailfrom: a-dubey@ti.com)
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69170h0R1569758;
	Thu, 1 Oct 2026 03:07:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=tdEEkcm5Kl9twWp
	o9ok+pXavM11b191qHHBzK2dezhk=; b=U0xFm72Df8QrCAt1g2pGLgYzR3ilHX5
	L1CiwfiQQvak4lB2gQVzC1BfWEVXxavqJJK2HJ51DNPWfGe2RIZU3MqVSspr0BPt
	jlnjbdTjLNa5cDzQ84AuokXviBZcvZCnqYInTmANQy/j4WeRmHQHIupEj6OgsP6l
	zyevjWITqukObHI5WbQ5hn3oDeqa68SBOvNbYc91GwYDZjTR3sQiehGMoDdHSnU8
	SWKTR65zrWUEMjKSPnGV0g7kfrFCf1VIgnGaGGej8o1+2i7Y1Vxp+BrLx+iVBDHS
	JW7MI5/CV+c/lAg8HzFt/Vfbl4sFCyNIAU9fK4rus/kVlUWDx/30Eaw==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012018.outbound.protection.outlook.com [40.107.200.18])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s26hkd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 03:07:06 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SC80kNQ+qGCUAykfT5dkBi9W5Y0XDWrgDimdlXUR2v+vf+0wgo4d2RZyPG35v4tAfjm5JlOpHL91sNnMQ8NQV9fkeRd+wThrR5Mo7mETidklCkZxnLfHOk40Lec472ppe2Z7ynHJPp5ZpNMQ6akfev68loNemJwyDjsNCR3bO2QNOe+5ycFa9aNK122L7VpbXc9Qqq3J211qx14pyQLcPJBSjgLHF+COU4Pi8jHdw8yBEhPY6H8vMs2POHZ9dDPW3ahbBI4kmHJbPm/EnZKyUhGre3146vMgqSgfOQ8v+3/RyaXB3f5NkLzaUDCQaXOunidUOpYF0h3csp9rQRyzEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdEEkcm5Kl9twWpo9ok+pXavM11b191qHHBzK2dezhk=;
 b=T2m49de/P+WFrblzUUWx4t0rfOjAmSMYAwuGvXgB8JC7Qz3So7lLQPhj1SidEwtPiFXik3IgacsbDETOMxloU0KVm5clJ//Rridkb+HNUeHWRqpToZm+feA0q6ReoAlASCkChiga8BzG+UdoHH63L/BtFim3/sEt8OYYhbobowq1VRdugCy/VA0FWgq/WFCJXOj0zEuuDaHYChUamz8BX+7/BNONvrCp6+i4xh+MxynawFL36JF86BLhQmJNZzxity+eeYPkele9YV3XTdQKN38x6ldzyxI5FwZ7pm45ZjFZgQ/2+BgX5pQFlUPtOe8S2fIpD0v7RY0+jt1Dfc787g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdEEkcm5Kl9twWpo9ok+pXavM11b191qHHBzK2dezhk=;
 b=a3S+tDQGuGsc28wIpQXF4s1ZwbnM99OqDKnP5iFj49MrdlclvB98ydBAY2dPvSyWg9Rmi6+HXY+C+zuJsHH72F1xkrLI8l+ROzZoy7xop3hQvnaZXX1D5X7ZY5b7Bsm1wAZR++vIckunc+IfRSHTB9Z23SyYXBWJqEumIfLWeCg=
Received: from DS1PR07CA0018.namprd07.prod.outlook.com (2603:10b6:8:44d::13)
 by DS7PR10MB5070.namprd10.prod.outlook.com (2603:10b6:5:3a7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.12; Thu, 1 Oct
 2026 08:07:02 +0000
Received: from DM2PEPF00003FC4.namprd04.prod.outlook.com
 (2603:10b6:8:44d:cafe::8e) by DS1PR07CA0018.outlook.office365.com
 (2603:10b6:8:44d::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.17 via Frontend Transport; Thu, 1
 Oct 2026 08:07:02 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 DM2PEPF00003FC4.mail.protection.outlook.com (10.167.23.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 08:07:01 +0000
Received: from DFLE202.ent.ti.com (10.64.6.60) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:06:31 -0500
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 03:06:30 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 03:06:30 -0500
Received: from [10.24.50.31] (lalit-ti-241.dhcp.ti.com [10.24.50.31])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 69186SSF1516925;
	Thu, 1 Oct 2026 03:06:28 -0500
Content-Type: multipart/alternative;
	boundary="------------8j690ByKu4087aXbiT2L7A4d"
Message-ID: <e0af0bf9-3348-4bd7-82cc-9b110657bc6d@ti.com>
Date: Thu, 1 Oct 2026 13:36:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-ti][master][PATCH v4 1/3]
 dm-verity-upstream: Add dynamic layer for meta-security dm-verity
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, <reatmon@ti.com>, <denys@konsulko.com>,
        <a-limaye@ti.com>, <u-kumar1@ti.com>, <m-chawdhry@ti.com>
References: <20260930125938.95629-1-a-dubey@ti.com>
 <20260930162209.GI4190@denix.org>
Content-Language: en-US
From: Atharv Dubey <a-dubey@ti.com>
In-Reply-To: <20260930162209.GI4190@denix.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM2PEPF00003FC4:EE_|DS7PR10MB5070:EE_
X-MS-Office365-Filtering-Correlation-Id: ab16867d-2e92-4fba-2533-08df1f92f8fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|13003099007|4143699003|6133799003|3023799007|10067099003|56012099006|5023799004|8096899003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	QjOmXpSPt/e5M2lKdUBtZiljw7o5qE1NMc/O8yPGj43jIwjrUUc2mZmxuHunb/8JVHIECDyYV9mAYBZnLwpdNHO9bE2fSy3gTkbBl6uzFkDj2qvYa2PEYJotc4vtVxKDmDgwh1XkIG1N6iaXjBaWLf9eJL0c1Sqk7++K2T57OktVVFdQddZ6CBCgXrNtx5tKcP6yrkE9dKSEiCoiOvlYE/McNgxi77aCrn7rEPAGBvRJ413KJrxIF9igbgxD8KJc8wvdvs7miIn97X9nkE7ANr0dT15eXUobd6a0y7hsja27/RQQTHZVv4+my3GiAbFr4iWl7wd45psRfT2n2L57XLeyJM//k5RmfpAbnNdgxY7Jrj4JWkAqMzho/ertLJrVyunN1O9tYmfdXuccTFmkIvqZbPB1JAo+OIL2QvuqsSVlzckVmZlmD2lVuuWSspPxANiAfpUdwT+eYg7CS8FVb/xD0V5XaqmCNhq1rkqYbzFdhsUkACo4nkDb1Wgq5t1Nz+DUhR1Dm7i7lTIM+/EdTUBDrih9jzKgXNGiItcdxzyFK/XaXEHD8mbo/ejxygOSSG+6jX7+AR8h9r0EMQ11DjwwemI3rgOyAAvGfp4yxWcVuo7uRJ/t15KD6pO0G+GdfFSE02K5Y5tpshu7xXrkUA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(13003099007)(4143699003)(6133799003)(3023799007)(10067099003)(56012099006)(5023799004)(8096899003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	FUP+DkuDiVv7UhSS3yDCzU4ozDKl/+daFwlU8nof5kMEBtl1snhjEZO1xZBFyk3lx6rlhgNmW3NZE5nnhffZOr3Ok6wSlT1g2Kle/bnEiojolX0kEwn0Lk9MZ5dSY5uawDZRK9y+uhsGYvFlupr2nKwanjWA9F0AML0YxYN+J2qXG7493HrXLZa8iJyHNhvextxL+Xgxz83AsWIarQy9mk1MLMlu6pQnX1Wzli/RYSXe+QXc3BTZfIqcWGq4rqO/Pfh0txf7tm6S+Dp7kcpc1CRukC1qX+QeqGF6SbH8RSIxl3DnqNFY4wJhGBeoumelQOWm3on53cZetxsRK/866Ofta5c5ZQLe6J7kxZDc/2PibcMoT1wmOjrmT+y4CLVbq5pBjKbpVxBMqx5lMMPtC1S3Y0tzh7w+Pr6lDlg21qQdQgqB2iTdICektu+DxHFk
X-Exchange-RoutingPolicyChecked: 
	EYba52rXRDmRn3ywfKZZ9dJSSGZEKl0qn6iVOfhnSMtf9kvbH/kAT2GOakgWKUYMYxOA/0mPfLmd/FlyNkSu34u6tysczq+lB0c2PxwraVgnnJc46xgom0A1f0ROKZlC5Hz7w2sgl0MinGEWQdJCgF61cxHywa41i0IuFq/4aqE+mXN/QKSwBIiVxjmX57KApisz9Ts+Nl+anvvzP/2x4MDRl5jK1r+xIg9jCvG7iOwgXskyVtJ6+ynCxrYu46j6HTvtJZ0Vya4sc+KcYNw4i3kQqT3jv7qgIrcxSzkIPCmGxT1Xd2b/uITDNbJxTPLi/4da5XK1Xp8EkBBBRgzGNA==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 08:07:01.1772
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab16867d-2e92-4fba-2533-08df1f92f8fa
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM2PEPF00003FC4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB5070
X-Proofpoint-GUID: vFaD8zPok9G_lkvUnngJpL7qtns1A9IV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfXxKdqwXIIvx82
 BVO8C3ux0ecZ5/egV0YL6rGwyMoy24OFf35iU83F8cVBJpSoS/9w/WT8EbGip6dYok+Hpyij5Vt
 JSIiKpyIc2Rb5pVLoJ+4GPRYpRNX+zwM7UbVOudI8WYMYjtYzQW38J5o/2X7HmaosnwW5CitMhK
 Oqp6IQGU/25tWTsS+du5plx1MEhh+sfnHTJGWmE5FqtNCesRkOsatbOGB9l1Mr0Cgzhh9+Ega5+
 A3ASV3UaDvVZlfdFGaUbVb7RnFOB4Ea9VzEY/9RJq+Dr8zSLrZrt9ndoqhLYAfFLGDkPYiyBU/+
 itrlVrenwluMFLgA94J0q7hL9wgKj8RF9g7TtM3AUjryKtPPdBSAejxHialBrTW9MqVKafMobtF
 WxOISJH092VpJSWLFR8cuFEgEY12zTowucSY4P8PELGBEIjCbRUVCYLsMBCW//iozzK4XC2E3ri
 aSiVlZ7Wpf9tLA+N9QQ==
X-Proofpoint-ORIG-GUID: vFaD8zPok9G_lkvUnngJpL7qtns1A9IV
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abe14aa cx=c_pps
 a=73h/HchST80NzqUzJRdbyQ==:117 a=iwqwCZQqcuTv3JOpYdM7/Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=660iZSQnnn4A:10 a=AlMIdn_sM9wA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22
 a=RpNjiQI2AAAA:8 a=iGHA9ds3AAAA:8 a=sozttTNsAAAA:8 a=U4ROjGcRHx_IwCQLhFMA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=0gcC27t9AAAA:8 a=ez0CIMpcYov51TXjfkMA:9
 a=tqdMzFhGG8mD8GCBlf4leDhY3gs=:19 a=sTxRpBpiy98KL1WkT8X2XIWo+SM=:19
 a=368RLfB9EPscNW4c:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=f5sM90hAhNS9OGT-JDKn:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX3nbwnv2ZKBW5
 ObHJBiC4atgbZzZfKsdejYtNUvYGiV8ohxNsH19sCpKg+c0vQXssq4moBXZ+n0HbVyvatEMptVs
 yoCgQBdY0+DdixsdJsqUVPjz0CNEWRw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010032
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 01 Oct 2026 08:07:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20428

--------------8j690ByKu4087aXbiT2L7A4d
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0384305.ppops.net id 69170h0R1569758

Hi Denys,

On 30/09/26 21:52, Denys Dmytriyenko wrote:
> On Wed, Sep 30, 2026 at 06:=E2=80=8A29:=E2=80=8A36PM +0530, Atharv Dube=
y via=20
> lists.=E2=80=8Ayoctoproject.=E2=80=8Aorg wrote: > Add an optional dynam=
ic layer=20
> enabling dm-verity block-level integrity > verification of the root=20
> filesystem for TI K3 platforms, using > meta-security's
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uJdqXRfPtmw7SgZE_=
JPD3T2ZGKQQCoLNXhtUZkSdkelZkg_-b1-LC9k-eu2ov9pdMYotJXXEww$>=20
>
> ZjQcmQRYFpfptBannerEnd
> On Wed, Sep 30, 2026 at 06:29:36PM +0530, Atharv Dubey via lists.yoctop=
roject.org wrote:
> > Add an optional dynamic layer enabling dm-verity block-level integrit=
y
> > verification of the root filesystem for TI K3 platforms, using
> > meta-security's stock dm-verity mechanism as-is. Requires meta-securi=
ty
> > to be present in bblayers.conf.
> >=20
> > dm-verity hashes the rootfs at build time; at boot, a dedicated
> > initramfs loads the root hash and the kernel checks every block read
> > against it. Set DM_VERITY_IMAGE to enable all the verity-related
> > recipes for that image; other images build as usual.
> >=20
> > Signed-off-by: Atharv Dubey <a-dubey@ti.com>
> >=20
> > ---
> > v4:
> >  - Use ti-core-initramfs instead of a separate dm-verity initramfs
> >  - Instead of a DISTRO_FEATURE, just check if DM_VERITY_IMAGE is set
> > v3:
> >  - Disabled the automount rules from udev-aragoconf, so don't need th=
e
> >    ignorelist for dm-verity
> > v2:
> >  - Replaced hardcoded /dev/mmcblk1p2 with a PARTUUID
> > ---
> >  meta-ti-bsp/conf/layer.conf                   |  3 +++
> >  meta-ti-bsp/conf/machine/include/k3.inc       |  7 ++++++
> >  .../conf/include/dm-verity-upstream.inc       | 23 +++++++++++++++++=
++
> >  .../udev/udev-aragoconf_%.bbappend            |  5 ++++
> >  .../udev/udev-extraconf_%.bbappend            |  6 +++++
> >  meta-ti-bsp/files/wic/k3-verity.wks.in        |  5 ++++
> >  6 files changed, 49 insertions(+)
> >  create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/conf/in=
clude/dm-verity-upstream.inc
> >  create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes=
-core/udev/udev-aragoconf_%.bbappend
> >  create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipes=
-core/udev/udev-extraconf_%.bbappend
> >  create mode 100644 meta-ti-bsp/files/wic/k3-verity.wks.in
> >=20
> > diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.con=
f
> > index 3cc54aa4..aca35cd3 100644
> > --- a/meta-ti-bsp/conf/layer.conf
> > +++ b/meta-ti-bsp/conf/layer.conf
> > @@ -20,12 +20,15 @@ LAYERDEPENDS_meta-ti-bsp =3D " \
> >  LAYERRECOMMENDS_meta-ti-bsp =3D " \
> >      openembedded-layer \
> >      tpm-layer \
> > +    security \
> >  "
> > =20
> >  BBFILES_DYNAMIC +=3D " \
> >      openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-layer=
/recipes*/*/*.bbappend \
> >      tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bb \
> >      tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bbap=
pend \
> > +    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.=
bb \
> > +    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*.=
bbappend \
> >  "
> > =20
> >  SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
> > diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/co=
nf/machine/include/k3.inc
> > index 2ebbfb9e..f19db45f 100644
> > --- a/meta-ti-bsp/conf/machine/include/k3.inc
> > +++ b/meta-ti-bsp/conf/machine/include/k3.inc
> > @@ -64,3 +64,10 @@ FALCON_INCLUDE =3D ""
> >  FALCON_INCLUDE:ti-falcon =3D "conf/machine/include/ti-falcon.inc"
> > =20
> >  require ${FALCON_INCLUDE}
> > +
> > +# dm-verity protects the rootfs listed in DM_VERITY_IMAGE; see dynam=
ic-layers/security-layer/conf/include/dm-verity-upstream.inc for what tha=
t turns on.
> > +DM_VERITY_IMAGE ??=3D ""
> > +
> > +DM_VERITY_UPSTREAM_INCLUDE =3D "${@'dynamic-layers/security-layer/co=
nf/include/dm-verity-upstream.inc'=20
> if d.getVar('DM_VERITY_IMAGE') else ''}"
> > +
> > +require ${DM_VERITY_UPSTREAM_INCLUDE}
> > diff --git a/meta-ti-bsp/dynamic-layers/security-layer/conf/include/d=
m-verity-upstream.inc b/meta-ti-bsp/dynamic-layers/security-layer/conf/in=
clude/dm-verity-upstream.inc
> > new file mode 100644
> > index 00000000..3ff2b7d6
> > --- /dev/null
> > +++ b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-verit=
y-upstream.inc
> > @@ -0,0 +1,23 @@
> > +# Enables dm-verity to check the rootfs for tampering on TI K3 board=
s.
> > +DM_VERITY_IMAGE_TYPE =3D "ext4"
> > +IMAGE_CLASSES +=3D "dm-verity-img"
> > +
> > +# ti-core-initramfs.bbappend already wires the initramfs into the bo=
ot partition once dm-verity is enabled, so we don't need to do it here.
> > +
> > +# Derive the root partition's UUID from MACHINE so everyone computes=
 the same one.
> > +python () {
> > +    import uuid
> > +
> > +    if not d.getVar('DM_VERITY_ROOT_PARTUUID'):
> > +        d.setVar('DM_VERITY_ROOT_PARTUUID',
> > +                 str(uuid.uuid5(uuid.NAMESPACE_DNS, 'dm-verity-root-=
%s' % d.getVar('MACHINE'))))
> > +}
>
> Should these 2 anonymous python functions be combined and the above cod=
e go
> behind the check below? Is DM_VERITY_ROOT_PARTUUID needed outside of th=
e
> DM_VERITY_IMAGE image?


Yes we can club the 2 functions. Nope we dont need DM_VERITY_ROOT_PARTUUI=
D

anywhere else.


>
>
> > +
> > +python () {
> > +    if d.getVar('PN') !=3D d.getVar('DM_VERITY_IMAGE'):
> > +        return
> > +
> > +    d.setVar('WKS_FILE', 'k3-verity.wks.in')
> > +    d.appendVar('EXTRA_IMAGE_FEATURES', ' read-only-rootfs')
> > +    d.appendVar('WICVARS', ' DM_VERITY_IMAGE DM_VERITY_IMAGE_TYPE IM=
AGE_NAME_SUFFIX IMGDEPLOYDIR DM_VERITY_ROOT_PARTUUID')
> > +}
> > diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/u=
dev/udev-aragoconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer=
/recipes-core/udev/udev-aragoconf_%.bbappend
> > new file mode 100644
> > index 00000000..e5f6c1b2
> > --- /dev/null
> > +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/ude=
v-aragoconf_%.bbappend
> > @@ -0,0 +1,5 @@
> > +do_install:append() {
> > +    if ${@'true' if d.getVar('DM_VERITY_IMAGE') else 'false'}; then
> > +        : > ${D}${libdir}/udev/rules.d/50-arago.rules
>
> Why not simply remove the file?
>
>
> > +    fi
> > +}
> > diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/u=
dev/udev-extraconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-layer=
/recipes-core/udev/udev-extraconf_%.bbappend
> > new file mode 100644
> > index 00000000..a14e21ea
> > --- /dev/null
> > +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/ude=
v-extraconf_%.bbappend
> > @@ -0,0 +1,6 @@
> > +# Nothing should ever get auto-mounted under dm-verity, so just kill=
 the automounter.
> > +do_install:append() {
> > +    if ${@'true' if d.getVar('DM_VERITY_IMAGE') else 'false'}; then
> > +        : > ${D}${sysconfdir}/udev/rules.d/automount.rules
>
> Same question as above.


We would get QA issues, if we exclude them as a whole. Thats why zeroing=20
them made sense.

>
>
> > +    fi
> > +}
> > diff --git a/meta-ti-bsp/files/wic/k3-verity.wks.in b/meta-ti-bsp/fil=
es/wic/k3-verity.wks.in
> > new file mode 100644
> > index 00000000..62ae0ec1
> > --- /dev/null
> > +++ b/meta-ti-bsp/files/wic/k3-verity.wks.in
> > @@ -0,0 +1,5 @@
> > +# Disk layout for a board that boots with dm-verity enabled.
> > +
> > +bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4 root=3DPARTUU=
ID=3D${DM_VERITY_ROOT_PARTUUID} ${TI_WKS_BOOTLOADER_APPEND}"
> > +part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDER}=
${TI_WKS_INITRAMFS}" --fstype=3Dvfat --label boot --active --align 1024 -=
-use-uuid --fixed-size 128M
> > +part / --source rawcopy --sourceparams=3D"file=3D${IMGDEPLOYDIR}/${D=
M_VERITY_IMAGE}-${MACHINE}${IMAGE_NAME_SUFFIX}.${DM_VERITY_IMAGE_TYPE}.ve=
rity" --align 1024 --uuid ${DM_VERITY_ROOT_PARTUUID}
> > --=20
> > 2.34.1
>  =20

Regards,
Atharv

--------------8j690ByKu4087aXbiT2L7A4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by m0384305.ppops.net id 69170h0R1569758

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>Hi Denys,=C2=A0</p>
    <div class=3D"moz-cite-prefix">On 30/09/26 21:52, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20260930162209.GI4190@denix.org=
">
      <!-- BaNnErBlUrFlE-BoDy-start -->
      <!-- Preheader Text : BEGIN -->
      <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DU=
TF-8">
      <div
style=3D"display:none !important;display:none;visibility:hidden;mso-hide:=
all;font-size:1px;color:#ffffff;line-height:1px;max-height:0px;opacity:0;=
overflow:hidden;">
        On Wed, Sep 30, 2026 at 06:=E2=80=8A29:=E2=80=8A36PM +0530, Athar=
v Dubey via
        lists.=E2=80=8Ayoctoproject.=E2=80=8Aorg wrote: &gt; Add an optio=
nal dynamic
        layer enabling dm-verity block-level integrity &gt; verification
        of the root filesystem for TI K3 platforms, using &gt;
        meta-security's</div>
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
tps://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uJdqXRfPtmw7SgZE_JPD3T=
2ZGKQQCoLNXhtUZkSdkelZkg_-b1-LC9k-eu2ov9pdMYotJXXEww$" style=3D"mso-paddi=
ng-alt: 7px; padding: 7px; border-radius: 2px; border: 1px solid #666666;=
 "><strong style=3D"font-weight: normal; color: #000000; text-decoration:=
 none; font-family: 'Arial', sans-serif; font-size: 14px;">&nbsp;&nbsp;Re=
port&nbsp;Suspicious&nbsp;&nbsp;</strong></a>&nbsp;&nbsp;&zwnj; </td>
      </tr></table>
    </td></tr></table>
  </td></tr></table>
<![endif]-->
      <!--[if !((ie)|(mso))]-->
      <div dir=3D"ltr" lang=3D"en" id=3D"pfptBanner42bdxcm"
style=3D"all: revert !important; display:block !important; text-align: le=
ft !important; margin: 0 0 10px 0 !important; padding:7px 16px 8px 16px !=
important; border-radius: 4px !important; min-width: 200px !important; ba=
ckground-color: #d0d8dc !important; background-color: #d0d8dc; border-top=
: 4px solid #90a4ae !important; border-top: 4px solid #90a4ae;">
        <div id=3D"pfptBanner42bdxcm"
style=3D"all: unset !important; float:left !important; display:block !imp=
ortant; margin: 1px 0 1px 0 !important; max-width: 600px !important;">
          <div id=3D"pfptBanner42bdxcm"
style=3D"all: unset !important; display:block !important; visibility: vis=
ible !important; background-color: #d0d8dc !important; color:#000000 !imp=
ortant; color:#000000; font-family: 'Arial', sans-serif !important; font-=
family: 'Arial', sans-serif; font-weight:bold !important; font-weight:bol=
d; font-size:14px !important; line-height:1.29 !important; line-height:1.=
29">
            This message was sent from outside of Texas Instruments. </di=
v>
          <div id=3D"pfptBanner42bdxcm"
style=3D"all: unset !important; display:block !important; visibility: vis=
ible !important; background-color: #d0d8dc !important; color:#000000 !imp=
ortant; color:#000000; font-weight:normal; font-family: 'Arial', sans-ser=
if !important; font-family: 'Arial', sans-serif; font-size:12px !importan=
t; line-height:1.5 !important; line-height:1.5; margin-top:2px !important=
;">
            Do not click links or open attachments unless you recognize
            the source of this email and know the content is safe. </div>
        </div>
        <div id=3D"pfptBanner42bdxcm"
style=3D"all: unset !important; float: right !important; display: block !=
important; display: block; margin-left: 16px !important; margin-top: 1px =
!important; text-align: right !important; width: fit-content !important; =
font-size: 12px !important">
          <a id=3D"pfptBanner42bdxcm"
href=3D"https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uJdqXRfPtmw7=
SgZE_JPD3T2ZGKQQCoLNXhtUZkSdkelZkg_-b1-LC9k-eu2ov9pdMYotJXXEww$"
style=3D"all: unset !important; display: inline-block !important; text-de=
coration: none"
            moz-do-not-send=3D"true">
            <div class=3D"pfptPrimaryButton42bdxcm"
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
      <style>#pfptBanner42bdxcm { all: revert !important; display: block =
!important;
    visibility: visible !important; opacity: 1 !important;
    background-color: #d0d8dc !important;
    max-width: none !important; max-height: none !important }.pfptPrimary=
Button42bdxcm:hover, .pfptPrimaryButton42bdxcm:focus {
    background-color: #b4c1c7 !important; }.pfptPrimaryButton42bdxcm:acti=
ve {
    background-color: #90a4ae !important; }html:root, html:root>body { al=
l: revert !important; display: block !important;
    visibility: visible !important; opacity: 1 !important; }</style>
      <!-- BaNnErBlUrFlE-HeAdEr-end -->
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">On Wed, Sep 30, 2026 at 06:29:36PM +0530, Atharv =
Dubey via lists.yoctoproject.org wrote:
&gt; Add an optional dynamic layer enabling dm-verity block-level integri=
ty
&gt; verification of the root filesystem for TI K3 platforms, using
&gt; meta-security's stock dm-verity mechanism as-is. Requires meta-secur=
ity
&gt; to be present in bblayers.conf.
&gt;=20
&gt; dm-verity hashes the rootfs at build time; at boot, a dedicated
&gt; initramfs loads the root hash and the kernel checks every block read
&gt; against it. Set DM_VERITY_IMAGE to enable all the verity-related
&gt; recipes for that image; other images build as usual.
&gt;=20
&gt; Signed-off-by: Atharv Dubey <a class=3D"moz-txt-link-rfc2396E" href=3D=
"mailto:a-dubey@ti.com">&lt;a-dubey@ti.com&gt;</a>
&gt;=20
&gt; ---
&gt; v4:
&gt;  - Use ti-core-initramfs instead of a separate dm-verity initramfs
&gt;  - Instead of a DISTRO_FEATURE, just check if DM_VERITY_IMAGE is set
&gt; v3:
&gt;  - Disabled the automount rules from udev-aragoconf, so don't need t=
he
&gt;    ignorelist for dm-verity
&gt; v2:
&gt;  - Replaced hardcoded /dev/mmcblk1p2 with a PARTUUID
&gt; ---
&gt;  meta-ti-bsp/conf/layer.conf                   |  3 +++
&gt;  meta-ti-bsp/conf/machine/include/k3.inc       |  7 ++++++
&gt;  .../conf/include/dm-verity-upstream.inc       | 23 ++++++++++++++++=
+++
&gt;  .../udev/udev-aragoconf_%.bbappend            |  5 ++++
&gt;  .../udev/udev-extraconf_%.bbappend            |  6 +++++
&gt;  meta-ti-bsp/files/wic/k3-verity.wks.in        |  5 ++++
&gt;  6 files changed, 49 insertions(+)
&gt;  create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/conf/i=
nclude/dm-verity-upstream.inc
&gt;  create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipe=
s-core/udev/udev-aragoconf_%.bbappend
&gt;  create mode 100644 meta-ti-bsp/dynamic-layers/security-layer/recipe=
s-core/udev/udev-extraconf_%.bbappend
&gt;  create mode 100644 meta-ti-bsp/files/wic/k3-verity.wks.in
&gt;=20
&gt; diff --git a/meta-ti-bsp/conf/layer.conf b/meta-ti-bsp/conf/layer.co=
nf
&gt; index 3cc54aa4..aca35cd3 100644
&gt; --- a/meta-ti-bsp/conf/layer.conf
&gt; +++ b/meta-ti-bsp/conf/layer.conf
&gt; @@ -20,12 +20,15 @@ LAYERDEPENDS_meta-ti-bsp =3D " \
&gt;  LAYERRECOMMENDS_meta-ti-bsp =3D " \
&gt;      openembedded-layer \
&gt;      tpm-layer \
&gt; +    security \
&gt;  "
&gt; =20
&gt;  BBFILES_DYNAMIC +=3D " \
&gt;      openembedded-layer:${LAYERDIR}/dynamic-layers/openembedded-laye=
r/recipes*/*/*.bbappend \
&gt;      tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bb =
\
&gt;      tpm-layer:${LAYERDIR}/dynamic-layers/tpm-layer/recipes*/*/*.bba=
ppend \
&gt; +    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*=
.bb \
&gt; +    security:${LAYERDIR}/dynamic-layers/security-layer/recipes*/*/*=
.bbappend \
&gt;  "
&gt; =20
&gt;  SIGGEN_EXCLUDERECIPES_ABISAFE +=3D " \
&gt; diff --git a/meta-ti-bsp/conf/machine/include/k3.inc b/meta-ti-bsp/c=
onf/machine/include/k3.inc
&gt; index 2ebbfb9e..f19db45f 100644
&gt; --- a/meta-ti-bsp/conf/machine/include/k3.inc
&gt; +++ b/meta-ti-bsp/conf/machine/include/k3.inc
&gt; @@ -64,3 +64,10 @@ FALCON_INCLUDE =3D ""
&gt;  FALCON_INCLUDE:ti-falcon =3D "conf/machine/include/ti-falcon.inc"
&gt; =20
&gt;  require ${FALCON_INCLUDE}
&gt; +
&gt; +# dm-verity protects the rootfs listed in DM_VERITY_IMAGE; see dyna=
mic-layers/security-layer/conf/include/dm-verity-upstream.inc for what th=
at turns on.
&gt; +DM_VERITY_IMAGE ??=3D ""
&gt; +
&gt; +DM_VERITY_UPSTREAM_INCLUDE =3D <a class=3D"moz-txt-link-rfc2396E" h=
ref=3D"mailto:${@'dynamic-layers/security-layer/conf/include/dm-verity-up=
stream.inc'ifd.getVar('DM_VERITY_IMAGE')else''}">"${@'dynamic-layers/secu=
rity-layer/conf/include/dm-verity-upstream.inc' if d.getVar('DM_VERITY_IM=
AGE') else ''}"</a>
&gt; +
&gt; +require ${DM_VERITY_UPSTREAM_INCLUDE}
&gt; diff --git a/meta-ti-bsp/dynamic-layers/security-layer/conf/include/=
dm-verity-upstream.inc b/meta-ti-bsp/dynamic-layers/security-layer/conf/i=
nclude/dm-verity-upstream.inc
&gt; new file mode 100644
&gt; index 00000000..3ff2b7d6
&gt; --- /dev/null
&gt; +++ b/meta-ti-bsp/dynamic-layers/security-layer/conf/include/dm-veri=
ty-upstream.inc
&gt; @@ -0,0 +1,23 @@
&gt; +# Enables dm-verity to check the rootfs for tampering on TI K3 boar=
ds.
&gt; +DM_VERITY_IMAGE_TYPE =3D "ext4"
&gt; +IMAGE_CLASSES +=3D "dm-verity-img"
&gt; +
&gt; +# ti-core-initramfs.bbappend already wires the initramfs into the b=
oot partition once dm-verity is enabled, so we don't need to do it here.
&gt; +
&gt; +# Derive the root partition's UUID from MACHINE so everyone compute=
s the same one.
&gt; +python () {
&gt; +    import uuid
&gt; +
&gt; +    if not d.getVar('DM_VERITY_ROOT_PARTUUID'):
&gt; +        d.setVar('DM_VERITY_ROOT_PARTUUID',
&gt; +                 str(uuid.uuid5(uuid.NAMESPACE_DNS, 'dm-verity-root=
-%s' % d.getVar('MACHINE'))))
&gt; +}

Should these 2 anonymous python functions be combined and the above code =
go=20
behind the check below? Is DM_VERITY_ROOT_PARTUUID needed outside of the=20
DM_VERITY_IMAGE image? </pre>
    </blockquote>
    <p><br>
    </p>
    <p>Yes we can club the 2 functions. Nope we dont need=C2=A0<span
      style=3D"white-space: pre-wrap">DM_VERITY_ROOT_PARTUUID </span></p>
    <p>anywhere else.=C2=A0=C2=A0</p>
    <p><br>
    </p>
    <blockquote type=3D"cite" cite=3D"mid:20260930162209.GI4190@denix.org=
">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">


&gt; +
&gt; +python () {
&gt; +    if d.getVar('PN') !=3D d.getVar('DM_VERITY_IMAGE'):
&gt; +        return
&gt; +
&gt; +    d.setVar('WKS_FILE', 'k3-verity.wks.in')
&gt; +    d.appendVar('EXTRA_IMAGE_FEATURES', ' read-only-rootfs')
&gt; +    d.appendVar('WICVARS', ' DM_VERITY_IMAGE DM_VERITY_IMAGE_TYPE I=
MAGE_NAME_SUFFIX IMGDEPLOYDIR DM_VERITY_ROOT_PARTUUID')
&gt; +}
&gt; diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/=
udev/udev-aragoconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-laye=
r/recipes-core/udev/udev-aragoconf_%.bbappend
&gt; new file mode 100644
&gt; index 00000000..e5f6c1b2
&gt; --- /dev/null
&gt; +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/ud=
ev-aragoconf_%.bbappend
&gt; @@ -0,0 +1,5 @@
&gt; +do_install:append() {
&gt; +    if ${@'true' if d.getVar('DM_VERITY_IMAGE') else 'false'}; then
&gt; +        : &gt; ${D}${libdir}/udev/rules.d/50-arago.rules

Why not simply remove the file?


&gt; +    fi
&gt; +}
&gt; diff --git a/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/=
udev/udev-extraconf_%.bbappend b/meta-ti-bsp/dynamic-layers/security-laye=
r/recipes-core/udev/udev-extraconf_%.bbappend
&gt; new file mode 100644
&gt; index 00000000..a14e21ea
&gt; --- /dev/null
&gt; +++ b/meta-ti-bsp/dynamic-layers/security-layer/recipes-core/udev/ud=
ev-extraconf_%.bbappend
&gt; @@ -0,0 +1,6 @@
&gt; +# Nothing should ever get auto-mounted under dm-verity, so just kil=
l the automounter.
&gt; +do_install:append() {
&gt; +    if ${@'true' if d.getVar('DM_VERITY_IMAGE') else 'false'}; then
&gt; +        : &gt; ${D}${sysconfdir}/udev/rules.d/automount.rules

Same question as above. </pre>
    </blockquote>
    <p><br>
    </p>
    <p>We would get QA issues, if we exclude them as a whole. Thats why
      zeroing them made sense.=C2=A0</p>
    <blockquote type=3D"cite" cite=3D"mid:20260930162209.GI4190@denix.org=
">
      <pre
style=3D"font-family: sans-serif; font-size: 100%; white-space: pre-wrap;=
 word-wrap: break-word">


&gt; +    fi
&gt; +}
&gt; diff --git a/meta-ti-bsp/files/wic/k3-verity.wks.in b/meta-ti-bsp/fi=
les/wic/k3-verity.wks.in
&gt; new file mode 100644
&gt; index 00000000..62ae0ec1
&gt; --- /dev/null
&gt; +++ b/meta-ti-bsp/files/wic/k3-verity.wks.in
&gt; @@ -0,0 +1,5 @@
&gt; +# Disk layout for a board that boots with dm-verity enabled.
&gt; +
&gt; +bootloader --timeout=3D3 --append=3D"rootfstype=3Dext4 root=3DPARTU=
UID=3D${DM_VERITY_ROOT_PARTUUID} ${TI_WKS_BOOTLOADER_APPEND}"
&gt; +part --source bootimg-efi --sourceparams=3D"loader=3D${EFI_PROVIDER=
}${TI_WKS_INITRAMFS}" --fstype=3Dvfat --label boot --active --align 1024 =
--use-uuid --fixed-size 128M
&gt; +part / --source rawcopy --sourceparams=3D"file=3D${IMGDEPLOYDIR}/${=
DM_VERITY_IMAGE}-${MACHINE}${IMAGE_NAME_SUFFIX}.${DM_VERITY_IMAGE_TYPE}.v=
erity" --align 1024 --uuid ${DM_VERITY_ROOT_PARTUUID}
&gt; --=20
&gt; 2.34.1
 </pre>
    </blockquote>
    <p>Regards,=C2=A0<br>
      Atharv</p>
  </body>
</html>

--------------8j690ByKu4087aXbiT2L7A4d--

