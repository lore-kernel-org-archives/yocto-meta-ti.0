Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web12.18367.1637885538876005413
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Nov 2021 16:12:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=UNCYu/Gh;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: praneeth@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1AQ0CDUs023415;
	Thu, 25 Nov 2021 18:12:13 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1637885533;
	bh=x1XK/Dh8snEL4ukE5XLIwFOcNHrFMFnQ0dot0tql9Qg=;
	h=From:To:CC:Subject:Date:References:In-Reply-To;
	b=UNCYu/GhmQPz6LSJTcyWnzISbKVsQJvC3LDAXDKV5jMdkrIjtS5Avhr1yQocvyURr
	 mSLTkZ9mh0Qg/SENZdBm3jCNnPw+PQkINBxjgEGHBhLFE2dUde7et4oa9626QTnRgj
	 uFl5TpZmkjca8y3Ftp1ZtLj9TMQO0Ihsk77x/q/o=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1AQ0CD9t048774
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 25 Nov 2021 18:12:13 -0600
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 25
 Nov 2021 18:12:12 -0600
Received: from DLEE110.ent.ti.com ([fe80::546b:3e96:e947:ccce]) by
 DLEE110.ent.ti.com ([fe80::546b:3e96:e947:ccce%20]) with mapi id
 15.01.2308.014; Thu, 25 Nov 2021 18:12:12 -0600
From: "praneeth" <praneeth@ti.com>
To: Khem Raj <raj.khem@gmail.com>,
        "aricciardi@baylibre.com"
	<aricciardi@baylibre.com>,
        "Balagopalakrishnan, Anand" <anandb@ti.com>,
        "Bhargav, Krunal" <k-bhargav@ti.com>
CC: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>,
        "Denys
 Dmytriyenko" <denis@denix.org>
Subject: Re: [meta-ti] Errors with 5.10 kernel + ti-sgx-ddk on bbb
Thread-Topic: [meta-ti] Errors with 5.10 kernel + ti-sgx-ddk on bbb
Thread-Index: AQHX4kWc7tQxl5lBZEWlt47ZCGyouawU7/pX
Date: Fri, 26 Nov 2021 00:12:12 +0000
Message-ID: <92d1d6e1-0f23-4f4a-884b-5b429907e39c@email.android.com>
References: <CAMKF1spBkte+39N4OMnX-93ef0Rm2pUiqZaHFaotJLN1MizTSg@mail.gmail.com>
In-Reply-To: <CAMKF1spBkte+39N4OMnX-93ef0Rm2pUiqZaHFaotJLN1MizTSg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_92d1d6e10f234f4a884b5b429907e39cemailandroidcom_"

--_000_92d1d6e10f234f4a884b5b429907e39cemailandroidcom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Apologies for top post.

Khem,
Thanks for reporting. We have observed similar failure on other platforms w=
ith same sgx core.

A fix is in progress.  Will keep you posted.


--Praneeth


On Nov 25, 2021 3:44 PM, Khem Raj <raj.khem@gmail.com> wrote:
Hi

I am trying to use ti-sgx-ddk-um for egl and ended up with the
following errors. I wonder
if 5.10 kernel + pvr is supposed to work on bbb.

root@beaglebone:~# uname -a
Linux beaglebone 5.10.65-gf22103162c #1 PREEMPT Thu Oct 21 18:27:04
UTC 2021 armv7l armv7l armv7l GNU/Linux


