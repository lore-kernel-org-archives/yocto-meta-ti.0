Return-Path: <prabu@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A6F40E01412
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 04:31:37 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7GBVWFV006847;
	Fri, 16 Aug 2013 06:31:33 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7GBVTQM022710;
	Fri, 16 Aug 2013 06:31:30 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.02.0342.003; Fri, 16 Aug 2013 19:31:28 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: Kovesdi Gyorgy <kgy@teledigit.eu>, meta-ti mailing list
	<meta-ti@yoctoproject.org>
Thread-Topic: [meta-ti] Kernel crash running omap3-sgx-modules_4.05.00.03 on
	3.x	kernels
Thread-Index: AQHOmnOLUQYuXIRRTEu6GC9CHSu2xJmXszQg
Date: Fri, 16 Aug 2013 11:31:28 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB9760A@DBDE04.ent.ti.com>
References: <19394510.IQgu9b8fOF@kgy-pc>
In-Reply-To: <19394510.IQgu9b8fOF@kgy-pc>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: Re: Kernel crash running omap3-sgx-modules_4.05.00.03 on 3.x	kernels
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
X-List-Received-Date: Fri, 16 Aug 2013 11:31:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Kovesdi -=20

Have you enabled the clocks - looks like the pvrsrv-init (or an init script=
 of similar name) has not been run before and pvrsrv-ctl is not run ?

regards,
Prabu

-----Original Message-----
From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject=
.org] On Behalf Of Kovesdi Gyorgy
Sent: Friday, August 16, 2013 5:56 PM
To: meta-ti mailing list
Subject: [meta-ti] Kernel crash running omap3-sgx-modules_4.05.00.03 on 3.x=
 kernels

Hi,

I have Beagleboard-C4, kerner 3.2.28

At last i could compile libgles and sgx modules version 4.05.00.03 with som=
e hacks, and found the following error running any gles-based application:

[   74.792510] Unhandled fault: external abort on non-linefetch (0x1008) at=
=20
0xd0b00ca8                                                                 =
                            =20
[   74.800476] Internal error: : 1008 [#1]                                 =
                                                                           =
                             =20
[   74.804473] Modules linked in: bufferclass_ti(O) omaplfb(O) pvrsrvkm(O) =
                                                                           =
                             =20
[   74.811370] CPU: 0    Tainted: G           O  (3.2.28 #1)               =
                                                                           =
                             =20
[   74.817108] PC is at PollForValueKM+0x48/0xb8 [pvrsrvkm]                =
                                                                           =
                             =20
[   74.822692] LR is at PollForValueKM+0x38/0xb8 [pvrsrvkm]                =
                                                                           =
                             =20

Previously i tried it on Angstrom with the same result. The kernel can be a=
ny 3.x version, the result is also the same. It can run on 2.6 kernels only=
.

The calltrace is:

[<bf005aa0>] (PollForValueKM+0x48/0xb8 [pvrsrvkm]) from [<bf0117f8>]
(SGXResetInvalDC.isra.2+0x58/0x60 [pvrsrvkm]) [<bf0117f8>] (SGXResetInvalDC=
.isra.2+0x58/0x60 [pvrsrvkm]) from [<bf011990>] (SGXReset+0x190/0x1ac [pvrs=
rvkm]) [<bf011990>] (SGXReset+0x190/0x1ac [pvrsrvkm]) from [<bf00ec90>]
(SGXInitialise+0x48/0x110 [pvrsrvkm])
[<bf00ec90>] (SGXInitialise+0x48/0x110 [pvrsrvkm]) from [<bf011c04>]
(SGXPostPowerState+0x4c/0xa0 [pvrsrvkm]) [<bf011c04>] (SGXPostPowerState+0x=
4c/0xa0 [pvrsrvkm]) from [<bf001778>]
(PVRSRVDevicePostPowerStateKM_AnyVaCb+0x74/0x88 [pvrsrvkm]) [<bf001778>] (P=
VRSRVDevicePostPowerStateKM_AnyVaCb+0x74/0x88 [pvrsrvkm]) from [<bf008768>]=
 (List_PVRSRV_POWER_DEV_PVRSRV_ERROR_Any_va+0x30/0x58 [pvrsrvkm]) [<bf00876=
8>] (List_PVRSRV_POWER_DEV_PVRSRV_ERROR_Any_va+0x30/0x58 [pvrsrvkm]) from [=
<bf0019cc>] (PVRSRVSetDevicePowerStateKM+0x6c/0xa8 [pvrsrvkm]) [<bf0019cc>]=
 (PVRSRVSetDevicePowerStateKM+0x6c/0xa8 [pvrsrvkm]) from [<bf00fbf8>] (SGXS=
cheduleCCBCommandKM+0x2c/0xa4 [pvrsrvkm]) [<bf00fbf8>] (SGXScheduleCCBComma=
ndKM+0x2c/0xa4 [pvrsrvkm]) from [<bf00e224>]
(SGXSubmitTransferKM+0x118/0x2b4 [pvrsrvkm]) [<bf00e224>] (SGXSubmitTransfe=
rKM+0x118/0x2b4 [pvrsrvkm]) from [<bf014f2c>]
(SGXSubmitTransferBW+0x164/0x170 [pvrsrvkm]) [<bf014f2c>] (SGXSubmitTransfe=
rBW+0x164/0x170 [pvrsrvkm]) from [<bf0145b4>]
(BridgedDispatchKM+0xe0/0x138 [pvrsrvkm]) [<bf0145b4>] (BridgedDispatchKM+0=
xe0/0x138 [pvrsrvkm]) from [<bf00e004>] (PVRSRV_BridgeDispatchKM+0xac/0xec =
[pvrsrvkm]) [<bf00e004>] (PVRSRV_BridgeDispatchKM+0xac/0xec [pvrsrvkm]) fro=
m [<c00ec554>]
(vfs_ioctl+0x20/0x3c)
[<c00ec554>] (vfs_ioctl+0x20/0x3c) from [<c00ecf94>]
(do_vfs_ioctl+0x488/0x4e0)
[<c00ecf94>] (do_vfs_ioctl+0x488/0x4e0) from [<c00ed034>]
(sys_ioctl+0x48/0x70)
[<c00ed034>] (sys_ioctl+0x48/0x70) from [<c000d600>]
(ret_fast_syscall+0x0/0x30)
Code: e59d3004 e1a07000 ea000011 e1a05003 (e5983000)

Regards
Gy=F6rgy K=F6vesdi

_______________________________________________
meta-ti mailing list
meta-ti@yoctoproject.org
https://lists.yoctoproject.org/listinfo/meta-ti

