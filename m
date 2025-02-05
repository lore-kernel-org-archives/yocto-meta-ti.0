Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7F7C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 07:52:56 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.6995.1738741966185153692
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2025 23:52:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=zTE0kzjE;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5157qjC93313640
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Feb 2025 01:52:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1738741965;
	bh=F3SiKR8n5s//fToCuixNxOIBnadAQFogTBxSsfq95ek=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=zTE0kzjE1tiEa/LaXicyDbkJm335rk5cdgrIPGqe90lxHD14m/OS6Xc8jIEXhn0D3
	 JcH43HGKVaOt6nKAzf5plFx7isrqD/1uBCdvJSHewOXK4oNuJ+PJhCefKx2W5PC6KP
	 nj0YyT+bY1AmYbLaKPv/vySP4wQz9YuEIg6rfyqk=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5157qjKi082287
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 5 Feb 2025 01:52:45 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 5
 Feb 2025 01:52:44 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 5 Feb 2025 01:52:45 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5157qg7i047614;
	Wed, 5 Feb 2025 01:52:43 -0600
Message-ID: <a1293c13-9f64-475c-bd49-0e5d94a09e8f@ti.com>
Date: Wed, 5 Feb 2025 13:22:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [PATCH] conf: machine: j722s: Add overlay to
 KERNEL_DEVICETREE_PREFIX
To: <a-dutta@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <u-kumar1@ti.com>, <meta-ti@lists.yoctoproject.org>
References: <20250205073251.42414-1-a-dutta@ti.com>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20250205073251.42414-1-a-dutta@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 5157qjC93313640
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Wed, 05 Feb 2025 07:52:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18270

Hi,

Is this intended for master, scarthgap or both?
as subject prefix doesn't mention the target branch.

meta-ti convention is - [meta-ti][branch-name/s][PATCH]

checkout [1] for more details


[1]: https://lists.yoctoproject.org/g/meta-ti/messages?dir=3Ddesc

--
Chirag

On 05/02/25 13:02, Anurag Dutta via lists.yoctoproject.org wrote:
> Add the overlay "k3-j7200-evm-mcspi-loopback.=E2=80=8Adtso" to the j722=
s=20
> configuration so that SPI loopback tests can be carried out=20
> successfully. Signed-off-by: Anurag Dutta <a-dutta@=E2=80=8Ati.=E2=80=8A=
com> ---=20
> meta-ti-bsp/conf/machine/j722s-evm.=E2=80=8Aconf | 1 + 1
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!uFdqXRfP1m1bKqZk3=
LPDfOi2poL4OClMb3IQWBMLR7Hs_8vJrAjdbzKut0Ums3yL50vq-atYRdntACEuvn8$>=20
>
> ZjQcmQRYFpfptBannerEnd
> Add the overlay "k3-j7200-evm-mcspi-loopback.dtso" to the j722s
> configuration so that SPI loopback tests can be carried out
> successfully.
>
> Signed-off-by: Anurag Dutta <a-dutta@ti.com>
> ---
>   meta-ti-bsp/conf/machine/j722s-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/meta-ti-bsp/conf/machine/j722s-evm.conf b/meta-ti-bsp/conf=
/machine/j722s-evm.conf
> index 2af0981e..8f42866c 100644
> --- a/meta-ti-bsp/conf/machine/j722s-evm.conf
> +++ b/meta-ti-bsp/conf/machine/j722s-evm.conf
> @@ -7,6 +7,7 @@ require conf/machine/include/j722s.inc
>   KERNEL_DEVICETREE_PREFIX =3D " \
>       ti/k3-j722s \
>       ti/k3-fpdlink \
> +    ti/k3-j7200-evm-mcspi-loopback \
>       ti/k3-v3link \
>   "
>  =20
> --=20
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18269): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/18269__;!!G3vK!XtFGvKLXQl7jW5WRVs4amySH=
OYw6_sWc6SMhtGivEXzjmIK_B73jrA36bkb9L3XfO2uMadFW88EobYYZAxz6mGJbpkp7WEEJ4=
A$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/111008641/7030289__;!!G3vK!XtFGvKLXQl7jW5WRVs4amySHOYw6_sWc6SMhtG=
ivEXzjmIK_B73jrA36bkb9L3XfO2uMadFW88EobYYZAxz6mGJbpkqdnUHh5Q$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!XtFGvKLXQl7jW5WRVs4amySHOYw6_sWc6SMhtGivEXzjmIK=
_B73jrA36bkb9L3XfO2uMadFW88EobYYZAxz6mGJbpkqq16zQHQ$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

