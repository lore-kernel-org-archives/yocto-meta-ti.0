Return-Path: <nikhil.nd@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2A7A4E00C81; Mon,  8 Jul 2019 22:45:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.248 listed in list.dnswl.org]
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8CB0E00951
	for <meta-ti@yoctoproject.org>; Mon,  8 Jul 2019 22:45:20 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x695jKnF088385
	for <meta-ti@yoctoproject.org>; Tue, 9 Jul 2019 00:45:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1562651120;
	bh=4g4x3OoSDvlYXDbWozJwZ5NzILFlOWx7KWUdlirjEQ0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=yWtErdqSnJr2omjzHSQ9jKcxs1opYZUoD02BlfwRlf7HQ+LLahxtqIfaj9EWn5Plo
	NdDV+L5f9eUlt6KhE/9I4S8ibYvQXX9a3m6ANasMgHsoXIUBAmijnyI9ZSTVGYfk3m
	WID5S6I+GhHJd2xSAnR03+QaruflHoG4GVaRzd7o=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x695jKEu090580
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 9 Jul 2019 00:45:20 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 9 Jul 2019 00:45:20 -0500
Received: from DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb]) by
	DFLE108.ent.ti.com ([fe80::c18:99ac:4a4:2ceb%17]) with mapi id
	15.01.1713.004; Tue, 9 Jul 2019 00:45:20 -0500
From: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-ti@yoctoproject.org"
	<meta-ti@yoctoproject.org>
Thread-Topic: [[meta-ti] [thud] PATCH v1] j7-evm: Add new DTBO for jailhouse
Thread-Index: AQHVNb1ye5I+o4LEJ0qFP8ui2VZ1C6bBhlSAgABAuOA=
Date: Tue, 9 Jul 2019 05:45:20 +0000
Message-ID: <dfbdf88320524b22a5ce45ee3f2d2658@ti.com>
References: <1562611580-75662-1-git-send-email-nikhil.nd@ti.com>
	<34e0e6a4ff47413b9149de83037e4838@ti.com>
In-Reply-To: <34e0e6a4ff47413b9149de83037e4838@ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.250.132.63]
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
X-List-Received-Date: Tue, 09 Jul 2019 05:45:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

From: Dmytriyenko, Denys=20
Sent: Tuesday, July 9, 2019 2:22 AM
To: Devshatwar, Nikhil; meta-ti@yoctoproject.org
Cc: R, Karthik
Subject: RE: [[meta-ti] [thud] PATCH v1] j7-evm: Add new DTBO for jailhouse

> make[3]: *** No rule to make target 'arch/arm64/boot/dts/ti/k3-j721e-comm=
on-proc-board-jailhouse.dtbo'.  Stop.

> Should the kernel recipe be updated first?
Yes, that must be the issue.
I am facing some do_compile error in the tidl-import, could not verify the =
yocto build

Regards,
Nikhil D
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


