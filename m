Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.9657.1628698425375606955
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 11 Aug 2021 09:13:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@ti.com header.s=ti-com-17q1 header.b=AmcW1Gus;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: nm@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17BGDZnM101005;
	Wed, 11 Aug 2021 11:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1628698415;
	bh=XPCJd7AY3OsnGsct5FePDJ6+4TBI9Odf5eDZ2/60sYo=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=AmcW1Gushi/yhizgpvC73+029/2tEWEOwIWiiRo5q84LALGICCc1PZ5NLc1i9oZOl
	 5heYeAMsmal496Qh4lu+TpFOhFFq0dZMoim466r6StXLPzLu2kpuQ96kMdL4gwN1BG
	 tQYqyVYFy2rJLFNigpg5ofrrWx1eScNOrOxr605s=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17BGDZbV032818
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 11 Aug 2021 11:13:35 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 11
 Aug 2021 11:13:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 11 Aug 2021 11:13:34 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17BGDYmP082765;
	Wed, 11 Aug 2021 11:13:34 -0500
Date: Wed, 11 Aug 2021 11:13:34 -0500
From: "Nishanth Menon" <nm@ti.com>
To: Michael <kakuschky@elbe-net.de>
CC: <meta-ti@lists.yoctoproject.org>
Subject: Re: [meta-ti] dunfell kernel 5.10 ti-sgx-ddk-km kernel errors at boot
Message-ID: <20210811161334.ufskdqypra3tj3sd@encore>
References: <EiRi.1628694531238614074.IC29@lists.yoctoproject.org>
MIME-Version: 1.0
In-Reply-To: <EiRi.1628694531238614074.IC29@lists.yoctoproject.org>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 17BGDZnM101005
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08:08-20210811, Michael wrote:
> The kernel 5.10 and ti-sgx-ddk-km build know and I can create an image.
>=20
> Now I still have two problems and need some advice what I'm doing wrong=
 or how to fix these issues.
>=20
> 1.) The sgx section of my dts file is not recognized
>=20
> &sgx {
> status =3D "okay";
> };
>=20
> I got the error "Label or path sgx not found". In older version it was =
recognized.


That is because there is a sgx node in device tree, I dont think it has
been introduced so far.

>=20
> 2.) When booting with a dts without sgx section the created image SGX K=
ernel module is started and produced some errors
>=20
> [=A0=A0 12.480473] PVR_K: UM DDK-(4948957) and KM DDK-(4948957) match. =
[ OK ]
> [=A0=A0 13.484084] PVR_K:(Error): PollForValueKM: Timeout. Expected 0x1=
 but found 0x0 (mask 0x1).

I remember seeing this before.. I remember there was a bug of SGX
support with the driver, essentially it is not detecting the hardware.

Not sure if that has been fixed in the DDK.

> [=A0=A0 13.492411] PVR_K:(Error): SGXInitialise: Wait for uKernel initi=
alisation failed
> [=A0=A0 13.499873] PVR_K: SGX debug (SGX_DDK sgxddk 1.17@4948957)
> [=A0=A0 13.505396] PVR_K:=A0 Host Ctl flags=3D 00000006
> [=A0=A0 13.509683] PVR_K: SGX Host control:
> [=A0=A0 13.513274] PVR_K:=A0=A0 (HC-0) 0x00000000 0x00000000 0x00000000=
 0x00000000
