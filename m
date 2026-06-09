Return-Path: <jm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7EB6CD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 21:10:02 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.24])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6276.1781039396605068828
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 09 Jun 2026 14:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=B4nJ9w/i;
 spf=pass (domain: ti.com, ip: 40.93.196.24, mailfrom: jm@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XEKfOBuzUL5qmj6if9Pv0kkZR5MHnQHGEeqJKmpYTf7TEAGExNams4FDTpS18+9dxNbAho6cS+p2MDxu7kpnTegYa8GaMa1JSkO//9jSukcvCJwqwTAvtVeHEW62eqOOMKAUwNa4Ddy/q3X27Yu/bhJTaNYgaUz7FpcMUUq+I9a129ntEE/R55jP0abZaW3j6k3EpreQqy819JfobZNEr0d4zTd1XNPClRBwJ/CbYl5C4nE6th3BT7NFn92OI9gHAaSBghkUCWp2UyHHoNboHlroCL+m0OvmDld6Thvr/qAn78GC3goBW+WrhMLcXa1p6qL9vXDh2dx9IN+pVSCyLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MFoEUAnxdY9N12yh0Snw0E/WnbsPOir/FF6Lgo4vvxk=;
 b=kV9pG5RKQt47x2zTRY1Neah0WC9xBV2vM89cUW7SnWIPVdbZp5/D65DQjiwAHR22alb7h2DdYWaYHdWoWtErUjUaEAJJOjA6Zcv/xRR+oI53kOf7blibjCoZNQ4kYvY1I5M8KxEuX9/I/cq7rUfIyTvV2C5FvRaEDdXlA08gO6f1um8dwQmpTgkzAtUDLpQ9VhaK0cdE61r7YSKO1Pe0X2xFU3xVtSer2wmLS8VMsab/MF8/GyayU1Nbp+D7EBe3HjrtdIf+65WOSvuSncG7s3SGoGIQe8W7cYuImPs3odtPUIg6UGRoGl/m7YoKEARB7jUsoISaLr56YVJGo9XSGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=konsulko.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MFoEUAnxdY9N12yh0Snw0E/WnbsPOir/FF6Lgo4vvxk=;
 b=B4nJ9w/inuM+UU3T7ks8Wrk95KvS0Xkpah98qcdx+BfS7qE57IbQnFh5z9RDplV7U2am+1XKdCDAwFI5XZ9lQeTLWZld3HwNueGcRvsVAVyR/+a/YP0pZ9bUlsMHaaa9dYkjMeVUHh2/1zoAQgVkwXdnXxVHQiBQbSdtGRJkkMk=
Received: from DS7PR06CA0044.namprd06.prod.outlook.com (2603:10b6:8:54::20) by
 MN2PR10MB4384.namprd10.prod.outlook.com (2603:10b6:208:198::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Tue, 9 Jun
 2026 21:09:54 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:8:54:cafe::40) by DS7PR06CA0044.outlook.office365.com
 (2603:10b6:8:54::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.14 via Frontend Transport; Tue, 9
 Jun 2026 21:09:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.139.1 via Frontend Transport; Tue, 9 Jun 2026 21:09:52 +0000
Received: from DFLE214.ent.ti.com (10.64.6.72) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 16:09:35 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 9 Jun
 2026 16:09:35 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37 via Frontend
 Transport; Tue, 9 Jun 2026 16:09:35 -0500
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 659L9ZAD1872112;
	Tue, 9 Jun 2026 16:09:35 -0500
Message-ID: <a782c2c7-bf18-4ba9-abba-868ebec528ea@ti.com>
Date: Tue, 9 Jun 2026 16:09:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH] conf: am62dxx-evm: Fixup packaged
 overlay list
To: Ryan Eatmon <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, <denys@konsulko.com>
References: <20260609202801.18252-1-jm@ti.com>
 <2da95be9-31a6-4224-9706-323e5d51c2fb@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <2da95be9-31a6-4224-9706-323e5d51c2fb@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|MN2PR10MB4384:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cdca3ed-22cb-46bc-727e-08dec66b7303
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|18002099003|22082099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	FeEmhxR8AA7DMvcFN/6vVgDTu5PuiHG8khLxeCBzKj093AWT8Snioug4XMQgUI6+N/R69kVL+R8ZbFCnZYj6q0aUSjeS+CdmCVYhdbecdEUH1NNQcBWWxBX8+Ts/43fwGtMgx8O/wBxUQ9K6vg4gr+UMPOiLRpo6LPkpVdCLLG192BpfUQ7WkWoXxJvBEYJ51jGoKDosn2QKrd42vvBINyHBpJisG9wk/rWMfAAfqFun/GJuLeSWXpmlhCHzpBx4lEpbWZYxP6dLAeEvZjHadmMRiHPXQrzz9HCfau9k/iuTrwxPw19y5rEV/oTIB8hqujS/sMCgdsqWXsJM5SotYI8oyHgVhnhYzBjD95FWYPEY2zOrf2CEGm/2Z+zVt6vSO7lzxLb8EfQWdkKFao1SP+FBNffHc2RSQ2K2S1zyJ52NSRjZ3qbjtTI1wFT3jxnwc+IivhHh0quYDM+pYzwkC5S7HSJHjm7ul6F2lWrzMi57VbqNaj8/YaZpGVoqQTb2NalzpBL93q4FrGWRuz63EYOv5tBg1TGR+bXsNEYhLEeCO+b/barCG6j2j5lzTpGpLR8FNNKF0Q5W8xweMsgwFMW63uerRhiXbLlUw0AymWTMs6cCao8rCarAQBp6OwfwnK7NeN7c7GLOiBQFuSDFymDXUcHY3WQ4w5tfF1mJUdSgAdw6tUkFmvC5x0kMkm5Nt6HxvYf0+kWwfEn+jj/M+QzQs4F+bwOsrHoLJ631Vlc=
X-Forefront-Antispam-Report: 
	CIP:198.47.21.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet200.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	mJ5Jmvh+9MoQCQuiRL7sSlPczSt+SPzs4Q7u0HrWZne073nbIqLMbD9WN3yonX+DWOV76MV+eDX4mINwy2bfTTCto5qIK+TnhlLeKZuqZOZ+GPTZfgNXUSktIi1PyJr9iM8xSt+b19waAKUWovXlvDcaoV/yBSIZnfRmCNJT9fSM6oWHdoatiSyt7Gobc1Ncod839KRkvxmveMJn55RzaJAyFThNo98EGMonr52RHVbmJop1WKA/8suM5Q+nCEzVXYBxgDjT6F3gWpzmbYn2xtOVC41LB+ZpU8CyVTjUsoYsHtqvAzKWd2/oFGOydHTbDuOnyYxmlRonHsKHCuN+dT6KYyr2EB3k9+3x1kLLxOuqqRpYQAhx754Ef5d/Ezmupy3rdZJfH+YiyZmU1PdXgF+HHEUyn+WOYR4Hbk92TCvMGLv7np8is8QHMwxOSTYi
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2026 21:09:52.5572
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cdca3ed-22cb-46bc-727e-08dec66b7303
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.194];Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4384
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 09 Jun 2026 21:10:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/20000

