Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.5158.1575585036038399258
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 05 Dec 2019 14:30:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=QQTwHyjl;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: d-senicic1@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xB5MUZ6J079955;
	Thu, 5 Dec 2019 16:30:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1575585035;
	bh=eZI90EWd3zDqRVFt0hQThF2WtRn5qmk0hlZG2pIDrps=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=QQTwHyjlZSub/W/BKaKMr6t85dCGzjQEllkOrbP1o9rGvmJyJxuRRfwbQ1x3lLnMj
	 WAT9TXVGmhrpBEgL9g7wo9cfjFQrIGmGF9yLWWk8Jdf42wo1U9nW+K+xfrv3M66Ec4
	 nOeSJKuLn6XNZVFjJFDNoMd1yC7loAZsGgqcsTNM=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id xB5MUZAx045503;
	Thu, 5 Dec 2019 16:30:35 -0600
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 5 Dec
 2019 16:30:34 -0600
Received: from DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d]) by
 DLEE100.ent.ti.com ([fe80::ad4d:c227:3f85:880d%17]) with mapi id
 15.01.1847.003; Thu, 5 Dec 2019 16:30:34 -0600
From: "djordje senicic" <d-senicic1@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
CC: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
        "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti][thud/master][PATCH] cmem: Adding am5729idk specific CMEM configuration
Thread-Topic: [meta-ti][thud/master][PATCH] cmem: Adding am5729idk specific
 CMEM configuration
Thread-Index: AQHVpS8pJ2k+it0erUae4W7gyWFc66esZiAA///F6OA=
Date: Thu, 5 Dec 2019 22:30:34 +0000
Message-ID: <d0c7e4d3dde5405996aeb523df8c3b76@ti.com>
References: <20191127142816.15503-1-x0157990@ti.com>
 <20191205195534.GO24609@beryl>
In-Reply-To: <20191205195534.GO24609@beryl>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.96.62]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Addressed naming ("i"->"idk") in PATCHv2: https://lists.yoctoproject.org/g/=
meta-ti/message/12552=20

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Thursday, December 5, 2019 2:56 PM
To: Senicic, Djordje
Cc: meta-ti@yoctoproject.org; meta-ti@lists.yoctoproject.org
Subject: Re: [meta-ti][thud/master][PATCH] cmem: Adding am5729idk specific =
CMEM configuration

On Wed, Nov 27, 2019 at 09:28:16AM -0500, djordje senicic via Lists.Yoctopr=
oject.Org wrote:
> - CMEM memory block increased to 512MB to enable TIDL using 4xEVE and 2xD=
SP
>=20
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>  recipes-kernel/linux/cmem.inc                 |  9 +++--
>  .../linux/files/dra7xx/cmem-am572i.dtsi       | 40 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 4 deletions(-)
>  create mode 100644 recipes-kernel/linux/files/dra7xx/cmem-am572i.dtsi
>=20
> diff --git a/recipes-kernel/linux/cmem.inc b/recipes-kernel/linux/cmem.in=
c
> index 8bd643f4..8d33fe35 100644
> --- a/recipes-kernel/linux/cmem.inc
> +++ b/recipes-kernel/linux/cmem.inc
> @@ -2,14 +2,15 @@
>  #
>  # Use these for temporary overrides
>  CMEM_MACHINE =3D "${MACHINE}"
> -CMEM_MACHINE_am57xx-evm =3D "am571x am572x am574x"
> -CMEM_MACHINE_am57xx-hs-evm =3D "am571x am572x am574x"
> +CMEM_MACHINE_am57xx-evm =3D "am571x am572x am572i am574x"
> +CMEM_MACHINE_am57xx-hs-evm =3D "am571x am572x am572i am574x"
>  CMEM_MACHINE_dra7xx-evm =3D "dra71x dra72x dra74x dra76x"
>  CMEM_MACHINE_dra7xx-hs-evm =3D "dra71x dra72x dra74x dra76x"
> =20
>  # Set cmem.dtsi per machine or machine variant
>  CMEM_DTSI =3D "cmem.dtsi"
>  CMEM_DTSI_am571x =3D "cmem-am571x.dtsi"
> +CMEM_DTSI_am572i =3D "cmem-am572i.dtsi"

