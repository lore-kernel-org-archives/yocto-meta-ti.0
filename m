Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.14120.1625253395300650844
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 02 Jul 2021 12:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=HaMv7cVB;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 162JGXhv021278;
	Fri, 2 Jul 2021 14:16:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625253393;
	bh=4oJuI/RPw5nVHXBhtVPOM0H0gahllXS6IbFJf7uPvtY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=HaMv7cVBbf6BSRK5PgpQ4mMJIgM5YA8VOkpBcX3NoW2AlgI+n5kdVJFNy/dY813cl
	 gGGzHDHfoDYuhoX7Karwjp4bv/FAJsH/rB2NjFtr3RskxAsH0PA3jti1ySPg28N1Eq
	 vxKqtcNhX4LQyEWb5vPDhSb0yN+lzdHujVq64aCg=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 162JGX3q098416
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 2 Jul 2021 14:16:33 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 2 Jul
 2021 14:16:33 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 2 Jul 2021 14:16:33 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 162JGXHs090161;
	Fri, 2 Jul 2021 14:16:33 -0500
Subject: Re: [dunfell/master PATCH V2] conf: j7-evm: Add j721e eaik dtb to KERNEL_DEVICETREE
To: Sinthu Raja <sinthu.raja@mistralsolutions.com>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        Yogesh
 Siraswar <yogeshs@ti.com>
CC: "Vutla, Lokesh" <lokeshvutla@ti.com>,
        "Raja, M Sinthu"
	<sinthu.raja@ti.com>
References: <20210702085707.1225-1-sinthu.raja@ti.com>
From: "praneeth" <praneeth@ti.com>
Message-ID: <428ef685-0016-751b-5e76-bbf4e8be7006@ti.com>
Date: Fri, 2 Jul 2021 14:16:33 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702085707.1225-1-sinthu.raja@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 162JGXhv021278
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/2/2021 3:57 AM, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
>=20
> J721E EdgeAI Kit (EAIK) is a low cost, small form factor board designed
> for TI=E2=80=99s J721E SoC. TI=E2=80=99s J721E SoC comprises of dual co=
re A72, high
> performance vision accelerators, video codec accelerators, latest C71x
> and C66x DSP, high bandwidth real-time IPs for capture and display,
> GPU, dedicated safety island and security accelerators.
>=20
> J721E EAIK supports the following interfaces:
> * 4 GB LPDDR4 RAM
> * x1 Gigabit Ethernet interface
> * x1 USB 3.0 Type-C port
> * x3 USB 3.0 Type-A ports
> * x1 PCIe M.2 E Key
> * x1 PCIe M.2 M Key
> * x2 CSI2 Camera interface (RPi and TI Camera connector)
> * 40-pin Raspberry Pi compatible GPIO header
>=20
> J721e EVM and EAIK uses the unified bootloader. Add j721e eaik dtb
> for machine=3Dj721e-evm
>=20
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>

Reviewed-by: Praneeth Bajjuri <praneeth@ti.com>

> ---
> Added Reviewed-by.
> The U-boot and kernel patches are merged, this patch can be merged
> once the SRCREV is updated to the latest commit in linux and u-boot
> recipies.
> V1 Patch link:
> https://lists.yoctoproject.org/g/meta-ti/message/13857
>=20
>   conf/machine/j7-evm.conf | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
> index 1b99baeb..3cf0f186 100644
> --- a/conf/machine/j7-evm.conf
> +++ b/conf/machine/j7-evm.conf
> @@ -11,6 +11,7 @@ SERIAL_CONSOLES_CHECK =3D "${SERIAL_CONSOLES}"
>  =20
>   KERNEL_DEVICETREE =3D " \
>       ti/k3-j721e-common-proc-board.dtb \
> +    ti/k3-j721e-eaik.dtb \

Yogesh,

Please make sure the kernel commitsha is updated first and then the dtb=20
update

Kernel changes has recently been merged:
Ref:=20
https://git.ti.com/cgit/ti-linux-kernel/ti-linux-kernel/commit/?h=3Dti-li=
nux-5.10.y&id=3D5c52c20f0031b04357eae6044e538e37a8c9054d=20


as long as kernel recipe pointing to atleast the mentioned commit, then=20
you can merge the dtb update(this patch)

builds will fail if you pull this patch without the kernel commitsha chan=
ge.

>   "
>  =20
>   UBOOT_MACHINE =3D "j721e_evm_a72_config"
>=20
