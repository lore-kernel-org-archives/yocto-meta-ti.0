Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.5829.1607347300472988660
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 07 Dec 2020 05:21:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=CyNyHpFl;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: dmurphy@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B7DLcM5097058
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Dec 2020 07:21:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607347298;
	bh=PuCDTSMW5jC5lIRE2A4zwP3JstOWd04iRaUPzRge/Fc=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=CyNyHpFlIoCv49Ck2gRtQxZA9kXD+KbadbD8LEHl1AFmDREcxlHZrj+2p9zrCg9L0
	 nFAiXz5hGBLIAN9FbkzpInyppITdujI1NxVZ0S3L0sf/ixr1zMZMaI9Ch9MvnnxMRH
	 cWpVmoJ61wHqvBwY4/1VG/vieomf9nikiDcqTsB8=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B7DLcEX086501
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 7 Dec 2020 07:21:38 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Dec
 2020 07:21:38 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Dec 2020 07:21:38 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B7DLcNo058998;
	Mon, 7 Dec 2020 07:21:38 -0600
Subject: Re: [PATCH] [meta-ti][dunfell/master][PATCH] set serverip after dhcp
To: Caleb Robey <c-robey@ti.com>, <meta-ti@lists.yoctoproject.org>
CC: Lucas Weaver <l-weaver@ti.com>, a0232989 <a0232989@ti.com>
References: <20201203221953.26215-1-c-robey@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <e38d9a21-e212-8801-054f-88ceef028632@ti.com>
Date: Mon, 7 Dec 2020 07:21:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201203221953.26215-1-c-robey@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Caleb

On 12/3/20 4:19 PM, Caleb Robey wrote:
> From: a0232989 <a0232989@ti.com>
>
> There is a documented issue where the u-boot dhcp command,
> when autoboot is set to "no", will reset serverip to the
> gateway ip address. This is a workaround that should not
> have any negative affect on these scripts and will prevent
> this issue for occuring.
>
> Issue:
> https://stackoverflow.com/questions/13975468/in-u-boot-can-the-dhcp-command-automatically-set-the-serverip-environment-varia
>
> Note: we display this behavior in older scripts, but dropped
> the nomenclature lately and default NFS setups do not work
> out of the box as a result.
>
> Signed-off-by: Caleb Robey <c-robey@ti.com>
> ---
>   setup-uboot-env-am335x.sh     | 4 ++--
>   setup-uboot-env-am43x.sh      | 2 +-
>   setup-uboot-env-am57xx-evm.sh | 2 +-
>   setup-uboot-env-am65x.sh      | 5 ++---
>   4 files changed, 6 insertions(+), 7 deletions(-)

Wrong list. These need to go to meta-arago mail list

Dan
