Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.18688.1637888607488286893
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Nov 2021 17:03:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F7O0MtRe;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id 8so7591882qtx.5
        for <meta-ti@lists.yoctoproject.org>; Thu, 25 Nov 2021 17:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sl1nPuzcqvgdGBYGpLC1cIovAJdtWPO+JwBsNatpdc4=;
        b=F7O0MtReqpSlDaoRfcsjWxJ8cwbWmsrO/ElU4eP/l9HTIBlWita5xQSoPPElG2/0r2
         cRb2Jh0I4agi5yTvpE93EIWA47y9HXH1lh1lmbYUpOi2bSCcrpS3vycW/bG2vbHJ1Bpq
         7eF53xSimChnP0haSsQluu0xFpaa+wqIAx9K1sGVo6UhMfUPALvSzacA47TPYNgTzwxV
         0w4rBXD6BEOmNTkfE9+HVJW0W/kkXe38osrcZzOAEljgKDFsNwvH8Awacn4TTOeDVN4E
         /z3Ma6eWCJaz33i8ZGsexEgX9XEMcSkCWIxR0ZTDS6OtwhCXAdZKm4R24iUQzREbmMeW
         CEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sl1nPuzcqvgdGBYGpLC1cIovAJdtWPO+JwBsNatpdc4=;
        b=7fT8scEg8Ubl1SZPJ/sqyOEDAIdTMCNaUqya/BUSC0s9xogho6a7IDfQTT5VZ3PB+T
         8Ed3stX5D0XKaI1iXUCNiig8738Zezy4M5iEyUBK4/WWTxlHr7eVfrlIzkqwf2Xl4z54
         FguYSZmno+3dvrrQ+0eBsaJx2ty9CwfxWnwZRZ0YefSy+6PXori+xVIQhlU8Ujs19EnV
         VCeS3/21kWkJmXECk19vApeuvSL9wOtBTboipV0WmtZqfO55Pv1QngKMYHjuDB2u+F/V
         J5sJlsCDXRCULPWmB9VUlx3gNSWJb9u4q7DsA+cPxXhl5LkDUINmmqEodQUrCGMkm9oc
         o7dA==
X-Gm-Message-State: AOAM532uAzKgVvffoE8rELozXGa3qLunMWN/FPzSdsGmEUrMNN8hy9X0
	PgY09HjBuSsyv6wRjnsrjhtZbbf6K9mW8huIRSk=
X-Google-Smtp-Source: ABdhPJzOva37dYP6zHyhjrUufi+SG8bowve5qoI2QuUH7RsBVRifPXebZIjdHgDlRn6XV0dEhaQ04vt6NcAHaxHi5a0=
X-Received: by 2002:aed:30a3:: with SMTP id 32mr12640055qtf.660.1637888606497;
 Thu, 25 Nov 2021 17:03:26 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1spBkte+39N4OMnX-93ef0Rm2pUiqZaHFaotJLN1MizTSg@mail.gmail.com>
 <92d1d6e1-0f23-4f4a-884b-5b429907e39c@email.android.com>
In-Reply-To: <92d1d6e1-0f23-4f4a-884b-5b429907e39c@email.android.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 25 Nov 2021 17:03:15 -0800
Message-ID: <CAMKF1srTmSV7XLkRE=u4_pj7+_Ys4o8YCF3xJXcLPj0rXvqjEA@mail.gmail.com>
Subject: Re: [meta-ti] Errors with 5.10 kernel + ti-sgx-ddk on bbb
To: "Bajjuri, Praneeth" <praneeth@ti.com>
Cc: "Balagopalakrishnan, Anand" <anandb@ti.com>, "Bhargav, Krunal" <k-bhargav@ti.com>, Denys Dmytriyenko <denis@denix.org>, 
	"aricciardi@baylibre.com" <aricciardi@baylibre.com>, 
	"meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="0000000000009272fe05d1a6a825"

--0000000000009272fe05d1a6a825
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 25, 2021 at 4:12 PM Bajjuri, Praneeth <praneeth@ti.com> wrote:

> Apologies for top post.
>
> Khem,
> Thanks for reporting. We have observed similar failure on other platforms
> with same sgx core.
>
> A fix is in progress.  Will keep you posted.
>

Thanks Praneeth so will 5.4 work well ?

