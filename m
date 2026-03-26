Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEB76106F305
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 08:48:00 +0000 (UTC)
Received: from CO1PR03CU002.outbound.protection.outlook.com (CO1PR03CU002.outbound.protection.outlook.com [52.101.46.26])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43686.1774514879932719864
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 26 Mar 2026 01:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=pfw9mZDv;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.46.26, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pPn3IDiMsLV7JmyUgclezdeFNaVlAOHxWto6D05Duyd3tAr7DmCdTQg/0V8p7JxjPmGa9kCCfvh/ULxIatjTe/gk2RBLYWgzYpKkLwTaQPJ8H/WS8A5HgbKiQ4jJBQU6lG5OZq1G1ZAh7TYTiubRwtqXglh8l337F8BOTtDCTg67Ftp8HYqfaKVsn0CXxEnYL7Uhe4LRCHWEwJHc226lNJsUJX3TStsb/BGTKvqTXEekxJJ73Un8HztfYhOAJhmObyn3zMVEkxHIF6GbxMSFWEmhs8rcWkzmtgVuFTQs5+oZKxEoIMwjzM+JEwXfDv6JyjL9cOsQHO+pNdv+DKznBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YxUy09nE/a7LXNHsPRfvwAk30juRRTwYlR45+zDACA8=;
 b=JwPNz5j8KeCQmLZUzhZChv4Ms2g3oOC26CXwVYR9U7IpStyTY9jt8EGnsrqQm+T+ZTAD/PfjSAIHDAqsVNLJqJjt+FWcnW8mJx4Ck7ABw3x4XtZayF6gQ1yl8hZcVVTebtxJabcBhErTi0bd5ndTJ1vhzTves5G5woq6VTZART4QMyC0GT3ZqG1DzSWd10BmnH8S6yOs2Ni2UEvSC+Xtu/RgVoFAVDrv4pEL+Ev2JO6wtImozgs2ll5GhcCtNqn2bisjbaqNi0nOOfGXS7SXQZeYFxKSHBBqA+2203uWxXkftB1xZqqgsuy9wHWhZOk3nun8fOe65AYCp33jRxSPgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=denix.org smtp.mailfrom=ti.com; dmarc=pass
 (p=quarantine sp=none pct=100) action=none header.from=ti.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YxUy09nE/a7LXNHsPRfvwAk30juRRTwYlR45+zDACA8=;
 b=pfw9mZDvf7azIkTXtx6uBuZhnLapwnzGC325RRBXecYYsRfde5Jj9xp3WloWdfnBp0YlqGp2lZB4m9W8bxGK8X0FJiInDv54EgyayhVMxgieJ4RdTkjaqjJcHbSH/Ty+UXN02poeCSQ9icqyFEZTToRCB+2iCbDjESrPOn0WvrM=
