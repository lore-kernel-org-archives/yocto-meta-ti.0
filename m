Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
 by mx.groups.io with SMTP id smtpd.web08.18972.1637889533423524249
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 25 Nov 2021 17:18:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pbarker.dev header.s=fm2 header.b=JXOWOt4I;
 spf=pass (domain: pbarker.dev, ip: 66.111.4.29, mailfrom: paul@pbarker.dev)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 2FE305C00DB;
	Thu, 25 Nov 2021 20:18:52 -0500 (EST)
Received: from imap42 ([10.202.2.92])
  by compute1.internal (MEProxy); Thu, 25 Nov 2021 20:18:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pbarker.dev; h=
	mime-version:message-id:in-reply-to:references:date:from:to
	:subject:content-type; s=fm2; bh=IBXAJXZ+LcwbDB4HaZZoJrI4/zKk+rR
	Aog813Ur+los=; b=JXOWOt4IPgmYKkDpjslRtQ6IOjkUBibFqN+x+xu/dT49g99
	fYRYDrwrCX4aYjNY3gG2J87cj0lhhXz/t7f7X7j6tM2ZzEjVUaNfrfpyKjaJUl4b
	16zQpxZxMFnmskJX7076+3tsm5bbTuZ8EsCnJ6/LcdqcbSCjUy2UlFQR8uy23IXZ
	NN4w0kXtqSjk5Ak6Fzg9L6xurwo5KtuU1tJ4mWwmlqJ4Ced2afRQiP7Y/BQPqw5p
	69I+/0j8PIIrppSpOvCr9qh+CA27i4gYR1lInIzSGi0NET0YynFKNXpJ6EzOQCKj
	B1JuMZVxdT2JG9x6XOnblXMzBo9IkRzFrdgifoQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=IBXAJX
	Z+LcwbDB4HaZZoJrI4/zKk+rRAog813Ur+los=; b=RDTCvb6PVlWZaiNoer9GNO
	LAiSHc6zjViP6SWsyMSfZ0mjFLf/UKMS3RX41V7uy9VXtww2Xvqxnp2TBsXyCbPk
	UH1pOtaSBdq+pPEWWK4itfAt2hB8IrsdWY/4eD3/8oPz//l4IOEq7u3u+CXOtfj9
	wsQK+ksaQMFv6POVZ2cUBw84SQduqUo8Fj0X00ZNzmCVb/UEGZHoYHEY1Gcek8DA
	E9MjilDEm7Mwret3h4UiQQKDHVQoBiXEggvg5sK3p5lj4B+/P0pi+L8goHunNiJF
	Zjx3wVrGrze3UsNbgkeFm+HawGIUjfeqZH2eH6D2lyKYYOanAZK9FZ0XrPTPB/dw
	==
X-ME-Sender: <xms:-zWgYU_tUdOtsP1_5MjRilqkj0gjSscNNd0ZRBb26PLyUI0IF0oVcg>
    <xme:-zWgYcsg4SNKl1JG3kVYpF5cibTI5T5zss5NiBzW-d1GTvoC1zTbkviApZy9ZDP0-
    2J_TwtTxOhZRwFi3gM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrhedugdefhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedfrfgruhhl
    uceurghrkhgvrhdfuceophgruhhlsehpsggrrhhkvghrrdguvghvqeenucggtffrrghtth
    gvrhhnpeelhfdtffduveelveekudduheetgeethfehvdekieejgeelfedtledtjedtueff
    vdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdihohgtthhophhrohhjvggtthdroh
    hrghdpphgsrghrkhgvrhdruggvvhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehprghulhesphgsrghrkhgvrhdruggvvh
X-ME-Proxy: <xmx:-zWgYaCw1cZXJfkMCjKNWr8F8TSW7bY3xhwosaXpA0aPSgy2kq2Q-w>
    <xmx:-zWgYUdgD341bBt_vJQ1x9dJ7QptqvXFobbsEc2aVuPrp0u3RnGO4Q>
    <xmx:-zWgYZOMwww8dmV8rQsao6EHx3dwI9iTltOjmwyrEzaB8XgVZqBpXQ>
    <xmx:_DWgYbVBrGkH01SeOOCVZLUg51uYIlSfQmwWiVk61WH4GKpUF-nmMQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id BCC3A2180078; Thu, 25 Nov 2021 20:18:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1371-g2296cc3491-fm-20211109.003-g2296cc34
