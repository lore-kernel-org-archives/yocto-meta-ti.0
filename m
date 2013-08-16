Return-Path: <kgy@teledigit.eu>
Received: from teledigit.eu (teledigit.eu [195.56.148.37])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F5EFE0073F
	for <meta-ti@yoctoproject.org>; Fri, 16 Aug 2013 04:26:54 -0700 (PDT)
X-AuthUser: kgy@teledigit.eu
Received: from kgy-pc.localnet ([46.107.59.216]:59418)
	by teledigit.eu with [XMail 1.27 ESMTP Server]
	id <S2C333> for <meta-ti@yoctoproject.org> from <kgy@teledigit.eu>;
	Fri, 16 Aug 2013 13:26:18 +0200
From: Kovesdi Gyorgy <kgy@teledigit.eu>
To: meta-ti mailing list <meta-ti@yoctoproject.org>
Date: Fri, 16 Aug 2013 14:25:47 +0200
Message-ID: <19394510.IQgu9b8fOF@kgy-pc>
User-Agent: KMail/4.8.5 (Linux/3.4.47-2.38-desktop; KDE/4.8.5; i686; ; )
MIME-Version: 1.0
Subject: Kernel crash running omap3-sgx-modules_4.05.00.03 on 3.x kernels
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
X-List-Received-Date: Fri, 16 Aug 2013 11:26:58 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi,

I have Beagleboard-C4, kerner 3.2.28

At last i could compile libgles and sgx modules version 4.05.00.03 with=
 some=20
hacks, and found the following error running any gles-based application=
:

[   74.792510] Unhandled fault: external abort on non-linefetch (0x1008=
) at=20
0xd0b00ca8                                                             =
                                =20
[   74.800476] Internal error: : 1008 [#1]                             =
                                                                       =
                                     =20
[   74.804473] Modules linked in: bufferclass_ti(O) omaplfb(O) pvrsrvkm=
(O)                                                                    =
                                     =20
[   74.811370] CPU: 0    Tainted: G           O  (3.2.28 #1)           =
                                                                       =
                                     =20
[   74.817108] PC is at PollForValueKM+0x48/0xb8 [pvrsrvkm]            =
                                                                       =
                                     =20
[   74.822692] LR is at PollForValueKM+0x38/0xb8 [pvrsrvkm]            =
                                                                       =
                                     =20

Previously i tried it on Angstrom with the same result. The kernel can =
be any=20
3.x version, the result is also the same. It can run on 2.6 kernels onl=
y.

The calltrace is:

[<bf005aa0>] (PollForValueKM+0x48/0xb8 [pvrsrvkm]) from [<bf0117f8>]=20=

(SGXResetInvalDC.isra.2+0x58/0x60 [pvrsrvkm])
[<bf0117f8>] (SGXResetInvalDC.isra.2+0x58/0x60 [pvrsrvkm]) from [<bf011=
990>]=20
(SGXReset+0x190/0x1ac [pvrsrvkm])
[<bf011990>] (SGXReset+0x190/0x1ac [pvrsrvkm]) from [<bf00ec90>]=20
(SGXInitialise+0x48/0x110 [pvrsrvkm])
[<bf00ec90>] (SGXInitialise+0x48/0x110 [pvrsrvkm]) from [<bf011c04>]=20=

(SGXPostPowerState+0x4c/0xa0 [pvrsrvkm])
[<bf011c04>] (SGXPostPowerState+0x4c/0xa0 [pvrsrvkm]) from [<bf001778>]=
=20
(PVRSRVDevicePostPowerStateKM_AnyVaCb+0x74/0x88 [pvrsrvkm])
[<bf001778>] (PVRSRVDevicePostPowerStateKM_AnyVaCb+0x74/0x88 [pvrsrvkm]=
) from=20
[<bf008768>] (List_PVRSRV_POWER_DEV_PVRSRV_ERROR_Any_va+0x30/0x58 [pvrs=
rvkm])
[<bf008768>] (List_PVRSRV_POWER_DEV_PVRSRV_ERROR_Any_va+0x30/0x58 [pvrs=
rvkm])=20
from [<bf0019cc>] (PVRSRVSetDevicePowerStateKM+0x6c/0xa8 [pvrsrvkm])
[<bf0019cc>] (PVRSRVSetDevicePowerStateKM+0x6c/0xa8 [pvrsrvkm]) from=20=

[<bf00fbf8>] (SGXScheduleCCBCommandKM+0x2c/0xa4 [pvrsrvkm])
[<bf00fbf8>] (SGXScheduleCCBCommandKM+0x2c/0xa4 [pvrsrvkm]) from [<bf00=
e224>]=20
(SGXSubmitTransferKM+0x118/0x2b4 [pvrsrvkm])
[<bf00e224>] (SGXSubmitTransferKM+0x118/0x2b4 [pvrsrvkm]) from [<bf014f=
2c>]=20
(SGXSubmitTransferBW+0x164/0x170 [pvrsrvkm])
[<bf014f2c>] (SGXSubmitTransferBW+0x164/0x170 [pvrsrvkm]) from [<bf0145=
b4>]=20
(BridgedDispatchKM+0xe0/0x138 [pvrsrvkm])
[<bf0145b4>] (BridgedDispatchKM+0xe0/0x138 [pvrsrvkm]) from [<bf00e004>=
]=20
(PVRSRV_BridgeDispatchKM+0xac/0xec [pvrsrvkm])
[<bf00e004>] (PVRSRV_BridgeDispatchKM+0xac/0xec [pvrsrvkm]) from [<c00e=
c554>]=20
(vfs_ioctl+0x20/0x3c)
[<c00ec554>] (vfs_ioctl+0x20/0x3c) from [<c00ecf94>]=20
(do_vfs_ioctl+0x488/0x4e0)
[<c00ecf94>] (do_vfs_ioctl+0x488/0x4e0) from [<c00ed034>]=20
(sys_ioctl+0x48/0x70)
[<c00ed034>] (sys_ioctl+0x48/0x70) from [<c000d600>]=20
(ret_fast_syscall+0x0/0x30)
Code: e59d3004 e1a07000 ea000011 e1a05003 (e5983000)

Regards
Gy=F6rgy K=F6vesdi


