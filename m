Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.110])
 by mx.groups.io with SMTP id smtpd.web12.7001.1614224698090820036
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 24 Feb 2021 19:44:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@honeywell.com header.s=selector1 header.b=Cf9SRKIn;
 spf=pass (domain: honeywell.com, ip: 40.107.76.110, mailfrom: ravindra.ankam@honeywell.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6oFX81hPfjuqP48Q0q05r63ktI066Sez+eOHsvW3QbVswdkSImf/BaPVa5863a1KBEQ6bZrQe4+FxxgpD0i77WdF5kTiNWz/r2K5FlPj3ShBaOxUPHKPre/N96W8swcCbwyn8PThGk0WPWtDervz7MfREoOjmzv5K05x1VC02LUagEMi2STYcStG9lj+qRd18VZj0wK/necm75W2S6GNqo9t3IvU73ccu+xyxjCv2Qp3IGUlJJk/5L9H6852Nmc1jfk0bQsZJjgGYhX1YOiKEPZltdQ3AduJe333XM1K1QyU0QvBFLxZRcqoSbU9HtEsdp6TVPkQFQaPkUzJPsrXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/f+ZIoxtAe6nPw1nPbHw5jkM32JPvVeC5pJ/DA50YtM=;
 b=HC2DsTYBispcLvCvoHZOnsIC7u8yqs50c2Fx5EdZ+E9fVUo886MVwuQRLwEoDObbOqxi9Ah2vRgYhGmfb4NYIRdVhA7VUA8uXpXkNU7By53mfVS0TrfvzeOGS+28gl++PPfQHjvhLtpWu4J4IM7XpyGUng/ikDFf4diqjLqojpe7Cl81t3Vc5fHtzCh4890a17HiuY7toNBMN8gJFO5TS3HoRDXTLsECI94qLTkNbSVr7myNorr2/xESgWvdm9SqIoJNXpeIoFEAKTaqx0naVEfqq7PGa3UriEruFPFfnf/3q1qaeTFkZQHwjHp8JekBeV3FcECDzMQvp7JakglfuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=honeywell.com; dmarc=pass action=none
 header.from=honeywell.com; dkim=pass header.d=honeywell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Honeywell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/f+ZIoxtAe6nPw1nPbHw5jkM32JPvVeC5pJ/DA50YtM=;
 b=Cf9SRKIntsCchFBP50AfKXSiqOCnvcxJ2mNvJ+eSHiqzKbQaUnpo/SFFJGLpLUU4oDWJk/0Gqg9BmYbBZ+C0sgor8yxree1sXrTehkfRtDyi8nFerK483wJ75uH85aW1pUv9PajXp1N8PLXoKizvT3108yPE/nDHz+kDsz6N1zw=
Received: from SN1PR07MB3949.namprd07.prod.outlook.com (2603:10b6:802:25::17)
 by SA0PR07MB7769.namprd07.prod.outlook.com (2603:10b6:806:b3::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Thu, 25 Feb
 2021 03:44:56 +0000
Received: from SN1PR07MB3949.namprd07.prod.outlook.com
 ([fe80::c430:69d7:6d:82bf]) by SN1PR07MB3949.namprd07.prod.outlook.com
 ([fe80::c430:69d7:6d:82bf%2]) with mapi id 15.20.3868.027; Thu, 25 Feb 2021
 03:44:56 +0000
From: "Ankam, Ravindra" <Ravindra.Ankam@Honeywell.com>
To: "meta-ti@lists.yoctoproject.org" <meta-ti@lists.yoctoproject.org>
Subject: Re: [External] Re: [meta-arm] Error while building the custom image
Thread-Topic: [External] Re: [meta-arm] Error while building the custom image
Thread-Index: AdcJ8rX5nImPUeNeTLiDcvVgqT387wALHC0AABgJYyAAKkaUsA==
Date: Thu, 25 Feb 2021 03:44:55 +0000
Message-ID: 
 <SN1PR07MB3949F183672A4047CC5A3882819E9@SN1PR07MB3949.namprd07.prod.outlook.com>
References: 
 <SN1PR07MB39493750FC8337D03E5E87DE81809@SN1PR07MB3949.namprd07.prod.outlook.com>
 <20210223200454.GA4892@denix.org>
 <SN1PR07MB3949ECD1DCEECFDA163FD3E1819F9@SN1PR07MB3949.namprd07.prod.outlook.com>
In-Reply-To: 
 <SN1PR07MB3949ECD1DCEECFDA163FD3E1819F9@SN1PR07MB3949.namprd07.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.0.60
dlp-reaction: no-action
msip_labels: MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Enabled=true;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_SetDate=2021-02-25T03:44:50Z;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Method=Standard;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_Name=d546e5e1-5d42-4630-bacd-c69bfdcbd5e8;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_SiteId=96ece526-9c7d-48b0-8daf-8b93c90a5d18;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_ActionId=c08c17bf-78f4-4a51-a928-a61c44f90833;
 MSIP_Label_d546e5e1-5d42-4630-bacd-c69bfdcbd5e8_ContentBits=0
smarttag: 4
authentication-results: lists.yoctoproject.org; dkim=none (message not signed)
 header.d=none;lists.yoctoproject.org; dmarc=none action=none
 header.from=Honeywell.com;
x-originating-ip: [49.207.214.150]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 34160d0b-d2b2-48bd-7305-08d8d93fb7ac
x-ms-traffictypediagnostic: SA0PR07MB7769:
x-ms-exchange-minimumurldomainage: yoctoproject.org#3822
x-microsoft-antispam-prvs: 
 <SA0PR07MB7769B278CD85A29D5220ED14819E9@SA0PR07MB7769.namprd07.prod.outlook.com>
x-antispam: TRUE
x-recptdomain: NotTLSDomain
x-ms-oob-tlc-oobclassifiers: OLM:2276;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 FAPkqkdFM6UWe1qAPL0gFKcszAcyrmaFqQbc+wze4lbCF2kjvYOjT/CgUkaLSkbpOxX/3ezjQjCoN0LmquN1O1Uf2Rqme0Pb0+fcOuyuAjPfOBHHooTv5Q4hFKuOkdAbmm1avgWfj7/TfBZ+pBoEQSPG/kZIHoqQTmwU554b19XLSsh/k8EJ5Hl7nIApleEXtqyavpGYjQESz6K/VXskj3RDK8/suNKhHSfkXVTGqehD1iU7pnaOPrpd+5OQ4l+ELz6EawapRKh5LucwvkByK4o+rBSNLCnMDEwG/jO2LCR6t9++s9iOvAKXDrGVzgSUt/aORizsJhhjalfBrYcdimG7uyUNEe7pRqU2o9vxzFlo+frLkdjqQRrLgSG0tVJ4cgnHYpvoQx+ptH7H/Hb+DPLQNTFG3XkRQYwIHSZVldCnKfOQ/tL0ParvZPkKYbK8V5ZYNGAZWkkuMzCoQJ8VB7Rc+kTcbA5M7bf0jJqH/pENKyYo+G2oAcNKgBOy5Vbz12WRD50LoZjZSOButWUPQLJI0HdW1gYpwYyhxQcW2WPc5DKvq0FOK16HGuhNBLAM1Jv/nbOwNgtxWxomP4UeP1vCUH2gJNbxt7feLj278NM=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR07MB3949.namprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(66574015)(86362001)(83380400001)(66946007)(52536014)(66446008)(55236004)(66556008)(186003)(71200400001)(478600001)(5660300002)(2906002)(33656002)(30864003)(966005)(76116006)(64756008)(55016002)(316002)(19627235002)(66476007)(8676002)(9686003)(8936002)(6916009)(7696005)(53546011)(6506007)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 
 =?us-ascii?Q?B8yoQMrUb4wXe1iayHYBojcJM7eK/NFj1VxQoUGQ2UDb0n1AVHg27ArhBwXr?=
 =?us-ascii?Q?LrOi1pmXcCzrvF4IpP5om3Ndmp9LPcXIEtDnXM3WaLb0rjL46jiHtd5zRUc+?=
 =?us-ascii?Q?k3hf+7XXGTbp7rp1IPeL0vLkOjDWxG8WA9Z3Lp14A9i0YR7liBPyxax/tmDC?=
 =?us-ascii?Q?c0wruztZte0QbQF9guSJF10raLr57dJny531A5wqIfuQQjnFZmGal6PVTELq?=
 =?us-ascii?Q?HMOjCN03A0put+Z7sj6y7gOUf4dcmluidxzKxqB8S7TL3bR3G3gPDJqTl5Er?=
 =?us-ascii?Q?ouG4EuzCOmG+RnkaiQh6YPx4JkQzujkjY5aNh410yX2qjtf9AUkdmp1h2uVa?=
 =?us-ascii?Q?E9RUbHwCQSG0x3dSf22JxoS2Pl1CYOEuWinmn1bWbZrW8r1PGXJvwzvtWq8T?=
 =?us-ascii?Q?9lZKzTOqlUGtvmDdCQ0piYIzZGwqCFrCbSoCMZoOtZ6jrJR04vIYtbFjSd3y?=
 =?us-ascii?Q?y4573/JaxkMqYQ53Z0uULs665ZfxFN33flIFYbs0hTndxHiZss+Wq10IOq0Q?=
 =?us-ascii?Q?ovvhjm8AavjxFmWy4BYDHii+hYeU8ogjP9bQtS4JQVsxnWRm0K4nRr+x8NNL?=
 =?us-ascii?Q?B4hVLPKljChZVSuNk+9oojYbPJMWVRHc0Zo9YxdAmuiTw6evW1DBZjsOBtZ/?=
 =?us-ascii?Q?JbKjUjWCmInJeHKImORHf5N9efoCaROuxpG2ZshV6rQBJqVAtLYbxIcmVhr1?=
 =?us-ascii?Q?bkvHWj2bbhaYS2HBm36549kZ/vallh3vjr1BqDeJgNi/dugCtCihmph5sAH1?=
 =?us-ascii?Q?djcO/PN/oF9sIjJT1f1MzJEJcK1GsOBEvCmup6m2VIdOlMqA5HrQveeXwIUu?=
 =?us-ascii?Q?59IF25CkfKIGtnVnyCBdnG2VE2fpvR96o100qsXNRq3SvKSEgVAnePsw35PQ?=
 =?us-ascii?Q?sv9883sFm5o9ohCtuNWMaiAt5WPE3box5mwB0wV2A+EaSHRxoqiMHTvQSCVi?=
 =?us-ascii?Q?nlgbLPVx/XvxFTvCKt/5QQ6QQhzZLWqW6g6H9aBPFfnrX1JC9Hc7IMcEDdfq?=
 =?us-ascii?Q?mgxg1NEViebo/BQ90P97SYDl4k4LR5fADef88uEl0wC6vOu84lMgQyLVOL55?=
 =?us-ascii?Q?fHb4MHKyUV/5IhyKfZKHKiUG42nf3tpSptCoWZvltaymaGcEWffentjB0vJe?=
 =?us-ascii?Q?l/eMYemoiyYbtRr+cr3d38V7dCL+RDAj4GphWrubjPaZr0gEqm9l28bD2PmK?=
 =?us-ascii?Q?bzzpz5cBpkr99K/xvJhO1p1SRc0Sxv6KKZzneTDZ0gDqOoeS65zzYdtW/H/x?=
 =?us-ascii?Q?bRslK3QNsyYP4Thg1GBCeYH9uAucwn7xgaPoVxVfO0iweIOeQZ6NW+J/1zQ5?=
 =?us-ascii?Q?6qRT+NrmBwgYE514EisXYqaL?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: Honeywell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN1PR07MB3949.namprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34160d0b-d2b2-48bd-7305-08d8d93fb7ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2021 03:44:55.9854
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 96ece526-9c7d-48b0-8daf-8b93c90a5d18
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qgnWsJ96XmcH+/FEsz1XEUnPHBii1DmhvshxHsmDwscK1Gcqe/TPL8JRn7K5bS7mZOKtNw7nOfYyU2uXUXCGhmrvoarON4QAHHrz3JC4nv0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR07MB7769
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
	Any idea about when Arago distro will be released for gatesgarth version?

Thanks and regards,
Ravi

-----Original Message-----
From: Denys Dmytriyenko <denis@denix.org>
Sent: Wednesday, February 24, 2021 1:35 AM
To: Ankam, Ravindra <Ravindra.Ankam@Honeywell.com>
Cc: meta-arm@lists.yoctoproject.org
Subject: [External] Re: [meta-arm] Error while building the custom image

Hi,

You seem to have a very strange combination of layers and mix of branches!

For example, is this a Poky distro or Arago? Why do you include meta-poky =
if DISTRO =3D "arago"?
Why do you have some layers on "gatesgarth" and some on unstable "master"?
And finally, Arago distro currently does not fully support master or gates=
garth with the external Arm toolchain, only dunfell.

--
Denys


On Tue, Feb 23, 2021 at 02:47:48PM +0000, Ankam, Ravindra via lists.yoctop=
roject.org wrote:
> Hi,
>                 Please attached the error logs.
> Can you please help how to address this issue?
>=20
> Thanks and regards,
> Ravi


> poky/build$ MACHINE=3Dam335x-evm bitbake custom-base-image Loading=20
> cache: 100%=20
> |#######################################################################=
#############################################################| Time: 0:00:0=
0 Loaded 4805 entries from dependency cache.
> WARNING: No recipes in default available for:
>   /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distro/=
recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
>   /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distro/=
recipes-graphics/wayland/weston_8.0.0.bbappend
>  =20
> /home/airport/ravi/yocto_gatesgarth/poky/meta-arago/meta-arago-distro/
> recipes-support/opencv/opencv_3.1.bbappend
> NOTE: Resolving any missing task queue dependencies
>=20
> Build Configuration:
> BB_VERSION           =3D "1.48.0"
> BUILD_SYS            =3D "x86_64-linux"
> NATIVELSBSTRING      =3D "ubuntu-16.04"
> TARGET_SYS           =3D "arm-linux-gnueabi"
> MACHINE              =3D "am335x-evm"
> DISTRO               =3D "arago"
> DISTRO_VERSION       =3D "2020.09"
> TUNE_FEATURES        =3D "arm armv7a vfp thumb neon callconvention-hard"
> TARGET_FPU           =3D "hard"
> meta
> meta-poky
> meta-yocto-bsp
> meta-custom          =3D "my-yocto-3.2.1:943ef2fad8428f002850e3655a3312e=
13d0dcb2c"
> meta-arm
> meta-arm-toolchain   =3D "gatesgarth:7185d29de9f54d2cb5b2da35b0c3f1e5f38=
1db2c"
> meta-clang           =3D "master:16f757de2d90594476d2c8feefd3a850c3c2493=
1"
> meta-ti              =3D "master:fb4726a88cbb5a6311bdb3095b81d314e344a32=
2"
> meta-arago-distro
> meta-arago-extras    =3D "master:f90d1bed7e775ac59bf1fcd95e95e9109d0953d=
b"
> meta-qt5             =3D "master:23f7a1c8eabaf1beb80cc6214954c0e1751c4cb=
d"
> meta-virtualization  =3D "master-next:3389eb0f128b1ef1d1aaf518afdf298a88=
f89619"
> meta-networking
> meta-python
> meta-perl
> meta-oe
> meta-gnome
> meta-multimedia
> meta-filesystems     =3D "gatesgarth:cef93b7b00e620d90a610112ee574fa60b6=
91cf8"
> meta-tpm
> meta-security
> meta-security-compliance =3D "master:16ee7308c9fd48d69b02c5519d2e5edddc5=
60658"
> meta-selinux         =3D "gatesgarth:36db146d56535318d343dc9138358885356=
f2172"
> meta-linaro
> meta-optee           =3D "master:11091b487e1ad4c6a4adfac34d958a3d9d9ccd1=
7"
>=20
> Initialising tasks: 100%=20
> |#####################################################################
> ##########################################################| Time:=20
> 0:00:02 Sstate summary: Wanted 1003 Found 0 Missed 1003 Current 22 (0%=
=20
> match, 2% complete)
> NOTE: Executing Tasks
> ERROR: external-arm-toolchain-2019.12-r0 do_install: '_sre.SRE_Match'=20
> object is not subscriptable
> ERROR: Logfile of failure stored in:=20
> /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc/
> work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/t
> emp/log.do_install.22351
> Log data follows:
> | DEBUG: Executing python function extend_recipe_sysroot
> | NOTE: Direct dependencies are=20
> | ['virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recip
> | es-devtools/patch/patch_2.7.6.bb:do_populate_sysroot',=20
> | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipe
> | s-devtools/rsync/rsync_3.2.3.bb:do_populate_sysroot',=20
> | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipe
> | s-extended/xz/xz_5.2.5.bb:do_populate_sysroot',=20
> | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipe
> | s-devtools/bison/bison_3.7.2.bb:do_populate_sysroot',=20
> | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipe
> | s-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot',=20
> | '/home/airport/ravi/yocto_gatesgarth/poky/meta/recipes-devtools/quil
> | t/quilt-native_0.66.bb:do_populate_sysroot',=20
> | 'virtual:native:/home/airport/ravi/yocto_gatesgarth/poky/meta/recipe
> | s-devtools/pseudo/pseudo_git.bb:do_populate_sysroot']
> | NOTE: Installed into sysroot: []
> | NOTE: Skipping as already exists in sysroot: ['patch-native',=20
> | 'rsync-native', 'xz-native', 'bison-native', 'pkgconfig-native',=20
> | 'quilt-native', 'pseudo-native', 'texinfo-dummy-native',=20
> | 'libtool-native', 'gnu-config-native', 'gettext-minimal-native',=20
> | 'automake-native', 'flex-native', 'autoconf-native', 'attr-native',=20
> | 'acl-native', 'popt-native', 'm4-native']
> | DEBUG: Python function extend_recipe_sysroot finished
> | DEBUG: Executing shell function do_install
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libanl.so.1 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libanl-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libBrokenLocale.so.1 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libBrokenLocale-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libc.so.6 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libc-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libcrypt.so.1 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libcrypt-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libdl.so.2 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libdl-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libm.so.6 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libm-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnsl.so.1 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnsl-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_compat.so.2 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_compat-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_db.so.2 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_db-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_dns.so.2 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_dns-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_files.so.2 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_files-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_hesiod.so.2 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libnss_hesiod-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libpthread.so.0 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libpthread-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libresolv.so.2 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libresolv-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/librt.so.1 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/librt-2.30.so, keep it
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libutil.so.1 is a symlink of=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/image/lib/libutil-2.30.so, keep it
> | rmdir: failed to remove=20
> | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gli
> | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12
> | -r0/image/usr/bin': Directory not empty
> | rmdir: failed to remove=20
> | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gli
> | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12
> | -r0/image/usr/sbin': Directory not empty
> | rmdir: failed to remove=20
> | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gli
> | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12
> | -r0/image/sbin': Directory not empty
> | NOTE: make -j 3 HOSTCC=3Dgcc  HOSTCPP=3Dgcc  -E headers_install INSTAL=
L_HDR_PATH=3D/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-ar=
m-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r=
0/external-arm-toolchain-2019.12/usr
> |   INSTALL=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/external-arm-toolchain-2019.12/usr/include
> | mv: cannot stat=20
> | '/home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-gli
> | bc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12
> | -r0/image/usr/lib/gcc/arm-none-linux-gnueabihf': No such file or=20
> | directory
> | WARNING: /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-a=
rm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-=
r0/temp/run.do_install.22351:415 exit 1 from 'mv /home/airport/ravi/yocto_g=
atesgarth/poky/build/tmp-external-arm-glibc/work/armv7at2hf-neon-linux-gnue=
abi/external-arm-toolchain/2019.12-r0/image/usr/lib/gcc/arm-none-linux-gnue=
abihf /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glibc=
/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-r0/image=
/usr/lib/gcc/arm-linux-gnueabi'
> | WARNING: Backtrace (BB generated script):
> |       #1: do_install, /home/airport/ravi/yocto_gatesgarth/poky/build/t=
mp-external-arm-glibc/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolc=
hain/2019.12-r0/temp/run.do_install.22351, line 415
> |       #2: main,=20
> | /home/airport/ravi/yocto_gatesgarth/poky/build/tmp-external-arm-glib
> | c/work/armv7at2hf-neon-linux-gnueabi/external-arm-toolchain/2019.12-
> | r0/temp/run.do_install.22351, line 415
> | ERROR: '_sre.SRE_Match' object is not subscriptable
> ERROR: Task (/home/airport/ravi/yocto_gatesgarth/poky/meta-arm/meta-arm-=
toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb=
:do_install) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 242 tasks of which 239 didn't need to be =
rerun and 1 failed.
>=20
> Summary: 1 task failed:
>  =20
> /home/airport/ravi/yocto_gatesgarth/poky/meta-arm/meta-arm-toolchain/r
> ecipes-devtools/external-arm-toolchain/external-arm-toolchain.bb:do_in
> stall
> Summary: There was 1 WARNING message shown.
> Summary: There was 1 ERROR message shown, returning a non-zero exit code=
.

>=20
>=20
>=20


--
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964