> [=A0=A0 13.519858] PVR_K:=A0=A0 (HC-10) 0x00000000 0x00000000 0x0000001=
4 0x00030D40
> [=A0=A0 13.526514] PVR_K:=A0=A0 (HC-20) 0x00000000 0x00000000 0x0000000=
0 0x00000000
> [=A0=A0 13.533159] PVR_K:=A0=A0 (HC-30) 0x00000000 0x00000000 0xEEDCCB0=
0 0x00000000
> [=A0=A0 13.539825] PVR_K:=A0=A0 (HC-40) 0x00000000 0x00000000 0x0000000=
0 0x00000000
> [=A0=A0 13.546483] PVR_K: SGX TA/3D control:
> [=A0=A0 13.550164] PVR_K:=A0=A0 (T3C-0) 0x0F003000 0x0F003140 0x0F00200=
0 0x00000000
> [=A0=A0 13.556818] PVR_K:=A0=A0 (T3C-10) 0x00000000 0x00000000 0x000000=
02 0x00000000
> [=A0=A0 13.563549] PVR_K:=A0=A0 (T3C-20) 0x00000000 0x00000000 0x000000=
00 0x00000000
> [=A0=A0 13.570303] PVR_K:=A0=A0 (T3C-30) 0x00000000 0x00000000 0x000000=
00 0x00000000
> [=A0=A0 13.577046] PVR_K:=A0=A0 (T3C-40) 0x00000000 0x00000000 0x000000=
00 0x00000000
> [=A0=A0 13.583778] PVR_K:=A0=A0 (T3C-50) 0x00000000 0x00000000 0x000000=
00 0x00000000
> [=A0=A0 13.590532] PVR_K:=A0=A0 (T3C-60) 0x00000000 0x00000000 0x000000=
00 0x00000000
> [=A0=A0 13.597276] PVR_K:=A0=A0 (T3C-70) 0x00000000 0x00000000 0x000000=
00 0x00000000
> [=A0=A0 13.604032] PVR_K:=A0=A0 (T3C-80) 0x00000000 0x00000000 0x000000=
00 0x0F000000
> [=A0=A0 13.610764] PVR_K:=A0=A0 (T3C-90) 0x828CF000 0x00000000 0x000000=
00 0x00000000
> [=A0=A0 13.617506] PVR_K:=A0=A0 (T3C-A0) 0x00000000 0x00000000 0x000000=
00 0x00000000
> [=A0=A0 13.624260] PVR_K:=A0=A0 (T3C-B0) 0x00000000 0x00000000 0x000000=
00 0x00000000
> [=A0=A0 13.630993] PVR_K:=A0=A0 (T3C-C0) 0x00000000 0x00000000 0x000000=
00 0x00000000
> [=A0=A0 13.637736] PVR_K:=A0=A0 (T3C-D0) 0x0F000000 0x8000B000 0x8004B0=
00 0x0F004000
> [=A0=A0 13.644490] PVR_K:=A0=A0 (T3C-E0) 0x0F00A420 0x0F00A740 0x000000=
00 0x00000000
> [=A0=A0 13.651222] PVR_K:=A0=A0 (T3C-F0) 0x00000000 0x00000000 0x000000=
00 0x00000000
> [=A0=A0 13.657965] PVR_K:=A0=A0 (T3C-100) 0x00000000 0x00000000 0x00000=
000 0x00000000
> [=A0=A0 13.672226] PVR_K:=A0=A0 (T3C-110) 0x00000000 0x00000000 0x00000=
000 0x00000000
> [=A0=A0 13.679215] PVR_K:=A0=A0 (T3C-120) 0x00000000 0x00000000 0x00000=
000 0x00000000
> [=A0=A0 13.686113] PVR_K: SGX Kernel CCB WO:0x0 RO:0x0
> [=A0=A0 13.690667] PVR_K: Active syncs
> [=A0=A0 13.693825] PVR_K:(Error): SGXPostPowerState: SGXInitialise fail=
ed
> [=A0=A0 13.700303] PVR_K:(Error): PVRSRVSetDevicePowerStateKM : Transit=
ion to 0 FAILED 0x18
> [=A0=A0 13.708147] PVR_K:(Error): SGXScheduleCCBCommandKM failed to pow=
er up device - ui32CallerID:-1 eError:24
> [=A0=A0 13.717696] PVR_K:(Error): SGXGetMiscInfoUkernel: SGXScheduleCCB=
CommandKM failed.
> [=A0=A0 13.725223] PVR_K: (FAIL) SGXInit: Unable to validate hardware c=
ore revision
> [=A0=A0 13.732306] PVR_K:(Error): PVRSRVFinaliseSystem: Failed PVRSRVDe=
vInitCompatCheck call (device index: 0)
> PVR:(Error): PVRSRVInitSrvDisconnect: KM returned 24 [0, ][=A0=A0 13.74=
2023] PVR_K:(Error): BridgedDispatchKM: Initialisation failed.=A0 Driver =
unusable.
>=20
> PVR:(Error): PVRSRVBridgeCall: Failed to access device.=A0 Function ID:=
3223086862 (strerror returns no value.). [0, ]
>=20


I think you could wait for TI to fix it, or report it over e2e.ti.com

--=20
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DD=
B5 849D 1736 249D
