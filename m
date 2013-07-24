Return-Path: <prabu@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B890E01440
	for <meta-ti@yoctoproject.org>; Tue, 23 Jul 2013 19:11:59 -0700 (PDT)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6O2BugB019603;
	Tue, 23 Jul 2013 21:11:56 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6O2Br20018586;
	Tue, 23 Jul 2013 21:11:54 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Wed, 24 Jul 2013 10:11:53 +0800
From: "Sundareson, Prabindh" <prabu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>
Thread-Topic: [meta-ti] [PATCH 0/9] Graphics SDK cleanup
Thread-Index: AQHObXAXXr8A/j+Xxkef8XKZSmzdxJlSkmaAgAAEO4CAABT/AIAAAoeAgAGON4CAHfN1gIAAvwpQ
Date: Wed, 24 Jul 2013 02:11:52 +0000
Message-ID: <321768C95D21724485BCE784F1BE98473EB7E070@DBDE04.ent.ti.com>
References: <prabu@ti.com> <1371057762-17055-1-git-send-email-prabu@ti.com>
	<20130620043900.GQ13356@edge>
	<CAFqH_518YDzw43QM-hRmrQt7kCVOK1n_39MGQk8Fg-DUDZpDng@mail.gmail.com>
	<CAFqH_51HO7Pe=QrRSQ_Hu0=2u+tBPpBVHQqevqS-6vw59YewtA@mail.gmail.com>
	<20130703155932.GD8850@edge>
	<CAFqH_52LYwT-FyYx0t9NAp5OPVxn4O2ZpSfz6+c-BfT_3agmxg@mail.gmail.com>
	<CAFqH_50tqO765pwsDPtR6kWgRBEtm-okL1Oe-2xERHP=55TAqw@mail.gmail.com>
	<20130723171645.GQ31158@edge>
In-Reply-To: <20130723171645.GQ31158@edge>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 0/9] Graphics SDK cleanup
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
X-List-Received-Date: Wed, 24 Jul 2013 02:12:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I would start with a log of the script from sgxdbg,

http://processors.wiki.ti.com/index.php/SGXDbg#Baselining_the_current_SGX_d=
river_environment

regards,
Prabu

-----Original Message-----
From: Dmytriyenko, Denys=20
Sent: Tuesday, July 23, 2013 10:47 PM
To: Enric Balletbo Serra
Cc: Sundareson, Prabindh; meta-ti@yoctoproject.org
Subject: Re: [meta-ti] [PATCH 0/9] Graphics SDK cleanup

