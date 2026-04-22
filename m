Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A72FA1FD7
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 16:39:34 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com (CY7PR03CU001.outbound.protection.outlook.com [40.93.198.70])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.87229.1776875971126537095
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 22 Apr 2026 09:39:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=h0th81U0;
 spf=pass (domain: ti.com, ip: 40.93.198.70, mailfrom: rs@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=llsUwqGcrBkRgOlJT4EZvB23ASuDqkHTErKPAw7Kpb+LPuWmN86kKE6WSSq56LXApwyqfGNkrELGJP/i+R7RoEbSVLt/BMSaUI9ThKvXVc/f/zIYpW9IB4FDy8txpFv37UNhCNoBsTo9UnrhdJDigBQTmGdvQZu/47pq3Qh+/hYkTq6AT976fCFOwQ8EY8V1r5b1dx/3mYODMyMtZWnv2Oh08UwbjPajw50Cg0D0i13v+9SRIahYuDf2qHWll7tJ7qMn7qQO72yTQ5Za0u01mmjtm2WAGSSA7clc44gP9CMR4I73eDVPdqhIxQMwbUD662ixBwF0IDYVRU2XMDw8/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lv7UcgBCOZhezO4HdFdfHPTNaV/iYAOGmhsR5GwThI=;
 b=SpHcOCfd9cLOFpKg1nNWDd3q813C81GshrNh0ml3y+YybBOaWvk0rbUBAzXajBFNrCCBiqrBNptADwsJaSThMbYotMxIQMsCtARDPT9kS6z2QhC+z+eju6gWZWw2UVVL6gHUfcROpRPH2L7ORwurOVoj1HX7KIrk/VwNV3yCAG1RodgYdEcxQ8tRampaVs4GxCP16p2zHp9wQjqPFiCsAbX5DTS0TaCZps0uFbNR176foM8ca9kQlyW1SE4vCYWoHE7cL+JyGkPspWe3tFRnN5fGeWrCw+6p3zYgffanYAHIPQ2Q9AXWAT+l/Thli8oWh6tkq4B9/AapbVU1jiLIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lv7UcgBCOZhezO4HdFdfHPTNaV/iYAOGmhsR5GwThI=;
 b=h0th81U0LzZmacPxgjGnE10rkC9uGt6zspOGn2k8KtomRn4J2RYFqcP1bCn4OR3MFeR10LwW+wCIwFyK9D34bMuAtMk/4nbJaCptUq7fg/QlLFN0eBspvTJSBvNpFuA5OoRTXK65nZuRdQeyDDzex8WsjP4zGI7cTySGoK3Gmts=
Received: from BY3PR10CA0010.namprd10.prod.outlook.com (2603:10b6:a03:255::15)
 by SA1PR10MB6614.namprd10.prod.outlook.com (2603:10b6:806:2b9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.16; Wed, 22 Apr
 2026 16:39:25 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:a03:255:cafe::9d) by BY3PR10CA0010.outlook.office365.com
 (2603:10b6:a03:255::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9791.48 via Frontend Transport; Wed,
 22 Apr 2026 16:39:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Wed, 22 Apr 2026 16:39:23 +0000
Received: from DFLE206.ent.ti.com (10.64.6.64) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 11:39:23 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE206.ent.ti.com
 (10.64.6.64) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 22 Apr
 2026 11:39:23 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Wed, 22 Apr 2026 11:39:23 -0500
Received: from localhost (rs-desk.dhcp.ti.com [128.247.81.39])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 63MGdN5N2727109;
	Wed, 22 Apr 2026 11:39:23 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 22 Apr 2026 11:39:23 -0500
Message-ID: <DHZTYKIA3SU8.1RGLJYU49Z18Y@ti.com>
From: Randolph Sapp <rs@ti.com>
To: Yogesh Hegde <y-hegde@ti.com>, <meta-ti@lists.yoctoproject.org>,
	<afd@ti.com>
CC: <praneeth@ti.com>, <prudhvi@ti.com>, <rs@ti.com>, <jm@ti.com>,
	<reatmon@ti.com>
Subject: Re: [master][PATCH] am62lxx-evm: Override serial console to ttyS0
 only
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260422062227.4098420-1-y-hegde@ti.com>
In-Reply-To: <20260422062227.4098420-1-y-hegde@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|SA1PR10MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: 63f1cb5d-0a58-43bc-3a1c-08dea08db62a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	oqHV7siAFxpfCfXdpxJwxIIZPUwD/zM4q4O3yZFKH5t5I9xv4LcSfFE17DF3JPavls9xYNfLbE7sDltTnmbk5Cx+u8QjMlUuJMzHKlW+6Hbuw+0W3OABMTzwYqP/qs/Z7CM9AxF9muoQHWtfjcFUYjmk9SDW2iVfx+Vi5luOzpeQN/Z1ZBcKPdVTor7vm+5rNftjBq3BmzzKjrEjNFqJG/vcQ7cPQROkFNLMhWL3CGC9iaUVDi6vU86SwysZwlyYmU+KD4TtB5oSPSGekJFzXoRnWvllHvjJnL01QZTwC2pTGEGDihEmre7Irr75GYKnOWYIoO+naHAGrfsYeE0gNvfiCRwYHjIJvqDntxcvOPgD2rVpacxXbf7B2GlqT860gXFc9fFpPnBqSeDF0Uby15oOw8W6SL7+cHPqegXAQcpIoyUyWAx+gKMA5iwpPDVcoit7Jgh5fix3/k+a/3WIOK74BbvQXYCuU79VU39vc6yPrTufa23U8Z3bZGF/dodHgIxjfRibeyQQBC0RTNBwGHvYe/Uu2WBCJC3+C6ZciF120LNyQYc5NFGcop70tdUFBTaoyuI7jNaVJEiFbCs+HpywKM/0xXDIyu5fbF0BDOiqPrXIIvSHACPVnIov5nOtdnBYhjcnJ/EUU3zDBbdNQqNzstD6ELrf5SrZeB0wPKsNqk7KXXVIK23JFF9UmbjkUXqacj6s+nG00gQMDSFzJdBvgfJe7lgh2lOjcwfZI/N1fxjLaqZa1BoZR9ZmTfrTZfCrVuV4dZJUmcEG5jsxrw==
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	L/sieVazr7IPjXYY8hJ/vBOmv80y9Dk7+vs0See1rmYLwWFY+RR7hAMGLUsUPl+YhsMUPuvhKpwcwtLwYugMIgWTo1yHXhvb3d/czbmAjSXgwk/vHP3Ay5hshBxPCNRp1vlgdQ+yQi0NLlshHOK7ET/3uPT9n61x6bdW30dTtSAbtFlIxcFkRi6PsuEvPzlXnJ6y/1nooUGMFH+eXdCW2Xa1+JGa82wVzWu6oJp23sQP6nBfW0buKXkjpCFTQWFpjzKDJ8bg7E88oCnvxe2rap+VpFafQgO37Wznl8deEkDKNiCSqQr+Y1VfZVhIFlIYM9yMd3ZeRxoeslpy8X1GlcQFA3yq9Vtnbnzr1yOxAVr6cNIvOcLW+yFNiqAnrNHXBIbxwN6Vo4oAfb0TsIzYUFJVXb+sOk1ipR+8JSPO7IvvxXqIaDAZ8NDAbjvyoYDn
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 16:39:23.8995
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63f1cb5d-0a58-43bc-3a1c-08dea08db62a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB6614
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 22 Apr 2026 16:39:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19869

On Wed Apr 22, 2026 at 1:22 AM CDT, Yogesh Hegde wrote:
> The am62lxx-evm board only has ttyS0 available. The k3 default
> SERIAL_CONSOLES inherited includes ttyS2, which causes
> systemd to wait indefinitely for a console that never appears,
> significantly increasing boot time and degrading user experience.
>
> Override SERIAL_CONSOLES to specify only ttyS0, allowing the boot
> process to proceed normally without waiting for unavailable consoles.
>
> Signed-off-by: Yogesh Hegde <y-hegde@ti.com>
> ---
>
> Boot time is increased from 33s to 2m18s.
> Boot time is measured from power on to TI LVGL demo
> running on HDMI Display.=20
>
> Logs:=20
>
> root@am62lxx-evm:~# systemd-analyze critical-chain ti-lvgl-demo.service
> The time when unit became active or started is printed after the "@" char=
acter.
> The time the unit took to start is printed after the "+" character.
> ti-lvgl-demo.service @1min 32.588s
> `-multi-user.target @1min 32.577s
>   `-getty.target @1min 32.575s
>     `-serial-getty@ttyS0.service @13.002s
>       `-systemd-user-sessions.service @10.847s +660ms
>         `-network.target @10.582s
>           `-systemd-networkd.service @8.748s +1.799s
>             `-network-pre.target @8.735s
>               `-iptables.service @7.477s +920ms
>                 `-basic.target @7.363s
>                   `-dbus-broker.service @6.661s +466ms
>                     `-dbus.socket @6.310s +434us
>                       `-sysinit.target @6.263s
>                         `-systemd-vconsole-setup.service @18.198s +391ms
>                           `-systemd-journald.socket @2.781s +335us
>                             `-system.slice @1.282s
>                               `--.slice @1.282s
>
> From the time analysis log, `getty.target` takes 1min 32 secs to bootup d=
ue to=20
> serial-getty@ttyS2.service failed. This service fails because there is no=
=20
> hardware associated with ttyS2.=20
>
> ---
>  meta-ti-bsp/conf/machine/am62lxx-evm.conf | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-ti-bsp/conf/machine/am62lxx-evm.conf b/meta-ti-bsp/conf=
/machine/am62lxx-evm.conf
> index 677d6955..edfb4057 100644
> --- a/meta-ti-bsp/conf/machine/am62lxx-evm.conf
> +++ b/meta-ti-bsp/conf/machine/am62lxx-evm.conf
> @@ -4,6 +4,8 @@
> =20
>  require conf/machine/include/am62lxx.inc
> =20
> +SERIAL_CONSOLES =3D "115200;ttyS0"
> +
>  IMAGE_FSTYPES +=3D "ubifs ubi"
> =20
>  MKUBIFS_ARGS ?=3D "-F -m 4096 -e 258048 -c 12000"

Systemd's getty generator might still try to grab ttyS0 in other scenarios,=
 but
this at least fixes the default behavior of trying to wait for the kernel s=
erial
console on this board.

Out of curiosity, why did this change for this board? As I recall Andrew an=
d
Nishanth had a debate about this a few years back and the result was to
standardize to ttyS2 for all k3.

Reviewed-by: Randolph Sapp <rs@ti.com>