root@beaglebone:~# /usr/bin/rc.pvr reload
Unloaded PowerVR consumer services.
[  732.691512] [drm] Initialized pvr 1.17.4948957 20110701 for
56000000.gpu on minor 1
[  732.726444] PVR_K: UM DDK-(4948957) and KM DDK-(4948957) match. [ OK ]
[  733.736908] PVR_K:(Error): PollForValueKM: Timeout. Expected 0x1
but found 0x0 (mask 0x1).
[  733.745233] PVR_K:(Error): SGXInitialise: Wait for uKernel
initialisation failed
[  733.756365] PVR_K: SGX debug (SGX_DDK sgxddk 1.17@4948957)
[  733.763365] PVR_K:  Host Ctl flags=3D 00000006
[  733.768918] PVR_K: SGX Host control:
[  733.772546] PVR_K:   (HC-0) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.781209] PVR_K:   (HC-10) 0x00000000 0x00000000 0x00000014 0x00030D40
[  733.789240] PVR_K:   (HC-20) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.795900] PVR_K:   (HC-30) 0x00000000 0x00000000 0x19CAA170 0x00000000
[  733.804558] PVR_K:   (HC-40) 0x00000000 0x00000000 0x00000000 0x00000818
[  733.812416] PVR_K: SGX TA/3D control:
[  733.816113] PVR_K:   (T3C-0) 0x0F003000 0x0F003140 0x0F002000 0x00000000
[  733.824822] PVR_K:   (T3C-10) 0x00000000 0x00000000 0x00000002 0x0000000=
0
[  733.832801] PVR_K:   (T3C-20) 0x00000000 0x00000000 0x00000000 0x0000000=
0
[  733.840733] PVR_K:   (T3C-30) 0x00000000 0x00000000 0x00000000 0x0000000=
0
[  733.848792] PVR_K:   (T3C-40) 0x00000000 0x00000000 0x00000000 0x0000000=
0
[  733.855551] PVR_K:   (T3C-50) 0x00000000 0x00000000 0x00000000 0x0000000=
0
[  733.864329] PVR_K:   (T3C-60) 0x00000000 0x00000000 0x00000000 0x0000000=
0
[  733.872316] PVR_K:   (T3C-70) 0x00000000 0x00000000 0x00000000 0x0000000=
0
[  733.880262] PVR_K:   (T3C-80) 0x00000000 0x00000000 0x00000000 0x0F00000=
0
[  733.888176] PVR_K:   (T3C-90) 0x81D8D000 0x00000000 0x00000000 0x0000000=
0
[  733.894920] PVR_K:   (T3C-A0) 0x00000000 0x00000000 0x00000000 0x0000000=
0
[  733.903663] PVR_K:   (T3C-B0) 0x00000000 0x00000000 0x00000000 0x0000000=
0
[  733.911628] PVR_K:   (T3C-C0) 0x00000000 0x00000000 0x00000000 0x0000000=
0
[  733.919526] PVR_K:   (T3C-D0) 0x0F000000 0x8000B000 0x8004B000 0x0F00400=
0
[  733.926268] PVR_K:   (T3C-E0) 0x0F00A420 0x0F00A740 0x00000000 0x0000000=
0
[  733.934984] PVR_K:   (T3C-F0) 0x00000000 0x00000000 0x00000000 0x0000000=
0
[  733.942953] PVR_K:   (T3C-100) 0x00000000 0x00000000 0x00000000 0x000000=
00
[  733.950925] PVR_K:   (T3C-110) 0x00000000 0x00000000 0x00000000 0x000000=
00
[  733.958901] PVR_K:   (T3C-120) 0x00000000 0x00000000 0x00001140 0x000000=
78
[  733.965732] PVR_K: SGX Kernel CCB WO:0x0 RO:0x0
[  733.972327] PVR_K: Active syncs
[  733.975503] PVR_K:(Error): SGXPostPowerState: SGXInitialise failed
[  733.983694] PVR_K:(Error): PVRSRVSetDevicePowerStateKM : Transition
to 0 FAILED 0x18
[  733.992700] PVR_K:(Error): SGXScheduleCCBCommandKM failed to power
up device - ui32CallerID:-1 eError:24
[  734.003537] PVR_K:(Error): SGXGetMiscInfoUkernel:
SGXScheduleCCBCommandKM failed.
[  734.012507] PVR_K: (FAIL) SGXInit: Unable to validate hardware core revi=
sion
[  734.020812] PVR_K:(Error): PVRSRVFinaliseSystem: Failed
PVRSRVDevInitCompatCheck call (device index: 0)
PVR:(Error): PVRSRVInitSrvDisconnect: KM returned 24 [0, ][
734.031803] PVR_K:(Error): BridgedDispatchKM: Initialisation failed.
Driver unusable.