Hi Ryan,

On 6/9/26 3:45 PM, Ryan Eatmon wrote:
>=20
> I assume this is for wrynose as well?=C2=A0 If so, please make sure to ad=
d it=20
> on the subject going forward.

Will fix and respin

>=20
>=20
> On 6/9/2026 3:28 PM, Judith Mendez wrote:
>> Some k3-am62x-sk* overlays no longer apply to AM62A/AM62D boards,
>> update overlay list packaged for AM62D mostly to include the new
>> k3-am62a7-sk-mcan.dtbo without dropping applicable overlays.
>>
>> Signed-off-by: Judith Mendez <jm@ti.com>
>> ---
>> =C2=A0 meta-ti-bsp/conf/machine/am62dxx-evm.conf | 9 ++++++++-
>> =C2=A0 1 file changed, 8 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-ti-bsp/conf/machine/am62dxx-evm.conf b/meta-ti-bsp/=20
>> conf/machine/am62dxx-evm.conf
>> index ef9df2f7..c776ffbf 100644
>> --- a/meta-ti-bsp/conf/machine/am62dxx-evm.conf
>> +++ b/meta-ti-bsp/conf/machine/am62dxx-evm.conf
>> @@ -7,7 +7,14 @@ require conf/machine/include/am62dxx.inc
>> =C2=A0 KERNEL_DEVICETREE_PREFIX =3D " \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62d2 \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62a7-sk-edgeai \
>> -=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-csi2 \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-ecap-capture \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-eqep \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-hdmi \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-lpm \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-mcspi-loopback \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62x-sk-pwm \
>> +=C2=A0=C2=A0=C2=A0 ti/k3-am62a7-sk-mcan.dtbo \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62a7-sk-rpi-hdr-ehrpwm \
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ti/k3-am62a7-sk-e3-max-opp \
>> =C2=A0 "
>=20


