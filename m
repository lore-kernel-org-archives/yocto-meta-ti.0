Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BEA99E00BAD; Mon,  8 Jul 2019 13:52:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AD281E008F2
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2019 13:52:04 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x68Kq3I6047202
	for <meta-ti@yoctoproject.org>; Mon, 8 Jul 2019 15:52:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562619123;
	bh=+ao8A8f2alMxqW9e/7Rz3+iiGWR2zLHuORHvp8e0pto=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=MMyxQGdpzk9IgYpkWKIPfkeQzxC0C2M5ERLh3qaWAvd5JZ7tv8aTt/jHI/6vjhcHu
	iMUqU1u1I8xsUmjlwKV/P6Z9Pu9N9kmLK7yOtCPLjcGaTLeQWf2R1TVold0GG7earx
	oynVaKNU5Onh74Pq/AKwucwxEuQErkH11gqJDepE=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x68Kq3rL105101
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Mon, 8 Jul 2019 15:52:03 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 8 Jul 2019 15:52:03 -0500
Received: from DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895]) by
	DFLE112.ent.ti.com ([fe80::d4dd:a09e:396d:a895%17]) with mapi id
	15.01.1713.004; Mon, 8 Jul 2019 15:52:03 -0500
From: "Dmytriyenko, Denys" <denys@ti.com>
To: "Devshatwar, Nikhil" <nikhil.nd@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [[meta-ti] [thud] PATCH v1] j7-evm: Add new DTBO for jailhouse
Thread-Index: AQHVNb1xiVQfHp6Y4UeUJaDcv9KLq6bBMlJw
Date: Mon, 8 Jul 2019 20:52:03 +0000
Message-ID: <34e0e6a4ff47413b9149de83037e4838@ti.com>
References: <1562611580-75662-1-git-send-email-nikhil.nd@ti.com>
In-Reply-To: <1562611580-75662-1-git-send-email-nikhil.nd@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.67.208]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Cc: "R, Karthik" <karthik.ramanan@ti.com>
Subject: Re: [ [thud] PATCH v1] j7-evm: Add new DTBO for jailhouse
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 08 Jul 2019 20:52:05 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

make[3]: *** No rule to make target 'arch/arm64/boot/dts/ti/k3-j721e-common=
-proc-board-jailhouse.dtbo'.  Stop.

Should the kernel recipe be updated first?


> -----Original Message-----
> From: Devshatwar, Nikhil
> Sent: Monday, July 8, 2019 2:46 PM
> To: meta-ti@yoctoproject.org; Dmytriyenko, Denys
> Cc: R, Karthik; Devshatwar, Nikhil
> Subject: [[meta-ti] [thud] PATCH v1] j7-evm: Add new DTBO for jailhouse
>=20
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> ---
>  conf/machine/j7-evm.conf | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/conf/machine/j7-evm.conf b/conf/machine/j7-evm.conf
> index 9a2fada..55d7d61 100644
> --- a/conf/machine/j7-evm.conf
> +++ b/conf/machine/j7-evm.conf
> @@ -14,6 +14,7 @@ KERNEL_DEVICETREE =3D " \
>      ti/k3-j721e-dp0.dtbo \
>      ti/k3-j721e-common-proc-board-infotainment.dtbo \
>      ti/k3-j721e-common-proc-board-infotainment-display-sharing.dtbo \
> +    ti/k3-j721e-common-proc-board-jailhouse.dtbo \
>  "
>=20
>  UBOOT_MACHINE =3D "j721e_evm_a72_config"
> --
> 1.9.1