Mime-Version: 1.0
Message-Id: <247fc8d3-22e5-46bd-b288-6ccfd151778f@www.fastmail.com>
In-Reply-To: 
 <CAMKF1spBkte+39N4OMnX-93ef0Rm2pUiqZaHFaotJLN1MizTSg@mail.gmail.com>
References: 
 <CAMKF1spBkte+39N4OMnX-93ef0Rm2pUiqZaHFaotJLN1MizTSg@mail.gmail.com>
Date: Fri, 26 Nov 2021 01:18:30 +0000
From: "Paul Barker" <paul@pbarker.dev>
To: "Khem Raj" <raj.khem@gmail.com>, meta-ti@lists.yoctoproject.org,
 "Denys Dmytriyenko" <denis@denix.org>
Subject: Re: [meta-ti] Errors with 5.10 kernel + ti-sgx-ddk on bbb
Content-Type: text/plain

Hi Khem,

We had to apply the following patch for the BBE: https://github.com/SanCloudLtd/meta-sancloud/blob/dunfell/recipes-bsp/powervr-drivers/ti-sgx-ddk-km/0001-Fix-driver-config-for-5.10-kernel.patch

See https://github.com/openpvrsgx-devgroup/linux_openpvrsgx/issues/3.

Hope this helps,
Paul

On Thu, 25 Nov 2021, at 21:43, Khem Raj wrote:
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
> [  733.824822] PVR_K:   (T3C-10) 0x00000000 0x00000000 0x00000002 0x00000000
> [  733.832801] PVR_K:   (T3C-20) 0x00000000 0x00000000 0x00000000 0x00000000
> [  733.840733] PVR_K:   (T3C-30) 0x00000000 0x00000000 0x00000000 0x00000000
> [  733.848792] PVR_K:   (T3C-40) 0x00000000 0x00000000 0x00000000 0x00000000
> [  733.855551] PVR_K:   (T3C-50) 0x00000000 0x00000000 0x00000000 0x00000000
> [  733.864329] PVR_K:   (T3C-60) 0x00000000 0x00000000 0x00000000 0x00000000
> [  733.872316] PVR_K:   (T3C-70) 0x00000000 0x00000000 0x00000000 0x00000000
> [  733.880262] PVR_K:   (T3C-80) 0x00000000 0x00000000 0x00000000 0x0F000000
> [  733.888176] PVR_K:   (T3C-90) 0x81D8D000 0x00000000 0x00000000 0x00000000
> [  733.894920] PVR_K:   (T3C-A0) 0x00000000 0x00000000 0x00000000 0x00000000
> [  733.903663] PVR_K:   (T3C-B0) 0x00000000 0x00000000 0x00000000 0x00000000
> [  733.911628] PVR_K:   (T3C-C0) 0x00000000 0x00000000 0x00000000 0x00000000
> [  733.919526] PVR_K:   (T3C-D0) 0x0F000000 0x8000B000 0x8004B000 0x0F004000
> [  733.926268] PVR_K:   (T3C-E0) 0x0F00A420 0x0F00A740 0x00000000 0x00000000
> [  733.934984] PVR_K:   (T3C-F0) 0x00000000 0x00000000 0x00000000 0x00000000
> [  733.942953] PVR_K:   (T3C-100) 0x00000000 0x00000000 0x00000000 0x00000000
> [  733.950925] PVR_K:   (T3C-110) 0x00000000 0x00000000 0x00000000 0x00000000
> [  733.958901] PVR_K:   (T3C-120) 0x00000000 0x00000000 0x00001140 0x00000078
> [  733.965732] PVR_K: SGX Kernel CCB WO:0x0 RO:0x0
> [  733.972327] PVR_K: Active syncs
> [  733.975503] PVR_K:(Error): SGXPostPowerState: SGXInitialise failed
> [  733.983694] PVR_K:(Error): PVRSRVSetDevicePowerStateKM : Transition
> to 0 FAILED 0x18
> [  733.992700] PVR_K:(Error): SGXScheduleCCBCommandKM failed to power
> up device - ui32CallerID:-1 eError:24
> [  734.003537] PVR_K:(Error): SGXGetMiscInfoUkernel:
> SGXScheduleCCBCommandKM failed.
> [  734.012507] PVR_K: (FAIL) SGXInit: Unable to validate hardware core revision
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
>
> 

-- 
Paul Barker
https://pbarker.dev/