>
>
> --Praneeth
>
>
> On Nov 25, 2021 3:44 PM, Khem Raj <raj.khem@gmail.com> wrote:
> Hi
>
> I am trying to use ti-sgx-ddk-um for egl and ended up with the
> following errors. I wonder
> if 5.10 kernel + pvr is supposed to work on bbb.
>
> root@beaglebone:~# uname -a
> Linux beaglebone 5.10.65-gf22103162c #1 PREEMPT Thu Oct 21 18:27:04
> UTC 2021 armv7l armv7l armv7l GNU/Linux
>
>
> root@beaglebone:~# /usr/bin/rc.pvr reload
> Unloaded PowerVR consumer services.
> [  732.691512] [drm] Initialized pvr 1.17.4948957 20110701 for
> 56000000.gpu on minor 1
> [  732.726444] PVR_K: UM DDK-(4948957) and KM DDK-(4948957) match. [ OK ]
> [  733.736908] PVR_K:(Error): PollForValueKM: Timeout. Expected 0x1
> but found 0x0 (mask 0x1).
> [  733.745233] PVR_K:(Error): SGXInitialise: Wait for uKernel
> initialisation failed
> [  733.756365] PVR_K: SGX debug (SGX_DDK sgxddk 1.17@4948957)
> [  733.763365] PVR_K:  Host Ctl flags= 00000006
> [  733.768918] PVR_K: SGX Host control:
> [  733.772546] PVR_K:   (HC-0) 0x00000000 0x00000000 0x00000000 0x00000000
> [  733.781209] PVR_K:   (HC-10) 0x00000000 0x00000000 0x00000014 0x00030D40
> [  733.789240] PVR_K:   (HC-20) 0x00000000 0x00000000 0x00000000 0x00000000
> [  733.795900] PVR_K:   (HC-30) 0x00000000 0x00000000 0x19CAA170 0x00000000
> [  733.804558] PVR_K:   (HC-40) 0x00000000 0x00000000 0x00000000 0x00000818
> [  733.812416] PVR_K: SGX TA/3D control:
> [  733.816113] PVR_K:   (T3C-0) 0x0F003000 0x0F003140 0x0F002000 0x00000000
> [  733.824822] PVR_K:   (T3C-10) 0x00000000 0x00000000 0x00000002
> 0x00000000
> [  733.832801] PVR_K:   (T3C-20) 0x00000000 0x00000000 0x00000000
> 0x00000000
> [  733.840733] PVR_K:   (T3C-30) 0x00000000 0x00000000 0x00000000
> 0x00000000
> [  733.848792] PVR_K:   (T3C-40) 0x00000000 0x00000000 0x00000000
> 0x00000000
> [  733.855551] PVR_K:   (T3C-50) 0x00000000 0x00000000 0x00000000
> 0x00000000
> [  733.864329] PVR_K:   (T3C-60) 0x00000000 0x00000000 0x00000000
> 0x00000000
> [  733.872316] PVR_K:   (T3C-70) 0x00000000 0x00000000 0x00000000
> 0x00000000
> [  733.880262] PVR_K:   (T3C-80) 0x00000000 0x00000000 0x00000000
> 0x0F000000
> [  733.888176] PVR_K:   (T3C-90) 0x81D8D000 0x00000000 0x00000000
> 0x00000000
> [  733.894920] PVR_K:   (T3C-A0) 0x00000000 0x00000000 0x00000000
> 0x00000000
> [  733.903663] PVR_K:   (T3C-B0) 0x00000000 0x00000000 0x00000000
> 0x00000000
> [  733.911628] PVR_K:   (T3C-C0) 0x00000000 0x00000000 0x00000000
> 0x00000000
> [  733.919526] PVR_K:   (T3C-D0) 0x0F000000 0x8000B000 0x8004B000
> 0x0F004000
> [  733.926268] PVR_K:   (T3C-E0) 0x0F00A420 0x0F00A740 0x00000000
> 0x00000000
> [  733.934984] PVR_K:   (T3C-F0) 0x00000000 0x00000000 0x00000000
> 0x00000000
> [  733.942953] PVR_K:   (T3C-100) 0x00000000 0x00000000 0x00000000
> 0x00000000
> [  733.950925] PVR_K:   (T3C-110) 0x00000000 0x00000000 0x00000000
> 0x00000000
> [  733.958901] PVR_K:   (T3C-120) 0x00000000 0x00000000 0x00001140
> 0x00000078
> [  733.965732] PVR_K: SGX Kernel CCB WO:0x0 RO:0x0
> [  733.972327] PVR_K: Active syncs
> [  733.975503] PVR_K:(Error): SGXPostPowerState: SGXInitialise failed
> [  733.983694] PVR_K:(Error): PVRSRVSetDevicePowerStateKM : Transition
> to 0 FAILED 0x18
> [  733.992700] PVR_K:(Error): SGXScheduleCCBCommandKM failed to power
> up device - ui32CallerID:-1 eError:24
> [  734.003537] PVR_K:(Error): SGXGetMiscInfoUkernel:
> SGXScheduleCCBCommandKM failed.
> [  734.012507] PVR_K: (FAIL) SGXInit: Unable to validate hardware core
> revision
> [  734.020812] PVR_K:(Error): PVRSRVFinaliseSystem: Failed
> PVRSRVDevInitCompatCheck call (device index: 0)
> PVR:(Error): PVRSRVInitSrvDisconnect: KM returned 24 [0, ][
> 734.031803] PVR_K:(Error): BridgedDispatchKM: Initialisation failed.
> Driver unusable.
>
> PVR:(Error): PVRSRVBridgeCall: Failed to access device.  Function
> ID:3223086862 (strerror returns no value.). [0, ]
> PVR:(Error): SrvInit: PVRSRVInitSrvDisconnect failed (24). See srvkm
> log for details. [0, ]
> /usr/bin/pvrsrvctl: SrvInit failed (already initialized?)
> (err=PVRSRV_ERROR_RETRY)
>