PVR:(Error): PVRSRVBridgeCall: Failed to access device.  Function
ID:3223086862 (strerror returns no value.). [0, ]
PVR:(Error): SrvInit: PVRSRVInitSrvDisconnect failed (24). See srvkm
log for details. [0, ]
/usr/bin/pvrsrvctl: SrvInit failed (already initialized?)
(err=3DPVRSRV_ERROR_RETRY)

--_000_92d1d6e10f234f4a884b5b429907e39cemailandroidcom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div dir=3D"auto">Apologies for top post.
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Khem,&nbsp;</div>
<div dir=3D"auto">Thanks for reporting. We have observed similar failure on=
 other platforms with same sgx core.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">A fix is in progress.&nbsp; Will keep you posted.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">--Praneeth&nbsp;</div>
<div dir=3D"auto"><br>
</div>
</div>
<div class=3D"x_gmail_extra"><br>
<div class=3D"x_gmail_quote">On Nov 25, 2021 3:44 PM, Khem Raj &lt;raj.khem=
@gmail.com&gt; wrote:<br type=3D"attribution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi<br>
<br>
I am trying to use ti-sgx-ddk-um for egl and ended up with the<br>
following errors. I wonder<br>
if 5.10 kernel &#43; pvr is supposed to work on bbb.<br>
<br>
root@beaglebone:~# uname -a<br>
Linux beaglebone 5.10.65-gf22103162c #1 PREEMPT Thu Oct 21 18:27:04<br>
UTC 2021 armv7l armv7l armv7l GNU/Linux<br>
<br>
<br>
root@beaglebone:~# /usr/bin/rc.pvr reload<br>
Unloaded PowerVR consumer services.<br>
[&nbsp; 732.691512] [drm] Initialized pvr 1.17.4948957 20110701 for<br>
56000000.gpu on minor 1<br>
[&nbsp; 732.726444] PVR_K: UM DDK-(4948957) and KM DDK-(4948957) match. [ O=
K ]<br>
[&nbsp; 733.736908] PVR_K:(Error): PollForValueKM: Timeout. Expected 0x1<br=
>
but found 0x0 (mask 0x1).<br>
[&nbsp; 733.745233] PVR_K:(Error): SGXInitialise: Wait for uKernel<br>
initialisation failed<br>
[&nbsp; 733.756365] PVR_K: SGX debug (SGX_DDK sgxddk 1.17@4948957)<br>
[&nbsp; 733.763365] PVR_K:&nbsp; Host Ctl flags=3D 00000006<br>
[&nbsp; 733.768918] PVR_K: SGX Host control:<br>
[&nbsp; 733.772546] PVR_K:&nbsp;&nbsp; (HC-0) 0x00000000 0x00000000 0x00000=
000 0x00000000<br>
[&nbsp; 733.781209] PVR_K:&nbsp;&nbsp; (HC-10) 0x00000000 0x00000000 0x0000=
0014 0x00030D40<br>
[&nbsp; 733.789240] PVR_K:&nbsp;&nbsp; (HC-20) 0x00000000 0x00000000 0x0000=
0000 0x00000000<br>
[&nbsp; 733.795900] PVR_K:&nbsp;&nbsp; (HC-30) 0x00000000 0x00000000 0x19CA=
A170 0x00000000<br>
[&nbsp; 733.804558] PVR_K:&nbsp;&nbsp; (HC-40) 0x00000000 0x00000000 0x0000=
0000 0x00000818<br>
[&nbsp; 733.812416] PVR_K: SGX TA/3D control:<br>
[&nbsp; 733.816113] PVR_K:&nbsp;&nbsp; (T3C-0) 0x0F003000 0x0F003140 0x0F00=
2000 0x00000000<br>
[&nbsp; 733.824822] PVR_K:&nbsp;&nbsp; (T3C-10) 0x00000000 0x00000000 0x000=
00002 0x00000000<br>
[&nbsp; 733.832801] PVR_K:&nbsp;&nbsp; (T3C-20) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[&nbsp; 733.840733] PVR_K:&nbsp;&nbsp; (T3C-30) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[&nbsp; 733.848792] PVR_K:&nbsp;&nbsp; (T3C-40) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[&nbsp; 733.855551] PVR_K:&nbsp;&nbsp; (T3C-50) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[&nbsp; 733.864329] PVR_K:&nbsp;&nbsp; (T3C-60) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[&nbsp; 733.872316] PVR_K:&nbsp;&nbsp; (T3C-70) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[&nbsp; 733.880262] PVR_K:&nbsp;&nbsp; (T3C-80) 0x00000000 0x00000000 0x000=
00000 0x0F000000<br>
[&nbsp; 733.888176] PVR_K:&nbsp;&nbsp; (T3C-90) 0x81D8D000 0x00000000 0x000=
00000 0x00000000<br>
[&nbsp; 733.894920] PVR_K:&nbsp;&nbsp; (T3C-A0) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[&nbsp; 733.903663] PVR_K:&nbsp;&nbsp; (T3C-B0) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[&nbsp; 733.911628] PVR_K:&nbsp;&nbsp; (T3C-C0) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[&nbsp; 733.919526] PVR_K:&nbsp;&nbsp; (T3C-D0) 0x0F000000 0x8000B000 0x800=
4B000 0x0F004000<br>
[&nbsp; 733.926268] PVR_K:&nbsp;&nbsp; (T3C-E0) 0x0F00A420 0x0F00A740 0x000=
00000 0x00000000<br>
[&nbsp; 733.934984] PVR_K:&nbsp;&nbsp; (T3C-F0) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[&nbsp; 733.942953] PVR_K:&nbsp;&nbsp; (T3C-100) 0x00000000 0x00000000 0x00=
000000 0x00000000<br>
[&nbsp; 733.950925] PVR_K:&nbsp;&nbsp; (T3C-110) 0x00000000 0x00000000 0x00=
000000 0x00000000<br>
[&nbsp; 733.958901] PVR_K:&nbsp;&nbsp; (T3C-120) 0x00000000 0x00000000 0x00=
001140 0x00000078<br>
[&nbsp; 733.965732] PVR_K: SGX Kernel CCB WO:0x0 RO:0x0<br>
[&nbsp; 733.972327] PVR_K: Active syncs<br>
[&nbsp; 733.975503] PVR_K:(Error): SGXPostPowerState: SGXInitialise failed<=
br>
[&nbsp; 733.983694] PVR_K:(Error): PVRSRVSetDevicePowerStateKM : Transition=
<br>
to 0 FAILED 0x18<br>
[&nbsp; 733.992700] PVR_K:(Error): SGXScheduleCCBCommandKM failed to power<=
br>
up device - ui32CallerID:-1 eError:24<br>
[&nbsp; 734.003537] PVR_K:(Error): SGXGetMiscInfoUkernel:<br>
SGXScheduleCCBCommandKM failed.<br>
[&nbsp; 734.012507] PVR_K: (FAIL) SGXInit: Unable to validate hardware core=
 revision<br>
[&nbsp; 734.020812] PVR_K:(Error): PVRSRVFinaliseSystem: Failed<br>
PVRSRVDevInitCompatCheck call (device index: 0)<br>
PVR:(Error): PVRSRVInitSrvDisconnect: KM returned 24 [0, ][<br>
734.031803] PVR_K:(Error): BridgedDispatchKM: Initialisation failed.<br>
Driver unusable.<br>
<br>
PVR:(Error): PVRSRVBridgeCall: Failed to access device.&nbsp; Function<br>
ID:3223086862 (strerror returns no value.). [0, ]<br>
PVR:(Error): SrvInit: PVRSRVInitSrvDisconnect failed (24). See srvkm<br>
log for details. [0, ]<br>
/usr/bin/pvrsrvctl: SrvInit failed (already initialized?)<br>
(err=3DPVRSRV_ERROR_RETRY)<br>
</div>
</span></font>
</body>
</html>

--_000_92d1d6e10f234f4a884b5b429907e39cemailandroidcom_--
