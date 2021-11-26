Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web12.30018.1637966487365095627
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 26 Nov 2021 14:41:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=icUP64jK;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id 8so10253582qtx.5
        for <meta-ti@lists.yoctoproject.org>; Fri, 26 Nov 2021 14:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wThehsfhVPKecYQlFSagoVukvefqJw7kt3fz1dfyQe8=;
        b=icUP64jKmQuMY/Z/53LIDprYABPEsOy/r89yi2Y3PDkhvD2fllKwesb7hSlJNbjLV5
         NarYbSroUR2L0BzDRe2YhVfqgrtgOn+y5cbYYFm+ZKm6X/SNWJw8kFXYzLfwgvwrKxTA
         nRvVc3MboCxgnCa0kCbWfCp7lkypXuqHy53xcEejQKFbNkLzfdhsKNmy+1ocF8GNkOf4
         3n9dwxuhrQvJUaon5t2Q00NTmFx3l8SsjiCZBPsaX0RS1vKvf/ts7sLjkKxA2HpwAhsg
         Ksi173x5OEIomUyp3/vGSv3NxW8N5FyS3SdvvI1QZE3aahNUGCSIp1xKkwYONpuqvo3l
         gNjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wThehsfhVPKecYQlFSagoVukvefqJw7kt3fz1dfyQe8=;
        b=gB30on0i97mZWopINlnD5S1/Y0Kre8e9/2IXb29Pgu9NZxX+ESYR0TYNf9IJPRMJUO
         04PgE6vIr2glX+rC9aDguo1555NeCDZHWXkUjiPHrviqBH08yvKEZuaQkEMPl8G7GWgK
         yC0PzMr6p4fVyyOC26wVKJaptRhpy8QHUlAEuO1G6lLoOdtPp7IFUcno9daPtl4XH7OR
         FAsedaDEZlrDtaHqd2pZCLy2fyYf+U3a7V+tUNfKDsnBEBZS8UTSJVgO/tW+Fai2hk1s
         dpafAePiCc0ChwWmmdXbiYMnHGOP1u9p/PRyLfdX3Qux0cVsqe3Lhq5vEnOipPqL8jTW
         9Y5g==
X-Gm-Message-State: AOAM531j2hmUuwrbg3OwM/Tz+ZIkwvvNebkPCSV0AV2wFpskgkQjCp2U
	ydtNC+YyHRdsJSC6IYBSaNieYhRVfaybHIzheSY=
X-Google-Smtp-Source: ABdhPJzEAuW9u2IUMyCeBzrgdBAEtIBpbR7SuvRt220anjx15SOybS9mQ306WdkzVyrLfAD9/7VR1nMS+t7MqYcTReo=
X-Received: by 2002:ac8:518e:: with SMTP id c14mr19058173qtn.665.1637966486339;
 Fri, 26 Nov 2021 14:41:26 -0800 (PST)
MIME-Version: 1.0
References: <CAMKF1spBkte+39N4OMnX-93ef0Rm2pUiqZaHFaotJLN1MizTSg@mail.gmail.com>
 <247fc8d3-22e5-46bd-b288-6ccfd151778f@www.fastmail.com>
In-Reply-To: <247fc8d3-22e5-46bd-b288-6ccfd151778f@www.fastmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 26 Nov 2021 14:41:00 -0800
Message-ID: <CAMKF1spJd3xCbgNGdv258nL86sr+GdyNWuwVAek-putB0x8SXQ@mail.gmail.com>
Subject: Re: [meta-ti] Errors with 5.10 kernel + ti-sgx-ddk on bbb
To: Paul Barker <paul@pbarker.dev>
Cc: meta-ti@lists.yoctoproject.org, Denys Dmytriyenko <denis@denix.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 25, 2021 at 5:18 PM Paul Barker <paul@pbarker.dev> wrote:
>
> Hi Khem,
>
> We had to apply the following patch for the BBE: https://github.com/SanCloudLtd/meta-sancloud/blob/dunfell/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-Fix-driver-config-for-5.10-kernel.patch
>
> See https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/issues/3.
>
> Hope this helps,

Thanks, it did help a bit where the errors I was seeing are gone, but
weston still fails to launch

PVR_K:(Error): BridgedDispatchKM: Driver initialisation not completed yet

but that was due to my monitor not being recognized properly by bbb
which I fixed with some aid to weston and pvr driver configuration


