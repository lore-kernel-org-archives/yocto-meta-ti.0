Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEEFBC4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 11:46:28 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4768.1707738384351848872
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 03:46:24 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=TQtNjWQJ;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CBkN6l129237
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 05:46:23 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707738383;
	bh=uHcBMaiq9rHg9wBtw+9ZfUlzJuW7XehKiRX3oAOWWxc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=TQtNjWQJKuAhWkR4dk7OK4tlRZnQK9CQ3OY/jEfbgJIhd5COJ6zyv6jwSzSG0iLvK
	 N9CcUqD1S4Jy7xX5P+VhBRUoNE6t2Z489z3rOrjN/h9FHSDqkOzu2+7GwGyosBTNkq
	 dUxPKSMb4XU+41hwY5iAhOmXLDF2Q4urO4tO9aLA=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CBkNO4017078
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 05:46:23 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 05:46:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 05:46:23 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CBkKqq065043;
	Mon, 12 Feb 2024 05:46:20 -0600
Message-ID: <438be919-5aee-4681-a6ca-3713e7c68fbe@ti.com>
Date: Mon, 12 Feb 2024 17:16:19 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [PATCH 1/2] meta-ti-bsp: optee: Upgrade to
 4.1
Content-Language: en-US
To: <m-chawdhry@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon
	<reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Udit Kumar <u-kumar1@ti.com>
References: <20240212102933.4157741-1-m-chawdhry@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240212102933.4157741-1-m-chawdhry@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 41CBkN6l129237
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 11:46:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17473

NAK as this is addressed by a v2 -=20
https://lists.yoctoproject.org/g/meta-ti/message/17469


On 12/02/24 15:59, Manorit Chawdhry via lists.yoctoproject.org wrote:
> Update all OP-TEE components to 4.=E2=80=8A1 tag. OP-TEE examples are a=
lready=20
> in 4.=E2=80=8A1 tag. Signed-off-by: Manorit Chawdhry <m-chawdhry@=E2=80=
=8Ati.=E2=80=8Acom> ---=20
> ..=E2=80=8A.=E2=80=8A/recipes-security/optee/optee-client-ti-version.=E2=
=80=8Ainc | 4 ++--=20
> meta-ti-bsp/recipes-security/optee/optee-os-ti-version.=E2=80=8Ainc
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> Update all OP-TEE components to 4.1 tag. OP-TEE examples are already in
> 4.1 tag.
>
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
>   .../recipes-security/optee/optee-client-ti-version.inc        | 4 ++-=
-
>   meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc    | 4 ++-=
-
>   meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc  | 4 ++-=
-
>   3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version=
.inc b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> index 0da37acf735f..0f1da594cd34 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-client-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV =3D "4.0.0+git${SRCPV}"
> -SRCREV =3D "acb0885c117e73cb6c5c9b1dd9054cb3f93507ee"
> +PV =3D "4.1.0+git${SRCPV}"
> +SRCREV =3D "f7e4ced15d1fefd073bbfc484fe0e1f74afe96c2"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc=
 b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> index 2e4e53b7ed03..34f4c809c58a 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-os-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV =3D "4.0.0+git${SRCPV}"
> -SRCREV =3D "2a5b1d1232f582056184367fb58a425ac7478ec6"
> +PV =3D "4.1.0+git${SRCPV}"
> +SRCREV =3D "012cdca49db398693903e05c42a254a3a0c0d8f2"
> diff --git a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.i=
nc b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> index 48231a669d6a..0091ad5696d0 100644
> --- a/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> +++ b/meta-ti-bsp/recipes-security/optee/optee-test-ti-version.inc
> @@ -1,2 +1,2 @@
> -PV =3D "4.0.0+git${SRCPV}"
> -SRCREV =3D "1c3d6be5eaa6174e3dbabf60928d15628e39b994"
> +PV =3D "4.1.0+git${SRCPV}"
> +SRCREV =3D "2e1e7a9c9d659585566a75fc8802f4758c42bcb2"
> --=20
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17467): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17467__;!!G3vK!VMFmkTW2mpNVH-S0_FtBska4=
42vZ2SKSG1eLBvT24lIH0V2RTlLXa9sYAaEXIaQHDndqhptvtg70FUcyyhUPRqnNddPWUj4Kk=
9ab$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/104308974/7030289__;!!G3vK!VMFmkTW2mpNVH-S0_FtBska442vZ2SKSG1eLBv=
T24lIH0V2RTlLXa9sYAaEXIaQHDndqhptvtg70FUcyyhUPRqnNddPWUhFiWJTO$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!VMFmkTW2mpNVH-S0_FtBska442vZ2SKSG1eLBvT24lIH0V2=
RTlLXa9sYAaEXIaQHDndqhptvtg70FUcyyhUPRqnNddPWUqdS2zmj$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

