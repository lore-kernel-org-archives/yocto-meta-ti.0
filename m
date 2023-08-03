Return-Path: <matthias.schnelte@de.abb.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE08C001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 12:22:18 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.49])
 by mx.groups.io with SMTP id smtpd.web11.13351.1691065328882988808
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 03 Aug 2023 05:22:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@de.abb.com header.s=selector1 header.b=HL8DOA/W;
 spf=pass (domain: de.abb.com, ip: 40.107.7.49, mailfrom: matthias.schnelte@de.abb.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlwHULZJqJYm/cjxtY3JCMH9RQOkWkm4pG8QQkwIz5xzH9jVTntEhRYhH4mMkhYiKTg1Yj2ziOxNXBOMShWoK33foKSxHEJ6kn7rmuh1h48MAhi/ci/qk7psrPPjuxX7T7xoCm2k6qUv+utDdmqCmv+heEz4NdKybH9p5tJL9K9NRRUXJe6ALaJxlmUPwaSo5riyls97mup419ADIXeYAj0gXOjE0Jt8Vj0ViJG4qIBRk97guIWNIe60+rEkpNAiKag4XaSUbKUT2/YSvQk/QfFY9TdePqhxG6YRgQkffQuxNM9Oo38sulxNqkUmmC9YElT2eQM1WRzsgoKHiWB2Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TNJ/mj6r09tQLH4DhYc0ZaDk2uM00XctzG96fuikjw=;
 b=ASZQBSxSWxgW5bpjR5868WsLRAVeJWnKpHP78n/sHGzX8DsVoQGa81iRhZPE00hngCNcwmhckQQh5RcK9Dzgmg1r2/VxpiLuZR3U+HCJ8A1q8duNOiwRscDwa17Evdb6FgOWaK1qXkjfM1dVvmXY/+caBkOtGhrB39dTM0zTU1pMA+tcZHMeOdAlGvgAi/JiGMKF181Rrf9qddMHvUOEoRQvhBOChFaec6JJU1sMr8zewwvRMALGzHbnk1vgui0kfp0e2ISN2KsHG4+NCBqqsRvaoLUvB78TdeJTZELxIaFQyQhHlsMMv1YOJpPiP0TtCRtxMewIz48Pvfeik4hSXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=de.abb.com; dmarc=pass action=none header.from=de.abb.com;
 dkim=pass header.d=de.abb.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.abb.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1TNJ/mj6r09tQLH4DhYc0ZaDk2uM00XctzG96fuikjw=;
 b=HL8DOA/WxAOrxCDVrLwxegWL11A5hf8Cnsy9z7Hube8hGO2wTILTc1Y7ygeh3hmB+tPgY+VcnMXS/EwCzrHFljEVC1caA6P2hV3B0UfHA9TzGJ13/6K2KpM9FzNQmbDe5zYYQbwTwaUFAoDEba7TNBlpX2mMQ33wNf4WaxyeBUq6ryNFwCqVadzHeFxkXEBQHJLOEphYLhfG1Qwl0WRLT7ypHDWGP6XL39GqNHgdL149w7O0CmqM2dhiGI0qXBPLzTZdRJqyY9IDjQmzRk9Y21JzRGb9kIsuhtNJf5CRv11GGETj63TaamW97KctYaHoZdhEmh3A6HAmSVvHHm4Nfw==
Received: from DB9PR06MB8106.eurprd06.prod.outlook.com (2603:10a6:10:26b::7)
 by DB9PR06MB8630.eurprd06.prod.outlook.com (2603:10a6:10:4ef::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 12:22:04 +0000
Received: from DB9PR06MB8106.eurprd06.prod.outlook.com
 ([fe80::7cf:c779:84ee:455f]) by DB9PR06MB8106.eurprd06.prod.outlook.com
 ([fe80::7cf:c779:84ee:455f%4]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 12:22:04 +0000
From: Matthias Schnelte <matthias.schnelte@de.abb.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: am335x. Kernel panic on reboot (PVR related)
Thread-Topic: am335x. Kernel panic on reboot (PVR related)
Thread-Index: AQHZxfU2D4bwb8vdKUyC1ubvkj21Qg==
Date: Thu, 3 Aug 2023 12:22:04 +0000
Message-ID: 
 <DB9PR06MB81064460DBEE125829111BF6C408A@DB9PR06MB8106.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=de.abb.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR06MB8106:EE_|DB9PR06MB8630:EE_
x-ms-office365-filtering-correlation-id: 218674e1-d4f5-4236-9a34-08db941c3f50
x-abb-o365-outbound: ABBOUTBOUND1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 MyN58rkKrrF4rYm2Okih+j4J53V6ZIv3itJ8Og4LjyGt+lsG8Npk+3POfbFqOfRqXZWhTbrWnojT+/BvytxDKPRrHe/IGSejcTIevuKRKuEsjt9raYFSKsChT0x12t4fFik31GWpEfvervHvDPRiLLX3lwqmbx3d+WPdAY7dOV4rLHnqQQ1O4jh1gVW8BLrhmSoIJv2P8NLKATwnJ1qFh1C78yu4HAqMuTzPQydyZ/ED228j24lUq3ueHfX8LyEDI9bFehUYPy2B/EPVLE3eJWx1O85A9L3JiAAYbApD57xPsL7+OlLTcpkUIdYKyoGoha+ojYa4wY8vg6UQCT/idkG6U+vwBB0Jk/oF8A0eIwthy42j/L1IcgeiisMv8m3ofTKiZ3FnkD2pv57cy5e+2T/QdSDxPhOYuQTU08PMkqxX/J+Wq6Wczm83uD+9lUBPQKNpJjr4Rh3csTdTYKth7x9+AfiII1SP3TzfQurRd7auZNguw9kP5eDRPj1JqBIARn0cIpj8QSVNRiYXAKUBP97ugq4kjQH4cLsLQ8bpaSUeIuel8SxFwGxlT86x0cvJKOEGFfVW9bdAmbHc54H/CQPUoY05/cHurtWyY2ChFUHeSJCPXcHxaijblYGjNDxm
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8106.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(19627405001)(55016003)(52536014)(44832011)(5660300002)(8936002)(8676002)(41300700001)(66946007)(64756008)(66446008)(66476007)(76116006)(6916009)(66556008)(316002)(2906002)(91956017)(7696005)(71200400001)(45080400002)(9686003)(478600001)(82960400001)(122000001)(38100700002)(83380400001)(66574015)(6506007)(33656002)(86362001)(38070700005)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?PPV5q71ibxXQE/IwaHK3/STBc1C8vnVQBmEHC+STJpqvcm6w7Bnjz4LqoY?=
 =?iso-8859-1?Q?H7eKlPDgkp21lJsac+MG1tGWOaNEytBjki61ASvd/ZACxWt9b5y4QPIe4W?=
 =?iso-8859-1?Q?gyXe1I3rg2D2kcXU/ecwVdh3nzAqf80OF6bmb8u7gxk6c0Q8H9HoBZvP9g?=
 =?iso-8859-1?Q?E/u7iasBxz5M1fPI+qPn8gNH4EpzijqlVglacw5gp5yL7UrVLK6sn7ziBM?=
 =?iso-8859-1?Q?/PiPvzmh1kXS5h9cRq9Sn0x5tooyLcisX1WyZZRZuujEB7D8IglhgbLzo+?=
 =?iso-8859-1?Q?qUrgSn1zUix0t86CZfg6GLo0xY4gNx51u7UKLbmM3TGpClg4c46zuNqOoK?=
 =?iso-8859-1?Q?YkD4+3H+rOAqYzXLT3IMwx3mggINqiT8HpvlA49/RUDzsXdg6bmsyMMmtI?=
 =?iso-8859-1?Q?6+NW4YuaMVWHJHFsKg23DaFhYOptIU5R/XJtLC67Q+BKjfG03uEiG2Ud0x?=
 =?iso-8859-1?Q?L+5HBB9BW7qysaidOAbbOo007s5y4fxsb7AGd3TJ0gcVO6LtCbeuWBbnCJ?=
 =?iso-8859-1?Q?RZ3bELQ6dlOuCLyP4/ZHPhC0gKwFzqmxV86voCsGqVvUJKHYrDuBclHKgZ?=
 =?iso-8859-1?Q?dPT8nMhp+SJN8eGZFsiRYyAnZsFDnq/oBUICkCgVUtsu32mgvzoGzUSRHe?=
 =?iso-8859-1?Q?VPqUjAffhuPDyACiGPLVu/mWpXSTxgQbZOzPr2WY6Dxal6VYRU33rfevtN?=
 =?iso-8859-1?Q?Q+73mSAIRMGdEJCNu1yRiJUWnxvRGGjx0OQrmG6oTFqdHpdTfYSky0s7I9?=
 =?iso-8859-1?Q?odO8LCCLNpICPkbLHnaIdlqvYiCOycgmpWAC3nEd9aHtHGpNdRPETFdlyF?=
 =?iso-8859-1?Q?KT9OHhq2WBjiZCoFzzH1Pi5LPy9SbUOT5wBQLuWmytaSbiK275kau5x1/C?=
 =?iso-8859-1?Q?6WMvZnW4iaUCx2F1aRtOXen3itIn3R5l2x6LlstUpqXDQZlNoDpoDWTqju?=
 =?iso-8859-1?Q?T6JGPYbccJJy4TIWFq7dqd6u5FMWlCBO3UnmLQmvawtPY9F0QmXkau5DZr?=
 =?iso-8859-1?Q?1k8lDtLkJq6Ses7xNapm4uYH3vcUxSHFccQi4aeAixMh9lUz8x9J3Xp05M?=
 =?iso-8859-1?Q?yD+Vz7agVu7MwMxs/z5jM2eXT7qhHGUrlysRSlspVzjKDZh8ev1c3lu1eM?=
 =?iso-8859-1?Q?vYCrPPBEEBXyhnu+M93ozFqoFLJ1EGLt4Zv3bZZi6VmcmHXQA0w3ekieSK?=
 =?iso-8859-1?Q?21LYdB4sM/jDjW/k++zb4SOjTEoeds6isZ5swbiFCNR2HOw8Y8lhvNTqnD?=
 =?iso-8859-1?Q?vkpr9q6fzbHhOJni9P6RkKbo2MBqQQk83kk6rIRXVNn5zHtAifkcH4+P5W?=
 =?iso-8859-1?Q?Q9UlRmRkznocAi8P4+R/ybzYlAZlobFV6boehgkSApZO7vsruBv7pvU2dH?=
 =?iso-8859-1?Q?/LlngayIhplSTKONTnaMiF3DNts5Vieo1nEHnQYG0nixdVoyi9KR6lPEv0?=
 =?iso-8859-1?Q?vKNp6Fjws8FZUma5zNySlwDL9gHD8e8C/DUs2EfgHMOomm37ewVZS6KggC?=
 =?iso-8859-1?Q?9mi03Swl3on2BoymK0cE1nEJ5CV9EQjCWN+oW+ijjBDoRxwdSJppO9WG1g?=
 =?iso-8859-1?Q?PSxdI5HN02OM1VlMXxZwgdEssdlgefE2eBCndUtlehr2fT7MfLlyh44D7B?=
 =?iso-8859-1?Q?6PlCpAm9grPSUoEZ+FaJsBBiBGe0oh08ZjJJelXYFDR0rO73tXryZbMybQ?=
 =?iso-8859-1?Q?dT9pddRSr+PNDBcaG51YXE9GHmpLzHAsCIyXiqM2Q4W1N4Q7SpG151VT/z?=
 =?iso-8859-1?Q?B5Ig=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_DB9PR06MB81064460DBEE125829111BF6C408ADB9PR06MB8106eurp_"
MIME-Version: 1.0
X-OriginatorOrg: de.abb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8106.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218674e1-d4f5-4236-9a34-08db941c3f50
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Aug 2023 12:22:04.4866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 372ee9e0-9ce0-4033-a64a-c07073a91ecd
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rJl8oMMqCmwXJXlG1W5rNjw3oAUNuVqF60H1nGSP5y7R0s4blG/1Z5q/bsQNZWk0NHcNltUrgirvlg8afFFNjohtryGbALXyhjIO0d8FYBw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8630
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 03 Aug 2023 12:22:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16869

--_000_DB9PR06MB81064460DBEE125829111BF6C408ADB9PR06MB8106eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi everyone,

I receive a kernel panic when rebooting my am335x based board.
The system is running weston and an qt-kiosk-browser (from meta-qt5) instan=
ce. Both are running as systemd services.
On reboot I receive a kernel panic (see below).

The kernel panic can be prevented if the qt-kiosk-browser service depends o=
n rc-pvr.service and adds a "sleep 5" as ExecStopPost.
I.e. the rc.pvr.service is stopped 5 seconds after qt-kiosk-browser has bee=
n stopped.
However the sleep feels like a hack.
Anybody has an idea what could be the root cause?

The build is based upon the latest kirkstone of meta-ti, meta-arago.
libgles and weston recipes are taken from latest dunfell as the sgx of the =
am335x is not supported in the latest kirkstone.

BRANCH =3D "ti-img-sgx/dunfell/${PV}"

SRC_URI =3D "git://git.ti.com/git/graphics/omap5-sgx-ddk-um-linux.git;proto=
col=3Dhttps;branch=3D${BRANCH}"
SRCREV =3D "742cf38aba13e1ba1a910cf1f036a1a212c263b6"


The  kernel panic I receive if the sleep 5 is not in place is below.

Any ideas would be appreciated.

Matthias

[ 6530.070411] PVRLinuxFenceDeInit: 4 fences leaked
[  OK  ] Stopped User Manager for UID 1201.
[  OK  ] Stopped User Manager for UID 0.
[  OK  ] Stopped rc.pvr.service.
         Stopping User Runtime Directory /run/user/0...
         Stopping User Runtime Directory /run/user/1201...
[ 6530.705184] 8<--- cut here ---
[ 6530.712786] Unable to handle kernel paging request at virtual address bf=
1c40c4
[ 6530.748573] pgd =3D e1827896
[ 6530.768238] [bf1c40c4] *pgd=3D82b5b811, *pte=3D00000000, *ppte=3D0000000=
0
[ 6530.778853] Internal error: Oops: 7 [#1] PREEMPT ARM
[ 6530.784013] Modules linked in: cfg80211 bluetooth ecdh_generic ecc qcser=
ial usb_wwan qmi_wwan cdc_wdm usbserial usbnet omap_aes_driver omap_sham om=
ap_crypto crypto_engine libaes pm33xx ti_emif_sram musb_dsps musb_hdrc udc_=
core usbcore phy_am335x phy_generic usb_common omap_wdt rtc_omap wkup_m3_ip=
c phy_am335x_control wkup_m3_rproc rtc_tps65910 edt_ft5x06 snd_soc_tlv320ai=
c3x sch_fq_codel cryptodev(O) [last unloaded: pvrsrvkm]
[ 6530.822692] CPU: 0 PID: 1 Comm: systemd Tainted: G           O      5.10=
.168-g991c5ce91e #1
[ 6530.831253] Hardware name: Generic AM33XX (Flattened Device Tree)
[ 6530.837538] PC is at dma_fence_release+0xd0/0x124
[ 6530.842368] LR is at dma_resv_fini+0xe0/0xf0
[ 6530.846744] pc : [<c06ec9f4>]    lr : [<c06ee8cc>]    psr: 00000113
[ 6530.853166] sp : c186fe70  ip : c186d9f4  fp : c100404c
[ 6530.858524] r10: 00000000  r9 : 5ac3c35a  r8 : c182e310
[ 6530.863891] r7 : c226f6e8  r6 : c3a72c88  r5 : c3a72c80  r4 : c3a72ca4
[ 6530.870578] r3 : bf1c40ac  r2 : 00000003  r1 : 00000000  r0 : c3a72ca4
[ 6530.877272] Flags: nzcv  IRQs on  FIQs on  Mode SVC_32  ISA ARM  Segment=
 none
[ 6530.884585] Control: 10c5387d  Table: 829d4019  DAC: 00000051
[ 6530.890489] Process systemd (pid: 1, stack limit =3D 0x04818d15)
[ 6530.896469] Stack: (0xc186fe70 to 0xc1870000)
[ 6530.900946] fe60:                                     00000000 c02704fc =
c5235ec0 f2179000
[ 6530.909328] fe80: c5235ec0 c01138f8 c2801500 c2e18b9c 00000000 c25a7e10 =
c226f6e8 c182e310
[ 6530.917711] fea0: 5ac3c35a c06ee8cc c2e18b00 00000000 c25a7e10 c063d924 =
c2e18b00 c066f7d4
[ 6530.926093] fec0: 00000004 c017c9fc c2808000 c064e108 c3879080 c06eb1c4 =
c226f6e8 c02a0310
[ 6530.934500] fee0: c34ea3c0 00080005 c25a7e10 c0287344 00000000 c25a7e10 =
00000000 c186e000
[ 6530.942885] ff00: c186d640 c3663cc0 c186d9f4 c186e000 c186d640 c108e4c0 =
5ac3c35a c014824c
[ 6530.954518] ff20: c186e000 c186ffb0 c01002c4 fffffe30 c01002c4 c0109bf8 =
00000000 00000000
[ 6530.966169] ff40: 00000000 1e3a4e69 64cb9b0b 00000002 00000004 0000007e =
c186ff78 c01002c4
[ 6530.977823] ff60: c186e000 000000fb 000e62e4 c02da4bc 00000000 c186e000 =
c2fdec00 00000000
[ 6530.989462] ff80: c1839b40 1e3a4e69 c2fdec00 0000007e b6f7cda0 00000000 =
00000006 c01002c4
[ 6531.001100] ffa0: c186e000 00000006 000e62e4 c01000cc 00000000 b6f7c8a4 =
00000000 00000000
[ 6531.012751] ffc0: 0000007e b6f7cda0 00000000 00000006 0025b1e0 000e4377 =
000e6620 000e62e4
[ 6531.024357] ffe0: 00000006 bedd6d88 b6c20ef5 b6ba1ae6 800c0030 0000007e =
00000000 00000000
[ 6531.035902] [<c06ec9f4>] (dma_fence_release) from [<c06ee8cc>] (dma_resv=
_fini+0xe0/0xf0)
[ 6531.047335] [<c06ee8cc>] (dma_resv_fini) from [<c063d924>] (drm_gem_obje=
ct_release+0x2c/0x5c)
[ 6531.059172] [<c063d924>] (drm_gem_object_release) from [<c066f7d4>] (drm=
_gem_cma_free_object+0x40/0x7c)
[ 6531.074954] [<c066f7d4>] (drm_gem_cma_free_object) from [<c064e108>] (dr=
m_gem_dmabuf_release+0x4c/0x64)
[ 6531.090885] [<c064e108>] (drm_gem_dmabuf_release) from [<c06eb1c4>] (dma=
_buf_release+0x44/0xa8)
[ 6531.103099] [<c06eb1c4>] (dma_buf_release) from [<c02a0310>] (__dentry_k=
ill+0x134/0x224)
[ 6531.114736] [<c02a0310>] (__dentry_kill) from [<c0287344>] (__fput+0xc0/=
0x26c)
[ 6531.125494] [<c0287344>] (__fput) from [<c014824c>] (task_work_run+0x94/=
0xd4)
[ 6531.136199] [<c014824c>] (task_work_run) from [<c0109bf8>] (do_work_pend=
ing+0x56c/0x58c)
[ 6531.147916] [<c0109bf8>] (do_work_pending) from [<c01000cc>] (slow_work_=
pending+0xc/0x20)
[ 6531.159789] Exception stack(0xc186ffb0 to 0xc186fff8)
[ 6531.168482] ffa0:                                     00000000 b6f7c8a4 =
00000000 00000000
[ 6531.180400] ffc0: 0000007e b6f7cda0 00000000 00000006 0025b1e0 000e4377 =
000e6620 000e62e4
[ 6531.192332] ffe0: 00000006 bedd6d88 b6c20ef5 b6ba1ae6 800c0030 0000007e
[ 6531.202682] Code: e5873004 e3530000 0a000010 e5143020 (e5933018)
[ 6531.241953] ---[ end trace 2ee20c6f470eae8d ]---
[ 6531.251011] Kernel panic - not syncing: Attempted to kill init! exitcode=
=3D0x0000000b
[ 6531.262502] ---[ end Kernel panic - not syncing: Attempted to kill init!=
 exitcode=3D0x0000000b ]---


--_000_DB9PR06MB81064460DBEE125829111BF6C408ADB9PR06MB8106eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Hi everyone,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I receive a kernel panic when rebooting my am335x based board.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
The system is running weston and an qt-kiosk-browser (from meta-qt5) instan=
ce. Both are running as systemd services.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
On reboot I receive a kernel panic (see below).</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
The kernel panic can be prevented if the qt-kiosk-browser service depends o=
n rc-pvr.service and adds a &quot;sleep 5&quot; as ExecStopPost.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
I.e. the rc.pvr.service is stopped 5 seconds after qt-kiosk-browser has bee=
n stopped.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">However the sleep feels like a hack.</span><=
br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);">Anybody has an idea what could be the root c=
ause?</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-siz=
e: 12pt; color: rgb(0, 0, 0);"><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
The build is based upon the latest kirkstone of meta-ti, meta-arago.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
libgles and weston recipes are taken from latest dunfell as the sgx of the =
am335x is not supported in the latest kirkstone.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
BRANCH =3D &quot;ti-img-sgx/dunfell/${PV}&quot;
<div><br class=3D"ContentPasted0">
</div>
<div class=3D"ContentPasted0">SRC_URI =3D &quot;git://git.ti.com/git/graphi=
cs/omap5-sgx-ddk-um-linux.git;protocol=3Dhttps;branch=3D${BRANCH}&quot;</di=
v>
<div class=3D"ContentPasted0">SRCREV =3D &quot;742cf38aba13e1ba1a910cf1f036=
a1a212c263b6&quot;</div>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
The&nbsp; kernel panic I receive if the sleep 5 is not in place is below.</=
div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Any ideas would be appreciated.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Matthias</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0 Conten=
tPasted1">
[ 6530.070411] PVRLinuxFenceDeInit: 4 fences leaked
<div class=3D"ContentPasted1">[ &nbsp;OK &nbsp;] Stopped User Manager for U=
ID 1201.</div>
<div class=3D"ContentPasted1">[ &nbsp;OK &nbsp;] Stopped User Manager for U=
ID 0.</div>
<div class=3D"ContentPasted1">[ &nbsp;OK &nbsp;] Stopped rc.pvr.service.</d=
iv>
<div class=3D"ContentPasted1">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Stopping Us=
er Runtime Directory /run/user/0...</div>
<div class=3D"ContentPasted1">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Stopping Us=
er Runtime Directory /run/user/1201...</div>
<div class=3D"ContentPasted1">[ 6530.705184] 8&lt;--- cut here ---</div>
<div class=3D"ContentPasted1">[ 6530.712786] Unable to handle kernel paging=
 request at virtual address bf1c40c4</div>
<div class=3D"ContentPasted1">[ 6530.748573] pgd =3D e1827896</div>
<div class=3D"ContentPasted1">[ 6530.768238] [bf1c40c4] *pgd=3D82b5b811, *p=
te=3D00000000, *ppte=3D00000000</div>
<div class=3D"ContentPasted1">[ 6530.778853] Internal error: Oops: 7 [#1] P=
REEMPT ARM</div>
<div class=3D"ContentPasted1">[ 6530.784013] Modules linked in: cfg80211 bl=
uetooth ecdh_generic ecc qcserial usb_wwan qmi_wwan cdc_wdm usbserial usbne=
t omap_aes_driver omap_sham omap_crypto crypto_engine libaes pm33xx ti_emif=
_sram musb_dsps musb_hdrc udc_core
 usbcore phy_am335x phy_generic usb_common omap_wdt rtc_omap wkup_m3_ipc ph=
y_am335x_control wkup_m3_rproc rtc_tps65910 edt_ft5x06 snd_soc_tlv320aic3x =
sch_fq_codel cryptodev(O) [last unloaded: pvrsrvkm]</div>
<div class=3D"ContentPasted1">[ 6530.822692] CPU: 0 PID: 1 Comm: systemd Ta=
inted: G &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; O &nbsp; &nbsp; &nbsp;5.10.168-=
g991c5ce91e #1</div>
<div class=3D"ContentPasted1">[ 6530.831253] Hardware name: Generic AM33XX =
(Flattened Device Tree)</div>
<div class=3D"ContentPasted1">[ 6530.837538] PC is at dma_fence_release+0xd=
0/0x124</div>
<div class=3D"ContentPasted1">[ 6530.842368] LR is at dma_resv_fini+0xe0/0x=
f0</div>
<div class=3D"ContentPasted1">[ 6530.846744] pc : [&lt;c06ec9f4&gt;] &nbsp;=
 &nbsp;lr : [&lt;c06ee8cc&gt;] &nbsp; &nbsp;psr: 00000113</div>
<div class=3D"ContentPasted1">[ 6530.853166] sp : c186fe70 &nbsp;ip : c186d=
9f4 &nbsp;fp : c100404c</div>
<div class=3D"ContentPasted1">[ 6530.858524] r10: 00000000 &nbsp;r9 : 5ac3c=
35a &nbsp;r8 : c182e310</div>
<div class=3D"ContentPasted1">[ 6530.863891] r7 : c226f6e8 &nbsp;r6 : c3a72=
c88 &nbsp;r5 : c3a72c80 &nbsp;r4 : c3a72ca4</div>
<div class=3D"ContentPasted1">[ 6530.870578] r3 : bf1c40ac &nbsp;r2 : 00000=
003 &nbsp;r1 : 00000000 &nbsp;r0 : c3a72ca4</div>
<div class=3D"ContentPasted1">[ 6530.877272] Flags: nzcv &nbsp;IRQs on &nbs=
p;FIQs on &nbsp;Mode SVC_32 &nbsp;ISA ARM &nbsp;Segment none</div>
<div class=3D"ContentPasted1">[ 6530.884585] Control: 10c5387d &nbsp;Table:=
 829d4019 &nbsp;DAC: 00000051</div>
<div class=3D"ContentPasted1">[ 6530.890489] Process systemd (pid: 1, stack=
 limit =3D 0x04818d15)</div>
<div class=3D"ContentPasted1">[ 6530.896469] Stack: (0xc186fe70 to 0xc18700=
00)</div>
<div class=3D"ContentPasted1">[ 6530.900946] fe60: &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; 00000000 c02704fc c5235ec0 f2179000</div>
<div class=3D"ContentPasted1">[ 6530.909328] fe80: c5235ec0 c01138f8 c28015=
00 c2e18b9c 00000000 c25a7e10 c226f6e8 c182e310</div>
<div class=3D"ContentPasted1">[ 6530.917711] fea0: 5ac3c35a c06ee8cc c2e18b=
00 00000000 c25a7e10 c063d924 c2e18b00 c066f7d4</div>
<div class=3D"ContentPasted1">[ 6530.926093] fec0: 00000004 c017c9fc c28080=
00 c064e108 c3879080 c06eb1c4 c226f6e8 c02a0310</div>
<div class=3D"ContentPasted1">[ 6530.934500] fee0: c34ea3c0 00080005 c25a7e=
10 c0287344 00000000 c25a7e10 00000000 c186e000</div>
<div class=3D"ContentPasted1">[ 6530.942885] ff00: c186d640 c3663cc0 c186d9=
f4 c186e000 c186d640 c108e4c0 5ac3c35a c014824c</div>
<div class=3D"ContentPasted1">[ 6530.954518] ff20: c186e000 c186ffb0 c01002=
c4 fffffe30 c01002c4 c0109bf8 00000000 00000000</div>
<div class=3D"ContentPasted1">[ 6530.966169] ff40: 00000000 1e3a4e69 64cb9b=
0b 00000002 00000004 0000007e c186ff78 c01002c4</div>
<div class=3D"ContentPasted1">[ 6530.977823] ff60: c186e000 000000fb 000e62=
e4 c02da4bc 00000000 c186e000 c2fdec00 00000000</div>
<div class=3D"ContentPasted1">[ 6530.989462] ff80: c1839b40 1e3a4e69 c2fdec=
00 0000007e b6f7cda0 00000000 00000006 c01002c4</div>
<div class=3D"ContentPasted1">[ 6531.001100] ffa0: c186e000 00000006 000e62=
e4 c01000cc 00000000 b6f7c8a4 00000000 00000000</div>
<div class=3D"ContentPasted1">[ 6531.012751] ffc0: 0000007e b6f7cda0 000000=
00 00000006 0025b1e0 000e4377 000e6620 000e62e4</div>
<div class=3D"ContentPasted1">[ 6531.024357] ffe0: 00000006 bedd6d88 b6c20e=
f5 b6ba1ae6 800c0030 0000007e 00000000 00000000</div>
<div class=3D"ContentPasted1">[ 6531.035902] [&lt;c06ec9f4&gt;] (dma_fence_=
release) from [&lt;c06ee8cc&gt;] (dma_resv_fini+0xe0/0xf0)</div>
<div class=3D"ContentPasted1">[ 6531.047335] [&lt;c06ee8cc&gt;] (dma_resv_f=
ini) from [&lt;c063d924&gt;] (drm_gem_object_release+0x2c/0x5c)</div>
<div class=3D"ContentPasted1">[ 6531.059172] [&lt;c063d924&gt;] (drm_gem_ob=
ject_release) from [&lt;c066f7d4&gt;] (drm_gem_cma_free_object+0x40/0x7c)</=
div>
<div class=3D"ContentPasted1">[ 6531.074954] [&lt;c066f7d4&gt;] (drm_gem_cm=
a_free_object) from [&lt;c064e108&gt;] (drm_gem_dmabuf_release+0x4c/0x64)</=
div>
<div class=3D"ContentPasted1">[ 6531.090885] [&lt;c064e108&gt;] (drm_gem_dm=
abuf_release) from [&lt;c06eb1c4&gt;] (dma_buf_release+0x44/0xa8)</div>
<div class=3D"ContentPasted1">[ 6531.103099] [&lt;c06eb1c4&gt;] (dma_buf_re=
lease) from [&lt;c02a0310&gt;] (__dentry_kill+0x134/0x224)</div>
<div class=3D"ContentPasted1">[ 6531.114736] [&lt;c02a0310&gt;] (__dentry_k=
ill) from [&lt;c0287344&gt;] (__fput+0xc0/0x26c)</div>
<div class=3D"ContentPasted1">[ 6531.125494] [&lt;c0287344&gt;] (__fput) fr=
om [&lt;c014824c&gt;] (task_work_run+0x94/0xd4)</div>
<div class=3D"ContentPasted1">[ 6531.136199] [&lt;c014824c&gt;] (task_work_=
run) from [&lt;c0109bf8&gt;] (do_work_pending+0x56c/0x58c)</div>
<div class=3D"ContentPasted1">[ 6531.147916] [&lt;c0109bf8&gt;] (do_work_pe=
nding) from [&lt;c01000cc&gt;] (slow_work_pending+0xc/0x20)</div>
<div class=3D"ContentPasted1">[ 6531.159789] Exception stack(0xc186ffb0 to =
0xc186fff8)</div>
<div class=3D"ContentPasted1">[ 6531.168482] ffa0: &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; 00000000 b6f7c8a4 00000000 00000000</div>
<div class=3D"ContentPasted1">[ 6531.180400] ffc0: 0000007e b6f7cda0 000000=
00 00000006 0025b1e0 000e4377 000e6620 000e62e4</div>
<div class=3D"ContentPasted1">[ 6531.192332] ffe0: 00000006 bedd6d88 b6c20e=
f5 b6ba1ae6 800c0030 0000007e</div>
<div class=3D"ContentPasted1">[ 6531.202682] Code: e5873004 e3530000 0a0000=
10 e5143020 (e5933018)
</div>
<div class=3D"ContentPasted1">[ 6531.241953] ---[ end trace 2ee20c6f470eae8=
d ]---</div>
<div class=3D"ContentPasted1">[ 6531.251011] Kernel panic - not syncing: At=
tempted to kill init! exitcode=3D0x0000000b</div>
<div class=3D"ContentPasted1">[ 6531.262502] ---[ end Kernel panic - not sy=
ncing: Attempted to kill init! exitcode=3D0x0000000b ]---</div>
<br>
</div>
</body>
</html>

--_000_DB9PR06MB81064460DBEE125829111BF6C408ADB9PR06MB8106eurp_--

