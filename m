Return-Path: <s-tripathi1@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C4D4EC0466
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 09:15:47 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com (CH5PR02CU005.outbound.protection.outlook.com [40.107.200.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14292.1772529338717695461
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 03 Mar 2026 01:15:38 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=selector1 header.b=iOhuLB0I;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 40.107.200.20, mailfrom: s-tripathi1@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ViXUrYQHcRo05gc+ew7uP30ZhWamGg0in/NOk2z2r5GnFCZQAABVXmOBz9JRoQYnJlO4fugoNBodxladerMbI5tcsl3UQ95Dt+X3U5xx9o/YWjVbVUaFNEkAFOqWezNsg5C3qrq8yqOIXyFJOd3/KeJsMVDFm7C0Q0a1psiLJA13BHyTRJqCu3ZQsCjP8+rB8Qzk9Rvd6EWROMnBGQD4i1vZqFT9b4LD2+x2hZecEntdjKTWUWibojZS6tTLKnQuGEvxTWKj57yzgA3u12/zmtWH4WxJhj5whv836GELLiqTCJn17qDOFTAhLJG27mGtn6bbZOrYhkkARIJd+SgTjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQ9o3+v4x7vYVX/WTnBPYNkIiSd3hoqhmu/1RLPZnvU=;
 b=mZTXY7GiFag5uhboDjO4jRPgDFIOr/BpBHq9q1Kq7I2GSrSYp76ew6HkZI+yhWieLmguLa3vpI7d9DjM+6ADgoJjcwtwfS9+7tB2qmL4b7/slXa4eslnSHGS10VzVF4Ces5g5ayJ/RdLSmi19aRR40fLtseS2c6eV99sqdlAGPY6N3YgAMWWGSTVzE6VVAVjqfoxRokZz1dsXiYF5tG90G8ceiQKm2DO05PRiK4qniNlWrvnWOIsV+vXhYMQq4TEsXuAAPln7MGkU6Qhf3MsFsQyy5iL0D+ahsUk1EzRuPtnNNfxXTx1epO04GTrgusDhhxip08ydhG+3JxyahXPEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LQ9o3+v4x7vYVX/WTnBPYNkIiSd3hoqhmu/1RLPZnvU=;
 b=iOhuLB0INSytIxHBt2D7/MJvCy3h2QSjbspcqP4egz01G9w2jSKK11tXKaFsq+cm2icXpmkJapoxFg00r78hHbk2uZoCQ7yNcVza+okXqvf5TzdG4I+ZkHaQW4cIYQGZhcLovD3rCH0ivyy0jkDdWNeQ7mv4YtGlJTckgiSp8r8=
Received: from BLAPR03CA0026.namprd03.prod.outlook.com (2603:10b6:208:32b::31)
 by DS0PR10MB6728.namprd10.prod.outlook.com (2603:10b6:8:11c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Tue, 3 Mar
 2026 09:15:34 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:208:32b:cafe::48) by BLAPR03CA0026.outlook.office365.com
 (2603:10b6:208:32b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Tue,
 3 Mar 2026 09:15:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Tue, 3 Mar 2026 09:15:33 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 03:15:27 -0600
Received: from DFLE214.ent.ti.com (10.64.6.72) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 3 Mar
 2026 03:15:26 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE214.ent.ti.com
 (10.64.6.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 3 Mar 2026 03:15:26 -0600
Received: from [10.24.68.200] (hp-z2-tower-g9.dhcp.ti.com [10.24.68.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6239FOBM2355334;
	Tue, 3 Mar 2026 03:15:24 -0600
Message-ID: <0d189906-4a9a-455a-9ac4-59a68d3df4e5@ti.com>
Date: Tue, 3 Mar 2026 14:45:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-ti][master][PATCH 2/3] initramfs: Add encrypted boot
 support with fTPM
To: Ryan Eatmon <reatmon@ti.com>, Randolph Sapp <rs@ti.com>,
	<meta-ti@lists.yoctoproject.org>
CC: <praneeth@ti.com>, <kamlesh@ti.com>, <vishalm@ti.com>,
	<k-malarvizhi@ti.com>
References: <20260302144647.1705408-1-s-tripathi1@ti.com>
 <20260302144647.1705408-3-s-tripathi1@ti.com>
 <DGSNMFG7CJMI.369LJBMXN2VSL@ti.com>
 <823f1750-cb5a-46c8-9281-9b9a46b8e257@ti.com>
Content-Language: en-US
From: Shiva Tripathi <s-tripathi1@ti.com>
In-Reply-To: <823f1750-cb5a-46c8-9281-9b9a46b8e257@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|DS0PR10MB6728:EE_
X-MS-Office365-Filtering-Correlation-Id: ca12b6e2-9e6d-4578-dd11-08de79056c88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|376014|34020700016|1800799024|36860700013|7142099003;
X-Microsoft-Antispam-Message-Info: 
	9X7dA5sBjPb5diyGklJnCbzL8eGwSYg0VvdDRpRKjwngGguhxBiUzfSZxZP1tQEZDfD0rm9USql4c+HCZMlKBTiWbzUnQ2PQtYaiVITyq9JUVfn4YAeR+zJ6FVht374VymafFkVx4tZ+BeNHCJtRrZC9VDNl4zeJaAEYvavXkpFB0HcdQ6tGTrhN55BdRdax3cTNV/k7DAhDmWeeM8jsOACo6M1xk0zNxsmwJR98HmkYJwUMFyXIQb1PkGRKoSmVOeWzvx7vpLtfLlSQ1iMo2L9b8VauAG2gtNReFCaerV9daqcvXHZ3i5BjcKqXniXY0Ml/IO3V9HQARHUYuVSpnOfL3Ta5oqaDd4BGzp6xeWT/huWodvVC7Zx/chOuensTDC0j72DUr1D3pu2WYCaKv0m0kFci2BVyI3guyuOalVivQhyF4wxY/Lu2/86dhOCAWUoxbNrej1n/CQDcsa98YXexY8bDSi++NZjU2hXvDr9Wzq+2IeTGCM/RP6uEuwyXaA6BP/ZUJkcqNllFoSA6qDiHnGjvHSZD+LLr6IaRVUjSxBTs5iOIYID/8BxrydX5nK9/7erv/x8uinc9LKqWLLEg4cW929qLyEp1FjAvrpwb79iH4UZ312bs9t7hD/J5/aMJWgcU5u870C3mlqVqD0WQH+dY0GGob+nEiwUv5o/0BZVr7zPj5xdt6gPXv3IkRphOgd2OPBEe4sLbWBW6nghEeZOsFGU7Q2AKnG63RGWP2vE0SHvpRsuaPgSw7eUiPkxNMtLsl9DRGzY1N7smCA==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(376014)(34020700016)(1800799024)(36860700013)(7142099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	LNmKSdpSo1jr4vc+FGv7vLXme7dJ42Z0uuDl4MdJ6IRXmFIR9Ud8an6alEVEl8VSDholFrOq9opiHacLlUVz8dS6F6w5ojGU1KJiOPY1YGmBa6KQPlHW0rA0awRmFRj/zSy7or6JkFizXkPz0E/sJ8bVifSrVcKc3heOlMFKzouvf0F7Dz/hqBpN0COV64lRR6JCg/VCYF3wTI4xxxSqPKJQsXf3At7z+GrGS6i5ovKBi9R4/dumHvdgzaAOJ1fL9vtrjOm3yS5DzmwyZcYy8LAxPYFZfKJGTRhE9J1SwxZn6Z0MorCzSxK9ukeAMjxjxjIBNwjPJgmuKRRyu9Lo+34sj/CTrEjW/aWp4ygflDgqKQNqbsPMBNsOCNDxVhVJjqRM+lUE5+0i/F+HsEnNca4qu2eJiFQ1JPW9UiKASl/S1m6FvmbRsrfd/wUXCO33
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 09:15:33.4766
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca12b6e2-9e6d-4578-dd11-08de79056c88
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6728
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 03 Mar 2026 09:15:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19634



On 3/3/26 04:10, Ryan Eatmon wrote:
>=20
>=20
> On 3/2/2026 4:36 PM, Randolph Sapp wrote:
>> On Mon Mar 2, 2026 at 8:46 AM CST, Shiva Tripathi via
>> lists.yoctoproject.org wrote:
>>> Add ti-encrypted-boot-initramfs for LUKS encryption with TPM-sealed
>>> keys. This provides full disk encryption using dm-crypt with keys
>>> sealed by firmware TPM (fTPM) running in OP-TEE and stored in eMMC RPMB=
.
>>>
>>> The initramfs includes:
>>> - Custom init script for in-place LUKS encryption on first boot
>>> - TPM key sealing/unsealing using persistent handle 0x81080001
>>> - Support for cryptsetup, tpm2-tools, and OP-TEE client
>>> - Automatic filesystem resize after encryption
>>>
>>> ti-encrypted-boot-initramfs builds when MACHINE_FEATURES contains
>>> 'luks-encryption'.
>>>
>>> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
>>> ---
>>> =C2=A0 .../initramfs-ti-encrypted-init/files/init=C2=A0=C2=A0=C2=A0 | 3=
24 ++++++++++++++++++
>>> =C2=A0 .../initramfs-ti-encrypted-init_1.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 30 ++
>>> =C2=A0 .../initramfs/ti-encrypted-boot-initramfs.bb=C2=A0 |=C2=A0 50 ++=
+
>>> =C2=A0 3 files changed, 404 insertions(+)
>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-ti=
-
>>> encrypted-init/files/init
>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-ti=
-
>>> encrypted-init_1.0.bb
>>> =C2=A0 create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-encrypted=
-
>>> boot-initramfs.bb
>>>
>>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-
>>> init/files/init b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-
>>> encrypted-init/files/init
>>> new file mode 100644
>>> index 00000000..6675b6ed
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init/
>>> files/init
>>> @@ -0,0 +1,324 @@
>>> +#!/usr/bin/busybox sh
>>> +# TI SDK initramfs init script with LUKS2 + fTPM encryption support
>>> +
>>> +# Mount essential filesystems
>>> +/usr/bin/busybox echo "Initializing system..."
>>> +/usr/bin/busybox mount -t proc proc /proc
>>> +/usr/bin/busybox mount -t sysfs sysfs /sys
>>> +/usr/bin/busybox mount -t devtmpfs devtmpfs /dev
>>> +
>>> +# Configuration
>>> +BOOT_DEV=3D"/dev/mmcblk1p1"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 # Boot partition (FAT, unencrypted)
>>> +ROOT_DEV=3D"/dev/mmcblk1p2"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 # Root partition (will be
>>> encrypted)
>>> +CRYPT_NAME=3D"root_crypt"
>>> +CRYPT_DEV=3D"/dev/mapper/${CRYPT_NAME}"
>>> +BOOT_MNT=3D"/boot_part"
>>> +TPM_PRIMARY_CTX=3D"/tmp/tpm_primary.ctx"
>>> +TPM_KEY_PRIV=3D"/tmp/tpm_key.priv"
>>> +TPM_KEY_PUB=3D"/tmp/tpm_key.pub"
>>> +TPM_KEY_CTX=3D"/tmp/tpm_key.ctx"
>>> +TPM2_HANDLE=3D"0x81080001"=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # TPM persistent handle for LUKS
>>> key
>>> +ENCRYPTION_MARKER=3D"${BOOT_MNT}/.encryption_in_progress"
>>> +
>>> +# Wait for MMC device to appear (up to 10 seconds)
>>> +/usr/bin/busybox echo "Waiting for storage device..."
>>> +for i in 1 2 3 4 5 6 7 8 9 10; do
>>> +=C2=A0=C2=A0=C2=A0 if [ -b "${ROOT_DEV}" ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox sleep 1
>>> +done
>>> +
>>> +# Check if root device exists
>>> +if [ ! -b "${ROOT_DEV}" ]; then
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERROR: Storage device not fo=
und!"
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox sh
>>> +fi
>>> +
>>> +# Mount boot partition
>>> +/usr/bin/busybox echo "Mounting boot partition..."
>>> +/usr/bin/busybox mkdir -p "${BOOT_MNT}"
>>> +if ! /usr/bin/busybox mount "${BOOT_DEV}" "${BOOT_MNT}"; then
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERROR: Failed to mount boot =
partition!"
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Attempting standard boot..."
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox mkdir -p /newroot
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox mount "${ROOT_DEV}" /newroot
>>> +=C2=A0=C2=A0=C2=A0 exec /usr/sbin/switch_root /newroot /sbin/init
>>> +fi
>>
>> The main boot path should be the error path here, not an arbitrary
>> duplication
>> of logic.
>>
>>> +
>>> +# Initialize fTPM in OP-TEE
>>> +/usr/bin/busybox echo "Initializing secure hardware(fTPM)..."
>>> +
>>> +# Start TEE supplicant (required for fTPM TA to work)
>>> +if [ -x /usr/sbin/tee-supplicant ]; then
>>> +=C2=A0=C2=A0=C2=A0 /usr/sbin/tee-supplicant -d &
>>> +=C2=A0=C2=A0=C2=A0 TEE_SUPPLICANT_PID=3D$!
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox sleep 5
>>> +else
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Warning: Trusted execution e=
nvironment
>>> not available"
>>> +fi
>>> +
>>> +# Load fTPM kernel module
>>> +if ! /sbin/modprobe tpm_ftpm_tee; then
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Warning: TPM module failed t=
o load"
>>> +fi
>>> +
>>> +# Wait for TPM device (up to 10 seconds)
>>> +for i in 1 2 3 4 5 6 7 8 9 10; do
>>> +=C2=A0=C2=A0=C2=A0 if [ -c /dev/tpmrm0 ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox sleep 1
>>> +done
>>
>> This should be a function who's exit code is use in the below script
>> directly
>> instead of rechecking if the device is present.
>>
>>> +
>>> +# Check if TPM is available
>>> +TPM_AVAILABLE=3D0
>>> +if [ -c /dev/tpmrm0 ]; then
>>> +=C2=A0=C2=A0=C2=A0 TPM_AVAILABLE=3D1
>>> +=C2=A0=C2=A0=C2=A0 export TPM2TOOLS_TCTI=3D"device:/dev/tpmrm0"
>>> +else
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Warning: fTPM not available =
- encryption
>>> will be skipped"
>>> +=C2=A0=C2=A0=C2=A0 if [ -n "${TEE_SUPPLICANT_PID}" ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox kill "${TE=
E_SUPPLICANT_PID}" 2>/dev/null
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +fi
>>> +
>>> +# Function: Generate 32-byte random key using TPM RNG
>>> +generate_random_key() {
>>> +=C2=A0=C2=A0=C2=A0 if [ $TPM_AVAILABLE -eq 1 ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/tpm2_getrandom --h=
ex 32
>>> +=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERRO=
R: TPM not available for key
>>> generation"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +}
>>
>> This should probably be reported to the user, or at least they should
>> be told
>> how to access it during runtime.
>>
>>> +
>>> +# Function: Seal data with TPM and store in persistent handle
>>> +tpm_seal_key() {
>>> +=C2=A0=C2=A0=C2=A0 local KEY_DATA=3D"$1"
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if [ $TPM_AVAILABLE -eq 0 ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERRO=
R: TPM not available for sealing"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Create primary key in owner hierarchy
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/tpm2_createprimary -C o -c "${TPM_PRIMARY_=
CTX}" -Q ||
>>> return 1
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Create sealed object
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo -n "${KEY_DATA}" | \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/tpm2_create -C "${=
TPM_PRIMARY_CTX}" \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -u "${TPM_KEY_PUB}" -r "${T=
PM_KEY_PRIV}" \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -i- -Q || return 1
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Load sealed object into TPM
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/tpm2_load -C "${TPM_PRIMARY_CTX}" \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -u "${TPM_KEY_PUB}" -r "${T=
PM_KEY_PRIV}" \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -c "${TPM_KEY_CTX}" -Q || r=
eturn 1
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Make key persistent at handle (stored in TPM NV R=
AM - RPMB)
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/tpm2_evictcontrol -C o -c "${TPM_KEY_CTX}"
>>> "${TPM2_HANDLE}" || return 1
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return 0
>>> +}
>>> +
>>> +# Function: Unseal data from TPM persistent handle
>>> +tpm_unseal_key() {
>>> +=C2=A0=C2=A0=C2=A0 if [ $TPM_AVAILABLE -eq 0 ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERRO=
R: TPM not available for
>>> unsealing" >&2
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Check if persistent handle exists
>>> +=C2=A0=C2=A0=C2=A0 if ! /usr/bin/tpm2_getcap handles-persistent | grep=
 -q
>>> "${TPM2_HANDLE}"; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERRO=
R: TPM persistent handle not
>>> found" >&2
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Unseal key directly from persistent handle
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/tpm2_unseal -c "${TPM2_HANDLE}" || return =
1
>>> +
>>> +=C2=A0=C2=A0=C2=A0 return 0
>>> +}
>>> +
>>> +# Function: Perform in-place LUKS encryption (first boot)
>>> +encrypt_root_filesystem() {
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D"
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "First boot: Encrypting root =
filesystem"
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D"
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Set marker to track encryption progress
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox touch "${ENCRYPTION_MARKER}"
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox sync
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Generate random encryption key using TPM RNG
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Generating encryption key...=
"
>>> +=C2=A0=C2=A0=C2=A0 LUKS_KEY=3D$(generate_random_key)
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if [ -z "${LUKS_KEY}" ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERRO=
R: Failed to generate encryption
>>> key"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox rm -f "${E=
NCRYPTION_MARKER}"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Seal key with TPM before encryption starts
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Securing key with TPM..."
>>> +=C2=A0=C2=A0=C2=A0 if ! tpm_seal_key "${LUKS_KEY}"; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERRO=
R: Failed to secure key"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox rm -f "${E=
NCRYPTION_MARKER}"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Filesystem check before encryption
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Checking filesystem integrit=
y..."
>>> +=C2=A0=C2=A0=C2=A0 /usr/sbin/e2fsck -f -y "${ROOT_DEV}"
>>> +=C2=A0=C2=A0=C2=A0 E2FSCK_RET=3D$?
>>> +=C2=A0=C2=A0=C2=A0 if [ ${E2FSCK_RET} -ge 4 ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERRO=
R: Filesystem check failed"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox rm -f "${E=
NCRYPTION_MARKER}"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Shrink filesystem before encryption to leave room=
 for LUKS header
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Preparing filesystem for enc=
ryption..."
>>> +=C2=A0=C2=A0=C2=A0 /usr/sbin/resize2fs "${ROOT_DEV}" 368M || {
>>
>> Arbitrary size here, prone to failure in the future. Look into the "-
>> M" option
>> instead.
>>
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERRO=
R: Failed to prepare filesystem"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox rm -f "${E=
NCRYPTION_MARKER}"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Perform in-place encryption
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D"
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Encrypting filesystem..."
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "This will take several minut=
es."
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "DO NOT POWER OFF THE DEVICE!=
"
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D"
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo -n "${LUKS_KEY}" | \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/sbin/cryptsetup reencr=
ypt --encrypt \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --type luks2 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --cipher aes-xts-plain64 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --key-size 256 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --hash sha256 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --reduce-device-size 32M \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 --key-file - \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "${ROOT_DEV}" || {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERRO=
R: Encryption failed"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox rm -f "${E=
NCRYPTION_MARKER}"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>>> +=C2=A0=C2=A0=C2=A0 }
>>
>> This should only work on partitions that already contain a LUKS
>> header. The LUKS
>> header is placed in sector 0 of the block device. resize2fs doesn't
>> support
>> changing the starting position of the filesystem so you will always
>> corrupt the
>> existing filesystem. It may still be recoverable, but that's not the
>> point. This
>> is a bad idea.
>>
>> Additionally, the partition should be overwritten with randomized data
>> before
>> use to make sure unused blocks look indistinguishable from later
>> encrypted data.
>> This is not something that can be done using an initramfs without
>> external
>> storage.
>>
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D"
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Encryption completed success=
fully!"
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D"
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Remove encryption marker
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox sync
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Unlock the newly encrypted device
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Activating encrypted filesys=
tem..."
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo -n "${LUKS_KEY}" | \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/sbin/cryptsetup luksOp=
en "${ROOT_DEV}" "${CRYPT_NAME}"
>>> --key-file - || {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERRO=
R: Failed to activate encrypted
>>> filesystem"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Resize filesystem to fit the encrypted device
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Optimizing filesystem..."
>>> +=C2=A0=C2=A0=C2=A0 /usr/sbin/resize2fs -f "${CRYPT_DEV}" || {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERRO=
R: Failed to optimize filesystem"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 1
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Verify filesystem after resize
>>> +=C2=A0=C2=A0=C2=A0 /usr/sbin/e2fsck -f -y "${CRYPT_DEV}" || {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "WARN=
ING: Filesystem verification had
>>> issues, but continuing"
>>> +=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 return 0
>>> +}
>>> +
>>> +# Function: Unlock encrypted root filesystem (subsequent boots)
>>> +unlock_encrypted_root() {
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Unlocking encrypted filesyst=
em..."
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Unseal key from TPM persistent handle
>>> +=C2=A0=C2=A0=C2=A0 LUKS_KEY=3D$(tpm_unseal_key)
>>> +
>>> +=C2=A0=C2=A0=C2=A0 if [ -z "${LUKS_KEY}" ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERRO=
R: Failed to retrieve encryption
>>> key from TPM"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Atte=
mpting passphrase fallback..."
>>> +
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Try to unlock with passph=
rase (interactive)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/sbin/cryptsetup luksOp=
en "${ROOT_DEV}" "${CRYPT_NAME}"
>>> || {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /us=
r/bin/busybox echo "ERROR: Failed to unlock encrypted
>>> filesystem"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /us=
r/bin/busybox sh
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Unlock with unsealed key
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo -n "$=
{LUKS_KEY}" | \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /us=
r/sbin/cryptsetup luksOpen "${ROOT_DEV}"
>>> "${CRYPT_NAME}" --key-file - || {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /us=
r/bin/busybox echo "ERROR: Failed to unlock with TPM
>>> key"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /us=
r/bin/busybox sh
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Encrypted filesystem unlocke=
d"
>>> +}
>>> +
>>> +# Main boot logic
>>> +/usr/bin/busybox echo "Checking filesystem encryption status..."
>>> +
>>> +# Check if device is LUKS encrypted
>>> +if /usr/sbin/cryptsetup isLuks "${ROOT_DEV}"; then
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Filesystem is encrypted"
>>> +=C2=A0=C2=A0=C2=A0 unlock_encrypted_root
>>> +=C2=A0=C2=A0=C2=A0 MOUNT_DEV=3D"${CRYPT_DEV}"
>>> +else
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Filesystem is not encrypted"
>>> +
>>> +=C2=A0=C2=A0=C2=A0 # Check if encryption is enabled and TPM is availab=
le
>>> +=C2=A0=C2=A0=C2=A0 if [ $TPM_AVAILABLE -eq 1 ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Check for encryption mark=
er (resume interrupted encryption)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [ -f "${ENCRYPTION_MARKE=
R}" ]; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /us=
r/bin/busybox echo "Resuming interrupted encryption..."
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
! encrypt_root_filesystem; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERROR: Failed to resume
>>> encryption"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "Booting without encryption..."
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 MOUNT_DEV=3D"${ROOT_DEV}"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 els=
e
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 MOUNT_DEV=3D"${CRYPT_DEV}"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # F=
irst boot - perform encryption
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if =
encrypt_root_filesystem; then
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 MOUNT_DEV=3D"${CRYPT_DEV}"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 els=
e
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERROR: Encryption failed -
>>> booting without encryption"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 MOUNT_DEV=3D"${ROOT_DEV}"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
>>> +=C2=A0=C2=A0=C2=A0 else
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "TPM =
not available - skipping encryption"
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MOUNT_DEV=3D"${ROOT_DEV}"
>>> +=C2=A0=C2=A0=C2=A0 fi
>>> +fi
>>> +
>>> +# Unmount boot partition before switching root
>>> +/usr/bin/busybox umount "${BOOT_MNT}"
>>> +
>>> +# Mount root filesystem (encrypted or unencrypted)
>>> +/usr/bin/busybox echo "Mounting root filesystem..."
>>> +/usr/bin/busybox mkdir -p /newroot
>>> +/usr/bin/busybox mount "${MOUNT_DEV}" /newroot || {
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox echo "ERROR: Failed to mount root =
filesystem!"
>>> +=C2=A0=C2=A0=C2=A0 /usr/bin/busybox sh
>>> +}
>>> +
>>> +/usr/bin/busybox echo "Boot complete"
>>> +
>>> +# Clean up tmpfs
>>> +/usr/bin/busybox rm -f "${TPM_PRIMARY_CTX}" "${TPM_KEY_PUB}"
>>> "${TPM_KEY_PRIV}" "${TPM_KEY_CTX}"
>>> +
>>> +# Switch to real root
>>> +exec /usr/sbin/switch_root /newroot /sbin/init
>>
>> In general I think this effort is misguided. An initrd is not a
>> replacement for
>> live image install. We should not be dramatically changing the running
>> system as
>> part of the first boot.
>=20
> 100% agree.=C2=A0 This is something that should be done at build time as =
part
> of the image creation.
>=20

Thanks for the review comments. I'll work on the changes.

The current implementation focuses on first boot encryption because that
way it's possible to seal encryption keys to TPM persistent handle
0x81080001 via tpm2_evictcontrol. The key becomes device-bound through
TPM's internal sealing keys (unique per device) and is stored in the
device's RPMB (not on the filesystem).

Build-time encryption with TPM-sealed keys is not possible because:
- TPM hardware is not available during image build
- Each target device has a unique TPM with device-specific sealing keys
- RPMB authentication is device-specific

The key must be sealed on the actual target device where the TPM exists.
CIP Core's initramfs-crypt-hook uses the same approach [1]- first-boot
in-place encryption with TPM sealing

[1]
https://gitlab.com/cip-project/cip-core/isar-cip-core/-/blob/master/doc/REA=
DME.tpm2.encryption.md#encrypted-partitions

Regards,
Shiva

>=20
>>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-
>>> init_1.0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-
>>> encrypted-init_1.0.bb
>>> new file mode 100644
>>> index 00000000..7da878f7
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-
>>> init_1.0.bb
>>> @@ -0,0 +1,30 @@
>>> +SUMMARY =3D "TI encrypted boot initramfs init script"
>>> +DESCRIPTION =3D "Custom /init script for encrypted boot with fTPM +
>>> LUKS support"
>>> +
>>> +LICENSE =3D "MIT"
>>> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/
>>> COPYING.MIT;md5=3D3da9cfbcb788c80a0384361b4de20420"
>>> +
>>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}/files:"
>>> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
>>> +
>>> +SRC_URI =3D "file://init"
>>> +
>>> +S =3D "${WORKDIR}/sources"
>>> +UNPACKDIR =3D "${WORKDIR}"
>>> +
>>> +# This recipe must run in the initramfs context
>>> +inherit allarch
>>> +
>>> +do_install() {
>>> +=C2=A0=C2=A0=C2=A0 # Install /init script to root of initramfs
>>> +=C2=A0=C2=A0=C2=A0 install -m 0755 ${UNPACKDIR}/init ${D}/init
>>> +}
>>> +
>>> +# Package the /init file
>>> +FILES:${PN} =3D "/init"
>>> +
>>> +# Runtime dependencies
>>> +RDEPENDS:${PN} =3D "busybox cryptsetup tpm2-tools tpm2-tss optee-
>>> client e2fsprogs-e2fsck e2fsprogs-resize2fs util-linux-blkid"
>>> +
>>> +# This package must be included in initramfs
>>> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
>>> diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-
>>> initramfs.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-
>>> initramfs.bb
>>> new file mode 100644
>>> index 00000000..314499db
>>> --- /dev/null
>>> +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-initramfs.bb
>>> @@ -0,0 +1,50 @@
>>> +SUMMARY =3D "TI encrypted boot initramfs image"
>>> +
>>> +DESCRIPTION =3D "Minimal initramfs image with dm-crypt/fTPM support
>>> for encrypted root filesystem. \
>>> +This initramfs provides LUKS encryption with TPM-sealed keys stored
>>> in RPMB."
>>> +
>>> +LICENSE =3D "MIT"
>>> +
>>> +# Only build this when luks-encryption feature is enabled
>>> +COMPATIBLE_MACHINE =3D "null"
>>> +COMPATIBLE_MACHINE:k3 =3D "${@bb.utils.contains('MACHINE_FEATURES',
>>> 'luks-encryption', '.*', 'null', d)}"
>>> +
>>> +INITRAMFS_FSTYPES =3D "cpio.gz"
>>> +
>>> +IMAGE_NAME =3D "ti-encrypted-boot-initramfs"
>>> +
>>> +export IMAGE_BASENAME =3D "${IMAGE_NAME}"
>>> +
>>> +# Install our custom init script and dependencies
>>> +PACKAGE_INSTALL =3D "\
>>> +=C2=A0=C2=A0=C2=A0 initramfs-ti-encrypted-init \
>>> +=C2=A0=C2=A0=C2=A0 busybox \
>>> +=C2=A0=C2=A0=C2=A0 base-passwd \
>>> +=C2=A0=C2=A0=C2=A0 kmod \
>>> +=C2=A0=C2=A0=C2=A0 cryptsetup \
>>> +=C2=A0=C2=A0=C2=A0 tpm2-tools \
>>> +=C2=A0=C2=A0=C2=A0 tpm2-tss \
>>> +=C2=A0=C2=A0=C2=A0 libtss2-tcti-device \
>>> +=C2=A0=C2=A0=C2=A0 optee-client \
>>> +=C2=A0=C2=A0=C2=A0 util-linux-blkid \
>>> +=C2=A0=C2=A0=C2=A0 e2fsprogs-e2fsck \
>>> +=C2=A0=C2=A0=C2=A0 e2fsprogs-resize2fs \
>>> +=C2=A0=C2=A0=C2=A0 kernel-module-tpm-ftpm-tee \
>>> +=C2=A0=C2=A0=C2=A0 ${ROOTFS_BOOTSTRAP_INSTALL} \
>>> +"
>>> +
>>> +# Ensure the initramfs only contains the bare minimum
>>> +IMAGE_FEATURES =3D ""
>>> +IMAGE_LINGUAS =3D ""
>>> +
>>> +# Exclude kernel image from initramfs
>>> +PACKAGE_EXCLUDE =3D "kernel-image-*"
>>> +
>>> +IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
>>> +IMAGE_NAME_SUFFIX ?=3D ""
>>> +IMAGE_ROOTFS_SIZE =3D "16384"
>>> +IMAGE_ROOTFS_EXTRA_SPACE =3D "0"
>>> +
>>> +BAD_RECOMMENDATIONS +=3D "busybox-syslog"
>>> +
>>> +inherit image
>>
>=20