--0000000000009272fe05d1a6a825
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Nov 25, 2021 at 4:12 PM Bajjuri, Praneeth &lt;<a hr=
ef=3D"mailto:praneeth@ti.com">praneeth@ti.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">





<div>
<div>
<div dir=3D"auto">Apologies for top post.
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">Khem,=C2=A0</div>
<div dir=3D"auto">Thanks for reporting. We have observed similar failure on=
 other platforms with same sgx core.</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">A fix is in progress.=C2=A0 Will keep you posted.</div></=
div></div></div></blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">=
Thanks Praneeth so will 5.4 work well ?=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div><div><div dir=3D"auto"><div dir=3D"auto"></div></div></div></di=
v><div><div><div dir=3D"auto">
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto"><br>
</div>
<div dir=3D"auto">--Praneeth=C2=A0</div>
<div dir=3D"auto"><br>
</div>
</div>
<div><br>
<div>On Nov 25, 2021 3:44 PM, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br type=3D"attrib=
ution">
</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt">
<div>Hi<br>
<br>
I am trying to use ti-sgx-ddk-um for egl and ended up with the<br>
following errors. I wonder<br>
if 5.10 kernel + pvr is supposed to work on bbb.<br>
<br>
root@beaglebone:~# uname -a<br>
Linux beaglebone 5.10.65-gf22103162c #1 PREEMPT Thu Oct 21 18:27:04<br>
UTC 2021 armv7l armv7l armv7l GNU/Linux<br>
<br>
<br>
root@beaglebone:~# /usr/bin/rc.pvr reload<br>
Unloaded PowerVR consumer services.<br>
[=C2=A0 732.691512] [drm] Initialized pvr 1.17.4948957 20110701 for<br>
56000000.gpu on minor 1<br>
[=C2=A0 732.726444] PVR_K: UM DDK-(4948957) and KM DDK-(4948957) match. [ O=
K ]<br>
[=C2=A0 733.736908] PVR_K:(Error): PollForValueKM: Timeout. Expected 0x1<br=
>
but found 0x0 (mask 0x1).<br>
[=C2=A0 733.745233] PVR_K:(Error): SGXInitialise: Wait for uKernel<br>
initialisation failed<br>
[=C2=A0 733.756365] PVR_K: SGX debug (SGX_DDK sgxddk 1.17@4948957)<br>
[=C2=A0 733.763365] PVR_K:=C2=A0 Host Ctl flags=3D 00000006<br>
[=C2=A0 733.768918] PVR_K: SGX Host control:<br>
[=C2=A0 733.772546] PVR_K:=C2=A0=C2=A0 (HC-0) 0x00000000 0x00000000 0x00000=
000 0x00000000<br>
[=C2=A0 733.781209] PVR_K:=C2=A0=C2=A0 (HC-10) 0x00000000 0x00000000 0x0000=
0014 0x00030D40<br>
[=C2=A0 733.789240] PVR_K:=C2=A0=C2=A0 (HC-20) 0x00000000 0x00000000 0x0000=
0000 0x00000000<br>
[=C2=A0 733.795900] PVR_K:=C2=A0=C2=A0 (HC-30) 0x00000000 0x00000000 0x19CA=
A170 0x00000000<br>
[=C2=A0 733.804558] PVR_K:=C2=A0=C2=A0 (HC-40) 0x00000000 0x00000000 0x0000=
0000 0x00000818<br>
[=C2=A0 733.812416] PVR_K: SGX TA/3D control:<br>
[=C2=A0 733.816113] PVR_K:=C2=A0=C2=A0 (T3C-0) 0x0F003000 0x0F003140 0x0F00=
2000 0x00000000<br>
[=C2=A0 733.824822] PVR_K:=C2=A0=C2=A0 (T3C-10) 0x00000000 0x00000000 0x000=
00002 0x00000000<br>
[=C2=A0 733.832801] PVR_K:=C2=A0=C2=A0 (T3C-20) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[=C2=A0 733.840733] PVR_K:=C2=A0=C2=A0 (T3C-30) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[=C2=A0 733.848792] PVR_K:=C2=A0=C2=A0 (T3C-40) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[=C2=A0 733.855551] PVR_K:=C2=A0=C2=A0 (T3C-50) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[=C2=A0 733.864329] PVR_K:=C2=A0=C2=A0 (T3C-60) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[=C2=A0 733.872316] PVR_K:=C2=A0=C2=A0 (T3C-70) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[=C2=A0 733.880262] PVR_K:=C2=A0=C2=A0 (T3C-80) 0x00000000 0x00000000 0x000=
00000 0x0F000000<br>
[=C2=A0 733.888176] PVR_K:=C2=A0=C2=A0 (T3C-90) 0x81D8D000 0x00000000 0x000=
00000 0x00000000<br>
[=C2=A0 733.894920] PVR_K:=C2=A0=C2=A0 (T3C-A0) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[=C2=A0 733.903663] PVR_K:=C2=A0=C2=A0 (T3C-B0) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[=C2=A0 733.911628] PVR_K:=C2=A0=C2=A0 (T3C-C0) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[=C2=A0 733.919526] PVR_K:=C2=A0=C2=A0 (T3C-D0) 0x0F000000 0x8000B000 0x800=
4B000 0x0F004000<br>
[=C2=A0 733.926268] PVR_K:=C2=A0=C2=A0 (T3C-E0) 0x0F00A420 0x0F00A740 0x000=
00000 0x00000000<br>
[=C2=A0 733.934984] PVR_K:=C2=A0=C2=A0 (T3C-F0) 0x00000000 0x00000000 0x000=
00000 0x00000000<br>
[=C2=A0 733.942953] PVR_K:=C2=A0=C2=A0 (T3C-100) 0x00000000 0x00000000 0x00=
000000 0x00000000<br>
[=C2=A0 733.950925] PVR_K:=C2=A0=C2=A0 (T3C-110) 0x00000000 0x00000000 0x00=
000000 0x00000000<br>
[=C2=A0 733.958901] PVR_K:=C2=A0=C2=A0 (T3C-120) 0x00000000 0x00000000 0x00=
001140 0x00000078<br>
[=C2=A0 733.965732] PVR_K: SGX Kernel CCB WO:0x0 RO:0x0<br>
[=C2=A0 733.972327] PVR_K: Active syncs<br>
[=C2=A0 733.975503] PVR_K:(Error): SGXPostPowerState: SGXInitialise failed<=
br>
[=C2=A0 733.983694] PVR_K:(Error): PVRSRVSetDevicePowerStateKM : Transition=
<br>
to 0 FAILED 0x18<br>
[=C2=A0 733.992700] PVR_K:(Error): SGXScheduleCCBCommandKM failed to power<=
br>
up device - ui32CallerID:-1 eError:24<br>
[=C2=A0 734.003537] PVR_K:(Error): SGXGetMiscInfoUkernel:<br>
SGXScheduleCCBCommandKM failed.<br>
[=C2=A0 734.012507] PVR_K: (FAIL) SGXInit: Unable to validate hardware core=
 revision<br>
[=C2=A0 734.020812] PVR_K:(Error): PVRSRVFinaliseSystem: Failed<br>
PVRSRVDevInitCompatCheck call (device index: 0)<br>
PVR:(Error): PVRSRVInitSrvDisconnect: KM returned 24 [0, ][<br>
734.031803] PVR_K:(Error): BridgedDispatchKM: Initialisation failed.<br>
Driver unusable.<br>
<br>
PVR:(Error): PVRSRVBridgeCall: Failed to access device.=C2=A0 Function<br>
ID:3223086862 (strerror returns no value.). [0, ]<br>
PVR:(Error): SrvInit: PVRSRVInitSrvDisconnect failed (24). See srvkm<br>
log for details. [0, ]<br>
/usr/bin/pvrsrvctl: SrvInit failed (already initialized?)<br>
(err=3DPVRSRV_ERROR_RETRY)<br>
</div>
</span></font>
</div>

</blockquote></div></div>

--0000000000009272fe05d1a6a825--
