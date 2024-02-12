Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF1BC48297
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 11:57:48 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.4896.1707739059248228676
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 12 Feb 2024 03:57:39 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=bcvJdzrH;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41CBvcxE130839
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 05:57:38 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707739058;
	bh=tYfYiTMVELbhdqtMy1OUzs7n9u2ya3XdGL2XZlKsaq0=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bcvJdzrHOJuSE7MC+uhrGgVUWWbwP+FUNdeB65xMVL8tFSWFI6hK60q9HM4FeXkD9
	 LeeDeu2gxqBWIfYhIOjvYEsTXZI1FF6ux5XBJE8yNrOt4n6zsZZ4vtO98/1cWoEuEE
	 bhQSmlte7s9+xvqjCAoOHL2o2H+8FpxtGuTS1IzM=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41CBvcUH027538
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 05:57:38 -0600
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 12
 Feb 2024 05:57:38 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 12 Feb 2024 05:57:38 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41CBvZVO075167;
	Mon, 12 Feb 2024 05:57:35 -0600
Message-ID: <7612053f-0cfd-4f54-8063-395b796527e5@ti.com>
Date: Mon, 12 Feb 2024 17:27:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [PATCH 2/2] meta-ti-bsp:
 trusted-firmware-arm: Update to master
Content-Language: en-US
To: <m-chawdhry@ti.com>, <meta-ti@lists.yoctoproject.org>,
        Ryan Eatmon
	<reatmon@ti.com>
CC: Aniket Limaye <a-limaye@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Kamlesh Gurudasani <kamlesh@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>, Dhruva Gole <d-gole@ti.com>,
        Udit Kumar <u-kumar1@ti.com>
References: <20240212102933.4157741-1-m-chawdhry@ti.com>
 <20240212102933.4157741-2-m-chawdhry@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20240212102933.4157741-2-m-chawdhry@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 41CBvcxE130839
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 12 Feb 2024 11:57:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17474

NAK as this is addressed by a v2 -=20
https://lists.yoctoproject.org/g/meta-ti/message/17469


<https://lists.yoctoproject.org/g/meta-ti/message/17469>
On 12/02/24 15:59, Manorit Chawdhry via lists.yoctoproject.org wrote:
> The current master has the support for power off functionality, update=20
> to that. Signed-off-by: Manorit Chawdhry <m-chawdhry@=E2=80=8Ati.=E2=80=
=8Acom> ---=20
> ..=E2=80=8A.=E2=80=8A/recipes-bsp/trusted-firmware-a/trusted-firmware-a=
-ti.=E2=80=8Ainc | 4=20
> ++-- 1 file changed, 2 insertions(+),
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> ZjQcmQRYFpfptBannerEnd
> The current master has the support for power off functionality, update
> to that.
>
> Signed-off-by: Manorit Chawdhry <m-chawdhry@ti.com>
> ---
>   .../recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc  | 4 ++-=
-
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmwar=
e-a-ti.inc b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-=
a-ti.inc
> index b27870051a1b..fb161726f8c3 100644
> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.=
inc
> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.=
inc
> @@ -1,5 +1,5 @@
> -PV:k3 =3D "2.9+git${SRCPV}"
> -SRCREV_tfa:k3 =3D "d7a7135d32a8c7da004c0c19b75bd4e2813f9759"
> +PV:k3 =3D "2.10+git${SRCPV}"
> +SRCREV_tfa:k3 =3D "00f1ec6b8740ccd403e641131e294aabacf2a48b"
>   SRC_URI:k3 =3D "git://git.trustedfirmware.org/TF-A/trusted-firmware-a=
.git;protocol=3Dhttps;name=3Dtfa;branch=3Dmaster"
>   COMPATIBLE_MACHINE:k3 =3D "k3"
>   TFA_BUILD_TARGET:k3 =3D "all"
> --=20
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17468): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17468__;!!G3vK!Tug9K3z3XiC8CtaK0SY2tzMw=
s10D5sDGpWV0CWy8C0I5W6p6NijCFSvQzhl-JuKaqoK11PreZ_SvGWR_aIgSoxxQsHxddnVie=
R0g$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/104308975/7030289__;!!G3vK!Tug9K3z3XiC8CtaK0SY2tzMws10D5sDGpWV0CW=
y8C0I5W6p6NijCFSvQzhl-JuKaqoK11PreZ_SvGWR_aIgSoxxQsHxddgdkSb4e$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!Tug9K3z3XiC8CtaK0SY2tzMws10D5sDGpWV0CWy8C0I5W6p=
6NijCFSvQzhl-JuKaqoK11PreZ_SvGWR_aIgSoxxQsHxddtWcay2T$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