> Paul
>
> On Thu, 25 Nov 2021, at 21:43, Khem Raj wrote:
> > Hi
> >
> > I am trying to use ti-sgx-ddk-um for egl and ended up with the
> > following errors. I wonder
> > if 5.10 kernel + pvr is supposed to work on bbb.
> >
> > root@beaglebone:~# uname -a
> > Linux beaglebone 5.10.65-gf22103162c #1 PREEMPT Thu Oct 21 18:27:04
> > UTC 2021 armv7l armv7l armv7l GNU/Linux
> >
> >
> > root@beaglebone:~# /usr/bin/rc.pvr reload
> > Unloaded PowerVR consumer services.
> > [  732.691512] [drm] Initialized pvr 1.17.4948957 20110701 for
> > 56000000.gpu on minor 1
> > [  732.726444] PVR_K: UM DDK-(4948957) and KM DDK-(4948957) match. [ OK ]
> > [  733.736908] PVR_K:(Error): PollForValueKM: Timeout. Expected 0x1
> > but found 0x0 (mask 0x1).
> > [  733.745233] PVR_K:(Error): SGXInitialise: Wait for uKernel
> > initialisation failed
> > [  733.756365] PVR_K: SGX debug (SGX_DDK sgxddk 1.17@4948957)
> > [  733.763365] PVR_K:  Host Ctl flags= 00000006
> > [  733.768918] PVR_K: SGX Host control:
> > [  733.772546] PVR_K:   (HC-0) 0x00000000 0x00000000 0x00000000 0x00000000
> > [  733.781209] PVR_K:   (HC-10) 0x00000000 0x00000000 0x00000014 0x00030D40
> > [  733.789240] PVR_K:   (HC-20) 0x00000000 0x00000000 0x00000000 0x00000000
> > [  733.795900] PVR_K:   (HC-30) 0x00000000 0x00000000 0x19CAA170 0x00000000
> > [  733.804558] PVR_K:   (HC-40) 0x00000000 0x00000000 0x00000000 0x00000818
> > [  733.812416] PVR_K: SGX TA/3D control:
> > [  733.816113] PVR_K:   (T3C-0) 0x0F003000 0x0F003140 0x0F002000 0x00000000
> > [  733.824822] PVR_K:   (T3C-10) 0x00000000 0x00000000 0x00000002 0x00000000
> > [  733.832801] PVR_K:   (T3C-20) 0x00000000 0x00000000 0x00000000 0x00000000
> > [  733.840733] PVR_K:   (T3C-30) 0x00000000 0x00000000 0x00000000 0x00000000
> > [  733.848792] PVR_K:   (T3C-40) 0x00000000 0x00000000 0x00000000 0x00000000
> > [  733.855551] PVR_K:   (T3C-50) 0x00000000 0x00000000 0x00000000 0x00000000
> > [  733.864329] PVR_K:   (T3C-60) 0x00000000 0x00000000 0x00000000 0x00000000
> > [  733.872316] PVR_K:   (T3C-70) 0x00000000 0x00000000 0x00000000 0x00000000
> > [  733.880262] PVR_K:   (T3C-80) 0x00000000 0x00000000 0x00000000 0x0F000000
> > [  733.888176] PVR_K:   (T3C-90) 0x81D8D000 0x00000000 0x00000000 0x00000000
> > [  733.894920] PVR_K:   (T3C-A0) 0x00000000 0x00000000 0x00000000 0x00000000
> > [  733.903663] PVR_K:   (T3C-B0) 0x00000000 0x00000000 0x00000000 0x00000000
> > [  733.911628] PVR_K:   (T3C-C0) 0x00000000 0x00000000 0x00000000 0x00000000
> > [  733.919526] PVR_K:   (T3C-D0) 0x0F000000 0x8000B000 0x8004B000 0x0F004000
> > [  733.926268] PVR_K:   (T3C-E0) 0x0F00A420 0x0F00A740 0x00000000 0x00000000
> > [  733.934984] PVR_K:   (T3C-F0) 0x00000000 0x00000000 0x00000000 0x00000000
> > [  733.942953] PVR_K:   (T3C-100) 0x00000000 0x00000000 0x00000000 0x00000000
> > [  733.950925] PVR_K:   (T3C-110) 0x00000000 0x00000000 0x00000000 0x00000000
> > [  733.958901] PVR_K:   (T3C-120) 0x00000000 0x00000000 0x00001140 0x00000078
> > [  733.965732] PVR_K: SGX Kernel CCB WO:0x0 RO:0x0
> > [  733.972327] PVR_K: Active syncs
> > [  733.975503] PVR_K:(Error): SGXPostPowerState: SGXInitialise failed
> > [  733.983694] PVR_K:(Error): PVRSRVSetDevicePowerStateKM : Transition
> > to 0 FAILED 0x18
> > [  733.992700] PVR_K:(Error): SGXScheduleCCBCommandKM failed to power
> > up device - ui32CallerID:-1 eError:24
> > [  734.003537] PVR_K:(Error): SGXGetMiscInfoUkernel:
> > SGXScheduleCCBCommandKM failed.
> > [  734.012507] PVR_K: (FAIL) SGXInit: Unable to validate hardware core revision
> > [  734.020812] PVR_K:(Error): PVRSRVFinaliseSystem: Failed
> > PVRSRVDevInitCompatCheck call (device index: 0)
> > PVR:(Error): PVRSRVInitSrvDisconnect: KM returned 24 [0, ][
> > 734.031803] PVR_K:(Error): BridgedDispatchKM: Initialisation failed.
> > Driver unusable.
> >
> > PVR:(Error): PVRSRVBridgeCall: Failed to access device.  Function
> > ID:3223086862 (strerror returns no value.). [0, ]
> > PVR:(Error): SrvInit: PVRSRVInitSrvDisconnect failed (24). See srvkm
> > log for details. [0, ]
> > /usr/bin/pvrsrvctl: SrvInit failed (already initialized?)
> > (err=PVRSRV_ERROR_RETRY)
> >
> >
> > 
>
> --
> Paul Barker
> https://pbarker.dev/