On Thu, Jul 04, 2013 at 05:53:51PM +0200, Enric Balletbo Serra wrote:
> Hi,
>=20
> I modified the package to do not install the libraries that depends on=20
> libdrm (pvr_drv.so libpvrPVR2D_DRIWSEGL.so libsrv_um_dri.so). Now I've=20
> following error loading running the pvr-init script:
>=20
> ioctl FBIOPUT_VSCREENINFO: Invalid argument Starting PVR
> [   11.968592] Unable to handle kernel NULL pointer dereference at
> virtual address 00000000
> [   11.977139] pgd =3D de560000
> [   11.979994] [00000000] *pgd=3D9e5f9831, *pte=3D00000000, *ppte=3D00000=
000
> [   11.986641] Internal error: Oops: 17 [#1] SMP ARM
> [   11.991568] Modules linked in: omaplfb(O+) pvrsrvkm(O)
> [   11.996971] CPU: 0    Tainted: G           O  (3.8.13+ #1)
> [   12.002840] PC is at AllocateDeviceID+0x0/0x48 [pvrsrvkm]
> [   12.008525] LR is at PVRSRVRegisterDCDeviceKM+0xf0/0x178 [pvrsrvkm]
> [   12.015091] pc : [<bf0063f0>]    lr : [<bf0026b4>]    psr: 40000013
> [   12.015091] sp : de565e18  ip : de0d0398  fp : 0000001c
> [   12.027115] r10: 00000001  r9 : 00000000  r8 : 000a8c00
> [   12.032586] r7 : df6ae898  r6 : 00000000  r5 : df6ae804  r4 : 00000000
> [   12.039422] r3 : de0d02c0  r2 : 00000001  r1 : de0d02c8  r0 : 00000000
> [   12.046260] Flags: nZcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segme=
nt user
> [   12.053734] Control: 10c5387d  Table: 9e560019  DAC: 00000015
> [   12.059752] Process modprobe (pid: 600, stack limit =3D 0xde564240)
> [   12.066133] Stack: (0xde565e18 to 0xde566000)
> [   12.074104] 5e00:
>     de2389c0 de0d02c0
> [   12.083159] 5e20: 00000032 df6ae800 00000000 00000000 000b4000
> bf03ac64 c0969874 ffffffff
> [   12.092276] 5e40: bf03bd54 00000001 00000001 bf03bd54 de565f58
> 00000000 00000001 bf03bd9c
> [   12.101149] 5e60: bf03e000 bf03e008 de564000 c0008890 bf03e000
> 00000000 00000001 bf03bd54
> [   12.110275] 5e80: bf03bd54 de565f58 00000000 00000001 bf03bd9c
> 00000001 de35ef80 c008a57c
> [   12.119290] 5ea0: bf03bd60 00007fff c008648c 00000010 c0087a74
> 00000028 00000000 bf03bd60
> [   12.128214] 5ec0: bf03bea8 000000c7 c0624424 e09e91f4 de565eec
> 4bc984d8 20000013 c087b058
> [   12.137101] 5ee0: de565f1c c0619ad8 e09eb000 b6e75000 00000acd
> 00000000 00000000 00000000
> [   12.147911] 5f00: 00000000 00000000 00000000 00000000 00000000
> 00000000 00000000 00000000
> [   12.156627] 5f20: 00000000 00000000 00000000 00000000 000000d2
> b6e6d000 00008b4d 4bc984d8
> [   12.168231] 5f40: 00000080 c000dac4 de564000 00000000 00000000
> c008a8f8 e09e3000 00008b4d
> [   12.177017] 5f60: e09e8bdc e09e8a2c e09eb37c 00001ec4 00002684
> 00000000 00000000 00000000
> [   12.185757] 5f80: 00000027 00000028 00000015 00000019 00000012
> 00000000 4bc9925c 00000000
> [   12.194483] 5fa0: 00022db0 c000d940 4bc9925c 00000000 b6e6d000
> 00008b4d 4bc984d8 00022db0
> [   12.203203] 5fc0: 4bc9925c 00000000 00022db0 00000080 00022ec0
> 00008b4d 4bc984d8 00000000
> [   12.211919] 5fe0: 4bca1b78 bea0a9a8 4bc90790 4bba7770 60000010
> b6e6d000 00105b04 20230200
> [   12.220696] [<bf0063f0>] (AllocateDeviceID+0x0/0x48 [pvrsrvkm])
> from [<bf0026b4>] (PVRSRVRegisterDCDeviceKM+0xf0/0x178 [pvrsrvkm])
> [   12.233166] [<bf0026b4>] (PVRSRVRegisterDCDeviceKM+0xf0/0x178
> [pvrsrvkm]) from [<bf03ac64>] (OMAPLFBInit+0x3e0/0x548 [omaplfb])
> [   12.245248] [<bf03ac64>] (OMAPLFBInit+0x3e0/0x548 [omaplfb]) from
> [<bf03e008>] (OMAPLFB_Init+0x8/0x2c [omaplfb])
> [   12.255952] [<bf03e008>] (OMAPLFB_Init+0x8/0x2c [omaplfb]) from
> [<c0008890>] (do_one_initcall+0x90/0x160)
> [   12.266010] [<c0008890>] (do_one_initcall+0x90/0x160) from
> [<c008a57c>] (load_module+0x1944/0x1bf4)
> [   12.275537] [<c008a57c>] (load_module+0x1944/0x1bf4) from
> [<c008a8f8>] (sys_init_module+0xcc/0xec)
> [   12.284957] [<c008a8f8>] (sys_init_module+0xcc/0xec) from
> [<c000d940>] (ret_fast_syscall+0x0/0x30)
> [   12.294728] Code: e3e00000 ebffed9d e1a00004 e8bd8038 (e5902000)
> [   12.301154] ---[ end trace 8828fbcbbe3723c2 ]---
> Segmentation fault
>=20
>=20
> Any idea which could be the problem ?

Prabu,

Do you have any insight in the problem above? Any pointers? Thanks.

--
Denys

