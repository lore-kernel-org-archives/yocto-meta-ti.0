Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web09.17241.1637876646167942778
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Nov 2021 13:44:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qf6l0Vr6;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id jo22so5613828qvb.13
        for <meta-ti@lists.yoctoproject.org>; Thu, 25 Nov 2021 13:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=NrluvjxDm+ovfU7yxfTjJ2Xi3huyFE/QjNT8AqfQlsg=;
        b=Qf6l0Vr6EYLOqIJJ6pzd6Ltf5pmSf1HVoPBj9aQNDUjrMN4B9yfB4N4PeC24zsyUnx
         j/kSCy+Mf3qmV9CeP/3EINLIv/ryJGrf6px6oZlIXFaZ59lXsNDiMym4K6L/gVKYQwMC
         j4w5J48UEdZeoXfJDWX9U41yakh/rdB4OYAXaJpzeadUQUntCplRu1x1sPytHFHDqYFn
         0/+lIhpD+eUiM4L32XUji4KTcHlYIf+AV1wri9P5/Ugd4LevxJt+iqgIUA1ihwS2iw1+
         wpneW0xVYJxp1mMcqaJMxrgVGse1LTM8RmH75YqPCXOwQx0zb5U9yPyxj/2V4LP/FHaA
         mZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=NrluvjxDm+ovfU7yxfTjJ2Xi3huyFE/QjNT8AqfQlsg=;
        b=0cuCityOOcR+4DEh+EezVA3AWvIxiM+nz4uh+K/LQmUeNvRDmeWhU6ZfSLJRMe/XO4
         6pa66G47gZZVCZwse7+ylICVAgA3aKNzakf6evGQfhJRHzwLcTUe9fhcGHF29j3v9+sC
         TMvQ3DQRLmdR1BNaz6pwHMUGYH7DjYVPjbSCQplrHJ0GuG+N7E5HELpccg9esfvqZrc3
         h7KVlAD074K8ejsTW4jrDrXyviP4ySy01zc/oKo1k66RrW1bAH5pdP43bBtqpBpQiwvf
         r9Y0UJwZhSz0gQCdfys4lNLlIArQ3qyOzCLMkDmAj4ksZOLioHZWYTjkGjzVBEhQFE0H
         rDBQ==
X-Gm-Message-State: AOAM5337gQjfxAHvftaRLRp59P4+Y5xyThnjfF5x8zGd2Moh87iL8Jxs
	zwNH5OtGPcjSGFGUKQfu6866xi4kMiLx2VSgXtqdAnF/gR2eoQ==
X-Google-Smtp-Source: ABdhPJwvU0SxjJC5R6twLIH3Lr1uNx6EYKJHTon4zAPcdGAhmD4eWHmH6oOakM2mmbP133+QB3ocZRGviSjLDeNVnD8=
X-Received: by 2002:a05:6214:e63:: with SMTP id jz3mr21470658qvb.16.1637876644953;
 Thu, 25 Nov 2021 13:44:04 -0800 (PST)
MIME-Version: 1.0
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 25 Nov 2021 13:43:39 -0800
Message-ID: <CAMKF1spBkte+39N4OMnX-93ef0Rm2pUiqZaHFaotJLN1MizTSg@mail.gmail.com>
Subject: Errors with 5.10 kernel + ti-sgx-ddk on bbb
To: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denis@denix.org>
Content-Type: text/plain; charset="UTF-8"

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
[  733.763365] PVR_K:  Host Ctl flags= 00000006
[  733.768918] PVR_K: SGX Host control:
[  733.772546] PVR_K:   (HC-0) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.781209] PVR_K:   (HC-10) 0x00000000 0x00000000 0x00000014 0x00030D40
[  733.789240] PVR_K:   (HC-20) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.795900] PVR_K:   (HC-30) 0x00000000 0x00000000 0x19CAA170 0x00000000
[  733.804558] PVR_K:   (HC-40) 0x00000000 0x00000000 0x00000000 0x00000818
[  733.812416] PVR_K: SGX TA/3D control:
[  733.816113] PVR_K:   (T3C-0) 0x0F003000 0x0F003140 0x0F002000 0x00000000
[  733.824822] PVR_K:   (T3C-10) 0x00000000 0x00000000 0x00000002 0x00000000
[  733.832801] PVR_K:   (T3C-20) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.840733] PVR_K:   (T3C-30) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.848792] PVR_K:   (T3C-40) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.855551] PVR_K:   (T3C-50) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.864329] PVR_K:   (T3C-60) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.872316] PVR_K:   (T3C-70) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.880262] PVR_K:   (T3C-80) 0x00000000 0x00000000 0x00000000 0x0F000000
[  733.888176] PVR_K:   (T3C-90) 0x81D8D000 0x00000000 0x00000000 0x00000000
[  733.894920] PVR_K:   (T3C-A0) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.903663] PVR_K:   (T3C-B0) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.911628] PVR_K:   (T3C-C0) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.919526] PVR_K:   (T3C-D0) 0x0F000000 0x8000B000 0x8004B000 0x0F004000
[  733.926268] PVR_K:   (T3C-E0) 0x0F00A420 0x0F00A740 0x00000000 0x00000000
[  733.934984] PVR_K:   (T3C-F0) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.942953] PVR_K:   (T3C-100) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.950925] PVR_K:   (T3C-110) 0x00000000 0x00000000 0x00000000 0x00000000
[  733.958901] PVR_K:   (T3C-120) 0x00000000 0x00000000 0x00001140 0x00000078
[  733.965732] PVR_K: SGX Kernel CCB WO:0x0 RO:0x0
[  733.972327] PVR_K: Active syncs
[  733.975503] PVR_K:(Error): SGXPostPowerState: SGXInitialise failed
[  733.983694] PVR_K:(Error): PVRSRVSetDevicePowerStateKM : Transition
to 0 FAILED 0x18
[  733.992700] PVR_K:(Error): SGXScheduleCCBCommandKM failed to power
up device - ui32CallerID:-1 eError:24
[  734.003537] PVR_K:(Error): SGXGetMiscInfoUkernel:
SGXScheduleCCBCommandKM failed.
[  734.012507] PVR_K: (FAIL) SGXInit: Unable to validate hardware core revision
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
(err=PVRSRV_ERROR_RETRY)