Received: from DS7PR05CA0038.namprd05.prod.outlook.com (2603:10b6:8:2f::23) by
 CH3PR10MB7396.namprd10.prod.outlook.com (2603:10b6:610:144::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Thu, 26 Mar 2026 08:47:56 +0000
Received: from DS1PEPF00017098.namprd05.prod.outlook.com
 (2603:10b6:8:2f:cafe::82) by DS7PR05CA0038.outlook.office365.com
 (2603:10b6:8:2f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.20 via Frontend Transport; Thu,
 26 Mar 2026 08:47:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 DS1PEPF00017098.mail.protection.outlook.com (10.167.18.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Thu, 26 Mar 2026 08:47:54 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:47:54 -0500
Received: from DLEE209.ent.ti.com (157.170.170.98) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 26 Mar
 2026 03:47:54 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE209.ent.ti.com
 (157.170.170.98) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 26 Mar 2026 03:47:54 -0500
Received: from [10.24.68.200] (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 62Q8loeL1847136;
	Thu, 26 Mar 2026 03:47:50 -0500
Message-ID: <f461e180-4761-4a4e-a2df-f00814d5d999@ti.com>
Date: Thu, 26 Mar 2026 14:17:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH v8 2/3] initramfs-module-luks-ftpm: Add
 fTPM support
To: Ryan Eatmon <reatmon@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: <rs@ti.com>, <jcormier@criticallink.com>, <praneeth@ti.com>,
	<kamlesh@ti.com>, <vishalm@ti.com>, <k-malarvizhi@ti.com>, <denis@denix.org>,
	<vigneshr@ti.com>, <afd@ti.com>
References: <20260319165833.137342-1-s-tripathi1@ti.com>
 <20260319165833.137342-3-s-tripathi1@ti.com>
 <e69c7725-0769-45d5-94e8-59975b383a15@ti.com>
Content-Language: en-US
From: Shiva Tripathi <s-tripathi1@ti.com>
In-Reply-To: <e69c7725-0769-45d5-94e8-59975b383a15@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017098:EE_|CH3PR10MB7396:EE_
X-MS-Office365-Filtering-Correlation-Id: 45193292-cf47-415b-2e1f-08de8b145f58
X-LD-Processed: e5b49634-450b-4709-8abb-1e2b19b982b7,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	O2vNbKOkq0Jmn18eVweOFQjXYlNZznKOO/O5pzLiUOmxAQxNBRjWaltt5RZsCsPNdUErtZ3zV0WHWM8dM1pQucjluu5a8Rm7q3NU4bMr7O34VEKeScW1A378fLKasPddAo9BNq/CZbopwEznbbJaC9QFzsGoezATpnrAZwf/PDCE6CJuwCoaDwNhCfQMdSAeYRIAbi1UkK0Ngd4zZzu0vyAPCo5TSqOL8eA5Y1xERF2blGAB+tji+EAQQKwjQ7fJFhDvWHrH8myT2+PjD+R+d0X1SH1M+SfcXcj+PLQyBbaKgPN/k2C4wUKonWfFu+HVhcfFM4DNBz2B31Xi/IClsl0wsW9ose7uDjn7a/u9Zd3UPa0V3sHmOZSTIyeEqwFilNwqdf5E0OptzttwoKYnM3rr3b/CUalEaA198TqpWJt5ki8EMO1WrhWVYLUOW/3kFHKY1qZZNYfOXtIy+GcimqQRQmI4TmnnePhz99d49Wj+FdbQkodQOXvKZxAhag9Y2D5QuDMc5tizViVLZjfZcHgjMWRrDBJqCM3gBESKiTft//yZtaHRBXI6ydAry7/1dz4bYP0fpe7aYx8gOqZ2LVEZ1DIHsLCynPXaUdrMYUxS7zvBQ7H6umwEZ93Uceiczc8OygVBEY0bBfUefK7tClgRCRKCZXrpuJ8HpVmQoiibqvP/Dr9VMT4KtVntkmDjagoGIfFRX7bXUJgc9Sm1IgO9Xae4tIx8rNP0uXK3xNaJTLgYM/ZAZGRVOgOICuF2eI81XM3ev+XENzah4MsHSg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	b/YDCz42nlIvTVeyn+lNG9igYiM51XsBr6qrHDA8U8E91YRAy4zZXw7WP8EzXYEh2VLYnbQ12PYzd6Q5VAFeO0q1m+SJCGXKQh78XyhLpiQ5QTRrVv9QUu6nZUAMIuGF3Hb7V59IiCZSnxJiVC+2k+1rOH91xxRNZbqQRaeszuOjYz9sq8Fc7OnSOn2S8uk1dFn5qZEmziX55rJn3CXvGVESzr1icjvwcDlitS2lvRCNOzEQ4oDTPUNQw6SI5jRCAlwwpHtwpic3j8MEWe5Glq69O4lS93u2kimN68Y7KZ+fehkXwLAyRlfvr0loWWxewnQ4BMJ6+/HujZCQ9mfz3IGvspenBkmlE4bC/34klIIJahssbBzLyCKxsgcPk62wjn6WpYWnM5zA1KgOe2M4Tg0Qp7wIIjDjtcsz99L8wiqV779TioJnbX+WQ4D87vy+
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 08:47:54.7094
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 45193292-cf47-415b-2e1f-08de8b145f58
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DS1PEPF00017098.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7396
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 26 Mar 2026 08:48:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19818



On 3/26/26 03:25, Ryan Eatmon wrote:
>=20
>=20
> On 3/19/2026 11:58 AM, Shiva Tripathi wrote:
>> Add initramfs module to dynamic-layers/tpm-layer providing LUKS2 full
>> disk encryption with TPM-sealed keys for TI K3 platforms. Keys are
>> sealed by firmware TPM (fTPM) running in OP-TEE and stored in eMMC
>> RPMB.
>>
>> Features:
>> - First-boot in-place encryption with tpm2_getrandom key generation
>> - TPM-sealed key storage via persistent handle 0x81080001
>> - Automatic unlock on subsequent boots
>> - Space verification ensuring 32MB available for LUKS header
>>
>> The module is built only when meta-tpm layer is present and gets
>> included in initramfs only when DISTRO_FEATURES=3D'luks' and
>> MACHINE_FEATURES=3D'optee-ftpm'
>>
>> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
>> ---
>> =C2=A0 .../initramfs-module-luks-ftpm/luksftpm=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 341 ++++++++++++++++++
>> =C2=A0 .../initramfs-module-luks-ftpm_1.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 43 +++
>> =C2=A0 .../packagegroup-ti-core-initramfs.bbappend=C2=A0=C2=A0 |=C2=A0=
=C2=A0 3 +
>> =C2=A0 3 files changed, 387 insertions(+)
>> =C2=A0 create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-t=
i/
>> initramfs/initramfs-module-luks-ftpm/luksftpm
>> =C2=A0 create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-t=
i/
>> initramfs/initramfs-module-luks-ftpm_1.0.bb
>> =C2=A0 create mode 100644 meta-ti-bsp/dynamic-layers/tpm-layer/recipes-t=
i/
>> initramfs/packagegroup-ti-core-initramfs.bbappend
>>
>> diff --git a/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/
>> initramfs/initramfs-module-luks-ftpm/luksftpm b/meta-ti-bsp/dynamic-
>> layers/tpm-layer/recipes-ti/initramfs/initramfs-module-luks-ftpm/luksftp=
m
>> new file mode 100644
>> index 00000000..5e3aedc4
>> --- /dev/null
>> +++ b/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/
>> initramfs-module-luks-ftpm/luksftpm
>> @@ -0,0 +1,341 @@
>> +#!/bin/sh
>> +# initramfs-framework module for LUKS encryption with fTPM support
>> +
>> +# Configuration
>> +BOOT_DEV=3D"/dev/mmcblk1p1"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 # Boot partition (FAT, unencrypted)
>> +ROOT_DEV=3D"/dev/mmcblk1p2"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 # Root partition (will be encrypted)
>> +CRYPT_NAME=3D"root_crypt"
>> +CRYPT_DEV=3D"/dev/mapper/${CRYPT_NAME}"
>> +BOOT_MNT=3D"/boot_part"
>> +TPM_PRIMARY_CTX=3D"/tmp/tpm_primary.ctx"
>> +TPM_KEY_PRIV=3D"/tmp/tpm_key.priv"
>> +TPM_KEY_PUB=3D"/tmp/tpm_key.pub"
>> +TPM_KEY_CTX=3D"/tmp/tpm_key.ctx"
>> +TPM2_HANDLE=3D"0x81080001"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 # TPM persistent handle for LUKS key
>> +ENCRYPTION_MARKER=3D"${BOOT_MNT}/.encryption_in_progress"
>> +
>> +# Wait for MMC device to appear
>> +wait_for_device() {
>> +=C2=A0=C2=A0=C2=A0 local device=3D"$1"
>> +=C2=A0=C2=A0=C2=A0 local timeout=3D"${2:-10}"
>> +
>> +=C2=A0=C2=A0=C2=A0 msg "Waiting for storage device ${device}..."
>> +=C2=A0=C2=A0=C2=A0 for i in $(seq 1 ${timeout}); do
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -b "${device}" ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn 0
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sleep 1
>> +=C2=A0=C2=A0=C2=A0 done
>> +=C2=A0=C2=A0=C2=A0 return 1
>> +}
>> +
>> +# Initialize fTPM and check availability
>> +init_ftpm() {
>> +=C2=A0=C2=A0=C2=A0 msg "Initializing secure hardware (fTPM)..."
>> +
>> +=C2=A0=C2=A0=C2=A0 # Start TEE supplicant (required for fTPM TA to work=
)
>> +=C2=A0=C2=A0=C2=A0 if [ -x /usr/sbin/tee-supplicant ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/sbin/tee-supplicant -d =
&
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TEE_SUPPLICANT_PID=3D$!
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sleep 5
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info "Warning: Trusted execu=
tion environment not available"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 # Load fTPM kernel module
>> +=C2=A0=C2=A0=C2=A0 if ! /sbin/modprobe tpm_ftpm_tee; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info "Warning: TPM module fa=
iled to load"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 # Wait for TPM device
>> +=C2=A0=C2=A0=C2=A0 for i in $(seq 1 10); do
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -c /dev/tpmrm0 ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 expo=
rt TPM2TOOLS_TCTI=3D"device:/dev/tpmrm0"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 retu=
rn 0
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sleep 1
>> +=C2=A0=C2=A0=C2=A0 done
>> +
>> +=C2=A0=C2=A0=C2=A0 info "Warning: fTPM not available - encryption will =
be skipped"
>> +=C2=A0=C2=A0=C2=A0 return 1
>> +}
>> +
>> +# Generate 32-byte random key using TPM RNG
>> +generate_random_key() {
>> +=C2=A0=C2=A0=C2=A0 /usr/bin/tpm2_getrandom --hex 32
>> +}
>> +
>> +# Seal data with TPM and store in persistent handle
>> +tpm_seal_key() {
>> +=C2=A0=C2=A0=C2=A0 local KEY_DATA=3D"$1"
>> +
>> +=C2=A0=C2=A0=C2=A0 # Create primary key in owner hierarchy
>> +=C2=A0=C2=A0=C2=A0 /usr/bin/tpm2_createprimary -C o -c "${TPM_PRIMARY_C=
TX}" -Q ||
>> return 1
>> +
>> +=C2=A0=C2=A0=C2=A0 # Create sealed object
>> +=C2=A0=C2=A0=C2=A0 echo -n "${KEY_DATA}" | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/tpm2_create -C "${T=
PM_PRIMARY_CTX}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -u "${TPM_KEY_PUB}" -r "${TP=
M_KEY_PRIV}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -i- -Q || return 1
>> +
>> +=C2=A0=C2=A0=C2=A0 # Load sealed object into TPM
>> +=C2=A0=C2=A0=C2=A0 /usr/bin/tpm2_load -C "${TPM_PRIMARY_CTX}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -u "${TPM_KEY_PUB}" -r "${TP=
M_KEY_PRIV}" \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -c "${TPM_KEY_CTX}" -Q || re=
turn 1
>> +
>> +=C2=A0=C2=A0=C2=A0 # Make key persistent at handle (stored in TPM NV RA=
M - RPMB)
>> +=C2=A0=C2=A0=C2=A0 /usr/bin/tpm2_evictcontrol -C o -c "${TPM_KEY_CTX}"
>> "${TPM2_HANDLE}" || return 1
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0
>> +}
>> +
>> +# Unseal data from TPM persistent handle
>> +tpm_unseal_key() {
>> +=C2=A0=C2=A0=C2=A0 # Check if persistent handle exists
>> +=C2=A0=C2=A0=C2=A0 if ! /usr/bin/tpm2_getcap handles-persistent | grep =
-q
>> "${TPM2_HANDLE}"; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 debug "ERROR: TPM persistent=
 handle not found"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 # Unseal key directly from persistent handle
>> +=C2=A0=C2=A0=C2=A0 /usr/bin/tpm2_unseal -c "${TPM2_HANDLE}" || return 1
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0
>> +}
>> +
>> +# Perform in-place LUKS encryption (first boot)
>> +encrypt_root_filesystem() {
>> +=C2=A0=C2=A0=C2=A0 msg "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
>> +=C2=A0=C2=A0=C2=A0 msg "First boot: Encrypting root filesystem"
>> +=C2=A0=C2=A0=C2=A0 msg "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
>> +
>> +=C2=A0=C2=A0=C2=A0 # Set marker to track encryption progress
>> +=C2=A0=C2=A0=C2=A0 touch "${ENCRYPTION_MARKER}"
>> +=C2=A0=C2=A0=C2=A0 sync
>> +
>> +=C2=A0=C2=A0=C2=A0 # Generate random encryption key using TPM RNG
>> +=C2=A0=C2=A0=C2=A0 msg "Generating encryption key..."
>> +=C2=A0=C2=A0=C2=A0 LUKS_KEY=3D$(generate_random_key)
>> +
>> +=C2=A0=C2=A0=C2=A0 if [ -z "${LUKS_KEY}" ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "ERROR: Failed to genera=
te encryption key"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f "${ENCRYPTION_MARKER}"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 # Seal key with TPM before encryption starts
>> +=C2=A0=C2=A0=C2=A0 msg "Securing key with TPM..."
>> +=C2=A0=C2=A0=C2=A0 if ! tpm_seal_key "${LUKS_KEY}"; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "ERROR: Failed to secure=
 key"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f "${ENCRYPTION_MARKER}"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 # Filesystem check before encryption
>> +=C2=A0=C2=A0=C2=A0 msg "Checking filesystem integrity..."
>> +=C2=A0=C2=A0=C2=A0 /usr/sbin/e2fsck -f -y "${ROOT_DEV}"
>> +=C2=A0=C2=A0=C2=A0 E2FSCK_RET=3D$?
>> +=C2=A0=C2=A0=C2=A0 if [ ${E2FSCK_RET} -ge 4 ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "ERROR: Filesystem check=
 failed"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f "${ENCRYPTION_MARKER}"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 # Shrink filesystem before encryption to leave room =
for LUKS header
>> +=C2=A0=C2=A0=C2=A0 msg "Preparing filesystem for encryption..."
>> +=C2=A0=C2=A0=C2=A0 /usr/sbin/resize2fs -M "${ROOT_DEV}" || {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "ERROR: Failed to prepar=
e filesystem"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f "${ENCRYPTION_MARKER}"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 # Verify partition has sufficient space for LUKS hea=
der
>> +=C2=A0=C2=A0=C2=A0 msg "Verifying space for encryption..."
>> +=C2=A0=C2=A0=C2=A0 MIN_BLOCKS=3D$(/usr/sbin/resize2fs -P "${ROOT_DEV}" =
2>&1 | awk '/
>> [Mm]inimum.*:/ {print $NF}')
>> +
>> +=C2=A0=C2=A0=C2=A0 # Get filesystem block size and device size
>> +=C2=A0=C2=A0=C2=A0 BLOCK_SIZE=3D$(/usr/sbin/tune2fs -l "${ROOT_DEV}" 2>=
/dev/null | awk
>> '/^Block size:/ {print $NF}')
>> +=C2=A0=C2=A0=C2=A0 DEV_NAME=3D$(basename "${ROOT_DEV}")
>> +=C2=A0=C2=A0=C2=A0 PART_SECTORS=3D$(cat /sys/class/block/"${DEV_NAME}"/=
size 2>/dev/null)
>> +
>> +=C2=A0=C2=A0=C2=A0 if [ -z "${MIN_BLOCKS}" ] || [ -z "${BLOCK_SIZE}" ] =
|| [ -z
>> "${PART_SECTORS}" ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "ERROR: Unable to determ=
ine partition geometry"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f "${ENCRYPTION_MARKER}"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 # Convert filesystem blocks to 512-byte sectors
>> +=C2=A0=C2=A0=C2=A0 MIN_SECTORS=3D$((MIN_BLOCKS * BLOCK_SIZE / 512))
>> +=C2=A0=C2=A0=C2=A0 LUKS_SECTORS=3D65536=C2=A0 # 32MB in 512-byte sector=
s
>> +
>> +=C2=A0=C2=A0=C2=A0 if [ $((PART_SECTORS - MIN_SECTORS)) -lt ${LUKS_SECT=
ORS} ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "ERROR: Insufficient spa=
ce for LUKS header (need 32MB free)"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f "${ENCRYPTION_MARKER}"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 # Perform in-place encryption
>> +=C2=A0=C2=A0=C2=A0 msg "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
>> +=C2=A0=C2=A0=C2=A0 msg "Encrypting filesystem..."
>> +=C2=A0=C2=A0=C2=A0 msg "This will take several minutes."
>> +=C2=A0=C2=A0=C2=A0 msg "DO NOT POWER OFF THE DEVICE!"
>> +=C2=A0=C2=A0=C2=A0 msg "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
>> +
>> +=C2=A0=C2=A0=C2=A0 echo -n "${LUKS_KEY}" | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/sbin/cryptsetup reencry=
pt --encrypt \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --type luks2 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --cipher aes-xts-plain64 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --key-size 256 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --hash sha256 \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --reduce-device-size 32M \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --key-file - \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "${ROOT_DEV}" || {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "ERROR: Encryption faile=
d"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rm -f "${ENCRYPTION_MARKER}"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 msg "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
>> +=C2=A0=C2=A0=C2=A0 msg "Encryption completed successfully!"
>> +=C2=A0=C2=A0=C2=A0 msg "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
>> +
>> +=C2=A0=C2=A0=C2=A0 # Remove encryption marker
>> +=C2=A0=C2=A0=C2=A0 rm -f "${ENCRYPTION_MARKER}"
>> +=C2=A0=C2=A0=C2=A0 sync
>> +
>> +=C2=A0=C2=A0=C2=A0 # Unlock the newly encrypted device
>> +=C2=A0=C2=A0=C2=A0 msg "Activating encrypted filesystem..."
>> +=C2=A0=C2=A0=C2=A0 echo -n "${LUKS_KEY}" | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/sbin/cryptsetup luksOpe=
n "${ROOT_DEV}" "${CRYPT_NAME}"
>> --key-file - || {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "ERROR: Failed to activa=
te encrypted filesystem"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 # Resize filesystem to fit the encrypted device
>> +=C2=A0=C2=A0=C2=A0 msg "Optimizing filesystem..."
>> +=C2=A0=C2=A0=C2=A0 /usr/sbin/resize2fs -f "${CRYPT_DEV}" || {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "ERROR: Failed to optimi=
ze filesystem"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 # Verify filesystem after resize
>> +=C2=A0=C2=A0=C2=A0 /usr/sbin/e2fsck -f -y "${CRYPT_DEV}" || {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info "WARNING: Filesystem ve=
rification had issues, but
>> continuing"
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 return 0
>> +}
>> +
>> +# Unlock encrypted root filesystem (subsequent boots)
>> +unlock_encrypted_root() {
>> +=C2=A0=C2=A0=C2=A0 msg "Unlocking encrypted filesystem..."
>> +
>> +=C2=A0=C2=A0=C2=A0 # Unseal key from TPM persistent handle
>> +=C2=A0=C2=A0=C2=A0 LUKS_KEY=3D$(tpm_unseal_key)
>> +
>> +=C2=A0=C2=A0=C2=A0 if [ -z "${LUKS_KEY}" ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "ERROR: Failed to retrie=
ve encryption key from TPM"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "Attempting passphrase f=
allback..."
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Try to unlock with passphr=
ase (interactive)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/sbin/cryptsetup luksOpe=
n "${ROOT_DEV}" "${CRYPT_NAME}" || {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fata=
l "ERROR: Failed to unlock encrypted filesystem"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Unlock with unsealed key
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo -n "${LUKS_KEY}" | \
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr=
/sbin/cryptsetup luksOpen "${ROOT_DEV}"
>> "${CRYPT_NAME}" --key-file - || {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fata=
l "ERROR: Failed to unlock with TPM key"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 msg "Encrypted filesystem unlocked"
>> +}
>> +
>> +# Module enabled check
>> +luksftpm_enabled() {
>> +=C2=A0=C2=A0=C2=A0 # Always run this module - it handles both encrypted=
 and
>> unencrypted cases
>> +=C2=A0=C2=A0=C2=A0 return 0
>> +}
>> +
>> +# Module main function
>> +luksftpm_run() {
>> +=C2=A0=C2=A0=C2=A0 # Wait for storage device
>> +=C2=A0=C2=A0=C2=A0 if ! wait_for_device "${ROOT_DEV}" 10; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info "Storage device not fou=
nd, skipping encryption module"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 # Mount boot partition
>> +=C2=A0=C2=A0=C2=A0 msg "Mounting boot partition..."
>> +=C2=A0=C2=A0=C2=A0 mkdir -p "${BOOT_MNT}"
>> +=C2=A0=C2=A0=C2=A0 if ! mount "${BOOT_DEV}" "${BOOT_MNT}"; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info "ERROR: Failed to mount=
 boot partition, attempting
>> standard boot..."
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mkdir -p ${ROOTFS_DIR}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mount "${ROOT_DEV}" ${ROOTFS=
_DIR}
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 # Initialize fTPM
>> +=C2=A0=C2=A0=C2=A0 TPM_AVAILABLE=3D0
>> +=C2=A0=C2=A0=C2=A0 if init_ftpm; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 TPM_AVAILABLE=3D1
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 # Check filesystem encryption status
>> +=C2=A0=C2=A0=C2=A0 msg "Checking filesystem encryption status..."
>> +
>> +=C2=A0=C2=A0=C2=A0 MOUNT_DEV=3D"${ROOT_DEV}"
>> +
>> +=C2=A0=C2=A0=C2=A0 if /usr/sbin/cryptsetup isLuks "${ROOT_DEV}"; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "Filesystem is encrypted=
"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unlock_encrypted_root
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MOUNT_DEV=3D"${CRYPT_DEV}"
>> +=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "Filesystem is not encry=
pted"
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Check if encryption is ena=
bled and TPM is available
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ $TPM_AVAILABLE -eq 1 ];=
 then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Ch=
eck for encryption marker (resume interrupted
>> encryption)
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [=
 -f "${ENCRYPTION_MARKER}" ]; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 msg "Resuming interrupted encryption..."
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if ! encrypt_root_filesystem; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "ERROR: Failed to resume =
encryption"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "Booting without encrypti=
on..."
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MOUNT_DEV=3D"${ROOT_DEV}"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MOUNT_DEV=3D"${CRYPT_DEV}"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 # First boot - perform encryption
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if encrypt_root_filesystem; then
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MOUNT_DEV=3D"${CRYPT_DEV}"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg "ERROR: Encryption failed=
 - booting without
>> encryption"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MOUNT_DEV=3D"${ROOT_DEV}"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msg =
"TPM not available - skipping encryption"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MOUN=
T_DEV=3D"${ROOT_DEV}"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>> +=C2=A0=C2=A0=C2=A0 fi
>> +
>> +=C2=A0=C2=A0=C2=A0 # Unmount boot partition before switching root
>> +=C2=A0=C2=A0=C2=A0 umount "${BOOT_MNT}"
>> +
>> +=C2=A0=C2=A0=C2=A0 # Mount root filesystem to $ROOTFS_DIR (framework ex=
pects this)
>> +=C2=A0=C2=A0=C2=A0 msg "Mounting root filesystem..."
>> +=C2=A0=C2=A0=C2=A0 mkdir -p ${ROOTFS_DIR}
>> +=C2=A0=C2=A0=C2=A0 mount "${MOUNT_DEV}" ${ROOTFS_DIR} || {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fatal "ERROR: Failed to moun=
t root filesystem!"
>> +=C2=A0=C2=A0=C2=A0 }
>> +
>> +=C2=A0=C2=A0=C2=A0 # Clean up tmpfs and sensitive variables
>> +=C2=A0=C2=A0=C2=A0 rm -f "${TPM_PRIMARY_CTX}" "${TPM_KEY_PUB}" "${TPM_K=
EY_PRIV}"
>> "${TPM_KEY_CTX}"
>> +=C2=A0=C2=A0=C2=A0 unset LUKS_KEY TPM_AVAILABLE MOUNT_DEV TEE_SUPPLICAN=
T_PID
>> +
>> +=C2=A0=C2=A0=C2=A0 msg "Boot complete"
>> +}
>> diff --git a/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/
>> initramfs/initramfs-module-luks-ftpm_1.0.bb b/meta-ti-bsp/dynamic-
>> layers/tpm-layer/recipes-ti/initramfs/initramfs-module-luks-ftpm_1.0.bb
>> new file mode 100644
>> index 00000000..b2a41d08
>> --- /dev/null
>> +++ b/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/
>> initramfs-module-luks-ftpm_1.0.bb
>> @@ -0,0 +1,43 @@
>> +SUMMARY =3D "initramfs support for LUKS encryption with fTPM"
>> +DESCRIPTION =3D "Provides LUKS2 full disk encryption using firmware TPM
>> (fTPM) for key management on TI K3 platforms"
>> +
>> +LICENSE =3D "MIT"
>> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/
>> COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420"
>> +
>> +# Only build for platforms with optee-ftpm support
>> +COMPATIBLE_MACHINE =3D "null"
>> +COMPATIBLE_MACHINE:k3 =3D "${@bb.utils.contains('MACHINE_FEATURES',
>> 'optee-ftpm', '.*', 'null', d)}"
>> +
>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>> +
>> +SRC_URI =3D "file://luksftpm"
>> +
>> +S =3D "${UNPACKDIR}"
>> +
>> +do_install() {
>> +=C2=A0=C2=A0=C2=A0 install -d ${D}/init.d
>> +=C2=A0=C2=A0=C2=A0 # Install as 85-luksftpm (runs after udev at 01, bef=
ore rootfs at
>> 90)
>> +=C2=A0=C2=A0=C2=A0 install -m 0755 ${UNPACKDIR}/luksftpm ${D}/init.d/85=
-luksftpm
>> +}
>> +
>> +FILES:${PN} =3D "/init.d/85-luksftpm"
>> +
>> +# Runtime dependencies
>> +RDEPENDS:${PN} =3D "\
>> +=C2=A0=C2=A0=C2=A0 initramfs-framework-base \
>> +=C2=A0=C2=A0=C2=A0 busybox \
>> +=C2=A0=C2=A0=C2=A0 kmod \
>> +=C2=A0=C2=A0=C2=A0 cryptsetup \
>> +=C2=A0=C2=A0=C2=A0 tpm2-tools \
>> +=C2=A0=C2=A0=C2=A0 tpm2-tss \
>> +=C2=A0=C2=A0=C2=A0 libtss2-tcti-device \
>> +=C2=A0=C2=A0=C2=A0 optee-client \
>> +=C2=A0=C2=A0=C2=A0 optee-ftpm \
>> +=C2=A0=C2=A0=C2=A0 e2fsprogs-e2fsck \
>> +=C2=A0=C2=A0=C2=A0 e2fsprogs-resize2fs \
>> +=C2=A0=C2=A0=C2=A0 e2fsprogs-tune2fs \
>> +=C2=A0=C2=A0=C2=A0 util-linux-blkid \
>> +=C2=A0=C2=A0=C2=A0 kernel-module-tpm-ftpm-tee \
>> +"
>> +
>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>> diff --git a/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/
>> initramfs/packagegroup-ti-core-initramfs.bbappend b/meta-ti-bsp/
>> dynamic-layers/tpm-layer/recipes-ti/initramfs/packagegroup-ti-core-
>> initramfs.bbappend
>> new file mode 100644
>> index 00000000..52c82389
>> --- /dev/null
>> +++ b/meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/
>> packagegroup-ti-core-initramfs.bbappend
>> @@ -0,0 +1,3 @@
>> +LUKS_ENCRYPTION ?=3D "${@bb.utils.contains('MACHINE_FEATURES', 'optee-
>> ftpm', 'initramfs-module-luks-ftpm', '', d)}"
>> +
>> +RDEPENDS:${PN}:append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
>> 'luks', '${LUKS_ENCRYPTION}', '', d)}"
>=20
> We are missing another setting that should be in the dynamic layer. With
> the above we are adding a bunch of new packages into the initramfs and
> we are now running into the INITRAMFS_MAXSIZE check.
>=20
> I created:
> meta-ti-bsp/dynamic-layers/tpm-layer/recipes-ti/initramfs/ti-core-
> initramfs.bbappend
>=20
> With:
> INITRAMFS_MAXSIZE =3D "200000"
>=20
> And that finished the build successfully.=C2=A0 So I think we need a V9 t=
o
> include this change as well.
>=20

Thanks for testing.
As part of my testing I had some busybox optimizations (using busybox as
init manager) that might have helped keep the initramfs size smaller.
But using the default settings (systemd as init manager) the initramfs
size crosses the current limit.

Will address the change in V9 as suggested.

Thanks,
Shiva

>=20
>=20