Why not use the full "idk" instead of a single "i" in dtsi and machine name=
s -=20
a single change from "x" to "i" is too subtle and can be missed/forgotten i=
n=20
the future...


>  CMEM_DTSI_am574x =3D "cmem-am574x.dtsi"
>  CMEM_DTSI_dra71x =3D "cmem-dra71x.dtsi"
>  CMEM_DTSI_dra72x =3D "cmem-dra72x.dtsi"
> @@ -18,8 +19,8 @@ CMEM_DTSI_dra76x =3D "cmem-dra76x.dtsi"
>  # Split device trees between variants
>  CMEM_DEVICETREE =3D "${KERNEL_DEVICETREE}"
>  CMEM_DEVICETREE_am571x =3D "am571x-idk.dtb am571x-idk-lcd-osd101t2045.dt=
b am571x-idk-lcd-osd101t2587.dtb"
> -CMEM_DEVICETREE_am572x =3D "am57xx-beagle-x15.dtb am57xx-beagle-x15-revc=
.dtb \
> -                          am572x-idk.dtb am572x-idk-lcd-osd101t2045.dtb =
am572x-idk-lcd-osd101t2587.dtb"
> +CMEM_DEVICETREE_am572x =3D "am57xx-beagle-x15.dtb am57xx-beagle-x15-revc=
.dtb"
> +CMEM_DEVICETREE_am572i =3D "am572x-idk.dtb am572x-idk-lcd-osd101t2045.dt=
b am572x-idk-lcd-osd101t2587.dtb"
>  CMEM_DEVICETREE_am574x =3D "am574x-idk.dtb am574x-idk-lcd-osd101t2587.dt=
b"
>  CMEM_DEVICETREE_dra71x =3D "dra71-evm.dtb"
>  CMEM_DEVICETREE_dra72x =3D "dra72-evm.dtb dra72-evm-lcd-osd101t2045.dtb =
dra72-evm-lcd-osd101t2587.dtb \
> diff --git a/recipes-kernel/linux/files/dra7xx/cmem-am572i.dtsi b/recipes=
-kernel/linux/files/dra7xx/cmem-am572i.dtsi
> new file mode 100644
> index 00000000..6c39e22c
> --- /dev/null
> +++ b/recipes-kernel/linux/files/dra7xx/cmem-am572i.dtsi
> @@ -0,0 +1,40 @@
> +/ {
> +        reserved-memory {
> +                #address-cells =3D <2>;
> +                #size-cells =3D <2>;
> +                ranges;
> +
> +                cmem_block_mem_0: cmem_block_mem@a0000000 {
> +                        reg =3D <0x0 0xa0000000 0x0 0x20000000>;
> +                        no-map;
> +                        status =3D "okay";
> +                };
> +
> +		cmem_block_mem_1_ocmc3: cmem_block_mem@40500000 {
> +			reg =3D <0x0 0x40500000 0x0 0x100000>;
> +			no-map;
> +			status =3D "okay";
> +		};
> +        };
> +
> +        cmem {
> +                compatible =3D "ti,cmem";
> +                #address-cells =3D <1>;
> +                #size-cells =3D <0>;
> +
> +		#pool-size-cells =3D <2>;
> +
> +                status =3D "okay";
> +
> +                cmem_block_0: cmem_block@0 {
> +                        reg =3D <0>;
> +                        memory-region =3D <&cmem_block_mem_0>;
> +                        cmem-buf-pools =3D <1 0x0 0x20000000>;
> +                };
> +
> +		cmem_block_1: cmem_block@1 {
> +			reg =3D <1>;
> +			memory-region =3D <&cmem_block_mem_1_ocmc3>;
> +		};
> +        };
> +};
> --=20
> 2.17.1
>=20

> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
>=20
> View/Reply Online (#12533): https://lists.yoctoproject.org/g/meta-ti/mess=
age/12533
> Mute This Topic: https://lists.yoctoproject.org/mt/62541901/1051543
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub  [denys@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

